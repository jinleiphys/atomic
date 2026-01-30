# Project Guidelines for Claude

## 写作风格

- **不使用破折号**：中文写作中避免使用破折号（——），改用逗号、句号或其他标点来分隔句子结构
- **使用英文括号**：使用英文括号 () 而非中文括号（）
- **宏大叙事风格**：使用连贯的段落而非列表要点，保持散文式的流畅表达

## 构建与部署

### 本地构建
```bash
/Users/jinlei/anaconda3/envs/pinn/bin/jupyter-book build book/
```

### 部署到 GitHub Pages
代码提交到 `main` 分支后，还需要将构建结果推送到 `gh-pages` 分支：
```bash
# 1. 先构建
/Users/jinlei/anaconda3/envs/pinn/bin/jupyter-book build book/

# 2. 推送到 gh-pages 分支
/Users/jinlei/anaconda3/envs/pinn/bin/ghp-import -n -p -f book/_build/html
```

完整流程：
```bash
git add . && git commit -m "your message" && git push  # 推送源码到 main
/Users/jinlei/anaconda3/envs/pinn/bin/jupyter-book build book/  # 构建
/Users/jinlei/anaconda3/envs/pinn/bin/ghp-import -n -p -f book/_build/html  # 部署到 gh-pages
```
