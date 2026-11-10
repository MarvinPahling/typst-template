= Results <results>

== Tables

@participants shows an example table. You set the number of columns and
then simply list the cells one after the other, row by row.

#figure(
  table(
    columns: 3,
    [Group], [Participants], [Average age],
    [A], [24], [31.5],
    [B], [19], [28.2],
    [C], [31], [35.0],
  ),
  caption: [Number of participants and average age per group.],
) <participants>

== Formulas

If you need a formula, put it between dollar signs. With spaces inside the
dollar signs it gets its own numbered line:

$ a^2 + b^2 = c^2 $ <pythagoras>

Without spaces it stays in the text, like $x = 5$. You can refer to the
numbered formula with @pythagoras.
