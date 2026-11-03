#!/usr/bin/env python3
"""Compile a LaTeX document twice with XeLaTeX."""

import argparse
import shutil
import subprocess
import sys
from pathlib import Path


def main() -> int:
    default_tex = Path(__file__).resolve().parent / "allin.tex"
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "tex_file",
        nargs="?",
        type=Path,
        default=default_tex,
        help="TeX source file (default: allin.tex)",
    )
    args = parser.parse_args()
    tex_file = args.tex_file.resolve()

    xelatex = shutil.which("xelatex")
    if xelatex is None:
        print("错误：找不到 xelatex，请先安装 TeX Live 或 MiKTeX。", file=sys.stderr)
        return 1
    if not tex_file.is_file():
        print(f"错误：文件不存在：{tex_file}", file=sys.stderr)
        return 1

    command = [xelatex, "-interaction=nonstopmode", "-file-line-error", tex_file.name]
    for pass_number in (1, 2):
        print(f"XeLaTeX 第 {pass_number} 次编译：{tex_file.name}")
        result = subprocess.run(command, cwd=tex_file.parent, check=False)
        if result.returncode != 0:
            return result.returncode

    pdf_file = tex_file.with_suffix(".pdf")
    if not pdf_file.is_file():
        print(f"错误：未生成 PDF：{pdf_file}", file=sys.stderr)
        return 1

    print(f"编译完成：{pdf_file}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
