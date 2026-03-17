# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

这是一本原子物理学教材（源代码：原子物理的逆向工程），采用双线叙事风格：
- **物理叙事 (Carbon Story)**：追溯概念如何演化、图景如何更替
- **硅基视角 (Silicon Perspective)**：用计算机科学的类比和数值方法重新诠释物理概念
- **AI Workshop**：可运行的 Python 代码（NumPy、Matplotlib、SciPy）

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

工作流文件：`.github/workflows/deploy.yml`。CI 分别构建中英文版本，然后合并到 `book/_build/html/`（英文版置于 `en/` 子目录），再通过 `ghp-import` 部署到 `gh-pages` 分支。

### 本地预览 (可选)

```bash
cd book && python -m jupyter_book build --html
# 打开 _build/html/index.html 预览
```

`_build/` 目录已在 `.gitignore` 中忽略，**不要提交**。

### 双配置系统

项目存在两套配置文件：
- **`myst.yml`**（中文 `book/myst.yml`，英文 `book/en/myst.yml`）：现代 MyST 格式，包含目录结构（`toc`）、站点选项、导航栏。**新增章节必须同时更新 `myst.yml` 中的 `toc` 和 `_toc.yml`**，否则会出现章节在网站目录中缺失的情况。
- **`_config.yml` + `_toc.yml`**：Jupyter Book 传统格式，仍被构建系统使用。

## 分支说明

- **main**：源文件，包含 `book/` 目录下的 Markdown 和配置
- **gh-pages**：构建后的静态 HTML（由 CI 自动生成，不要手动修改）

## 网站地址

- 中文版：https://jinleiphys.github.io/atomic/
- 英文版：https://jinleiphys.github.io/atomic/en/

## 双语工作流

项目同时维护中文版 (`book/`) 和英文版 (`book/en/`) 两个版本。

- **中文源文件**：`book/` 目录下的 `.md` 文件
- **英文源文件**：`book/en/` 目录下的 `.md` 文件（镜像结构）
- **共享资源**：图片文件在 `book/ch01/` 等目录中，英文版通过相对路径 `../../ch01/` 引用
- **共享配置**：`references.bib` 和 `logo.png` 由英文版通过 `../` 相对路径引用

### 中英文一致性（最高优先级）

中文版和英文版必须保持叙事结构完全一致。这意味着：

1. **同步修改**：任何对中文版内容的增删改，必须同步反映到英文版，反之亦然。不允许出现一个版本有而另一个版本没有的章节、段落或图表。
2. **结构镜像**：两个版本的章节划分、小节标题、段落顺序、图表位置必须一一对应。中文版加了一段话，英文版对应位置也必须加上翻译。
3. **公式与代码一致**：LaTeX 公式在两个版本中完全相同。Python 代码逻辑相同，仅文本标签（xlabel、ylabel、title、print 输出、注释）翻译为对应语言。
4. **图表引用一致**：同一张图在两个版本中出现在相同的上下文位置。英文版图片 `:name:` 标签加 `-en` 后缀以避免冲突。
5. **英文版字体**：`remove-cell` 代码块中的字体配置使用 `['DejaVu Sans']` 替代 CJK 字体。matplotlib 标签使用英文。

### Notebook 代码块格式

每个含代码的 `.md` 文件开头必须有字体配置的 `remove-cell`：

中文版：
```python
plt.rcParams['font.sans-serif'] = ['Heiti TC', 'Noto Sans CJK SC', 'SimHei', 'DejaVu Sans']
```

英文版：
```python
plt.rcParams['font.sans-serif'] = ['DejaVu Sans']
```

### 新增章节 checklist

1. 在 `book/ch0X/` 和 `book/en/ch0X/` 下分别创建中英文 `.md` 文件
2. 更新 `book/myst.yml` 的 `toc` 部分
3. 更新 `book/_toc.yml`
4. 更新 `book/en/myst.yml` 的 `toc` 部分
5. 确保中英文内容结构完全对齐
