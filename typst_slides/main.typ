#import "theme/lib.typ": *

// Compile: typst compile --root . --font-path fonts main.typ main.pdf
// One page per usage, adapted from typst_slides_experiments_20261103.
#show: typslides.with(
  ratio: "16-9", theme: "bluey", font: "Noto Sans SC Static",
  font-size: 20pt, link-style: "color", show-progress: true,
)
#set text(lang: "zh", font: ("Noto Sans SC Static", "DejaVu Sans"))
#set par(justify: false)
#show raw: set text(font: ("DejaVu Sans Mono", "Noto Sans SC Static"), size: 0.78em)

// Reusable styles from the experiment slides.
#let blue = rgb("2456A6")
#let gray = rgb("667085")
#let tbl(..args) = table(stroke: rgb("D0D5DD"), inset: 6pt, ..args)
#let callout(body) = block(width: 100%, inset: 10pt, radius: 4pt, fill: rgb("EDF3FC"))[#body]
#let card(title, body) = block(width: 100%, inset: 12pt, radius: 5pt, fill: rgb("F2F5FA"))[
  #text(fill: blue, weight: "bold")[#title]
  #v(0.15cm)
  #body
]
// Page footer: only related video links; keep them relative for offline use.
#let evidence(body) = place(bottom + left, dy: 0.4cm,
  block(width: 100%)[#text(size: 8pt, fill: gray)[#body]])

// 1. Cover: title, subtitle, author and metadata.
#front-slide(
  title: [Typst 汇报版式用法],
  subtitle: [一页一种用法 · 16:9 蓝色主题 · 可直接复制修改],
  authors: "尹超",
  info: [Typslides 示例集 · 示例图形和数值均不代表实验结果],
)

// 2. Basic slide: local font sizes, lists, emphasis, raw text and spacing.
#slide(title: "01 / 文字、列表与局部样式", outlined: true)[
  #set text(size: 17pt)
  *先写这一页的主要结论，再列支持它的信息。*
  #v(0.3cm)
  - 无序列表适合并列信息；每项保持简短。
  - 行内代码使用反引号，例如 `candidate_id`。
  - #text(fill: blue, weight: "bold")[颜色与粗体]用于强调关键数字或术语。
  #v(0.3cm)
  + 有序列表适合流程或操作步骤。
  + 局部使用 `set text(size: 17pt)` 调整字号。
  #text(size: 12pt, fill: gray)[补充说明可使用较小字号。手动换行：第一行\ 第二行。]
]

// 3. Table: fractional column widths and reusable table styling.
#slide(title: "02 / 表格与比例列宽", outlined: true)[
  #set text(size: 17pt)
  #tbl(
    columns: (1.2fr, 2fr, 2fr),
    table.header([*指标*], [*方案 A*], [*方案 B*]),
    [示例成功次数], [2/10], [6/10],
    [示例输入], [固定规则], [候选选择],
    [说明], [列宽使用 `fr` 分配], [表头使用 `table.header`],
  )
  #v(0.3cm)
  #text(size: 13pt, fill: gray)[`tbl` 封装边框和内边距；内容和列宽由各页传入。以上为排版示例数值。]
]

// 4. Callout: full-width rounded block, paragraph spacing and emphasis.
#slide(title: "03 / 结论提示框", outlined: true)[
  #set text(size: 18pt)
  普通正文用于交代背景，提示框用于突出这一页最值得记住的信息。
  #v(0.4cm)
  #callout[*主要结论放在这里。* 使用浅蓝色背景、圆角与统一内边距，使它与正文形成层次。]
  #v(0.35cm)
  #text(size: 14pt, fill: gray)[用法：`#callout[内容]`。内部可以继续使用粗体、链接和行内代码。]
]

// 5. Two cards: equal-width grid, gutter, titled blocks and explicit line breaks.
#slide(title: "04 / 双栏卡片与流程对比", outlined: true)[
  #set text(size: 17pt)
  #grid(
    columns: (1fr, 1fr), gutter: 18pt,
    card([方案 A], [输入信息\ ↓\ 固定处理规则\ ↓\ 输出结果]),
    card([方案 B], [输入信息\ ↓\ 候选评估与选择\ ↓\ 输出结果]),
  )
  #v(0.3cm)
  #text(size: 13pt, fill: gray)[用法：`grid(columns: (1fr, 1fr), gutter: 18pt, card(...), card(...))`。]
]

// 6. Mixed image/table layout: unequal columns with width-constrained images.
#slide(title: "05 / 图文分栏", outlined: true)[
  #set text(size: 16pt)
  #grid(
    columns: (1fr, 1.4fr), gutter: 16pt,
    [#image("assets/layout-a.svg", width: 100%)\ #text(size: 11pt, fill: gray)[示意图 A · 不代表真实场景]],
    [#tbl(
      columns: (1fr, 2fr),
      table.header([*项目*], [*说明*]),
      [左栏], [图片宽度为所在列的 100%],
      [右栏], [使用表格或正文解释图片],
      [比例], [`1fr` 与 `1.4fr` 分配空间],
    )],
  )
]

// 7. Three images: a single row with separate captions.
#slide(title: "06 / 三图对比与图注", outlined: true)[
  #set text(size: 16pt)
  #grid(
    columns: (1fr, 1fr, 1fr), gutter: 12pt,
    [#image("assets/layout-a.svg", width: 100%)\ *阶段 A*\ 用短句解释左图。],
    [#image("assets/layout-b.svg", width: 100%)\ *阶段 B*\ 各图保持一致比例。],
    [#image("assets/layout-c.svg", width: 100%)\ *阶段 C*\ 用于过程或结果对比。],
  )
  #v(0.3cm)
  #text(size: 13pt, fill: gray)[替换相对图片路径即可复用；同样支持 PNG、JPEG 等实际截图。]
]

// 8. Relative links in a table, footer-only video links and offline fallback.
#slide(title: "07 / 表格链接与页脚视频", outlined: true)[
  #set text(size: 17pt)
  #tbl(
    columns: (1fr, 2fr),
    table.header([*入口*], [*用途*]),
    [#link("videos/demo.mp4")[打开示例视频]], [表格单元格可直接放相对链接],
    [#link("videos.html")[打开离线播放页]], [PDF 阅读器拦截视频链接时使用],
  )
  #v(0.3cm)
  所有链接随文件夹一起移动；下载时保留 `videos/` 和 `videos.html`。
  #v(0.2cm)
  #text(size: 13pt, fill: gray)[页脚用 `place(bottom + left, ...)` 定位。演示视频为 1 秒纯蓝画面，仅用于测试链接。]
  #evidence[#link("videos/demo.mp4")[视频：离线链接示例]]
]
