# Typst Slides 用法示例

从 `Agent4Robot/typst_slides_experiments_20261103` 提取常用写法，按**每种用法一页**整理，共 8 页。入口为 `main.typ`，沿用 Typslides 的 16:9 `bluey` 蓝色主题、中文字体、页码和底部进度条。示例图形和数字仅用于演示排版，不代表实验结果。

## 页面与源码用法

| 页码 | 用法 | 主要接口 |
| --- | --- | --- |
| 1 | 封面 | `front-slide` 的标题、副标题、作者和信息 |
| 2 | 文字与列表 | `slide`、局部 `set text`、粗体、行内代码、列表、`v` 与换行 |
| 3 | 表格 | `tbl`、`table.header`、`fr` 比例列宽 |
| 4 | 结论提示框 | `callout`：全宽浅蓝背景、圆角、内边距 |
| 5 | 双栏卡片 | `grid`、`card`、列间距、流程箭头 |
| 6 | 图文分栏 | 不等宽 `grid`、图片、图注与表格 |
| 7 | 三图对比 | 三列 `grid`、相同图片比例、独立图注 |
| 8 | 视频与链接 | 表格内 `link`、页脚 `place`、相对视频路径、离线播放页 |

`main.typ` 开头集中定义 `tbl`、`callout`、`card` 和 `evidence` 辅助函数。`evidence` 沿用来源 slides 的函数名，但页脚只展示相关视频链接。复制页面时保留对应辅助函数即可；无需修改主题实现。

## 编译与预览

在本目录运行：

```bash
typst compile --root . --font-path fonts main.typ main.pdf
```

持续预览：

```bash
typst watch --root . --font-path fonts main.typ main.pdf
```

编译使用随项目提供的 Noto Sans SC Static 字体。`main.pdf` 是本地生成文件，按仓库规则不提交。需要分享 PDF 时，把视频和播放页一起带上，保持相对目录结构。

## 素材与文件结构

```text
typst_slides/
├── main.typ             # 8 页用法示例及公共样式
├── theme/               # Typslides 主题源码及许可证
├── fonts/               # 中文字体（常规、粗体）
├── assets/layout-*.svg  # 3 张轻量示意图，可换成真实图片
├── videos/demo.mp4      # 1 秒纯蓝视频，仅演示本地链接
├── videos.html          # 浏览器离线播放入口
├── evidence/            # 可选的结果或记录，当前仅占位
└── previews/            # 本地预览图目录，当前仅占位
```

原有包入口 `lib.typ`、包配置 `typst.toml`、参考文献文件及其他素材保留。当前示例不依赖网络素材，也不复制完整实验数据或大型视频。

如果 PDF 阅读器不允许打开相对视频链接，用浏览器直接打开 `videos.html`。示例视频可用 FFmpeg 重新生成：

```bash
ffmpeg -v error -y -f lavfi -i color=c=0x2456a6:s=480x270:d=1 \
  -c:v libx264 -pix_fmt yuv420p videos/demo.mp4
```
