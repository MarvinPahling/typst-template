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

== A Table with More Options

Tables can do a bit more: `columns` can also set the width of each column,
`align` decides whether the text sits left, centred or right, and
`table.cell(colspan: 2)` lets one cell stretch over two columns.
@prices shows an example.

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    align: (left, center, center),
    [Product], [Price 2025], [Price 2026],
    [Bread], [2.50 €], [2.70 €],
    [Milk], [1.10 €], [1.20 €],
    [Coffee], table.cell(colspan: 2)[not sold anymore],
  ),
  caption: [Prices of a few products in two years.],
) <prices>

== A Table from a CSV File

If your data is in Excel, you don't have to type it in by hand. Save the
sheet as a `.csv` file ("File → Save as → CSV") and put it in the `data`
folder. The first line of the file becomes the bold header row. @survey
was created from the file `data/survey.csv`.

#let survey = csv("../data/survey.csv")

#figure(
  table(
    columns: 4,
    ..survey.flatten(),
  ),
  caption: [Survey answers per month, loaded from a CSV file.],
) <survey>

If you change the CSV file, the table in the PDF updates automatically.
Make sure `columns` matches the number of columns in your file.

== Formulas

If you need a formula, put it between dollar signs. With spaces inside the
dollar signs it gets its own numbered line:

$ a^2 + b^2 = c^2 $ <pythagoras>

Without spaces it stays in the text, like $x = 5$. You can refer to the
numbered formula with @pythagoras.
