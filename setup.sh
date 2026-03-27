#!/bin/bash
set -e

LANGUAGE="vi"
BIN_NAME=""

require_root() {
    if [ "$EUID" -ne 0 ]; then
        if is_vi; then
            echo "Lỗi: vui lòng chạy script bằng quyền root."
            echo "Ví dụ:"
            echo "  sudo bash setup.sh"
            echo "hoặc"
            echo "  sudo -i"
            echo "  bash setup.sh"
        else
            echo "Error: please run this script as root."
            echo "Example:"
            echo "  sudo bash setup.sh"
            echo "or"
            echo "  sudo -i"
            echo "  bash setup.sh"
        fi
        exit 1
    fi
}


is_vi() {
    [ "$LANGUAGE" = "vi" ]
}

choose_language() {
    echo "========================================"
    echo "            vGocms Setup"
    echo "========================================"
    echo "1) Tiếng Việt"
    echo "2) English"
    read -r -p "Chọn ngôn ngữ / Choose language [1]: " lang_choice

    case "$lang_choice" in
        2) LANGUAGE="en" ;;
        *) LANGUAGE="vi" ;;
    esac

    echo ""
}

check_dependencies() {
    local deps=("unzip" "wget" "ss" "openssl" "curl")
    for cmd in "${deps[@]}"; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            if is_vi; then
                echo "Lỗi: thiếu lệnh '$cmd'."
                echo "Vui lòng cài trước, ví dụ:"
                echo "  apt update && apt install -y unzip wget iproute2 openssl curl"
            else
                echo "Error: missing command '$cmd'."
                echo "Please install it first, for example:"
                echo "  apt update && apt install -y unzip wget iproute2 openssl curl"
            fi
            exit 1
        fi
    done
}

get_public_ip() {
    curl -s ifconfig.me || hostname -I | awk '{print $1}'
}

setup_binary() {
    if is_vi; then
        echo "--- Đang kiểm tra kiến trúc hệ thống ---"
    else
        echo "--- Checking system architecture ---"
    fi

    ARCH=$(uname -m)

    if [ "$ARCH" = "x86_64" ]; then
        if is_vi; then
            echo "Phát hiện Linux AMD64."
        else
            echo "Detected Linux AMD64."
        fi
        FILE_URL="https://raw.githubusercontent.com/vgocms-dev/vGocms/main/main/install/linux_amd64.zip"
        BIN_NAME="vgocms_linux_amd64"
    elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
        if is_vi; then
            echo "Phát hiện Linux ARM64."
        else
            echo "Detected Linux ARM64."
        fi
        FILE_URL="https://raw.githubusercontent.com/vgocms-dev/vGocms/main/main/install/linux_arm64.zip"
        BIN_NAME="vgocms_linux_arm64"
    else
        if is_vi; then
            echo "Lỗi: kiến trúc '$ARCH' chưa được hỗ trợ."
        else
            echo "Error: architecture '$ARCH' is not supported."
        fi
        exit 1
    fi

    if is_vi; then
        echo "Đang tải file cài đặt từ:"
        echo "  $FILE_URL"
    else
        echo "Downloading installation package from:"
        echo "  $FILE_URL"
    fi

    wget -qO vgocms.zip "$FILE_URL"

    if is_vi; then
        echo "Đang giải nén..."
    else
        echo "Extracting..."
    fi
    unzip -q -o vgocms.zip
    rm -f vgocms.zip

    if is_vi; then
        echo "Cấp quyền thực thi cho $BIN_NAME ..."
    else
        echo "Granting execute permission to $BIN_NAME ..."
    fi
    chmod 755 "$BIN_NAME"
}

setup_env() {
    echo ""

    if is_vi; then
        echo "========================================"
        echo "        CẤU HÌNH HỆ THỐNG (.env)"
        echo "========================================"
        echo ""
        echo "--- Cấu hình MySQL ---"
        echo "Hướng dẫn:"
        echo "  - DB_HOST: host MySQL. Nếu MySQL cài cùng VPS thì thường là localhost."
        echo "  - DB_PORT: cổng MySQL. Mặc định phổ biến là 3306."
        echo "  - DB_USER: tài khoản đăng nhập MySQL, ví dụ root."
        echo "  - DB_PASS: mật khẩu MySQL."
        echo "  - DB_NAME: tên database bạn muốn dùng cho vGocms."
        echo "  - Chỉ cần bấm Enter nếu muốn dùng giá trị mặc định ở trong ngoặc []."
        echo ""
    else
        echo "========================================"
        echo "        SYSTEM CONFIGURATION (.env)"
        echo "========================================"
        echo ""
        echo "--- MySQL Configuration ---"
        echo "Guide:"
        echo "  - DB_HOST: MySQL host. If MySQL is installed on this same server, use localhost."
        echo "  - DB_PORT: MySQL port. The common default is 3306."
        echo "  - DB_USER: MySQL login user, for example root."
        echo "  - DB_PASS: MySQL password."
        echo "  - DB_NAME: database name to be used by vGocms."
        echo "  - Just press Enter to use the default value shown in brackets []."
        echo ""
    fi

    read -r -p "DB_HOST [localhost]: " DB_HOST
    DB_HOST=${DB_HOST:-localhost}

    read -r -p "DB_PORT [3306]: " DB_PORT
    DB_PORT=${DB_PORT:-3306}

    read -r -p "DB_USER [root]: " DB_USER
    DB_USER=${DB_USER:-root}

    if is_vi; then
        read -r -s -p "DB_PASS (mật khẩu MySQL): " DB_PASS
    else
        read -r -s -p "DB_PASS (MySQL password): " DB_PASS
    fi
    echo ""

    read -r -p "DB_NAME [videogo]: " DB_NAME
    DB_NAME=${DB_NAME:-videogo}

    echo ""
    if is_vi; then
        echo "--- Cấu hình Redis ---"
        echo "Hướng dẫn:"
        echo "  - REDIS_ADDR: địa chỉ Redis, dạng host:port."
        echo "  - Nếu Redis cài cùng VPS thì thường là localhost:6379."
        echo "  - REDIS_PASS: để trống nếu Redis không đặt mật khẩu."
        echo "  - REDIS_DB: database index Redis, mặc định là 0."
        echo ""
    else
        echo "--- Redis Configuration ---"
        echo "Guide:"
        echo "  - REDIS_ADDR: Redis address in host:port format."
        echo "  - If Redis is on the same server, localhost:6379 is usually correct."
        echo "  - REDIS_PASS: leave empty if Redis has no password."
        echo "  - REDIS_DB: Redis database index, default is 0."
        echo ""
    fi

    read -r -p "REDIS_ADDR [localhost:6379]: " REDIS_ADDR
    REDIS_ADDR=${REDIS_ADDR:-localhost:6379}

    read -r -s -p "REDIS_PASS []: " REDIS_PASS
    echo ""

    read -r -p "REDIS_DB [0]: " REDIS_DB
    REDIS_DB=${REDIS_DB:-0}

    SESSION_SECRET=$(openssl rand -hex 32)

    echo ""
    if is_vi; then
        echo "--- Cấu hình cổng ứng dụng ---"
        echo "Hướng dẫn:"
        echo "  - APP_PORT là cổng mà vGocms sẽ chạy."
        echo "  - Mặc định là 8000."
        echo "  - Nếu cổng đang bị ứng dụng khác sử dụng, script sẽ yêu cầu nhập lại."
        echo ""
    else
        echo "--- Application Port Configuration ---"
        echo "Guide:"
        echo "  - APP_PORT is the port where vGocms will run."
        echo "  - Default is 8000."
        echo "  - If the port is already in use, the script will ask you to enter another one."
        echo ""
    fi

    while true; do
        read -r -p "APP_PORT [8000]: " APP_PORT
        APP_PORT=${APP_PORT:-8000}

        if ss -tuln | grep -q ":$APP_PORT "; then
            if is_vi; then
                echo "-> Lỗi: port $APP_PORT đang được sử dụng. Vui lòng chọn port khác."
            else
                echo "-> Error: port $APP_PORT is already in use. Please choose another port."
            fi
        else
            break
        fi
    done

    cat > .env <<EOF
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

    if is_vi; then
        echo "-> Đã tạo file .env thành công."
    else
        echo "-> .env file created successfully."
    fi
}

setup_service() {
    echo ""

    if is_vi; then
        read -r -p "Bạn có muốn tạo service để chạy ngầm bằng systemd không? (y/n) [y]: " CREATE_SVC
    else
        read -r -p "Do you want to create a systemd service to run in background? (y/n) [y]: " CREATE_SVC
    fi

    CREATE_SVC=${CREATE_SVC:-y}

    if [[ "$CREATE_SVC" =~ ^[Yy]$ ]]; then
        if [ "$EUID" -ne 0 ]; then
            if is_vi; then
                echo "Cảnh báo: cần quyền root để tạo systemd service. Đang bỏ qua bước này."
            else
                echo "Warning: root privileges are required to create a systemd service. Skipping this step."
            fi
            return
        fi

        CURRENT_DIR=$(pwd)
        SERVICE_FILE="/etc/systemd/system/vgocms.service"
        SERVICE_USER="${SUDO_USER:-root}"

        cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=vGocms Service
After=network.target mysql.service redis.service

[Service]
Type=simple
User=$SERVICE_USER
WorkingDirectory=$CURRENT_DIR
ExecStart=$CURRENT_DIR/$BIN_NAME
Restart=always
RestartSec=5
EnvironmentFile=$CURRENT_DIR/.env

[Install]
WantedBy=multi-user.target
EOF

        if is_vi; then
            echo "Đang reload systemd daemon và khởi động vGocms..."
        else
            echo "Reloading systemd daemon and starting vGocms..."
        fi

        systemctl daemon-reload
        systemctl enable vgocms >/dev/null 2>&1
        systemctl start vgocms
        systemctl status vgocms --no-pager | head -n 5 || true

        if is_vi; then
            echo "-> Service đã được cài đặt và đang chạy ngầm."
        else
            echo "-> Service has been installed and is running in the background."
        fi
    fi
}

show_finish_message() {
    PUBLIC_IP=$(get_public_ip)

    echo ""
    echo "============================================================"

    if is_vi; then
        echo " CÀI ĐẶT THÀNH CÔNG!"
        echo "============================================================"
        echo "Ứng dụng đang chạy tại: http://$PUBLIC_IP:$APP_PORT"
        echo ""
        echo "BƯỚC TIẾP THEO (Cấu hình domain trên aaPanel):"
        echo "1. Vào aaPanel -> Website -> Proxy Project -> Add Proxy."
        echo "2. Ô Target nhập: https://127.0.0.1:$APP_PORT"
        echo "3. Domain name: nhập domain admin / api quản lý của bạn."
        echo "4. Nhấn Confirm để xác nhận."
        echo "5. Sau đó vào SSL để cấp SSL R13 cho domain."
        echo ""
        echo "Ví dụ Target:"
        echo "  https://127.0.0.1:$APP_PORT"
    else
        echo " INSTALLATION COMPLETED SUCCESSFULLY!"
        echo "============================================================"
        echo "Application is running at: http://$PUBLIC_IP:$APP_PORT"
        echo ""
        echo "NEXT STEP (Configure domain in aaPanel):"
        echo "1. Go to aaPanel -> Website -> Proxy Project -> Add Proxy."
        echo "2. In the Target field, enter: https://127.0.0.1:$APP_PORT"
        echo "3. Domain name: enter your admin / management API domain."
        echo "4. Click Confirm to save."
        echo "5. Then open the SSL section and issue SSL R13 for the domain."
        echo ""
        echo "Target example:"
        echo "  https://127.0.0.1:$APP_PORT"
    fi

    echo "============================================================"
}

main() {
    choose_language
    require_root
    check_dependencies
    setup_binary
    setup_env
    setup_service
    show_finish_message
}

main
