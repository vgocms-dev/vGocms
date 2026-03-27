# vGocms Installation Guide

Official documentation for setting up vGocms on your server using aaPanel and our automated installation script.

---

## 1. aaPanel Installation
First, you need to install aaPanel to manage your server environment. 

**Note:** If you have already installed aaPanel, you can skip this step.

Run the following command:
```bash
URL=https://www.aapanel.com/script/install_panel_en.sh && if [ -f /usr/bin/curl ];then curl -ksSO $URL ;else wget --no-check-certificate -O install_panel_en.sh $URL;fi;bash install_panel_en.sh ipssl
```

After installation, log in to your aaPanel dashboard and install the following required applications from the **App Store**:
- **Nginx:** Latest version
- **MySQL/MariaDB:** MariaDB 10.6+ is recommended
- **Redis:** Latest version

---

## 2. Database Configuration
1. **Create Database:** Go to **Databases** → **Add Database** in aaPanel.
2. **Save Credentials:** Copy the **Database Name**, **Username**, and **Password**. You will need these during the vGocms setup script.

---

## 3. Directory Preparation
Create a storage directory for your vGocms admin panel:
1. Open **Files** manager in aaPanel.
2. Navigate to `/www/wwwroot/`.
3. Create a new folder, e.g., `vgocms-admin`.
4. Copy the full path: `/www/wwwroot/vgocms-admin`.

---

## 4. SSH Installation
Connect to your server via SSH using Putty, Termius, or your preferred terminal.

> **Root Access:** You must run the installation as root. If you are logged in as a standard user, switch to root using: `sudo -s`

### Navigate to your directory
```bash
cd /www/wwwroot/vgocms-admin
```

### Run the Installation Script
Execute the following command to start the remote installation process:
```bash
curl -fsSL https://raw.githubusercontent.com/vgocms-dev/vGocms/main/setup.sh -o setup.sh && bash setup.sh
```

---

## 5. Following the Setup Script
The script will guide you through several configuration steps:
- **Language Selection:** Choose between 1) Vietnamese or 2) English.
- **System Check:** The script automatically detects your architecture (AMD64 or ARM64) and downloads the appropriate binary.
- **Environment Configuration:**
  - **MySQL:** Enter host, port, user, password, and DB name.
  - **Redis:** Enter address, password, and DB index.
  - **App Port:** Default is `8000`.
- **Systemd Service:** Choose `y` to create a systemd service for automatic background execution.

---

## 6. Final aaPanel Configuration
Once the script finishes, you need to expose the application to the internet:
1. Go to **aaPanel** → **Website** → **Proxy Project** → **Add Proxy**.
2. **Target URL:** Enter `http://127.0.0.1:8000` (replace 8000 if you chose a different port).
3. **Domain name:** Enter your admin or API domain.
4. Click **Confirm**.
5. Go to the **SSL** tab for that domain and issue an SSL certificate (Let's Encrypt R13).

---

## Support & Community
- **GitHub:** [vgocms-dev/vGocms](https://github.com/vgocms-dev/vGocms)
- **Telegram Support:** [@apiionline](https://t.me/apiionline)
- **Community Group:** [t.me/vgocms](https://t.me/vgocms)
