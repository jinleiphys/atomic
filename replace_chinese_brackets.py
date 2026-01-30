#!/usr/bin/env python3
"""
替换所有文件中的中文括号为英文括号
中文括号：（）
英文括号：()
"""

import os
import sys

# 要排除的目录
EXCLUDE_DIRS = {'.git', '__pycache__', 'node_modules', '.venv', 'venv', '.tox', '_build'}

# 要处理的文件扩展名
INCLUDE_EXTENSIONS = {'.md', '.txt', '.py', '.ipynb', '.rst', '.html', '.css', '.js', '.json', '.yaml', '.yml', '.toml'}


def should_process_file(filepath):
    """判断是否应该处理该文件"""
    # 排除脚本自身
    if os.path.basename(filepath) == 'replace_chinese_brackets.py':
        return False
    _, ext = os.path.splitext(filepath)
    return ext.lower() in INCLUDE_EXTENSIONS


def replace_brackets_in_file(filepath, dry_run=False):
    """替换文件中的中文括号为英文括号"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
    except (UnicodeDecodeError, IOError) as e:
        print(f"跳过 (读取错误): {filepath} - {e}")
        return False

    # 检查是否包含中文括号
    if '（' not in content and '）' not in content:
        return False

    # 替换中文括号为英文括号
    new_content = content.replace('（', '(').replace('）', ')')

    if dry_run:
        print(f"将修改: {filepath}")
        return True

    try:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"已修改: {filepath}")
        return True
    except IOError as e:
        print(f"写入错误: {filepath} - {e}")
        return False


def process_directory(root_dir, dry_run=False):
    """递归处理目录中的所有文件"""
    modified_count = 0

    for dirpath, dirnames, filenames in os.walk(root_dir):
        # 排除不需要处理的目录
        dirnames[:] = [d for d in dirnames if d not in EXCLUDE_DIRS]

        for filename in filenames:
            filepath = os.path.join(dirpath, filename)
            if should_process_file(filepath):
                if replace_brackets_in_file(filepath, dry_run):
                    modified_count += 1

    return modified_count


def main():
    # 获取脚本所在目录作为根目录
    root_dir = os.path.dirname(os.path.abspath(__file__))

    # 检查是否为预览模式
    dry_run = '--dry-run' in sys.argv or '-n' in sys.argv

    if dry_run:
        print("=== 预览模式 (不会实际修改文件) ===\n")
    else:
        print("=== 开始替换中文括号 ===\n")

    modified_count = process_directory(root_dir, dry_run)

    print(f"\n{'将修改' if dry_run else '已修改'} {modified_count} 个文件")

    if dry_run:
        print("\n提示: 去掉 --dry-run 参数以实际执行替换")


if __name__ == '__main__':
    main()
