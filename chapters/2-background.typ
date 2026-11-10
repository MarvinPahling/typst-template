= Theoretical Background <background>

This chapter explains the basics that are needed to understand the thesis.
You can cite all kinds of sources, for example a novel @rooney2018 or a
children's book @prairie.

== Quotes

Short quotes go directly into the text with quotation marks, for example
"electronic music is a big family" @electronic. Longer quotes are written
as a block:

#quote(block: true, attribution: [@harry[p. 10]])[
  This is a longer quote. It is indented and set apart from the rest of the
  text, and the source is shown underneath.
]

== Figures

Images are placed in the `assets` folder and inserted as a figure with a
caption. @logo shows an example.

#figure(
  image("../assets/ostfalia.svg", width: 50%),
  caption: [The Ostfalia logo as an example figure.],
) <logo>

The figure is numbered automatically and listed in the List of Figures.

== Several Images in One Figure

You can also put two images next to each other in one figure, for example
to compare them. A grid with two columns places them side by side, and
`width` sets how wide each image is.

#figure(
  grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    image("../assets/ostfalia.svg", width: 80%),
    image("../assets/amu-logo.png", width: 40%),
  ),
  caption: [Two logos shown next to each other.],
) <two-logos>

As you can see in @two-logos, the left logo is much wider than the right
one. Both images share one caption and one figure number.
