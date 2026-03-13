# GitHub Pages 部署指南

## 📋 前置步骤

### ✅ 已完成
- [x] 初始化 Git 仓库
- [x] 提交所有网站文件
- [x] 32 个文件已准备好

### ⏳ 待您手动完成（需要 2-3 分钟）

---

## 🎯 第一步：创建 GitHub 仓库

### 方式一：通过 GitHub 网站创建（推荐）

1. **访问 GitHub**
   - 打开浏览器，访问：https://github.com
   - 登录您的 GitHub 账号（如果没有，请先注册）

2. **创建新仓库**
   - 点击右上角的 `+` 按钮
   - 选择 `New repository`

3. **填写仓库信息**
   - **Repository name**（仓库名称）：建议使用 `haoya-dental-clinic`
   - **Description**（描述）：汕博雅口腔诊所官方网站
   - **Public / Private**：选择 **Public**（必须公开才能使用 GitHub Pages）
   - ⚠️ **不要**勾选 "Add a README file"
   - ⚠️ **不要**选择 `.gitignore` 或 `license`

4. **点击 "Create repository"**

---

## 🎯 第二步：连接本地仓库到 GitHub

### 您的仓库 URL
创建仓库后，GitHub 会显示仓库的 HTTPS URL，格式如下：
```
https://github.com/您的用户名/haoya-dental-clinic.git
```

**请将此 URL 复制下来，然后告诉我！**

我会帮您执行以下命令：

```bash
# 添加远程仓库
git remote add origin https://github.com/您的用户名/haoya-dental-clinic.git

# 推送到 GitHub
git push -u origin main
```

---

## 🎯 第三步：启用 GitHub Pages

推送成功后，按照以下步骤启用 GitHub Pages：

1. **访问仓库设置**
   - 在您的仓库页面，点击 `Settings` 标签
   - 在左侧菜单中找到 `Pages` 选项

2. **配置 Pages 设置**
   - **Source**（来源）：选择 `Deploy from a branch`
   - **Branch**（分支）：选择 `main`
   - **Folder**（文件夹）：选择 `/ (root)`

3. **点击 "Save"**

---

## 🎯 第四步：等待部署完成

- GitHub Pages 会在 1-2 分钟内自动部署您的网站
- 您可以在 `Pages` 设置页面看到部署状态
- 部署完成后，会显示您的网站 URL，格式为：
  ```
  https://您的用户名.github.io/haoya-dental-clinic/
  ```

---

## 🔍 验证部署

部署完成后，您的网站将包含以下页面：

- **首页**：`https://您的用户名.github.io/haoya-dental-clinic/`
- **文章列表**：`https://您的用户名.github.io/haoya-dental-clinic/articles.html`
- **文章详情1**：`https://您的用户名.github.io/haoya-dental-clinic/articles/article-1-orthodontics-price.html`
- **文章详情2**：`https://您的用户名.github.io/haoya-dental-clinic/articles/article-2-implants-guide.html`
- **FAQ页面**：`https://您的用户名.github.io/haoya-dental-clinic/faq.html`

---

## 📝 更新网站

以后更新网站时，只需要执行：

```bash
# 添加修改的文件
git add .

# 提交修改
git commit -m "更新描述"

# 推送到 GitHub
git push
```

GitHub Pages 会自动部署您的更新！

---

## 🌐 绑定自定义域名（可选）

如果您有自定义域名（如 `www.haoya-dental.com`），可以在 GitHub Pages 设置中配置：

1. 在 `Pages` 设置中，找到 `Custom domain`（自定义域名）
2. 输入您的域名，点击 `Save`
3. 按照提示配置 DNS 记录

---

## ⚠️ 常见问题

### Q1: 推送时提示认证失败怎么办？
**A:** 需要配置 GitHub 认证：
- 使用 GitHub Personal Access Token（推荐）
- 或者配置 SSH 密钥

### Q2: GitHub Pages 访问速度慢？
**A:** GitHub Pages 在国内访问速度正常，如果需要更快速度，建议使用阿里云 OSS。

### Q3: 如何查看部署日志？
**A:** 在仓库的 `Actions` 标签中可以查看部署日志。

---

## 📞 需要帮助？

如果您在部署过程中遇到任何问题，请随时告诉我！
