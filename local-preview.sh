#!/bin/bash
# Jupyter Book 本地预览脚本 (支持交互式代码运行，中英双语)
# 构建输出到: /Users/jinlei/atomic

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/book"
EN_SOURCE_DIR="$SOURCE_DIR/en"
OUTPUT_DIR="/Users/jinlei/atomic"
TEMPLATE_CACHE="$SCRIPT_DIR/.myst-templates"

echo "=== Jupyter Book 本地预览 (中英双语) ==="

# 激活 conda
echo ""
echo "[1/6] 激活 conda..."
if [ -f ~/anaconda3/etc/profile.d/conda.sh ]; then
    source ~/anaconda3/etc/profile.d/conda.sh
elif [ -f ~/miniconda3/etc/profile.d/conda.sh ]; then
    source ~/miniconda3/etc/profile.d/conda.sh
fi
conda activate base

# 检查并安装依赖
echo ""
echo "[2/6] 检查依赖..."
pip install -q jupyter-book notebook

set -e

# 准备构建配置
echo ""
echo "[3/6] 准备配置..."

# ========== 缓存模板 ==========
# 只在首次运行时下载 book-theme 模板，之后从本地缓存恢复
ensure_template_cache() {
    local build_dir="$1/_build/templates/site/myst/book-theme"
    if [ -d "$TEMPLATE_CACHE/book-theme" ]; then
        # 从永久缓存恢复到 _build/templates
        mkdir -p "$(dirname "$build_dir")"
        if [ ! -d "$build_dir" ]; then
            cp -r "$TEMPLATE_CACHE/book-theme" "$build_dir"
            echo "  ✓ 从缓存恢复 book-theme 模板"
        fi
    fi
}

save_template_cache() {
    local build_dir="$1/_build/templates/site/myst/book-theme"
    if [ -d "$build_dir" ] && [ ! -d "$TEMPLATE_CACHE/book-theme" ]; then
        # 首次构建后保存模板到永久缓存
        mkdir -p "$TEMPLATE_CACHE"
        cp -r "$build_dir" "$TEMPLATE_CACHE/book-theme"
        echo "  ✓ 模板已缓存到 $TEMPLATE_CACHE"
    fi
}

# ========== 构建中文版 ==========
echo ""
echo "[4/6] 构建中文版..."
MYST_YML="$SOURCE_DIR/myst.yml"
cp "$MYST_YML" "$MYST_YML.bak"
python3 << PYTHON
import yaml

with open("$SOURCE_DIR/myst.yml", "r") as f:
    config = yaml.safe_load(f)

# 使用本地 Jupyter server (替换 thebe/binder)
if "thebe" in config["project"]:
    del config["project"]["thebe"]
config["project"]["jupyter"] = {
    "server": {
        "url": "http://localhost:8888/",
        "token": "local"
    }
}

with open("$SOURCE_DIR/myst.yml", "w") as f:
    yaml.dump(config, f, allow_unicode=True, default_flow_style=False, sort_keys=False)
PYTHON

ensure_template_cache "$SOURCE_DIR"

cd "$SOURCE_DIR"
for attempt in 1 2 3; do
    python -m jupyter_book build --html && break
    echo "⚠️  构建失败 (尝试 $attempt/3)，5秒后重试..."
    sleep 5
done

save_template_cache "$SOURCE_DIR"

# 恢复中文版 myst.yml
mv "$MYST_YML.bak" "$MYST_YML"

# ========== 构建英文版 ==========
echo ""
echo "[5/6] 构建英文版..."
EN_MYST_YML="$EN_SOURCE_DIR/myst.yml"
cp "$EN_MYST_YML" "$EN_MYST_YML.bak"
python3 << PYTHON
import yaml

with open("$EN_SOURCE_DIR/myst.yml", "r") as f:
    config = yaml.safe_load(f)

# 使用本地 Jupyter server (替换 thebe/binder)
if "thebe" in config["project"]:
    del config["project"]["thebe"]
config["project"]["jupyter"] = {
    "server": {
        "url": "http://localhost:8888/",
        "token": "local"
    }
}

with open("$EN_SOURCE_DIR/myst.yml", "w") as f:
    yaml.dump(config, f, allow_unicode=True, default_flow_style=False, sort_keys=False)
PYTHON

ensure_template_cache "$EN_SOURCE_DIR"

cd "$EN_SOURCE_DIR"
for attempt in 1 2 3; do
    BASE_URL=/en python -m jupyter_book build --html && break
    echo "⚠️  构建失败 (尝试 $attempt/3)，5秒后重试..."
    sleep 5
done

save_template_cache "$EN_SOURCE_DIR"

# 恢复英文版 myst.yml
mv "$EN_MYST_YML.bak" "$EN_MYST_YML"

# ========== 合并输出 ==========
echo ""
echo "[6/6] 合并构建结果并启动服务..."
rm -rf "$OUTPUT_DIR"
cp -r "$SOURCE_DIR/_build/html" "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR/en"
cp -r "$EN_SOURCE_DIR/_build/html/"* "$OUTPUT_DIR/en/"
# 只删除 HTML 输出，保留模板缓存 (_build/templates/)
rm -rf "$SOURCE_DIR/_build/html"
rm -rf "$EN_SOURCE_DIR/_build/html"

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
