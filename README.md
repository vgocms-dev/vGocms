# vGocms - Hệ Thống Quản Trị Nội Dung Phim & Video Hiệu Năng Cao (Multi-Site & AI Powered)
# Website bán hàng: [https://vgo.codes](https://vgo.codes)
**vGocms** là giải pháp CMS chuyên dụng cho việc xây dựng và quản trị mạng lưới website phim, video với quy mô lớn. Được phát triển trên nền tảng ngôn ngữ **Go (Golang)**, vGocms mang lại tốc độ xử lý vượt trội, khả năng chịu tải cực cao và hệ thống tự động hóa hoàn hảo.

---

## 🔗 Thông Tin Trải Nghiệm (Demo)

*   **Trang Quản Trị (Admin)**: [https://demo-cms-vgo.vgo.codes](https://demo-cms-vgo.vgo.codes)
    *   Tài khoản: `admin`
    *   Mật khẩu: `admin123`
*   **Trang Phim (Frontend Demo)**: [https://demo-vgo-1.vgo.codes/](https://demo-vgo-1.vgo.codes/)

---

## 🚀 Tính Năng Chi Tiết (Deep Dive)

### 1. Quản Trị Multi-Site & Tự Động Hóa (Automation)
*   **Scheduler Thông Minh**: Hệ thống lập lịch chạy chuẩn mực mỗi phút, điều phối toàn bộ các tác vụ ngầm.
*   **Auto Sync Video**: Tự động đồng bộ phim mới dựa trên bộ lọc Taxonomy (Thể loại, Quốc gia, Máy chủ...). Hỗ trợ giới hạn số lượng sync theo giờ/ngày để tránh spam.
*   **Chiến dịch Publish Ngẫu Nhiên**: 
    *   Thiết lập khoảng cách thời gian publish ngẫu nhiên (vd: mỗi 30-120 phút).
    *   **Spread Timing**: Khả năng rải các tập phim/video trong một lần publish (cách nhau vài phút) để tạo tín hiệu hoạt động tự nhiên như người thật (Natural Signal), cực tốt cho SEO.
*   **Tùy biến Mã Nguồn**: Cho phép chèn mã HTML tùy chỉnh vào `<head>` và `<body>` cho từng site riêng biệt (tiện lợi cho việc cài đặt tracking, pixel, hoặc CSS/JS riêng).

### 2. Hệ Thống SEO Template Chuyên Sâu
*   **Cấu hình SEO theo loại trang**: Tùy chỉnh Meta Title/Description/Keywords riêng cho từng loại: Trang chủ, Chi tiết phim, Xem phim, Tìm kiếm, Trang diễn viên, và các danh sách theo Năm/Thể loại.
*   **Hệ thống Biến (Variables) động**: Sử dụng các placeholder như `{title}`, `{original_name}`, `{episode}`, `{year}`, `{sitename}` để tạo ra hàng triệu trang nội dung không trùng lặp.
*   **AI Bulk SEO Generator**: Chỉ với 1 click, AI sẽ dựa trên mô tả chung của website để tự động phát sinh toàn bộ Template SEO cho tất cả các loại trang trong hệ thống.
*   **Preview & Validation**: Tích hợp bộ đếm ký tự thời gian thực, đảm bảo nội dung SEO luôn nằm trong "vùng an toàn" của Google.

### 3. Quản Lý Menu & Điều Hướng Thông Minh
*   **Site-Specific Menus**: Mỗi website vệ tinh có thể dùng menu riêng hoặc fallback về menu hệ thống.
*   **Kéo-Thả Đa Cấp (Nested Menus)**: Giao diện quản lý Menu trực quan, hỗ trợ phân cấp cha-con không giới hạn.
*   **Shortcut Link Chips**: Tích hợp sẵn bộ phím tắt các đường dẫn quan trọng (Phim mới, Xem nhiều, Phim chiếu rạp...) giúp quản trị viên tạo menu nhanh chóng mà không cần nhớ URL.
*   **Lucide Icons**: Hỗ trợ thư viện hàng ngàn icon hiện đại, dễ dàng tùy chỉnh cho từng mục menu ngay trên giao diện.

### 4. Taxonomy & Địa Phương Hóa (Localization)
*   **Ghi đè Ngôn ngữ (Language Override)**: Tính năng cực mạnh cho phép thay đổi tên hiển thị của các Taxonomy (vd: Thể loại "Action" thành "Hành Động") cho từng site mà không làm thay đổi dữ liệu gốc trong database.
*   **Taxonomy Filter**: Kiểm soát chặt chẽ những thể loại hoặc quốc gia phim nào được phép xuất hiện trên từng site cụ thể.

### 5. Sức Mạnh Từ AI & Crawler (Đã mô tả ở bản trước)
*   **AI Rewrite Content**: Tự động rewrite Title/Slug/Description qua OpenRouter (GPT-4, Claude 3...).
*   **Crawler Đa Nguồn**: Hỗ trợ Ophim, MacCMS API, TMDB, vGo Share... với tốc độ cực nhanh.

---

## 🛠️ Công Nghệ Sử Dụng (Tech Stack)

*   **Backend**: Golang (Gin Framework) - Concurrent xử lý hàng ngàn tác vụ sync/rewrite cùng lúc.
*   **Database & Cache**: MySQL (Gorm) + Redis (Task Queue & API Cache).
*   **AI Integration**: OpenRouter (Kết nối mọi model AI mạnh nhất thế giới).
*   **UI/UX Admin**: Hiện đại, tối ưu cho quản trị viên vận hành hệ thống lớn.

---

## 🔥 Tại sao vGocms là cỗ máy kiếm tiền thụ động?

1.  **Tiết kiệm 99% nhân lực**: Hệ thống tự crawl, tự dùng AI viết bài, tự publish theo lịch ngẫu nhiên.
2.  **Khả năng nhân bản cực nhanh**: Tạo 1 site mới chỉ mất 5 phút với đầy đủ Menu, SEO và Phim.
3.  **Tối ưu SEO tối đa**: Với AI Rewrite và Multi-site template, bạn sở hữu mạng lưới vệ tinh chất lượng cao, index cực nhanh.
4.  **Chịu tải bền bỉ**: Golang đảm bảo server không bao giờ bị "treo" khi traffic tăng đột biến.

---

## 🛒 Thông Tin Mua Hàng & Hỗ Trợ

*   **Sở hữu trọn bộ vGocms & Giao diện chuyên nghiệp ngay hôm nay.**
*   **Telegram hỗ trợ cá nhân**: [@apiionline](https://t.me/apiionline)
*   **Nhóm cộng đồng vGocms**: [t.me/vgocms](https://t.me/vgocms)

---
**vGocms - Nền tảng vận hành đế chế Website phim tự động.**
