#let title(
  name: [默认实验], 
  type: [综合], 
  date: datetime.today(),
  doc,
) = {
  set page(numbering: "第1页/共1页")
  set align(center)
  set text(14pt)
  set text(font: "Noto Sans SC") // 需要下载思源黑体，可以在github上找到免费下载
  set text(lang: "zh")
  show figure: set block(breakable: true)
  show figure.where(kind: raw): set figure.caption(position: top)
  show raw: it =>{
    set text(font: ("Fira Code", "Noto Sans SC"))
    it
  }
  show raw.where(block: false): box.with(fill: luma(224), inset: (x: 0.3em),outset: (y: 0.3em), radius: 0.3em)
  show raw.where(block: true): it => {
    set par(justify: false); 
    set text(font: ("Fira Code", "Noto Sans SC"))
    
    block(
      inset: 0.5em,
      radius: 1em,
      fill:luma(196),
      align(center, " " + it.lang + " ") + v(-1em) + grid(
        columns: (100%, 100%),
        column-gutter: -100%,
        block(
          width: 100%,
          inset: 1em, 
          for (i, line) in it.lines.enumerate() {
            box(
              width: 0pt,
              align(right, str(i + 1) + h(2em))
            )
            box(fill: rgb("aaffee").lighten(-10% * calc.rem(i, 2)), 
              inset: 0pt, 
              outset: 0.35em, 
              width: 100%,
              height: auto,
              radius: {
                if i == 0 {(top: 3pt)}
                else if i == it.lines.len() - 1 {(bottom: 3pt)}
                else {0pt}
              },
              line + " ")
              linebreak()
          }
        )
      )
    )
  }
  page()[
    #v(1fr)
    #image(width: 70%, "zju.png")
    #v(1fr)
    #text(size: 18pt, [= 数字逻辑设计期末课程设计报告 \
    题目：双人交互的数字游戏])
    #v(1fr)
    小组成员：程宇轩 戴绍琦 庞星磊 王利威

    指导教师：杨莹春

    日期: #{str(date.year()) + "年" + str(date.month()) + "月" + str(date.day()) + "日"}
    #v(1fr)
  ]
  
  set text(size: 12pt)
  set text(font: "Noto Sans SC")
  set align(left)
  doc
}

#let cn_lorem(count) = {
  let random_number = datetime.today().day()
  let start = 0x4E00
  let end = 0x4FFF
  let decimal_part(number) = {
    return number - int(number)
  }
  let new_number(number) = {
    return decimal_part(number * 1.145142233421 + 1.232451233919810)
  }
  for i in range(count){
    str.from-unicode(int((end - start) * random_number) + start)
    random_number = new_number(random_number)
  }
}

#let TODO = {
  text(
    size: 5em,
    box(
      stroke: 2pt, 
      fill: luma(192), 
      inset: 1em,
      [TODO]
    )
  )
}
