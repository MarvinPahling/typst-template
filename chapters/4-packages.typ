#import "@preview/lilaq:0.6.0" as lq
#import "@preview/mercator:0.1.2": render-map
#import "@preview/subpar:0.2.2"
#import "@preview/wordometer:0.1.6": total-words

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

== Maps with Mercator

#link("https://typst.app/universe/package/mercator")[Mercator] draws maps
from GeoJSON files. You can export GeoJSON from QGIS or ArcGIS, or download
it from websites such as #link("https://www.naturalearthdata.com")[Natural Earth].
@study-area shows three example study sites on the German North Sea coast,
loaded from `data/study-area.geojson`.

#let study-area = read("../data/study-area.geojson", encoding: none)

#figure(
  box(fill: rgb("#dbe9f4"), render-map(study-area, json.encode((
    projection: (type: "mercator"),
    viewbox: (4, -67.6, 7, 5.3),
    fill: "{color}",
    point_color: "{color}",
    stroke: "#666666",
    stroke_width: 0.02,
    point_radius: 0.08,
    label: "{site}",
    label_font_size: 0.25,
  )), width: 75%)),
  caption: [Example study sites on the German North Sea coast.
    Map data: Natural Earth.],
) <study-area>

`viewbox` decides which part of the map is shown: the first two numbers
move the map, the last two zoom in or out. Mercator is still a very new
package. For important maps it is often easier to make them in QGIS,
export them as `.svg` and insert them like the plot in @survey-matplotlib.

You can also highlight a whole region by giving it its own colour in the
GeoJSON file. @cork highlights County Cork in red, with a dot for the city
of Cork. The data comes from `data/cork.geojson`.

#let ireland = read("../data/cork.geojson", encoding: none)

#figure(
  box(fill: rgb("#dbe9f4"), render-map(ireland, json.encode((
    projection: (type: "mercator"),
    viewbox: (-10.4, -61.9, 3, 1.9),
    fill: "{color}",
    point_color: "{color}",
    stroke: "#666666",
    stroke_width: 0.008,
    point_radius: 0.035,
    label: "{site}",
    label_font_size: 0.12,
  )), width: 80%)),
  caption: [County Cork (red) and the city of Cork in Ireland.
    Map data: Natural Earth.],
) <cork>

== Sub-figures with Subpar

#link("https://typst.app/universe/package/subpar")[Subpar] puts several
images into one figure and labels them (a), (b), ... Unlike the example
in @two-logos, you can refer to each image on its own. This is useful for
before/after photos of a coastline or for comparing two study sites.

#subpar.grid(
  figure(image("../assets/ostfalia.svg"), caption: [Ostfalia]), <logo-a>,
  figure(image("../assets/amu-logo.png", width: 60%), caption: [Aix-Marseille]), <logo-b>,
  columns: (1fr, 1fr),
  caption: [Two logos as sub-figures.],
  label: <logos-sub>,
)

@logos-sub shows two logos. The left one, @logo-a, is wider than the
right one, @logo-b.

== Word Count with Wordometer

#link("https://typst.app/universe/package/wordometer")[Wordometer] counts
the words in your thesis, which is handy if there is a word limit. The
count is switched on in `main.typ` with `#show: word-count`. Then you can
write `#total-words` anywhere:

This thesis currently has *#total-words words*.
