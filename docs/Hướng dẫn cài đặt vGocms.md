# Hướng dẫn cài đặt vGocms

Tài liệu chính thức để thiết lập vGocms trên máy chủ của bạn bằng aaPanel và tập lệnh cài đặt tự động của chúng tôi.

---

## 1. Cài đặt aaPanel
Đầu tiên, bạn cần cài đặt aaPanel để quản lý môi trường máy chủ.

**Lưu ý:** Nếu bạn đã cài đặt aaPanel, bạn có thể bỏ qua bước này.

Chạy lệnh sau:
```bash
URL=https://www.aapanel.com/script/install_panel_en.sh && if [ -f /usr/bin/curl ];then curl -ksSO $URL ;else wget --no-check-certificate -O install_panel_en.sh $URL;fi;bash install_panel_en.sh ipssl
```

Sau khi cài đặt, đăng nhập vào bảng điều khiển aaPanel và cài đặt các ứng dụng bắt buộc sau từ **App Store**:
- **Nginx:** Phiên bản mới nhất
- **MySQL/MariaDB:** Khuyên dùng MariaDB 10.6+ để tối ưu
- **Redis:** Phiên bản mới nhất

---

## 2. Cấu hình Cơ sở dữ liệu
1. **Tạo Cơ sở dữ liệu:** Vào **Databases** → **Add Database** trong aaPanel.
2. **Lưu thông tin đăng nhập:** Sao chép **Tên Database**, **Tên người dùng** và **Mật khẩu**. Bạn sẽ cần chúng trong quá trình chạy script setup vGocms.

---

## 3. Chuẩn bị Thư mục
Tạo thư mục lưu trữ cho bảng quản trị vGocms của bạn:
1. Mở trình quản lý **Files** trong aaPanel.
2. Điều hướng đến `/www/wwwroot/`.
3. Tạo một thư mục mới, ví dụ: `vgocms-admin`.
4. Sao chép đường dẫn đầy đủ: `/www/wwwroot/vgocms-admin`.

---

## 4. Cài đặt qua SSH
Kết nối với máy chủ của bạn qua SSH bằng Putty, Termius hoặc terminal ưa thích của bạn.

> **Quyền Root:** Bạn phải chạy cài đặt với quyền root. Nếu bạn đang đăng nhập bằng người dùng thông thường, hãy chuyển sang root bằng: `sudo -s`

### Điều hướng đến thư mục của bạn
```bash
cd /www/wwwroot/vgocms-admin
```

### Chạy Script Cài đặt
Thực thi lệnh sau để bắt đầu quá trình cài đặt từ xa:
```bash
sudo bash <(curl -fsSL https://raw.githubusercontent.com/vgocms-dev/vGocms/refs/heads/main/setup.sh)
```

---

## 5. Làm theo Script Setup
Script sẽ hướng dẫn bạn qua một số bước cấu hình:
- **Chọn Ngôn ngữ:** Chọn giữa 1) Tiếng Việt hoặc 2) Tiếng Anh.
- **Kiểm tra Hệ thống:** Script tự động phát hiện kiến trúc của bạn (AMD64 hoặc ARM64) và tải xuống bản binary phù hợp.
- **Cấu hình Môi trường:**
  - **MySQL:** Nhập host, port, user, password và tên DB.
  - **Redis:** Nhập địa chỉ, mật khẩu và index DB.
  - **App Port:** Mặc định là `8000`.
- **Dịch vụ Systemd:** Chọn `y` để tạo dịch vụ systemd để tự động chạy ngầm.

---

## 6. Cấu hình aaPanel Cuối cùng
Sau khi script kết thúc, bạn cần công khai ứng dụng ra internet:
1. Vào **aaPanel** → **Website** → **Proxy Project** → **Add Proxy**.
2. **Target URL:** Nhập `http://127.0.0.1:8000` (thay 8000 nếu bạn chọn port khác).
3. **Domain name:** Nhập domain admin hoặc API quản lý của bạn.
4. Nhấn **Confirm**.
5. Sau đó vào tab **SSL** cho domain đó và cấp chứng chỉ SSL (Let's Encrypt R13).

---

## Hỗ trợ & Cộng đồng
- **GitHub:** [vgocms-dev/vGocms](https://github.com/vgocms-dev/vGocms)
- **Hỗ trợ Telegram:** [@apiionline](https://t.me/apiionline)
- **Cộng đồng:** [t.me/vgocms](https://t.me/vgocms)
