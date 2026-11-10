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
