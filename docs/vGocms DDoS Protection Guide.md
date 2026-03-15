# vGocms DDoS Protection Guide (Multi-language)

---

## 🇻🇳 Tiếng Việt: Hướng dẫn cấu hình Rate Limiting

Tài liệu này hướng dẫn thiết lập quy tắc giới hạn tốc độ trên Cloudflare để bảo vệ hệ thống vGocms khỏi các cuộc tấn công flooding.

### 1. Thông số cấu hình
Nhập các thông số sau vào **Security > Security rules > Rate limiting rules**:

* **Rule name:** `vGocms_DDoS_Protection_450_10s`
* **Field:** `URI Path`
* **Operator:** `wildcard`
* **Value:** `/*`
* **Characteristics:** `IP`
* **Requests:** `450`
* **Period:** `10 seconds`
* **Action:** `Block` (hoặc `Managed Challenge`)
* **Duration:** `10 seconds` (hoặc `1 hour`)
* **Order:** `First`

### 2. Giải thích kỹ thuật
* **Chống Flood:** Ngưỡng 450 req/10s ngăn chặn script tấn công làm tràn CPU/RAM server API.
* **Wildcard:** `/*` bảo vệ toàn diện từ file tĩnh đến endpoint tìm kiếm.
* **Tối ưu:** Chặn tại Layer 7 Cloudflare giúp Web Server không phải xử lý traffic rác.

---

## 🇺🇸 English: Rate Limiting Configuration Guide

This document provides instructions for setting up Rate Limiting rules on Cloudflare to protect vGocms from flooding attacks.

### 1. Configuration Parameters
Navigate to **Security > Security rules > Rate limiting rules**:

* **Rule name:** `vGocms_DDoS_Protection_450_10s`
* **Field:** `URI Path`
* **Operator:** `wildcard`
* **Value:** `/*`
* **Characteristics:** `IP`
* **Requests:** `450`
* **Period:** `10 seconds`
* **Action:** `Block` (or `Managed Challenge`)
* **Duration:** `10 seconds` (or `1 hour`)
* **Order:** `First`

### 2. Technical Insights
* **Anti-Flood:** 450 req/10s stops attack scripts from exhausting API server resources.
* **Wildcard Matching:** Covers all endpoints including heavy DB search queries.
* **Edge Protection:** Blocking at the edge offloads traffic from your origin server.

---

## 🇨🇳 Chinese (简体中文): 速率限制配置指南

本文档旨在指导如何在 Cloudflare 上设置速率限制规则，以保护 vGocms 系统免受洪水攻击。

### 1. 配置参数
进入 **Security > Security rules > Rate limiting rules**:

* **Rule name:** `vGocms_DDoS_Protection_450_10s`
* **Field:** `URI Path`
* **Operator:** `wildcard`
* **Value:** `/*`
* **Characteristics:** `IP`
* **Requests:** `450`
* **Period:** `10 seconds`
* **Action:** `Block` (或 `Managed Challenge`)
* **Duration:** `10 seconds` (或 `1 hour`)
* **Order:** `First`

### 2. 技术解析
* **防止洪水请求:** 450次/10秒足以阻止恶意脚本耗尽服务器资源。
* **全路径覆盖:** 使用 `/*` 确保所有 API 和页面都受到保护。
* **性能优化:** 在 Cloudflare 边缘进行拦截，大幅减轻后端服务器压力。
