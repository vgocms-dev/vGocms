# Tiếng Việt

# vGocms - Hệ Thống Quản Trị Nội Dung Phim & Video Hiệu Năng Cao (Multi-Site & AI Powered)
# Website bán hàng: [https://vgo.codes](https://vgo.codes)
**vGocms** là giải pháp CMS chuyên dụng cho việc xây dựng và quản trị mạng lưới website phim, video với quy mô lớn. Được phát triển trên nền tảng ngôn ngữ **Go (Golang)**, vGocms mang lại tốc độ xử lý vượt trội, khả năng chịu tải cực cao và hệ thống tự động hóa hoàn hảo.

---

## 🔗 Thông Tin Trải Nghiệm (Demo)

* **Trang Quản Trị (Admin)**: [https://demo-cms-vgo.vgo.codes](https://demo-cms-vgo.vgo.codes)
    * Tài khoản: `admin`
    * Mật khẩu: `admin123`
* **Trang Phim (Frontend Demo)**: [https://demo-vgo-1.vgo.codes/](https://demo-vgo-1.vgo.codes/)

---

## 🚀 Tính Năng Chi Tiết (Deep Dive)

### 1. Quản Trị Multi-Site & Tự Động Hóa (Automation)
* **Scheduler Thông Minh**: Hệ thống lập lịch chạy chuẩn mực mỗi phút, điều phối toàn bộ các tác vụ ngầm.
* **Auto Sync Video**: Tự động đồng bộ phim mới dựa trên bộ lọc Taxonomy (Thể loại, Quốc gia, Máy chủ...). Hỗ trợ giới hạn số lượng sync theo giờ/ngày để tránh spam.
* **Chiến dịch Publish Ngẫu Nhiên**: 
    * Thiết lập khoảng cách thời gian publish ngẫu nhiên (vd: mỗi 30-120 phút).
    * **Spread Timing**: Khả năng rải các tập phim/video trong một lần publish (cách nhau vài phút) để tạo tín hiệu hoạt động tự nhiên như người thật (Natural Signal), cực tốt cho SEO.
* **Tùy biến Mã Nguồn**: Cho phép chèn mã HTML tùy chỉnh vào `<head>` và `<body>` cho từng site riêng biệt (tiện lợi cho việc cài đặt tracking, pixel, hoặc CSS/JS riêng).

### 2. Hệ Thống SEO Template Chuyên Sâu
* **Cấu hình SEO theo loại trang**: Tùy chỉnh Meta Title/Description/Keywords riêng cho từng loại: Trang chủ, Chi tiết phim, Xem phim, Tìm kiếm, Trang diễn viên, và các danh sách theo Năm/Thể loại.
* **Hệ thống Biến (Variables) động**: Sử dụng các placeholder như `{title}`, `{original_name}`, `{episode}`, `{year}`, `{sitename}` để tạo ra hàng triệu trang nội dung không trùng lặp.
* **AI Bulk SEO Generator**: Chỉ với 1 click, AI sẽ dựa trên mô tả chung của website để tự động phát sinh toàn bộ Template SEO cho tất cả các loại trang trong hệ thống.
* **Preview & Validation**: Tích hợp bộ đếm ký tự thời gian thực, đảm bảo nội dung SEO luôn nằm trong "vùng an toàn" của Google.

### 3. Quản Lý Menu & Điều Hướng Thông Minh
* **Site-Specific Menus**: Mỗi website vệ tinh có thể dùng menu riêng hoặc fallback về menu hệ thống.
* **Kéo-Thả Đa Cấp (Nested Menus)**: Giao diện quản lý Menu trực quan, hỗ trợ phân cấp cha-con không giới hạn.
* **Shortcut Link Chips**: Tích hợp sẵn bộ phím tắt các đường dẫn quan trọng (Phim mới, Xem nhiều, Phim chiếu rạp...) giúp quản trị viên tạo menu nhanh chóng mà không cần nhớ URL.
* **Lucide Icons**: Hỗ trợ thư viện hàng ngàn icon hiện đại, dễ dàng tùy chỉnh cho từng mục menu ngay trên giao diện.

### 4. Taxonomy & Địa Phương Hóa (Localization)
* **Ghi đè Ngôn ngữ (Language Override)**: Tính năng cực mạnh cho phép thay đổi tên hiển thị của các Taxonomy (vd: Thể loại "Action" thành "Hành Động") cho từng site mà không làm thay đổi dữ liệu gốc trong database.
* **Taxonomy Filter**: Kiểm soát chặt chẽ những thể loại hoặc quốc gia phim nào được phép xuất hiện trên từng site cụ thể.

### 5. Sức Mạnh Từ AI & Crawler
* **AI Rewrite Content**: Tự động rewrite Title/Slug/Description qua OpenRouter (GPT-4, Claude 3...).
* **Crawler Đa Nguồn**: Hỗ trợ Ophim, MacCMS API, TMDB, vGo Share... với tốc độ cực nhanh.

---

## 🛠️ Công Nghệ Sử Dụng (Tech Stack)

* **Backend**: Golang (Gin Framework) - Concurrent xử lý hàng ngàn tác vụ sync/rewrite cùng lúc.
* **Database & Cache**: MySQL (Gorm) + Redis (Task Queue & API Cache).
* **AI Integration**: OpenRouter (Kết nối mọi model AI mạnh nhất thế giới).
* **UI/UX Admin**: Hiện đại, tối ưu cho quản trị viên vận hành hệ thống lớn.

---

## 🔥 Tại sao vGocms là cỗ máy kiếm tiền thụ động?

1.  **Tiết kiệm 99% nhân lực**: Hệ thống tự crawl, tự dùng AI viết bài, tự publish theo lịch ngẫu nhiên.
2.  **Khả năng nhân bản cực nhanh**: Tạo 1 site mới chỉ mất 5 phút với đầy đủ Menu, SEO và Phim.
3.  **Tối ưu SEO tối đa**: Với AI Rewrite và Multi-site template, bạn sở hữu mạng lưới vệ tinh chất lượng cao, index cực nhanh.
4.  **Chịu tải bền bỉ**: Golang đảm bảo server không bao giờ bị "treo" khi traffic tăng đột biến.

---

## 🛒 Thông Tin Mua Hàng & Hỗ Trợ

* **Sở hữu trọn bộ vGocms & Giao diện chuyên nghiệp ngay hôm nay.**
* **Telegram hỗ trợ cá nhân**: [@apiionline](https://t.me/apiionline)
* **Nhóm cộng đồng vGocms**: [t.me/vgocms](https://t.me/vgocms)

---
**vGocms - Nền tảng vận hành đế chế Website phim tự động.**

***

# English

# vGocms - High-Performance Movie & Video CMS (Multi-Site & AI Powered)
# Sales Website: [https://vgo.codes](https://vgo.codes)
**vGocms** is a specialized CMS solution for building and managing large-scale movie and video website networks. Developed on **Go (Golang)**, vGocms delivers outstanding processing speed, extreme load capacity, and a flawless automation system.

---

## 🔗 Demo Information

* **Admin Dashboard**: [https://demo-cms-vgo.vgo.codes](https://demo-cms-vgo.vgo.codes)
    * Username: `admin`
    * Password: `admin123`
* **Frontend Demo**: [https://demo-vgo-1.vgo.codes/](https://demo-vgo-1.vgo.codes/)

---

## 🚀 Deep Dive Features

### 1. Multi-Site Management & Automation
* **Smart Scheduler**: A standard cron system running every minute to coordinate all background tasks.
* **Auto Sync Video**: Automatically syncs new movies based on Taxonomy filters (Genre, Country, Server...). Supports sync limits per hour/day to prevent spam.
* **Random Publish Campaign**: 
    * Set random publishing intervals (e.g., every 30-120 minutes).
    * **Spread Timing**: The ability to spread out movie/video episodes in a single publish run (minutes apart) to create natural activity signals, highly beneficial for SEO.
* **Custom Source Code**: Allows injecting custom HTML into the `<head>` and `<body>` for each specific site (convenient for tracking, pixels, or custom CSS/JS).

### 2. In-Depth SEO Template System
* **SEO Config by Page Type**: Custom Meta Title/Description/Keywords for each type: Homepage, Movie Detail, Watch Movie, Search, Actor Page, and Year/Genre lists.
* **Dynamic Variables System**: Utilize placeholders like `{title}`, `{original_name}`, `{episode}`, `{year}`, `{sitename}` to generate millions of unique content pages.
* **AI Bulk SEO Generator**: With 1 click, AI uses the website's general description to automatically generate the entire SEO Template for all page types in the system.
* **Preview & Validation**: Integrated real-time character counter, ensuring SEO content always stays within Google's "safe zone".

### 3. Smart Menu & Navigation Management
* **Site-Specific Menus**: Each satellite site can use its own menu or fallback to the system menu.
* **Drag-and-Drop Nested Menus**: Intuitive menu management interface, supporting unlimited parent-child hierarchies.
* **Shortcut Link Chips**: Built-in shortcuts for important paths (New Movies, Most Watched, Theaters...) helping admins create menus quickly without memorizing URLs.
* **Lucide Icons**: Supports a library of thousands of modern icons, easily customizable for each menu item directly on the interface.

### 4. Taxonomy & Localization
* **Language Override**: A powerful feature allowing you to change the display name of Taxonomies (e.g., Genre "Action" to "Hành Động") for individual sites without altering the core database.
* **Taxonomy Filter**: Strict control over which genres or movie countries are permitted to appear on specific sites.

### 5. Power of AI & Crawler
* **AI Rewrite Content**: Auto-rewrite Title/Slug/Description via OpenRouter (GPT-4, Claude 3...).
* **Multi-Source Crawler**: Supports Ophim, MacCMS API, TMDB, vGo Share... at ultra-fast speeds.

---

## 🛠️ Tech Stack

* **Backend**: Golang (Gin Framework) - Concurrent processing for thousands of sync/rewrite tasks simultaneously.
* **Database & Cache**: MySQL (Gorm) + Redis (Task Queue & API Cache).
* **AI Integration**: OpenRouter (Connects to the world's most powerful AI models).
* **UI/UX Admin**: Modern, optimized for administrators operating large systems.

---

## 🔥 Why vGocms is a passive income machine?

1.  **Save 99% manpower**: The system auto-crawls, uses AI to write content, and auto-publishes on a random schedule.
2.  **Ultra-fast cloning capability**: Creating a new site takes only 5 minutes with fully populated Menu, SEO, and Movies.
3.  **Maximum SEO optimization**: With AI Rewrite and Multi-site templates, you own a high-quality satellite network with rapid indexing.
4.  **Endurable load capacity**: Golang ensures the server never crashes during traffic spikes.

---

## 🛒 Purchase Info & Support

* **Own the full vGocms suite & Professional interface today.**
* **Personal Telegram Support**: [@apiionline](https://t.me/apiionline)
* **vGocms Community Group**: [t.me/vgocms](https://t.me/vgocms)

---
**vGocms - The platform to operate your automated movie website empire.**

***

# 简体中文

# vGocms - 高性能电影与视频内容管理系统 (多站点 & AI 驱动)
# 销售网站: [https://vgo.codes](https://vgo.codes)
**vGocms** 是专为构建和管理大规模电影和视频网站网络而设计的专属 CMS 解决方案。基于 **Go (Golang)** 开发，vGocms 提供卓越的处理速度、极高的负载能力和完美的自动化系统。

---

## 🔗 演示信息 (Demo)

* **管理后台 (Admin)**: [https://demo-cms-vgo.vgo.codes](https://demo-cms-vgo.vgo.codes)
    * 账号: `admin`
    * 密码: `admin123`
* **前端演示 (Frontend Demo)**: [https://demo-vgo-1.vgo.codes/](https://demo-vgo-1.vgo.codes/)

---

## 🚀 核心功能深度解析 (Deep Dive)

### 1. 多站点管理与自动化 (Automation)
* **智能调度器 (Smart Scheduler)**: 每分钟运行的标准定时任务系统，协调所有后台任务。
* **自动同步视频 (Auto Sync Video)**: 根据分类过滤器（类型、国家、服务器等）自动同步新电影。支持按小时/天限制同步数量以防止垃圾信息。
* **随机发布活动 (Random Publish Campaign)**: 
    * 设置随机发布的时间间隔（例如：每 30-120 分钟）。
    * **发布时间分散 (Spread Timing)**: 在单次发布中分散电影/视频剧集的发布时间（相隔数分钟），以产生如同真人操作的自然活动信号 (Natural Signal)，对 SEO 极有帮助。
* **自定义源代码**: 允许为每个特定站点在 `<head>` 和 `<body>` 中插入自定义 HTML 代码（便于安装追踪代码、像素或独立 CSS/JS）。

### 2. 深度 SEO 模板系统
* **按页面类型配置 SEO**: 为不同类型页面独立定制 Meta 标题/描述/关键词：首页、电影详情、播放页、搜索、演员页以及按年份/类型分类的列表页。
* **动态变量系统 (Variables)**: 使用如 `{title}`, `{original_name}`, `{episode}`, `{year}`, `{sitename}` 等占位符，生成数百万个不重复的内容页面。
* **AI 批量 SEO 生成器**: 只需一键，AI 将根据网站的总体描述，自动为系统中所有页面类型生成完整的 SEO 模板。
* **预览与验证**: 集成实时字符计数器，确保 SEO 内容始终处于 Google 的“安全区”内。

### 3. 智能菜单与导航管理
* **特定站点菜单 (Site-Specific Menus)**: 每个站群站点可以使用独立菜单或回退使用系统菜单。
* **拖拽多级菜单 (Nested Menus)**: 直观的菜单管理界面，支持无限层级的父子分类。
* **快捷链接标签 (Shortcut Link Chips)**: 内置重要路径的快捷方式（最新电影、最多观看、院线大片等），帮助管理员快速创建菜单而无需记住 URL。
* **Lucide 图标支持**: 支持数千个现代图标库，可直接在界面上为每个菜单项轻松自定义。

### 4. 分类与本地化 (Taxonomy & Localization)
* **语言覆盖 (Language Override)**: 强大的功能，允许为单个站点更改分类的显示名称（例如：将类型 "Action" 改为 "Hành Động"），而不会更改数据库中的核心数据。
* **分类过滤器 (Taxonomy Filter)**: 严格控制哪些电影类型或国家允许在特定站点上显示。

### 5. AI 与爬虫的强大功能
* **AI 重写内容**: 通过 OpenRouter (GPT-4, Claude 3...) 自动重写标题/别名/描述。
* **多源爬虫**: 支持 Ophim, MacCMS API, TMDB, vGo Share... 抓取速度极快。

---

## 🛠️ 技术栈 (Tech Stack)

* **后端**: Golang (Gin Framework) - 并发处理，同时执行数千个同步/重写任务。
* **数据库与缓存**: MySQL (Gorm) + Redis (任务队列与 API 缓存)。
* **AI 集成**: OpenRouter (连接全球最强大的 AI 模型)。
* **UI/UX 管理端**: 现代化设计，专为运营大型系统的管理员优化。

---

## 🔥 为什么 vGocms 是被动收入机器？

1.  **节省 99% 的人力**: 系统自动抓取，使用 AI 编写内容，并按随机计划自动发布。
2.  **极速复制站点能力**: 创建一个新站点只需 5 分钟，包含完整的菜单、SEO 和电影数据。
3.  **SEO 最大化优化**: 借助 AI 重写和多站点模板，您将拥有一个高质量且快速收录的站群网络。
4.  **持久的负载能力**: Golang 确保服务器在流量激增时永远不会崩溃。

---

## 🛒 购买信息与支持

* **立即拥有全套 vGocms 及专业界面。**
* **个人 Telegram 支持**: [@apiionline](https://t.me/apiionline)
* **vGocms 社区群**: [t.me/vgocms](https://t.me/vgocms)

---
**vGocms - 运营自动化电影网站帝国的平台。**
