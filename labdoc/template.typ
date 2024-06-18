#let title(
  name: [默认实验], 
  type: [综合], 
  date: datetime.today(),
  doc,
) = {
  set page(numbering: "第1页/共1页")
  set align(center)
  set text(14pt)
  set text(font: "Noto Serif SC") // 需要下载思源黑体，可以在github上找到免费下载
  set text(lang: "zh")
  show figure: set block(breakable: true)
  show figure.where(kind: raw): set figure.caption(position: top)
  show raw: it =>{
    set text(font: ("Fira Code", "Noto Serif SC"))
    it
  }
  show raw.where(block: false): box.with(fill: luma(224), inset: (x: 0.3em),outset: (y: 0.3em), radius: 0.3em)
  show raw.where(block: true): it => {
    set par(justify: false); 
    set text(font: ("Fira Code", "Noto Serif SC"))
    
    block(
      inset: 0.5em,
      grid(
        columns: (100%, 100%),
        column-gutter: -100%,
        block(
          width: 100%,
          inset: 1em, 
          for (i, line) in it.lines.enumerate() {
            box(
              width: 0pt,
              align(right, str(i + 1) + h(1em))
            )
            box(fill: luma(95% + 5% * calc.rem(i, 2)), 
              inset: 0pt, 
              outset: 0.35em, 
              width: 100%,
              height: auto,
              line + " ")
              linebreak()
          }
        )
      )
    )
  }
  page()[
    #v(1fr)
    // #image(width: 70%, "zju.png")
    // #v(1fr)
    #text(size: 18pt, [#text(size: 1.2em, strong([数字逻辑设计期末课程设计报告])) \
    题目：双人交互的数字游戏])
    #v(1fr)
    #table(
      columns: (1fr, 2fr,) * 2,
      align: (row, col) => {
        (if calc.rem(row, 2) == 0 {right} else {center})
      },
      stroke: (row, col) => {
        (if calc.rem(row, 2) == 1 {(bottom: 1pt)} else {none})
      },
      [小组成员：], [程宇轩], [小组成员：], [戴绍琦],
      [学号：], [], [学号：], [],
      [专业：], [计算机科学与技术], [专业：], [计算机科学与技术],
      [学院：], [竺可桢学院],[学院：], [竺可桢学院],
      table.cell(colspan: 4, [#v(1em)]),
      [小组成员：], [庞兴磊], [小组成员：], [王利威],
      [学号：], [], [学号：], [],
      [专业：], [计算机科学与技术], [专业：], [计算机科学与技术],
      [学院：], [竺可桢学院],[学院：], [竺可桢学院],
    )

    指导教师：杨莹春

    日期: #{str(date.year()) + "年" + str(date.month()) + "月" + str(date.day()) + "日"}
    #v(1fr)
    #image(width: 50%, "t_0.png")
    #v(1fr)
  ]
  
  set text(size: 12pt)
  set text(font: "Noto Serif SC")
  set align(left)
  
  set page(header: [#line(length: 100%) #v(-1em) 数字逻辑设计 #h(1fr) 浙江大学课程设计报告 \ #v(-1em) #line(length: 100%)])
  set heading(numbering: "1.")
  text(18pt, align(center, strong([目录])))
  text(14pt, outline(indent: (level) => level * 1em, title: none))
  doc
}