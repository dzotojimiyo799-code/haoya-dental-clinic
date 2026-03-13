#!/bin/bash

# 恢复品牌名称为中文脚本
echo "========================================="
echo "   恢复中文品牌名称"
echo "========================================="
echo ""
echo "正在将 Shanboa Dental 更新为 汕博雅口腔..."
echo ""

# 更新所有 HTML 文件
echo "正在更新 HTML 文件..."
sed -i '' 's/Shanboa Dental/汕博雅口腔/g' about.html services.html team.html process.html faq.html articles.html contact.html

# 更新文章详情页面
echo "正在更新文章详情页面..."
for file in articles/*.html; do
    if [ -f "$file" ]; then
        sed -i '' 's/Shanboa Dental/汕博雅口腔/g' "$file"
    fi
done

echo ""
echo "========================================="
echo "   ✅ 所有文件更新完成！"
echo "========================================="
echo ""
echo "已将 Shanboa Dental 恢复为 汕博雅口腔"
echo ""
echo "下一步："
echo "1. 检查更新后的文件"
echo "2. 提交到 Git: git add . && git commit -m '恢复中文品牌名称' && git push"
echo ""
