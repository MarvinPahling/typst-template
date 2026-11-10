#let cover(meta, date, logo: none) = align(center)[
  #v(1cm)
  #if logo != none { image(logo, height: 1.5cm) }
  #v(1cm)
  #text(size: 12pt, weight: "light")[#meta.faculty]
  #v(0.5cm)
  #text(size: 12pt, weight: "light")[#meta.program]
  #v(0.5cm)
  #text(size: 20pt, weight: "bold")[#meta.type]
  #v(1cm)
  #text(size: 12pt, weight: "semibold")[#meta.title]
  #v(0.5fr)
  #text(size: 12pt)[#meta.subtitle]
  #v(1fr)
  *Author:* #meta.name \
  *Student ID:* #meta.student_id
  #v(0.5cm)
  *First supervisor:* #meta.supervisor \
  *Second supervisor:* #meta.second_supervisor
  #v(1fr)
  *Submission date:* #date
]
