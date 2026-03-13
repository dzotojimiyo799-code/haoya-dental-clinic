#!/bin/bash

# Shanboa Dental 品牌名称更新脚本

echo "========================================="
echo "   Shanboa Dental 品牌名称更新"
echo "========================================="
echo ""

# 更新 index.html
echo "正在更新 index.html..."
sed -i '' 's/汕博雅口腔/Shanboa Dental/g' index.html
echo "✅ index.html 更新完成"

# 更新 about.html
echo "正在更新 about.html..."
sed -i '' 's/汕博雅口腔/Shanboa Dental/g' about.html
echo "✅ about.html 更新完成"

# 更新 services.html
echo "正在更新 services.html..."
sed -i '' 's/汕博雅口腔/Shanboa Dental/g' services.html
echo "✅ services.html 更新完成"

# 更新 team.html
echo "正在更新 team.html..."
sed -i '' 's/汕博雅口腔/Shanboa Dental/g' team.html
echo "✅ team.html 更新完成"

# 更新 process.html
echo "正在更新 process.html..."
sed -i '' 's/汕博雅口腔/Shanboa Dental/g' process.html
echo "✅ process.html 更新完成"

# 更新 faq.html
echo "正在更新 faq.html..."
sed -i '' 's/汕博雅口腔/Shanboa Dental/g' faq.html
echo "✅ faq.html 更新完成"

# 更新 articles.html
echo "正在更新 articles.html..."
sed -i '' 's/汕博雅口腔/Shanboa Dental/g' articles.html
echo "✅ articles.html 更新完成"

# 更新 contact.html
echo "正在更新 contact.html..."
sed -i '' 's/汕博雅口腔/Shanboa Dental/g' contact.html
echo "✅ contact.html 更新完成"

# 更新文章详情页面
echo "正在更新文章详情页面..."
for file in articles/*.html; do
    if [ -f "$file" ]; then
        sed -i '' 's/汕博雅口腔/Shanboa Dental/g' "$file"
        echo "✅ $file 更新完成"
    fi
done

echo ""
echo "========================================="
echo "   ✅ 所有文件更新完成！"
echo "========================================="
echo ""
echo "下一步："
echo "1. 检查更新后的文件"
echo "2. 提交到 Git"
echo "3. 推送到 GitHub"
echo ""
