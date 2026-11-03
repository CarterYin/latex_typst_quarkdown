# LaTeX 模板

本目录保留信号与系统作业模板，并整合了另一份模板中的通用 LaTeX 功能。

## 编译

需要安装 XeLaTeX。默认编译 `allin.tex` 两次，以生成更新后的目录：

```bash
python3 compile.py
```

也可以指定目录中的其他 `.tex` 文件：

```bash
python3 compile.py notes.tex
```

## 已整合的功能

- XY 与 TikZ-CD 交换图、TikZ 树形图
- 彩色公式高亮与常用数学记号
- `P{宽度}` 和 `X{宽度}` 左对齐定宽表格列
- 数学公式扩展、文字环绕图片、整段注释和示例文本宏包
