#import "@preview/lilaq:0.6.0" as lq

= Packages and Plots <packages>

== Typst Universe

Typst can be extended with packages that other people have written. You
find all of them on #link("https://typst.app/universe")[Typst Universe]:
packages for diagrams, plots, code listings, glossaries, to-do notes and
much more. Typst downloads a package automatically the first time you use
it. You only need one line at the top of your chapter file, for example:

```typ
#import "@preview/lilaq:0.6.0" as lq
```

The page of each package on Typst Universe shows the exact line to copy
and examples of how to use it.

Keep in mind that these packages are made by third parties and not by the
Typst team. Most of them are free and well maintained, but it's worth
checking that a package is still updated before you rely on it.

== Plots with Lilaq

#link("https://typst.app/universe/package/lilaq")[Lilaq] is a package for
plots. @survey-plot shows the survey data from @survey as a bar chart.
The data is loaded from the same file `data/survey.csv`, so the plot
updates automatically when the file changes.

#let survey = csv("../data/survey.csv", row-type: dictionary)
#let months = survey.map(row => row.Month)
#let satisfied = survey.map(row => int(row.Satisfied))
#let not-satisfied = survey.map(row => int(row.at("Not satisfied")))
#let x = range(months.len())

#figure(
  lq.diagram(
    width: 10cm,
    height: 5.5cm,
    ylim: (0, 55),
    ylabel: [Number of answers],
    xaxis: (ticks: months.enumerate()),
    lq.bar(x, satisfied, offset: -0.2, width: 0.4, label: [Satisfied]),
    lq.bar(x, not-satisfied, offset: 0.2, width: 0.4, label: [Not satisfied]),
  ),
  caption: [Satisfied and not satisfied answers per month, made with Lilaq.],
) <survey-plot>

Most people were satisfied in March, as you can see in @survey-plot.

== Plots from Other Programs

If you already made a plot in another program, such as Excel, Python
(matplotlib) or R, you can export it as an image and insert it like any
other figure. The best format is `.svg`, because it stays sharp at any
zoom level. `.png` also works.

@survey-matplotlib shows the same data as @survey-plot, but this time the
plot was made in Python with matplotlib and saved as
`assets/survey-matplotlib.svg`.

#figure(
  image("../assets/survey-matplotlib.svg", width: 85%),
  caption: [The survey data as a plot made with matplotlib.],
) <survey-matplotlib>
