#import "@preview/min-manual:0.3.0": manual
#import "@preview/mythographer-5e:0.0.2": *

#show heading.where(level: 1): it => {
  set text(size: 25pt, weight: "bold")

  let parts = counter(heading).get()

  if parts.last() != 0 {
    pagebreak()
  }
  it.body
}

#let template(config, body) = {
  set heading(outlined: false)

  show: dnd-template.with(config, is-first: false)
  body
}

#let config = default-config(lang: "en")
#show link: underline

#let example(alignment: center, body) = {
  align(alignment, rect(
    radius: 3pt,
    width: 90%,
    inset: 10pt,
    stroke: yellow,
    outset: 3pt,
    body,
  ))
}
#outline()

#pagebreak()
= About

Mythographer-5e is a _fast_ package that lets you write and format D&D adventures without wasting too much time on formatting.

The package is still under development, it already supports many features, I'll try my best to keep it backward compatible. If you find any issue please open one on #link("www.github.com/sa1g/dnd-typst-template")[the repo].

== Features

- Everything#footnote[Close to] is customizable modifying a simple parameters.
- Modules can be divided in _Parts_, this, of course, it up to the user to decide.
- Heading in 5e's style.
- Map regions, with automatic indexes.
- Items, features, spells, sidebars, read aloud, comment boxes, and tables are formatted as in official modules.
- Colors: colors are 100% customizable.
- Footers: customizable (you just need to draw a new footer in svg/png), number position and text is parametric: you can move it as you prefer.
- Automatic translation (for template keywords/phrases), currently only English and Italian are supported.
  - Adding new languages is pretty easy tho ;)
- Monsters can be rendered using 5e.tools jsons
  - This makes possible to create the monster using 5e.tools, incorporate it in the module you are working on and possibly on multiple VTTs (like FoundryVTT and Roll20) painlessly and without having to do the same thing multiple times.

#align(bottom)[
  == Future
  I'd like to create a script that parses a custom adventure so that it can be also directly used e.g. on FoundryVTT, but this is not high priority at all.

  It's possible to make _spells, feat_ and _items_ to work with json files from 5e.tools. Open an issue if needed.

  == Notes
  So far this project has been a solo developer adventure... Support would be amazing!

  Also due to the nature of Typst it doesn't exist a LaTeX equivalent of `minipage`, I can't visually show here how the background can be changed, functions will be explained anyway.
]
#pagebreak()


= About Customizability <about-custom>

Everything runs around a dictionary that specifies colors, fonts, font sizes, alignments, styles, etc.
The template uses a default config constructor (`default-config`) when nothing else is specified. A utility function (`merge-dicts`) is provided to help merging dictionaries "automagically": when a key is present in multiple ones, the "left-most" dictionary content is kept.

#align(center, grid(columns: 2, column-gutter: 60pt)[
  ```typst
  // Default usage
  #show: dnd-template
  ```
][
  ```typst
  // Custom config (19/02/2026)
  #show: dnd-template.with(
    default-config(lang:"it"))
  ```
])

All modifications done to this dictionary on the show rule are applied on the current context.
You can also apply customized styles for some methods, this is explained in later.

*Note*: in the entire template it's highly probable that if some text has a specific style (italic, smallcaps, etc) it can be changed or removed by modifying a "flag" in the config. In this document I won't show everything as it's pretty self-explanatory, but if you have any doubt please open an issue or send me an email, I'll be happy to help :)

= About Translations

Multiple languages are supported using #link("https://github.com/mayconfmelo/transl")[transl].
Languages are referred to by #link("https://en.wikipedia.org/wiki/ISO_639")[ISO 639-1].

#align(center, table(
  columns: 2,
  [*Supported Languages*], [*Code*],
  [English], [`en`],
  [Italian], [`it`],
))

The translation language is taken by the language set on the document, this is passed to the template by the `lang` variable. Translations are automatically applied where possible e.g. `part` (en) $arrow$ `parte` (it). At the moment there's no "big turn off button" for this feature and there's not plan to add it.

Adding a new language is pretty easy and it doesn't require much time :)

#pagebreak()
= Sections&Co.

Seven heading levels are managed by the template, these are:
#{
  // set text(0.7em)
  // show raw: set text(size: 0.7em)
  set heading(outlined: false)

  table(
    columns: 4,
    align: (center + horizon, center, left, left),
    [Heading Level], [Description], [Example], [Code],
    [```typst
    =
    ```],
    [Part],
    [
      #grid(columns: 2, column-gutter: 1fr)[
        #template(config)[#smallcaps(text(
          fill: config.headers.level-2.fill,
          font: config.headers.level-1.font,
          size: config.headers.level-1.size / 2,
          weight: config.headers.level-1.weight,
        )[Part 1: Lorem#footnote[Reduced size to fit in the table.]])]
      ][
        #template(config)[#smallcaps(text(
          fill: config.headers.level-2.fill,
          font: config.headers.level-1.font,
          size: config.headers.level-1.size / 2,
          weight: config.headers.level-1.weight,
        )[Lorem])]
      ]],
    [```typst = Lorem```, togglable in config: `show-part` (true/false)],

    [```typst==```],
    [Chapter],
    [#template(config)[#smallcaps(text(
      fill: config.headers.level-2.fill,
      font: config.headers.level-2.font,
      size: config.headers.level-2.size / 2,
      weight: config.headers.level-2.weight,
    )[Chapter 1: #lorem(2)#footnote[Reduced size to fit in the table.]])]],
    [```typst == #lorem(2)```, togglable with `show-chapter` (true/false)],

    [```typst===```],
    [Section],
    [#template(config)[=== #lorem(2)
      #lorem(4)]],
    [```typst
    === #lorem(2)
    #lorem(4)
    ```],

    [```typst====```],
    [Subsection],
    [#v(5pt)#template(config)[==== #lorem(2)
        #lorem(4)]],
    [```typst
    ==== #lorem(2)
    #lorem(4)
    ```],

    [```typst=====```],
    [Subsubsection],
    [#template(config)[===== #lorem(2)
      #lorem(4)]],
    [```typst
    ===== #lorem(2)
    #lorem(4)
    ```],

    [```typst======```],
    [Par#footnote[Also as a function: `dnd-par`]],
    [#v(5pt)#template(config)[====== #lorem(2)
        #lorem(4)]],
    [```typst
    ====== #lorem(2)
    #lorem(4)
    ```],

    [```typst=======```],
    [Subpar#footnote[Also as a function: `dnd-subpar`]],
    [#v(5pt)#template(config)[======= #lorem(2)
        #lorem(4)]],
    [```typst
    ======= #lorem(2)
    #lorem(4)
    ```],
  )
}

Let's see them more in details.



== Part (`=`)
Parts go to a *new page by default* when called. Setting `headers-level-1-to` to either `none`, `odd` or `even` sets the behavior of the pagebreak to go to that page.

By default an heading level 1 (=) page has the default paper as background and the text written by the body of `=`.

=== Deactivating the `part` keyword
The keyword can be easily deactivated by setting `show-part` to `false`. The result is clear: only the body is rendered.
#example(grid(
  columns: 2,
  column-gutter: 60pt,
  template(config)[#smallcaps(text(
    fill: config.headers.level-2.fill,
    font: config.headers.level-1.font,
    size: config.headers.level-1.size,
    weight: config.headers.level-1.weight,
  )[Lorem])],
  [```typst #show: dnd-template.with(
  default-config(show-part: false))```],
))

=== Translation

The `Part` keyword can be translated to supported languages simply by setting `lang` to the specified language in the configuration dictionary.

#example[#grid(
    column-gutter: 20pt,
    row-gutter: 5pt,
    columns: 2,
    align: center,
    [
      #template(config)[#smallcaps(text(
        fill: config.headers.level-2.fill,
        font: config.headers.level-1.font,
        size: config.headers.level-1.size,
        weight: config.headers.level-1.weight,
      )[Part 1: Lorem])]
    ],
    [
      #template(config)[#smallcaps(text(
        fill: config.headers.level-2.fill,
        font: config.headers.level-1.font,
        size: config.headers.level-1.size,
        weight: config.headers.level-1.weight,
      )[Parte 1: Lorem])]
    ],

    [English], [Italian],
  )
]



=== Customized background on `part` page
A customized background image can be set with:

```typst
  #dnd-image-heading-part(<your-image>, [<heading>],
    title-unstyled: [<outline text>],
  )
```
where `your-image` is an image object, `heading` is the text shown in the page and `title unstyled` is an optional argument that overrides what's written on the outline for this heading. This way you can format the text on this heading and have a different outline entry, this is useful if you want to better align your text, or to show another image in this page.

== Chapter (`==`)
Like `Part` the keyword can be *toggled off*:
#align(center, grid(
  columns: 2,
  column-gutter: 60pt,
  template(config)[#smallcaps(text(
    fill: config.headers.level-2.fill,
    font: config.headers.level-2.font,
    size: config.headers.level-2.size,
    weight: config.headers.level-2.weight,
  )[Lorem])],
  [```typst #show: dnd-template.with(
  default-config(show-chapter: false))```],
))

And *translated*:
#align(center)[#grid(
    column-gutter: 20pt,
    row-gutter: 5pt,
    columns: 2,
    align: center,
    [
      #template(config)[#smallcaps(text(
        fill: config.headers.level-2.fill,
        font: config.headers.level-2.font,
        size: config.headers.level-2.size,
        weight: config.headers.level-2.weight,
      )[Part 1: Lorem])]
    ],
    [
      #template(config)[#smallcaps(text(
        fill: config.headers.level-2.fill,
        font: config.headers.level-2.font,
        size: config.headers.level-2.size,
        weight: config.headers.level-2.weight,
      )[Parte 1: Lorem])]
    ],

    [English], [Italian],
  )
]

== Section (`===`)
Sections divide chapters into major thematic groups.

#example(grid(
  columns: 2,
  column-gutter: 60pt,
  [
    #template(config)[
      === #lorem(2)
      #lorem(5)
    ]
  ],
  [```typst
  === #lorem(2)
  #lorem(5)
  ```],
))
== Subsection (`====`)
Subsections further organize content for clarity.


#example(grid(
  columns: (40%, 50%),
  align: left,

  column-gutter: 60pt,
  [
    #template(config)[
      ==== #lorem(2)
      #lorem(5)
    ]
  ],
  [```typst
  ==== #lorem(2)
  #lorem(5)
  ```],
))

Note that the _gold_ bar is set to extend for all the width of the context#footnote[This is not a customizable parameter, hit me up if you need it modifiable.]

== Subsubection (`=====`)
Subsubsections represent the deepest level of division that still uses a block header. Deeper levels display headers inline.

#example(grid(
  columns: (40%, 50%),
  align: left,

  column-gutter: 60pt,
  [
    #template(config)[
      ===== #lorem(2)
      #lorem(5)
    ]
  ],
  [```typst
  ===== #lorem(2)
  #lorem(5)
  ```],
))

== Parahraph (`======`)
The paragraph format is rarely used in the core rulebooks, but remains available as an alternative to the "normal" style. By default it adds a `.` (dot) at the end of the body. This feature is hardcoded and cannot be disabled without modifying the template. Of course it works bad if you are using `#lorem` and the phrase ends :/

It can also be called using *`dnd-par`*.

#example({
  grid(
    columns: (40%, 50%),
    align: left + horizon,
    column-gutter: 60pt,
    [
      #template(config)[
        ====== #lorem(2)
        #lorem(5)
      ]
    ],
    [```typst ====== #lorem(2) #lorem(5)```],
  )

  grid(
    columns: (40%, 50%),
    align: left + horizon,
    column-gutter: 60pt,
    [
      #template(config)[
        #dnd-par[Random Body] #lorem(5)
      ]
    ],
    [```typst ====== #lorem(2) #lorem(5)```

      ```typst #dnd-par[Random Body] #lorem(5)```],
  )
})

== Subparahraph (`=======`)
The subparahraph format, which includes a parahraph indent, will likely feel more familiar to readers.

It can also be set with *`dnd-subpar`*.

#example(grid(
  columns: (40%, 50%),
  align: left + horizon,

  column-gutter: 60pt,
  [
    #template(config)[
      ======= #lorem(2)
      #lorem(5)
    ]
  ],
  [```typst ======= #lorem(2) #lorem(5)```

    ```typst #dnd-subpar(lorem(2)) #lorem(5)```],
))




== Extra: Image on Top of Heading
Yes, it's possible!

With `dnd-image-heading-section` you can put an image on top of your headings. Args:

```typst
#let dnd-image-heading-section(
  img: content,                                   // the img you want to use
  depth: int,                                     // heading depth
  title-styled: any,                              // heading you see in the page
  alignment: alignment = alignment,               //
  config: arguments | dictionary = (:),           // local config injection
  img-fit: str = "cover",                         //
  img-height: auto | fraction | relative = auto,  // if manual rescale is needed
  img-width: auto = auto,                         // ^^
  offset: length = 0pt,                           // vertical offset from the img
  title-unstyled: none = none,                    // heading in the outline
)
```

Below is a toy example with a colored rectangle. I can't show it here :(
```typst
#dnd-image-heading-section(rect(fill: red, height: 20em, width: 62em), 2, [A New Beginning'])
```


= Special Sections

Currently these work with data typed directly in the document, mostly because it's simple and I'm not sure anyone would use `json` data from 5e.tools for these are writing them is fast.
== Feat (`dnd-feat`)

#example(alignment: left, grid(
  columns: (40%, 50%),
  align: left,
  column-gutter: 60pt,
  [
    #template(config)[
      #dnd-feat[
        = Feat Name
        == you awesome prerequisite
        #lorem(20)
      ]]
  ],
  [
    ```typst
    #dnd-feat[
      = Feat Name
      == you awesome prerequisite
      #lorem(20)
    ]
    ```
  ],
))

== Items (`dnd-item`)

#example(alignment: left, grid(
  columns: (40%, 50%),
  align: left,
  column-gutter: 60pt,
  [
    #template(config)[
      #dnd-item[
        = Item Name
        == Wondrous item, rare
        #lorem(20)
      ]
    ]
  ],
  [
    ```typst
    #dnd-item[
      = Name
      == Wondrous item, rare
      #lorem(20)
    ]
    ```
  ],
))

== Spells (`dnd-spell`)
Spells currently need 7 arguments:
```typst
#let spell(
  title: content,
  level: str,
  time: str,
  range: str,
  components: str,
  duration: str,
  body: any,
  config: arguments | dictionary = (:)
)
```
They can be named or not. Personally I don't like this solution, suggestions are accepted :)


#example(grid(
  columns: (40%, 50%),
  align: left,
  column-gutter: 60pt,
  [
    #template(config)[
      #dnd-spell[Beautiful Typesetting][4th level illusion][1 action][5 feet][S, M][Until dispelled][
        #lorem(20)
      ]
    ]
  ],
  [
    ```typst
    #dnd-spell[Beautiful Typesetting][4th level illusion][1 action][5 feet][S, M][Until dispelled][
      #lorem(20)
    ]
    ```
  ],
))

= Map Regions (`dnd-area`)

The `dnd-area` function formats map regions. Numbering is automatic and resets with each new `dnd-area` block.

#example(alignment: center, grid(
  columns: (40%, 50%),
  align: left,
  column-gutter: 60pt,
  [#show: dnd-template.with(is-first: false)

    ===
    #dnd-area[
      = Village of Hommlet
      A small, welcoming village.
      == Inn of the Welcome Wench
      The village's central gathering place.
      == Blacksmith's Forge
      The local blacksmith's workshop.
      = Foo's Castle
      Foo's modest residence
      == Moat
      A shallow ditch crossed by a single plank.
    ]

    > *As you can see it resets when you exit the region*

    #dnd-area[
      = Ducktown
      #lorem(2)
      == Duck's Pond
      #lorem(5)
      == Duck's Nest
      #lorem(2)
      = Creeper's Lair
      #lorem(1)
    ]
  ],
  [
    ```typst
    #show: dnd-template.with(is-first: false)

    #dnd-area[
      = Village of Hommlet
      A small, welcoming village.
      == Inn of the Welcome Wench
      The village's central gathering place.
      == Blacksmith's Forge
      The local blacksmith's workshop.
      = Foo's Castle
      Foo's modest residence
      == Moat
      A shallow ditch crossed by a single plank.
    ]

    > *As you can see it resets when you exit the region*
    #dnd-area[
      = Village of Hommlet
      #lorem(2)
      == Inn of the Welcome Wench
      #lorem(5)
      == Blacksmith's Forge
      #lorem(2)
      = Foo's Castle
      #lorem(1)
    ]
    ```
  ],
))

= Text Boxes

== Read Aloud (`dnd-readaloud`)
Meant to be read aloud by the GM, `dnd-readaloud` has only the body argument (other than config):

#example(alignment: left, grid(
  columns: (40%, 50%),
  align: left + horizon,
  column-gutter: 60pt,
  [
    #template(config)[
      #dnd-readaloud[
        #lorem(20)
      ]
    ]
  ],
  [
    ```typst
      #dnd-readaloud[
        #lorem(20)
      ]
    ```
  ],
))

== Sidebar (`dnd-sidebar`)
Is designed for supplementary content. It doesn't break across columns.

Arguments:
- title
- body

#example(alignment: left, grid(
  columns: (40%, 50%),
  align: left + horizon,
  column-gutter: 60pt,
  [
    #template(config)[
      #dnd-sidebar[Title][
        #lorem(20)
      ]
    ]
  ],
  [
    ```typst
    #dnd-sidebar[Title][
      #lorem(20)
    ]
    ```
  ],
))

== Comment (`dnd-comment`)
It provides minimal visual highlighting for text, while laking the ornamentation of `dnd-sidebar`.

#example(alignment: left, grid(
  columns: (40%, 50%),
  align: left + horizon,
  column-gutter: 60pt,
  [
    #template(config)[
      #dnd-comment[Title][
        #lorem(20)
      ]
    ]
  ],
  [
    ```typst
    #dnd-comment[Title][
      #lorem(20)
    ]
    ```
  ],
))


== Tables
The table style automatically colors even-numbered rows and defaults to the width of the column.

#example(alignment: left, grid(
  columns: (40%, 50%),
  align: left + horizon,
  column-gutter: 60pt,
  [
    #template(config)[
      #figure(
        table(
          columns: (auto, 1fr),
          table.header[Table head][Table head],
          [January], [The Great Gatsby],
          [February], [To Kill a Mockingbird],
          [March], [1984],
          [April], [The Catcher in the Rye],
        ),
        caption: [Nice Table],
      )
    ]
  ],
  [
    #set text(size: 0.8em)
    ```typst
        #figure(
      table(
        columns: (auto, 1fr),
        table.header[Table head][Table head],
        [January], [The Great Gatsby],
        [February], [To Kill a Mockingbird],
        [March], [1984],
        [April], [The Catcher in the Rye],
      ),
      caption: [Nice Table],
    )
    ```
  ],
))

= Special functions

== Dropcap (`dnd-dropcap`)
`dnd-dropcap` makes possible to have a cool-styled initial letter attached to later text. This is possible because of the #link("https://typst.app/universe/package/droplet/")[droplet] package.

#example(alignment: left, grid(
  columns: (40%, 50%),
  align: left + horizon,
  column-gutter: 60pt,
  [
    #template(config)[
      #dnd-dropcap("A")[nother dagger was pus][ed through his heart. #lorem(10)]
    ]
  ],
  [
    #set text(size: 0.8em)
    ```typst
    #dnd-dropcap("A")[nother dagger was pus][ed through his heart. #lorem(10)]
    ```
  ],
))

= Monster (`dnd-monster`)

Monsters are managed using `json` files exported by #link("https://5e.tools")[5e.tools]. The idea is that if you are writing an adventure module or e.g. a monster manual it's highly probable that you will also need the stats written for VVTs#footnote[Virtual Table Tops] such as FoundryVTT or Roll20. If you create your monster using 5e.tools utility you can export it for many VTTs, thus you don't have to waste much time copying monster stats for each VTT specifications.

If you find any issue with a monster please open an issue on the #link("https://github.com/sa1g/dnd-typst-template")[template repo] or send me an email at "ettore" dot "saggiorato" "+dndtemplate" at "proton" dot "me", I'll try to fix it as soon as possible :) (please provide the json file of the monster if possible, it makes my life easier).

At the time of writing (23/02/2026) only JSON files are supported, an "inline" writing could be added if requested. It isn't hard to develop, it just requires some time.

At the time of writing (23/02/2026) only 2014's style has been implemented, 2024's may be added in the future. You will be able to change monster style (if it ever gets developed) by modifying `monster-style` from 2014 to 2024 in the config. Hit me up if you need it, as currently it isn't on my priority list as monsters are quite time consuming.

Once you have a JSON for your monster, everything is straightforward. Arguments:
- monster: loaded/generated dict of the monster, following 5e.tools specs
- correction-factor: needed to correctly set the height of the monster box. This is needed as typst currently doesn't support "top-balancing" columns
- columns: amount of columns show the monster to

Usage: ```typst #dnd-monster(json("unicorn.json"), correction-factor: 1.06) ```

#example(alignment: left, template(config)[#dnd-monster(json("unicorn.json"), correction-factor: 1.06)])

= Utility - Quality of Life

Useful utility functions and data structures are exposed by the template so simplify module/adventure writing and customization.

== `dnd-dice`
Makes possible to automatically calculate and show the average of a throw plus the dice formula.

Dices can be written as either `content` or `str`:

- [3d8]
- [3d8+3]
- [3d8 + 3]
- the same as strings, e.g. "3d8", "3d8+3", "3d8 + 3"

#example(alignment: left, grid(
  columns: (40%, 50%),
  align: left + horizon,
  column-gutter: 60pt,
  [
    #template(config)[
      #dnd-dice([3d8])

      #dnd-dice([3d8+3])

      #dnd-dice([3d8 + 3])

      #dnd-dice("3d8")

      #dnd-dice("3d8+3")

      #dnd-dice("3d8 + 3")
    ]
  ],
  [
    #set text(size: 0.8em)
    ```typst
    #dnd-dice([3d8])

    #dnd-dice([3d8+3])

    #dnd-dice([3d8 + 3])

    #dnd-dice("3d8")

    #dnd-dice("3d8+3")

    #dnd-dice("3d8 + 3")
    ```
  ],
))



== `easy-colors`
Creates a dictionary that can be applied, using `merge-dicts` on e.g. the default configuration so that you can easily remap default colors to others. This is not done granually, which you have to do creating a custom config, but it sets your chosen colors keeping the default color schema (new colors, same logic).

Arguments:
- primary: red,
- secondary: red,
- tertiary: red,
- fourth: black,
- text-fill: black,
- readaloud-background: colors.bgtan,
- monster-ribbon: colors.statblockribbon,
- monster-background: colors.statblockbg,
- monster-bar: colors.rulered,

== Fonts, font size, weight, colors, etc.
#rect(stroke: none, align(center, table(
  columns: 2,
  [*Name*], [*Description*],
  [`colors`],
  [Contains the same colors specified in the LaTeX template. These are most of the colors used in official books.],

  [`font-size`],
  [Font sizes similar to the same used in LaTeX. This is for a fast reference if you are used to that system.],

  [`font-weight`],
  [A dict representing all supported font weight by Typst. Note that fonts are not guaranteed to change weight granuarly as they need to support that.],

  [`font-family`],
  [A dict naming the three font styles used by default:
    #align(center, table(
      columns: 2,
      [*Font Name*], [*Dictionary Key*],
      [Tex Gyre Bonum], [`main`],
      [Gillius ADF No2], [`secondary`],
      [Royal Initialen], [`initial`],
    ))],
)))

== `flex-heading`
A utility function to create headings that show different content between the heading and the outline.

```typst
#flex-heading[<heading-on-page>][<heading-in-outline>]
```

= Customization

While using this template you might want to have some personal space by customizing many of its aspects. This is possible both _inline_ and at a _global_ level, the main difference relies in how you apply the custom _style_, which can be e.g. on either a specific `dnd-commentbox` or to all comment boxes around the document.

The main idea is that you can create custom configurations, which are dictionaries with the same structure as `default-config` but with different values, and apply them to specific blocks of the document.

To simplify the process of creating custom configurations, utility functions are provided to create and merge dictionaries:

#align(center, table(
  columns: 2,
  align: (center, left),
  [*Function*], [*Description*],
  [`merge-dicts`],
  [Merges multiple dictionaries, keeping the left-most value for each key. This is used to merge or append custom configurations to the default one. See how `default-config` works behind the scenes for an example on how it's used. ],

  [`config-area`], [Sets `dnd-area` style.],
  [`config-comment`], [Sets `dnd-comment` style.],
  [`config-dropcap`], [Sets `dnd-dropcap` style.],
  [`config-feat`], [Sets `dnd-feat` style.],
  [`config-item`], [Sets `dnd-item` style.],
  [`config-readloud`], [Sets `dnd-readaloud` style.],
  [`config-sidebar`], [Sets `dnd-sidebar` style.],
  [`config-spell`], [Sets `dnd-spell` style.],
  [`config-monster`], [Sets `dnd-monster` style.],
  [`config-table`], [Sets `dnd-table` style.],
  [`config-global`], [Sets the global text style.],
))


All configs default to a 2014s D&D style.

> In the future a "default" 2024 style may be added, please open an issue if you want this feature :)

#pagebreak()
== Inline
All the parts of the template that are shown via a function (`dnd-area, dnd-comment, dnd-dropcap, dnd-feat, dnd-item, dnd-readlaoud, dnd-sidebar, dnd-spell, dnd-monster`) can be customized on the fly, when called, by passing a custom configuration dictionary. This way you can have different styles for different blocks of the same type without the need to create an entire custom template for that.

This is very easy to do:

#example(alignment: left, {
  grid(
    columns: (40%, 50%),
    align: (horizon + center, left + horizon),
    column-gutter: 60pt,
    [
      #template(config)[
        #dnd-comment(config: config-comment(background-fill: rgb(100, 160, 40)))[This is a Comment Box!][
          #lorem(10)
        ]
      ]
    ],
    [
      #set text(size: 0.8em)
      ```typst
      #dnd-comment(config: config-comment(fill: rgb(100, 160, 40)))[This is a Comment Box!][
          #lorem(10)
        ]
      ```
    ],
  )

  grid(
    columns: (40%, 50%),
    align: (horizon + center, left + horizon),
    column-gutter: 60pt,
    [
      #template(config)[
        #dnd-readaloud(config: config-readaloud(edges-fill: rgb(220, 60, 120), background-fill: rgb(
          230,
          220,
          120,
        )))[
          #lorem(20)
        ]
      ]
    ],
    [
      #set text(size: 0.8em)
      ```typst
      #dnd-readaloud(config: config-readaloud(edges-fill: rgb(220, 60, 120), background-fill: rgb(230,220,120,
      )))[#lorem(20)]
      ```
    ],
  )

  grid(
    columns: (40%, 50%),
    align: (horizon + center, left + horizon),
    column-gutter: 60pt,
    [
      #template(config)[
        #dnd-sidebar(config: config-sidebar(
          edge-fill: rgb(100, 80, 60),
          background-fill: black,
          fill: white,
          title-fill: green,
        ))[
          Behold the DndSidebar!
        ][
          #lorem(20)
        ]
      ]
    ],
    [
      #set text(size: 0.8em)
      ```typst
      #dnd-sidebar(config: config-sidebar(edge-fill: rgb(100, 80, 60), background-fill: black))[
        Behold the DndSidebar!
      ][
        #lorem(20)
      ]
      ```
    ],
  )
})

== Global
You change, by setting different values in the constructor, variables of `default-config`. Most variables are self explanatory.

This is applied to the entire document.

```typst
#show: dnd-template.with(
  default-config(lang: "it")
)
```

When calling ```typst #show: dnd-template.with()``` you can also pass `is-first`, which is a boolean that sets if outline and footers are shown on the next pages or not. This is useful if you want to have completely different styles on the same document (having a single outline and continuous page numbering)
