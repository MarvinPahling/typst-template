#import "cover.typ": cover
#import "declaration.typ": declaration
#import "@preview/wordometer:0.1.6": word-count

#let meta = yaml("meta.yaml")
#let date = if meta.date in (none, "") {
  datetime.today().display("[day padding:none] [month repr:long] [year]")
} else { meta.date }
#let accent = rgb("#011E50")

#set document(title: meta.title, author: meta.name, keywords: meta.keywords)
#set page(paper: "a4", margin: (left: 3cm, right: 2.5cm, y: 2.5cm))
#set text(font: ("Charter", "Libertinus Serif"), size: 11pt, lang: "en")
#set par(justify: true, leading: 0.8em, spacing: 1.4em)
#show heading: set text(fill: accent)
#show heading.where(level: 1): set text(size: 20pt)
#show heading.where(level: 1): it => (
  pagebreak(weak: true) + v(1cm) + it + v(0.5cm)
)
#show heading.where(level: 1): set heading(supplement: [Chapter])
#show outline.entry.where(level: 1): strong
#show figure.where(kind: table): set figure.caption(position: top)
#set table(stroke: (x, y) => if y == 0 { (bottom: 1pt) }, inset: 7pt)
#show table.cell.where(y: 0): strong
#set math.equation(numbering: "(1)")
#show link: set text(fill: accent)
#show: word-count

#cover(meta, date, logo: "assets/amu-logo.png")

#set page(numbering: "I")
#counter(page).update(1)
#set heading(numbering: none)

#include "chapters/0-abstract.typ"

#outline(title: [Contents], depth: 3)
#outline(title: [List of Figures], target: figure.where(kind: image))
#outline(title: [List of Tables], target: figure.where(kind: table))

#set page(numbering: "1")
#counter(page).update(1)
#set heading(numbering: "1.1")

#include "chapters/1-introduction.typ"
#include "chapters/2-background.typ"
#include "chapters/3-results.typ"
#include "chapters/4-packages.typ"
#include "chapters/5-conclusion.typ"

#set heading(numbering: none)
#bibliography("bib.yaml", title: [References], style: "elsevier-harvard")

#declaration(meta, date)
