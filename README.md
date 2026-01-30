# 原子物理

基于 [Jupyter Book](https://jupyterbook.org) 构建的书籍网站。

在线地址: https://jinleiphys.github.io/atomic/

## 环境搭建

```bash
# 克隆仓库
git clone https://github.com/jinleiphys/atomic.git
cd atomic

# 创建并激活虚拟环境
python3 -m venv .venv
source .venv/bin/activate

# 安装依赖
pip install -r requirements.txt
```

## 本地构建与预览

```bash
# 激活虚拟环境(如果还没激活)
source .venv/bin/activate

# 构建 HTML
jupyter-book build book/

# 在浏览器中打开预览
open book/_build/html/index.html
```

如果修改了内容，重新运行 `jupyter-book build book/` 即可。加 `--all` 可以强制全部重建：

```bash
jupyter-book build --all book/
```

## 添加新章节

1. 在 `book/` 目录下创建 `.md` 或 `.ipynb` 文件
2. 编辑 `book/_toc.yml`，在 `chapters:` 下添加对应条目：

```yaml
format: jb-book
root: intro
chapters:
- file: markdown
- file: notebooks
- file: my-new-chapter    # <-- 新增，不需要写扩展名
```

3. 重新构建

## 部署到 GitHub Pages

```bash
source .venv/bin/activate
jupyter-book build book/
ghp-import -n -p -f book/_build/html
```

执行后内容会被推送到 `gh-pages` 分支，GitHub Pages 会自动更新。

需要在 GitHub 仓库的 **Settings > Pages** 中将 Source 设置为 `gh-pages` 分支、`/` 目录。

## 项目结构

```
atomic/
├── .venv/                  # 虚拟环境(不提交到 git)
├── requirements.txt        # Python 依赖
├── README.md
└── book/
    ├── _config.yml         # 书籍配置(标题、作者等)
    ├── _toc.yml            # 目录结构
    ├── intro.md            # 首页
    ├── markdown.md         # 示例章节
    ├── notebooks.ipynb     # 示例 Notebook
    ├── markdown-notebooks.md
    ├── logo.png
    ├── references.bib      # 参考文献
    └── _build/             # 构建产物(不提交到 git)
```

## 常用内容语法

Jupyter Book 使用 [MyST Markdown](https://myst-parser.readthedocs.io/) 语法，在标准 Markdown 基础上支持：

- 数学公式: `$E=mc^2$` 或 `$$\int_0^\infty f(x)dx$$`
- 引用: `` {cite}`key` ``(配合 `references.bib`)
- 提示框: `` ```{note} `` / `` ```{warning} `` / `` ```{tip} ``
- 图片: `` ```{figure} path/to/image.png ``
- 交叉引用: `` {ref}`label` ``

详见 [MyST 语法文档](https://jupyterbook.org/en/stable/reference/cheatsheet.html)。
