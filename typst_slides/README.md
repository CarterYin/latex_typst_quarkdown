# Typst 项目

本目录的文件夹结构与 `typst_slides_luna_prompt_comparison_20261030` 对齐：根目录放置演示文稿入口，主题源码、素材、字体和辅助材料分别放入对应文件夹。本次从参考项目复制了字体；其他文件夹只建立结构，未复制其中内容。

## 目录结构

```text
typst/
├── assets/                   # 项目图片、图标等素材
├── evidence/                 # 实验记录和可复核材料
├── fonts/                    # 项目字体
├── previews/                 # 页面预览图和缩略图
├── theme/                    # Typslides 主题源码
└── videos/                   # 演示或实验视频
```

### 文件夹用途

- `assets/`：演示文稿使用的图片、图表和图标。目前包含示例 logo。
- `evidence/`：实验记录、数据及其他可复核材料。当前为空。
- `fonts/`：项目自带字体。目前包含 `NotoSansSCStatic-Regular.ttf` 和 `NotoSansSCStatic-Bold.ttf`。
- `previews/`：页面截图、缩略图或联系表。当前为空。
- `theme/`：Typslides 主题与组件实现，包括 `lib.typ`、`typslides.typ`、`utils.typ` 和许可证。
- `videos/`：演示视频或实验过程视频。当前为空。

根目录文件：`main.typ` 是演示文稿源文件，`bibliography.bib` 保存参考文献，`main.pdf` 是编译预览，`typst.toml` 保存包配置，`lib.typ` 是 Typslides 包入口并转接到 `theme/lib.typ`。

空的 `evidence/`、`previews/` 和 `videos/` 目录用 `.gitkeep` 占位，方便 Git 保留目录结构。

## 编译

在本目录下运行：

```bash
typst compile --root . --font-path fonts main.typ main.pdf
```

编译使用 `fonts/` 中的 Noto Sans SC Static 字体。`main.pdf` 已加入 Git 忽略规则，编译后不会作为源文件提交。
