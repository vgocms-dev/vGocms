
#!/bin/bash
# Thiết lập dừng script ngay khi có lỗi
set -e

# ==========================================
# 1. Các hàm tiện ích (Utils)
# ==========================================

# Kiểm tra dependency
check_dependencies() {
    local deps=("unzip" "wget" "ss" "openssl")
    for cmd in "${deps[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            echo "Lỗi: Lệnh '$cmd' không được tìm thấy. Vui lòng cài đặt trước (VD: apt install unzip wget iproute2 openssl)."
            exit 1
        fi
    done
}

# Lấy địa chỉ IP public của VPS
get_public_ip() {
    curl -s ifconfig.me || hostname -I | awk '{print $1}'
}

# ==========================================
# 2. Xử lý tải và giải nén (Download & Extract)
# ==========================================

setup_binary() {
    echo "--- Đang kiểm tra kiến trúc hệ thống ---"
    ARCH=$(uname -m)
    
    # Chuyển đổi URL từ blob sang raw để wget tải đúng file ZIP thay vì trang HTML
    if [ "$ARCH" = "x86_64" ]; then
        echo "Phát hiện Linux AMD64."
        FILE_URL="https://raw.githubusercontent.com/vgocms-dev/vGocms/main/main/install/linux_amd64.zip"
        BIN_NAME="vgocms_linux_amd64"
    elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
        echo "Phát hiện Linux ARM64."
        FILE_URL="https://raw.githubusercontent.com/vgocms-dev/vGocms/main/main/install/linux_arm64.zip"
        BIN_NAME="vgocms_linux_arm64"
    else
        echo "Lỗi: Kiến trúc $ARCH không được hỗ trợ."
        exit 1
    fi

    echo "Đang tải $FILE_URL ..."
    wget -qO vgocms.zip "$FILE_URL"

    echo "Đang giải nén ..."
    unzip -q -o vgocms.zip
    rm vgocms.zip

    echo "Cấp quyền thực thi (chmod 755) cho $BIN_NAME..."
    chmod 755 "$BIN_NAME"
}

# ==========================================
# 3. Khởi tạo cấu hình (.env)
# ==========================================

setup_env() {
    echo ""
    echo "--- Cấu hình hệ thống (.env) ---"
    
    # Database
    read -p "DB_HOST [localhost]: " DB_HOST; DB_HOST=${DB_HOST:-localhost}
    read -p "DB_PORT [3306]: " DB_PORT; DB_PORT=${DB_PORT:-3306}
    read -p "DB_USER [root]: " DB_USER; DB_USER=${DB_USER:-root}
    read -p "DB_PASS: " DB_PASS
    read -p "DB_NAME [videogo]: " DB_NAME; DB_NAME=${DB_NAME:-videogo}

    # Redis
    echo ""
    read -p "REDIS_ADDR (VD: localhost:6379) [localhost:6379]: " REDIS_ADDR; REDIS_ADDR=${REDIS_ADDR:-localhost:6379}
    read -p "REDIS_PASS (Để trống nếu không có) []: " REDIS_PASS
    read -p "REDIS_DB [0]: " REDIS_DB; REDIS_DB=${REDIS_DB:-0}

    # Session Secret (Tự động sinh chuỗi an toàn)
    SESSION_SECRET=$(openssl rand -hex 32)

    # Port Checker
    echo ""
    while true; do
        read -p "APP_PORT [8000]: " APP_PORT
        APP_PORT=${APP_PORT:-8000}
        
        # Kiểm tra port xem có tiến trình nào đang listen không
        if ss -tuln | grep -q ":$APP_PORT "; then
            echo "-> Lỗi: Port $APP_PORT đang được sử dụng bởi ứng dụng khác. Vui lòng chọn Port khác."
        else
            break
        fi
    done

    # Ghi file .env
    cat <<EOF > .env
# --- Database ---
DB_HOST=$DB_HOST
DB_PORT=$DB_PORT
DB_USER=$DB_USER
DB_PASS=$DB_PASS
DB_NAME=$DB_NAME

# --- Redis ---
REDIS_ADDR=$REDIS_ADDR
REDIS_PASS=$REDIS_PASS
REDIS_DB=$REDIS_DB

# --- Session ---
SESSION_SECRET=$SESSION_SECRET

# --- Application ---
APP_PORT=$APP_PORT
GIN_MODE=release
EOF
    echo "-> Đã tạo file .env thành công."
}

# ==========================================
# 4. Khởi tạo Service chạy ngầm (Systemd)
# ==========================================

setup_service() {
    echo ""
    read -p "Bạn có muốn tạo service để chạy ngầm (Systemd) không? (y/n) [y]: " CREATE_SVC
    CREATE_SVC=${CREATE_SVC:-y}

    if [[ "$CREATE_SVC" =~ ^[Yy]$ ]]; then
        if [ "$EUID" -ne 0 ]; then
            echo "Cảnh báo: Bạn cần quyền root (sudo) để tạo systemd service. Bỏ qua bước tạo service."
            return
        fi

        CURRENT_DIR=$(pwd)
        SERVICE_FILE="/etc/systemd/system/vgocms.service"

        cat <<EOF > "$SERVICE_FILE"
[Unit]
Description=vGocms Service
After=network.target mysql.service redis.service

[Service]
Type=simple
User=$USER
WorkingDirectory=$CURRENT_DIR
ExecStart=$CURRENT_DIR/$BIN_NAME
Restart=always
RestartSec=5
EnvironmentFile=$CURRENT_DIR/.env

[Install]
WantedBy=multi-user.target
EOF

        echo "Đang reload systemd daemon và khởi động vGocms..."
        systemctl daemon-reload
        systemctl enable vgocms
        systemctl start vgocms
        systemctl status vgocms --no-pager | head -n 5
        
        echo "-> Service đã được cài đặt và đang chạy ngầm."
    fi
}

# ==========================================
# Hàm Main
# ==========================================
main() {
    check_dependencies
    setup_binary
    setup_env
    setup_service

    PUBLIC_IP=$(get_public_ip)
    
    echo ""
    echo "============================================================"
    echo " CÀI ĐẶT THÀNH CÔNG!"
    echo "============================================================"
    echo "Ứng dụng đang chạy tại: http://$PUBLIC_IP:$APP_PORT"
    echo ""
    echo "BƯỚC TIẾP THEO (Cấu hình Nginx Proxy):"
    echo "Để gắn domain, hãy trỏ domain về IP này và tạo block server trong Nginx:"
    echo "
server {
    listen 80;
    server_name yourdomain.com;

    location / {
        proxy_pass http://127.0.0.1:$APP_PORT;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}"
    echo "============================================================"
}

main
