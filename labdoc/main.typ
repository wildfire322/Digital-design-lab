#import "template.typ": *
#show: doc => title(
  name: "期末大型程序",
  date: datetime(year: 2024, month: 1, day: 14), // 随便写的，记得改
  doc,
)

#set heading(numbering: (..args) => {
  let arr = args.pos()
  if arr.len() == 1{
    numbering("一", arr.at(0))
  } else {
    arr.slice(1).map((i) => str(i)).join(".")
  }
})

= 标题

#lorem(100)

== 巴拉巴拉

#lorem(200)

== 致敬传奇排版工具 Typst

#lorem(114)

```Typst
#set heading(numbering: (..args) => {
  let arr = args.pos()
  if arr.len() == 1{
    numbering("一", arr.at(0))
  } else {
    arr.slice(1).map((i) => str(i)).join(".")
  } // 芝士注释
})
// 芝士代码自动标行号
``` // 哈里路大旋风哇袄