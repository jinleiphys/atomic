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

项目使用 **Jupyter Book 2.x (MyST)** 构建。

### 本地构建
```bash
cd /Users/jinlei/Desktop/code/atomic/book
python -m jupyter_book build --site
```

### 部署到 GitHub Pages

**重要**：必须设置 `BASE_URL` 环境变量！

```bash
cd /Users/jinlei/Desktop/code/atomic/book

# 构建（必须设置 BASE_URL）
BASE_URL="/atomic" python -m jupyter_book build --html

# 部署到 gh-pages 分支
python -m ghp_import -n -p -f _build/html
```

### 完整工作流
```bash
# 1. 提交源码到 main
git add . && git commit -m "your message" && git push origin main

# 2. 构建并部署
cd book
BASE_URL="/atomic" python -m jupyter_book build --html
python -m ghp_import -n -p -f _build/html
```

## 分支说明

- **main**：源文件，包含 `book/` 目录下的 Markdown 和配置
- **gh-pages**：构建后的静态 HTML 文件

## 网站地址

https://jinleiphys.github.io/atomic/
