# 🚀 GitHub 部署完整指南

## 方式一：使用自动脚本（推荐）

我已经为您创建了一个自动部署脚本 `deploy-github.sh`，它会自动完成所有步骤。

### 使用步骤：

1. **打开终端，进入项目目录**
   ```bash
   cd /Users/mac/WorkBuddy/20260313094845
   ```

2. **运行部署脚本**
   ```bash
   ./deploy-github.sh
   ```

3. **按照脚本提示操作**
   - 脚本会引导您登录 GitHub
   - 自动创建仓库
   - 自动推送代码
   - 最后引导您启用 GitHub Pages

---

## 方式二：手动操作（如果脚本无法使用）

### 第一步：登录 GitHub

在终端执行：
```bash
gh auth login
```

按照提示操作：
1. 选择 `GitHub.com`
2. 选择 `HTTPS`
3. 选择 `Yes` 登录
4. 选择 `Login with a web browser`
5. 复制显示的设备代码
6. 在浏览器中打开 https://github.com/login/device
7. 粘贴代码并授权

### 第二步：创建仓库

在终端执行：
```bash
gh repo create haoya-dental-clinic --public --description "汕博雅口腔诊所官方网站"
```

### 第三步：连接远程仓库

```bash
git remote add origin https://github.com/您的用户名/haoya-dental-clinic.git
```

### 第四步：推送代码

```bash
git push -u origin main
```

---

## 方式三：完全手动（无 GitHub CLI）

### 第一步：在 GitHub 网站创建仓库

1. 访问 https://github.com
2. 登录您的账号
3. 点击右上角 `+` → `New repository`
4. 填写：
   - **仓库名**：`haoya-dental-clinic`
   - **描述**：`汕博雅口腔诊所官方网站`
   - **选择 Public**
   - ⚠️ **不要**勾选 "Add a README file"
   - ⚠️ **不要**选择 `.gitignore` 或 `license`
5. 点击 `Create repository`

### 第二步：推送代码到 GitHub

创建仓库后，GitHub 会显示推送命令，类似这样：

```bash
git remote add origin https://github.com/您的用户名/haoya-dental-clinic.git
git branch -M main
git push -u origin main
```

将这些命令复制到终端执行即可。

---

## 📋 启用 GitHub Pages

推送代码成功后，启用 GitHub Pages：

1. **访问仓库设置页面**
   - https://github.com/您的用户名/haoya-dental-clinic/settings/pages

2. **配置 Pages 设置**
   - **Source**：选择 `Deploy from a branch`
   - **Branch**：选择 `main` 分支
   - **Folder**：选择 `/ (root)`
   - 点击 `Save`

3. **等待部署完成**
   - 部署需要 1-2 分钟
   - 页面会显示部署进度
   - 完成后会显示网站 URL

---

## 🎉 验证部署

部署成功后，您的网站地址为：

```
https://您的用户名.github.io/haoya-dental-clinic/
```

### 重要页面链接：

- **首页**：`https://您的用户名.github.io/haoya-dental-clinic/`
- **文章列表**：`https://您的用户名.github.io/haoya-dental-clinic/articles.html`
- **文章1**：`https://您的用户名.github.io/haoya-dental-clinic/articles/article-1-orthodontics-price.html`
- **文章2**：`https://您的用户名.github.io/haoya-dental-clinic/articles/article-2-implants-guide.html`
- **FAQ**：`https://您的用户名.github.io/haoya-dental-clinic/faq.html`
- **关于我们**：`https://您的用户名.github.io/haoya-dental-clinic/about.html`
- **服务项目**：`https://您的用户名.github.io/haoya-dental-clinic/services.html`
- **医生团队**：`https://您的用户名.github.io/haoya-dental-clinic/team.html`
- **就诊流程**：`https://您的用户名.github.io/haoya-dental-clinic/process.html`
- **联系方式**：`https://您的用户名.github.io/haoya-dental-clinic/contact.html`

---

## 🔄 后续更新网站

当您需要更新网站内容时，只需执行：

```bash
# 添加修改的文件
git add .

# 提交修改
git commit -m "更新描述"

# 推送到 GitHub
git push
```

GitHub Pages 会自动部署您的更新，通常在 1-2 分钟内完成。

---

## ⚠️ 常见问题

### Q1: 推送时提示认证失败？

**解决方案：**

1. 使用 GitHub CLI 重新登录
   ```bash
   gh auth login
   ```

2. 或者使用 Personal Access Token（PAT）
   - 访问 https://github.com/settings/tokens
   - 生成新的 token
   - 推送时使用 token 作为密码

### Q2: GitHub Pages 访问速度慢？

GitHub Pages 在国内访问速度正常。如果需要更快速度，可以考虑：
- 使用阿里云 OSS
- 使用 Cloudflare Pages

### Q3: 如何查看部署日志？

1. 访问仓库页面
2. 点击 `Actions` 标签
3. 查看最新的部署工作流

### Q4: 如何自定义域名？

1. 在 GitHub Pages 设置中添加自定义域名
2. 配置 DNS 记录（CNAME 或 A 记录）
3. 等待 DNS 生效（通常 24 小时内）

---

## 📞 需要帮助？

如果遇到任何问题，请随时告诉我！

---

## 🌐 SEO 优化建议

部署完成后，建议您：

1. **提交到百度站长平台**
   - 访问 https://ziyuan.baidu.com/
   - 提交网站地图

2. **提交到 Google Search Console**
   - 访问 https://search.google.com/search-console/
   - 验证网站所有权
   - 提交网站地图

3. **创建 sitemap.xml**
   - 我可以帮您生成 sitemap

4. **添加网站分析**
   - 百度统计
   - Google Analytics

---

**祝您部署顺利！🎉**
