# Project Guidelines for Claude

## 项目概述

这是一本原子物理学教材，采用双线叙事风格：
- **物理叙事 (Carbon Story)**：追溯概念如何演化、图景如何更替
- **硅基视角 (Silicon Perspective)**：用计算机科学的类比和数值方法重新诠释物理概念
- **AI Workshop**：可运行的 Python 代码

## 写作风格

- **段落式叙述**：使用连贯的段落而非列表要点，保持散文式的流畅表达
- **杜绝破折号和列表**：不使用 `-`、`*` 等列表格式，内容融入连贯段落
- **不使用小节标题**：章节内部避免过多 `###` 小节标题
- **使用英文括号**：使用 `()` 而非 `（）`
- **内容详尽**：每个概念充分展开，不惜篇幅

## 构建与部署

项目使用 **Jupyter Book 2.x (MyST)** 构建，通过 **GitHub Actions 自动部署**。

### 自动部署 (推荐)

推送到 `main` 分支后，GitHub Actions 会自动构建并部署到 GitHub Pages。

```bash
git add . && git commit -m "your message" && git push origin main
```

工作流文件位于 `.github/workflows/deploy.yml`。

### 本地预览 (可选)

如需本地预览，可以构建但**不要提交 `_build` 目录**：

```bash
cd /Users/jinlei/Desktop/code/atomic/book
python -m jupyter_book build --site
# 打开 _build/html/index.html 预览
```

`_build/` 目录已在 `.gitignore` 中忽略。

## 分支说明

- **main**：源文件，包含 `book/` 目录下的 Markdown 和配置
- **gh-pages**：构建后的静态 HTML 文件

## 网站地址

- 中文版：https://jinleiphys.github.io/atomic/
- 英文版：https://jinleiphys.github.io/atomic/en/

## 双语工作流

项目同时维护中文版 (`book/`) 和英文版 (`book/en/`) 两个版本。

- **中文源文件**：`book/` 目录下的 `.md` 文件
- **英文源文件**：`book/en/` 目录下的 `.md` 文件（镜像结构）
- **共享资源**：图片文件在 `book/ch01/` 等目录中，英文版通过相对路径 `../../ch01/` 引用
- **共享配置**：`references.bib` 和 `logo.png` 由英文版通过 `../` 相对路径引用

修改内容时需同步更新两个版本。英文版代码中的 matplotlib 标签使用英文，字体配置使用 `DejaVu Sans`。
