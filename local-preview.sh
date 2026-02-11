#!/bin/bash
# Jupyter Book 本地预览脚本 (支持交互式代码运行，中英双语)
# 构建输出到: /Users/jinlei/atomic

SOURCE_DIR="/Users/jinlei/Desktop/code/atomic/book"
EN_SOURCE_DIR="$SOURCE_DIR/en"
OUTPUT_DIR="/Users/jinlei/atomic"

echo "=== Jupyter Book 本地预览 (中英双语) ==="

# 激活 conda
echo ""
echo "[1/6] 激活 conda..."
if [ -f ~/miniconda3/etc/profile.d/conda.sh ]; then
    source ~/miniconda3/etc/profile.d/conda.sh
elif [ -f ~/anaconda3/etc/profile.d/conda.sh ]; then
    source ~/anaconda3/etc/profile.d/conda.sh
fi
conda activate base

# 检查并安装依赖
echo ""
echo "[2/6] 检查依赖..."
pip install -q jupyter-book notebook

set -e

# 准备本地模板 (避免网络下载)
echo ""
echo "[3/6] 准备模板..."
TEMPLATE_ZIP="/Users/jinlei/Downloads/book-theme-main.zip"
LOCAL_TEMPLATE="$SOURCE_DIR/_templates/book-theme-main"
if [ -f "$TEMPLATE_ZIP" ] && [ ! -d "$LOCAL_TEMPLATE" ]; then
    mkdir -p "$SOURCE_DIR/_templates"
    unzip -q "$TEMPLATE_ZIP" -d "$SOURCE_DIR/_templates"
    rm -rf "$SOURCE_DIR/_templates/__MACOSX"
    echo "模板已解压到 $LOCAL_TEMPLATE"
fi

# ========== 构建中文版 ==========
echo ""
echo "[4/6] 构建中文版..."
MYST_YML="$SOURCE_DIR/myst.yml"
cp "$MYST_YML" "$MYST_YML.bak"
python3 << 'PYTHON'
import yaml

with open("/Users/jinlei/Desktop/code/atomic/book/myst.yml", "r") as f:
    config = yaml.safe_load(f)

# 使用本地模板
config["site"]["template"] = "_templates/book-theme-main"

# 使用本地 Jupyter server (替换 thebe/binder)
if "thebe" in config["project"]:
    del config["project"]["thebe"]
config["project"]["jupyter"] = {
    "server": {
        "url": "http://localhost:8888/",
        "token": "local"
    }
}

with open("/Users/jinlei/Desktop/code/atomic/book/myst.yml", "w") as f:
    yaml.dump(config, f, allow_unicode=True, default_flow_style=False, sort_keys=False)
PYTHON

cd "$SOURCE_DIR"
python -m jupyter_book build --html

# 恢复中文版 myst.yml
mv "$MYST_YML.bak" "$MYST_YML"

# ========== 构建英文版 ==========
echo ""
echo "[5/6] 构建英文版..."
EN_MYST_YML="$EN_SOURCE_DIR/myst.yml"
cp "$EN_MYST_YML" "$EN_MYST_YML.bak"
python3 << 'PYTHON'
import yaml

with open("/Users/jinlei/Desktop/code/atomic/book/en/myst.yml", "r") as f:
    config = yaml.safe_load(f)

# 使用本地模板 (英文版模板在上级目录)
config["site"]["template"] = "../_templates/book-theme-main"

# 使用本地 Jupyter server (替换 thebe/binder)
if "thebe" in config["project"]:
    del config["project"]["thebe"]
config["project"]["jupyter"] = {
    "server": {
        "url": "http://localhost:8888/",
        "token": "local"
    }
}

with open("/Users/jinlei/Desktop/code/atomic/book/en/myst.yml", "w") as f:
    yaml.dump(config, f, allow_unicode=True, default_flow_style=False, sort_keys=False)
PYTHON

cd "$EN_SOURCE_DIR"
BASE_URL=/en python -m jupyter_book build --html

# 恢复英文版 myst.yml
mv "$EN_MYST_YML.bak" "$EN_MYST_YML"

# ========== 合并输出 ==========
echo ""
echo "[6/6] 合并构建结果并启动服务..."
rm -rf "$OUTPUT_DIR"
cp -r "$SOURCE_DIR/_build/html" "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR/en"
cp -r "$EN_SOURCE_DIR/_build/html/"* "$OUTPUT_DIR/en/"
rm -rf "$SOURCE_DIR/_build"
rm -rf "$EN_SOURCE_DIR/_build"

# 后台启动 Jupyter server (用于交互式代码)
export MPLCONFIGDIR="$SOURCE_DIR"
jupyter lab --NotebookApp.token='local' --NotebookApp.allow_origin='*' --no-browser --port=8888 &
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
echo "  中文版: http://localhost:8000"
echo "  英文版: http://localhost:8000/en/"
echo "  点击页面上的 'Live Code' 按钮运行代码"
echo "  按 Ctrl+C 停止所有服务"
echo "=========================================="
echo ""

cd "$OUTPUT_DIR"
python -m http.server 8000
