#!/bin/bash
# Jupyter Book 本地预览脚本 (支持交互式代码运行)
# 构建输出到: /Users/jinlei/atomic

SOURCE_DIR="/Users/jinlei/Desktop/code/atomic/book"
OUTPUT_DIR="/Users/jinlei/atomic"

echo "=== Jupyter Book 本地预览 ==="

# 激活 conda
echo ""
echo "[1/5] 激活 conda..."
if [ -f ~/miniconda3/etc/profile.d/conda.sh ]; then
    source ~/miniconda3/etc/profile.d/conda.sh
elif [ -f ~/anaconda3/etc/profile.d/conda.sh ]; then
    source ~/anaconda3/etc/profile.d/conda.sh
fi
conda activate base

# 检查并安装依赖
echo ""
echo "[2/5] 检查依赖..."
pip install -q jupyter-book notebook

set -e

# 准备本地模板 (避免网络下载)
echo ""
echo "[3/5] 准备模板..."
TEMPLATE_ZIP="/Users/jinlei/Downloads/book-theme-main.zip"
LOCAL_TEMPLATE="$SOURCE_DIR/_templates/book-theme-main"
if [ -f "$TEMPLATE_ZIP" ] && [ ! -d "$LOCAL_TEMPLATE" ]; then
    mkdir -p "$SOURCE_DIR/_templates"
    unzip -q "$TEMPLATE_ZIP" -d "$SOURCE_DIR/_templates"
    rm -rf "$SOURCE_DIR/_templates/__MACOSX"
    echo "模板已解压到 $LOCAL_TEMPLATE"
fi

# 临时修改 myst.yml 使用本地模板
MYST_YML="$SOURCE_DIR/myst.yml"
cp "$MYST_YML" "$MYST_YML.bak"
sed -i '' 's/template: book-theme/template: _templates\/book-theme-main/' "$MYST_YML"

# 构建静态 HTML
echo ""
echo "[4/5] 构建 Jupyter Book..."
cd "$SOURCE_DIR"
python -m jupyter_book build --html

# 恢复 myst.yml
mv "$MYST_YML.bak" "$MYST_YML"

# 复制到目标目录并清理
echo ""
echo "[5/5] 启动服务..."
rm -rf "$OUTPUT_DIR"
cp -r "$SOURCE_DIR/_build/html" "$OUTPUT_DIR"
rm -rf "$SOURCE_DIR/_build"

# 后台启动 Jupyter server (用于 Thebe 交互式代码)
python -m notebook --NotebookApp.token='' --NotebookApp.allow_origin='*' --no-browser --port=8888 &
JUPYTER_PID=$!

# 清理函数：退出时关闭 Jupyter server
cleanup() {
    echo ""
    echo "关闭服务..."
    kill $JUPYTER_PID 2>/dev/null
    exit 0
}
trap cleanup INT TERM

echo ""
echo "=========================================="
echo "  预览地址: http://localhost:8000"
echo "  点击页面上的 'Live Code' 按钮运行代码"
echo "  按 Ctrl+C 停止所有服务"
echo "=========================================="
echo ""

cd "$OUTPUT_DIR"
python -m http.server 8000
