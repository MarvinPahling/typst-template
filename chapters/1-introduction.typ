= Introduction <introduction>

This template shows you the most important things you need for writing a
thesis. Just replace the example text with your own. A new paragraph starts
after an empty line.

You can write *bold text* with stars and _italic text_ with underscores.
Footnotes work like this.#footnote[This is a footnote. It appears at the
  bottom of the page.]

== Motivation

Why is your topic important? Here you can already cite your first sources.
To cite a source, write an `@` followed by the key from `bib.yaml`:
@smith2020 explain how to write a good thesis. If you want to name a
specific page, put it in square brackets after the key @harry[p. 42].
Every cited source is added to the references at the end automatically.

Things you still have to do can be marked with a highlighter, so you
don't forget them: #highlight[TODO: describe the problem in more detail.]

== Structure of this Thesis

Lists are easy to write. A dash creates a bullet point:

- @background explains the theoretical background.
- @results presents the results.
- @packages shows how to use packages and plots.
- @conclusion summarises the thesis.

A plus sign creates a numbered list:

+ First step
+ Second step
+ Third step

The references to the chapters above (like @background) are created
automatically: put a label like `<background>` after a heading and then
write `@background` anywhere in the text.
