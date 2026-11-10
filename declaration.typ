#let declaration(meta, date) = [
  #heading(outlined: false)[Declaration of Authorship]

  I hereby declare that I have written this #meta.type with the title
  "#meta.title" independently and have not used any sources or aids other
  than those indicated. All passages taken literally or in spirit from other
  works have been marked as such.

  This work has not been submitted in the same or a similar form to any other
  examination board.

  #v(3cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2cm,
    row-gutter: 0.5em,
    [#meta.location, #date], [],
    line(length: 100%), line(length: 100%),
    [Place, date], [#meta.name],
  )
]
