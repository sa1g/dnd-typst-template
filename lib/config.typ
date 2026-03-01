// 18/02/2026 - Sa1g - Completely rewritten configuration management: one to rule them all!
// Previous strategy was too confusing also for its creator. :|
//
//
// Default values are set in `config`, whenever you want to override something simply set any
// argument to the value you want it to be set.

#import "config-utils.typ": colors, font, font-size, font-weight

#let config-area(
  area-line-fill: colors.titlegold,
  area-line-thickness: 1.2pt,
  area-text-fill: colors.darkest,
  area-font: font.main,
  area-heading-1-size: font-size.Large,
  area-heading-1-weight: font-weight.normal,
  area-heading-1-style: smallcaps,
  area-heading-1-fill: colors.titlered,
  area-heading-1-font: font.main,
  area-heading-2-size: font-size.normalsize,
  area-heading-2-weight: font-weight.normal,
  area-heading-2-style: smallcaps,
  area-heading-2-fill: colors.darkest,
  area-heading-2-font: font.main,
  area-text-size: font-size.small,
  // area-line-fill,
  // area-line-thickness,
  // area-text-fill,
  // area-font,
  // area-heading-1-size,
  // area-heading-1-weight,
  // area-heading-1-style,
  // area-heading-1-fill,
  // area-heading-1-font,
  // area-heading-2-size,
  // area-heading-2-weight,
  // area-heading-2-style,
  // area-heading-2-fill,
  // area-heading-2-font,
  // area-text-size,
) = {
  return (
    area: (
      line: (
        fill: area-line-fill,
        thickness: area-line-thickness,
      ),
      body: (
        font: area-font,
        size: area-text-size,
        fill: area-text-fill,
      ),
      headers: (
        level-1: (
          size: area-heading-1-size,
          weight: area-heading-1-weight,
          style: area-heading-1-style,
          fill: area-heading-1-fill,
          font: area-heading-1-font,
        ),
        level-2: (
          size: area-heading-2-size,
          weight: area-heading-2-weight,
          style: area-heading-2-style,
          fill: area-heading-2-fill,
          font: area-heading-2-font,
        ),
      ),
    ),
  )
}


#let config-comment(
  commentbox-fill: colors.PhbLightGreen,
  commentbox-title-font: font.secondary,
  commentbox-title-size: font-size.small,
  commentbox-title-style: smallcaps,
  commentbox-title-weight: font-weight.bold,
  commentbox-font: font.secondary,
  commentbox-size: font-size.small,
  commentbox-weight: font-weight.normal,
) = {
  return (
    commentbox: (
      title: (
        font: commentbox-title-font,
        size: commentbox-title-size,
        style: commentbox-title-style,
        weight: commentbox-title-weight,
      ),
      body: (
        font: commentbox-font,
        size: commentbox-size,
        weight: commentbox-weight,
      ),
      background: (
        fill: commentbox-fill,
      ),
    ),
  )
}

#let config-dropcap(
  dropcap-font: font.initial,
) = {
  return (
    dropcap: (
      font: dropcap-font,
    ),
  )
}

#let config-feat(
  feat-heading-1-fill: colors.titlered,
  feat-heading-1-font: font.main,
  feat-heading-1-size: font-size.large,
  feat-heading-1-weight: font-weight.normal,
  feat-heading-1-style: smallcaps,
  feat-heading-2-fill: colors.titlered,
  feat-heading-2-font: font.main,
  feat-heading-2-size: font-size.small,
  feat-heading-2-weight: font-weight.normal,
  feat-heading-2-style: emph,
  feat-font: font.main,
  feat-size: font-size.small,
  feat-line-fill: colors.titlegold,
  feat-line-thickness: 1.2pt,
) = {
  return (
    feat: (
      headers: (
        level-1: (
          fill: feat-heading-1-fill,
          font: feat-heading-1-font,
          size: feat-heading-1-size,
          weight: feat-heading-1-weight,
          style: feat-heading-1-style,
        ),
        level-2: (
          fill: feat-heading-2-fill,
          font: feat-heading-2-font,
          size: feat-heading-2-size,
          weight: feat-heading-2-weight,
          style: feat-heading-2-style,
        ),
      ),
      body: (font: feat-font, size: feat-size),
      line: (fill: feat-line-fill, thickness: feat-line-thickness),
    ),
  )
}

#let config-item(
  item-heading-1-fill: colors.titlered,
  item-heading-1-font: font.main,
  item-heading-1-size: font-size.small,
  item-heading-1-weight: font-weight.normal,
  item-heading-1-style: smallcaps,
  item-heading-2-font: font.main,
  item-heading-2-size: font-size.small,
  item-heading-2-weight: font-weight.normal,
  item-heading-2-style: emph,
  item-font: font.main,
  item-size: font-size.small,
) = {
  return (
    item: (
      headers: (
        level-1: (
          fill: item-heading-1-fill,
          font: item-heading-1-font,
          size: item-heading-1-size,
          weight: item-heading-1-weight,
          style: item-heading-1-style,
        ),
        level-2: (
          font: item-heading-2-font,
          size: item-heading-2-size,
          weight: item-heading-2-weight,
          style: item-heading-2-style,
        ),
      ),
      body: (
        font: item-font,
        size: item-size,
      ),
    ),
  )
}

#let config-readaloud(
  readaloud-background-fill: colors.bgtan,
  readaloud-edges-fill: colors.titlered,
  readaloud-transparentize-fill: 30%,
  readaloud-font: font.secondary,
  readaloud-size: 0.82em,
) = {
  return (
    readaloud: (
      body: (
        font: readaloud-font,
        size: readaloud-size,
      ),
      background: (
        fill: readaloud-background-fill,
        transparentize: readaloud-transparentize-fill,
        fill-edge: readaloud-edges-fill,
      ),
    ),
  )
}

#let config-sidebar(
  sidebar-background-fill: colors.PhbLightGreen,
  sidebar-edge-fill: colors.darkest,
  sidebar-title-font: font.secondary,
  sidebar-title-size: font-size.small,
  sidebar-title-weight: font-weight.normal,
  sidebar-title-style: smallcaps,
  sidebar-font: font.secondary,
  sidebar-size: font-size.small,
) = {
  return (
    sidebar: (
      title: (
        font: sidebar-title-font,
        size: sidebar-title-size,
        weight: sidebar-title-weight,
        style: sidebar-title-style,
      ),
      body: (
        font: sidebar-font,
        size: sidebar-size,
      ),
      fill-background: sidebar-background-fill,
      fill-edge: sidebar-edge-fill,
    ),
  )
}

#let config-spell(
  spell-title-fill: colors.titlered,
  spell-font: font.main,
  spell-size: font-size.small,
) = {
  return (
    spell: (
      fill-title: spell-title-fill,
      font: spell-font,
      size: spell-size,
    ),
  )
}

#let config-monster(
  monster-style: 2014,
  monster-title-fill: colors.titlered,
  monster-bar-fill: colors.rulered,
  monster-ribbon-fill: colors.statblockribbon,
  monster-background-fill: colors.statblockbg,
  monster-background-transparency-fill: 40%,
  monster-title-font: font.main,
  monster-title-weight: font-weight.bold,
  monster-title-style: none,
  monster-title-size: font-size.Large,
  monster-subtitle-size: font-size.large,
  monster-subtitle-style: smallcaps,
  monster-size: font-size.small,
  monster-font: font.secondary,
) = {
  return (
    monster: (
      background: (
        fill: monster-background-fill,
        transparency: monster-background-transparency-fill,
      ),
      title: (
        fill: monster-title-fill,
        font: monster-title-font,
        weight: monster-title-weight,
        style: monster-title-style,
        size: monster-title-size,
      ),
      subtitle: (
        size: monster-subtitle-size,
        style: monster-subtitle-style,
      ),
      body: (
        size: monster-size,
        font: monster-font,
      ),
      bar: (
        fill: monster-bar-fill,
      ),
      ribbon: (
        fill: monster-ribbon-fill,
      ),
      style: monster-style,
    ),
  )
}

#let config-table(
  table-title-fill: colors.darkest,
  table-header-fill: colors.darkest,
  table-body-fill: colors.darkest,
  table-cell-fill: colors.PhbLightGreen,
  table-title-font: font.secondary,
  table-title-style: smallcaps,
  table-title-weight: font-weight.bold,
  table-title-size: font-size.large,
  table-header-font: font.secondary,
  table-header-weight: font-weight.bold,
  table-body-font: font.secondary,
  table-body-size: font-size.small,
) = {
  return (
    table: (
      title: (
        font: table-title-font,
        style: table-title-style,
        weight: table-title-weight,
        size: table-title-size,
        fill: table-title-fill,
      ),
      header: (
        font: table-header-font,
        weight: table-header-weight,
        fill: table-header-fill,
      ),
      body: (
        font: table-body-font,
        size: table-body-size,
        fill: table-body-fill,
      ),
      cell: (
        primary-fill: table-cell-fill,
        secondary-fill: none,
      ),
    ),
  )
}

#let config-global(
  global-text-fill: colors.darkest,
  global-text-font: font.main,
  global-text-size: font-size.normalsize,
  global-text-weight: font-weight.normal,
) = {
  return (
    global: (
      text: (
        font: global-text-font,
        size: global-text-size,
        fill: global-text-fill,
        weight: global-text-weight,
      ),
    ),
  )
}





/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
// DEFAULT CONFIG

#let default-config(
  // Info
  title: none,
  subtitle: none,
  author: none,
  date: none,
  // Page
  paper: "us-letter",
  background: image("/assets/paper/default.jpg"),
  lang: "en",
  show-part: true,
  show-chapter: true,
  using-parts: true,
  // Common/Global text
  global-text-fill: colors.darkest,
  global-text-font: font.main,
  global-text-size: font-size.normalsize,
  global-text-weight: font-weight.normal,
  // Header
  headers-level-1-fill: colors.titlered,
  headers-level-1-font: font.main,
  headers-level-1-weight: font-weight.normal,
  headers-level-1-stroke: 0pt,
  headers-level-1-size: font-size.Huge,
  headers-level-1-linespread: 0.9pt,
  headers-level-1-style: none,
  headers-level-1-to: none, // odd, even
  headers-level-2-fill: colors.titlered,
  headers-level-2-font: font.main,
  headers-level-2-weight: font-weight.normal,
  headers-level-2-stroke: 0pt,
  headers-level-2-size: font-size.huge,
  headers-level-2-linespread: 0.9pt,
  headers-level-2-style: none,
  headers-level-3-fill: colors.titlered,
  headers-level-3-font: font.main,
  headers-level-3-weight: font-weight.normal,
  headers-level-3-size: font-size.LARGE,
  headers-level-3-linespread: 0.9pt,
  headers-level-3-style: smallcaps,
  headers-level-4-font: font.main,
  headers-level-4-weight: font-weight.normal,
  headers-level-4-size: font-size.Large,
  headers-level-4-linespread: 0.9pt,
  headers-level-4-style: smallcaps,
  headers-level-4-line-spacing: 3pt,
  headers-level-4-line-thickness: 1.2pt,
  headers-level-4-fill: colors.titlered,
  headers-level-4-line-fill: colors.titlegold,
  headers-level-5-font: font.main,
  headers-level-5-weight: font-weight.normal,
  headers-level-5-size: font-size.large,
  headers-level-5-linespread: 0.9pt,
  headers-level-5-fill: colors.titlered,
  headers-level-5-style: smallcaps,
  headers-level-6-font: font.main,
  headers-level-6-style: emph,
  headers-level-6-size: font-size.normalsize,
  headers-level-7-font: font.main,
  headers-level-7-style: emph,
  headers-level-7-size: font-size.normalsize,
  // Paragraph
  par-fill: colors.darkest,
  // Subparahraph
  subpar-fill: colors.darkest,
  // Outline
  outline-repeated-symbol: ".",
  outline-indent: true,
  outline-line-fill: colors.titlegold,
  outline-line-thickness: 1.2pt,
  outline-level-1-fill: colors.titlered,
  outline-level-1-font: font.main,
  outline-level-1-weight: font-weight.normal,
  outline-level-1-size: font-size.LARGE,
  outline-level-1-style: smallcaps,
  outline-level-2-fill: colors.titlered,
  outline-level-2-font: font.main,
  outline-level-2-weight: font-weight.normal,
  outline-level-2-size: font-size.Large,
  outline-level-2-style: smallcaps,
  outline-level-3-fill: colors.titlered,
  outline-level-3-font: font.main,
  outline-level-3-weight: font-weight.normal,
  outline-level-3-size: font-size.large,
  outline-level-3-style: none,
  outline-level-4-fill: colors.darkest,
  outline-level-4-font: font.main,
  outline-level-4-weight: font-weight.normal,
  outline-level-4-size: font-size.normalsize,
  outline-level-4-style: none,
  outline-level-5-fill: colors.darkest,
  outline-level-5-font: font.main,
  outline-level-5-weight: font-weight.normal,
  outline-level-5-size: font-size.normalsize,
  outline-level-5-style: none,
  // Table
  table-title-fill: colors.darkest,
  table-header-fill: colors.darkest,
  table-body-fill: colors.darkest,
  table-cell-fill: colors.PhbLightGreen,
  table-title-font: font.secondary,
  table-title-style: smallcaps,
  table-title-weight: font-weight.bold,
  table-title-size: font-size.large,
  table-header-font: font.secondary,
  table-header-weight: font-weight.bold,
  table-body-font: font.secondary,
  table-body-size: font-size.small,
  // drop-cap
  dropcap-font: font.initial,
  // dnd-area
  area-line-fill: colors.titlegold,
  area-line-thickness: 1.2pt,
  area-text-fill: colors.darkest,
  area-font: font.main,
  area-heading-1-size: font-size.Large,
  area-heading-1-weight: font-weight.normal,
  area-heading-1-style: smallcaps,
  area-heading-1-fill: colors.titlered,
  area-heading-1-font: font.main,
  area-heading-2-size: font-size.normalsize,
  area-heading-2-weight: font-weight.normal,
  area-heading-2-style: smallcaps,
  area-heading-2-fill: colors.darkest,
  area-heading-2-font: font.main,
  area-text-size: font-size.small,
  // dnd-commentbox
  commentbox-fill: colors.PhbLightGreen,
  commentbox-title-font: font.secondary,
  commentbox-title-size: font-size.small,
  commentbox-title-style: smallcaps,
  commentbox-title-weight: font-weight.bold,
  commentbox-font: font.secondary,
  commentbox-size: font-size.small,
  commentbox-weight: font-weight.normal,
  // dnd-feat
  feat-heading-1-fill: colors.titlered,
  feat-heading-1-font: font.main,
  feat-heading-1-size: font-size.large,
  feat-heading-1-weight: font-weight.normal,
  feat-heading-1-style: smallcaps,
  feat-heading-2-fill: colors.titlered,
  feat-heading-2-font: font.main,
  feat-heading-2-size: font-size.small,
  feat-heading-2-weight: font-weight.normal,
  feat-heading-2-style: emph,
  feat-font: font.main,
  feat-size: font-size.small,
  feat-line-fill: colors.titlegold,
  feat-line-thickness: 1.2pt,
  // dnd-item
  item-heading-1-fill: colors.titlered,
  item-heading-1-font: font.main,
  item-heading-1-size: font-size.small,
  item-heading-1-weight: font-weight.normal,
  item-heading-1-style: smallcaps,
  item-heading-2-font: font.main,
  item-heading-2-size: font-size.small,
  item-heading-2-weight: font-weight.normal,
  item-heading-2-style: emph,
  item-font: font.main,
  item-size: font-size.small,
  // dnd-readaloud
  readaloud-background-fill: colors.bgtan,
  readaloud-edges-fill: colors.titlered,
  readaloud-transparentize-fill: 30%,
  readaloud-font: font.secondary,
  readaloud-size: 0.82em,
  // dnd-sidebar
  sidebar-background-fill: colors.PhbLightGreen,
  sidebar-edge-fill: colors.darkest,
  sidebar-title-font: font.secondary,
  sidebar-title-size: font-size.small,
  sidebar-title-weight: font-weight.normal,
  sidebar-title-style: smallcaps,
  sidebar-font: font.secondary,
  sidebar-size: font-size.small,
  // dnd-spell
  spell-title-fill: colors.titlered,
  spell-font: font.main,
  spell-size: font-size.small,
  // dnd-monster
  monster-style: 2014,
  monster-title-fill: colors.titlered,
  monster-bar-fill: colors.rulered,
  monster-ribbon-fill: colors.statblockribbon,
  monster-background-fill: colors.statblockbg,
  monster-background-transparency-fill: 40%,
  monster-title-font: font.main,
  monster-title-weight: font-weight.bold,
  monster-title-style: none,
  monster-title-size: font-size.Large,
  monster-subtitle-size: font-size.large,
  monster-subtitle-style: smallcaps,
  monster-size: font-size.small,
  monster-font: font.secondary,
  // footer
  footer-image-left: image("../assets/footer/default/r.svg"),
  footer-image-right: image("../assets/footer/default/l.svg"),
  footer-chapter-dx: -6%,
  footer-chapter-dy: 76%,
  footer-number-dx: -15.5%,
  footer-number-dy: 77%,
  footer-scale: 133%,
  footer-fill: colors.titlegold,
  footer-debug-circle-fill: none,
  footer-font: font.main,
  footer-size-number: font-size.normalsize, //or normal
  footer-weight-number: font-weight.medium,
  footer-size-chapter: font-size.small,
  footer-weight-chapter: font-weight.medium,
  footer-chapter-style: smallcaps,
) = {
  assert(monster-style == 2014, message: "Currently supported monster styles: `2014`")

  let config = (
    info: (
      title: title,
      subtitle: subtitle,
      author: author,
      date: date,
    ),
    page: (
      paper: paper,
      background: background,
      lang: lang,
      show-part: show-part,
      show-chapter: show-chapter,
      using-parts: using-parts,
    ),
    headers: (
      level-1: (
        fill: headers-level-1-fill,
        font: headers-level-1-font,
        weight: headers-level-1-weight,
        stroke: headers-level-1-stroke,
        size: headers-level-1-size,
        linespread: headers-level-1-linespread,
        style: headers-level-1-style,
        to: headers-level-1-to,
      ),
      level-2: (
        fill: headers-level-2-fill,
        font: headers-level-2-font,
        weight: headers-level-2-weight,
        stroke: headers-level-2-stroke,
        size: headers-level-2-size,
        linespread: headers-level-2-linespread,
        style: headers-level-2-style,
      ),
      level-3: (
        fill: headers-level-3-fill,
        font: headers-level-3-font,
        weight: headers-level-3-weight,
        size: headers-level-3-size,
        linespread: headers-level-3-linespread,
        style: headers-level-3-style,
      ),
      level-4: (
        fill: headers-level-4-fill,
        font: headers-level-4-font,
        weight: headers-level-4-weight,
        size: headers-level-4-size,
        linespread: headers-level-4-linespread,
        style: headers-level-4-style,
        line: (
          fill: headers-level-4-line-fill,
          spacing: headers-level-4-line-spacing,
          thickness: headers-level-4-line-thickness,
        ),
      ),
      level-5: (
        fill: headers-level-5-fill,
        font: headers-level-5-font,
        weight: headers-level-5-weight,
        size: headers-level-5-size,
        linespread: headers-level-5-linespread,
        style: headers-level-5-style,
      ),
      level-6: (
        font: headers-level-6-font,
        style: headers-level-6-style,
        size: headers-level-6-size,
      ),
      level-7: (
        font: headers-level-7-font,
        style: headers-level-7-style,
        size: headers-level-7-size,
      ),
    ),
    par: (
      fill: par-fill,
    ),
    subpar: (
      fill: subpar-fill,
    ),
    outline: (
      level-1: (
        fill: outline-level-1-fill,
        font: outline-level-1-font,
        weight: outline-level-1-weight,
        size: outline-level-1-size,
        style: outline-level-1-style,
      ),
      level-2: (
        fill: outline-level-2-fill,
        font: outline-level-2-font,
        weight: outline-level-2-weight,
        size: outline-level-2-size,
        style: outline-level-2-style,
      ),
      level-3: (
        fill: outline-level-3-fill,
        font: outline-level-3-font,
        weight: outline-level-3-weight,
        size: outline-level-3-size,
        style: outline-level-3-style,
      ),
      level-4: (
        fill: outline-level-4-fill,
        font: outline-level-4-font,
        weight: outline-level-4-weight,
        size: outline-level-4-size,
        style: outline-level-4-style,
      ),
      level-5: (
        fill: outline-level-5-fill,
        font: outline-level-5-font,
        weight: outline-level-5-weight,
        size: outline-level-5-size,
        style: outline-level-5-style,
      ),
      line: (fill: outline-line-fill, thickness: outline-line-thickness),
      repeated-symbol: outline-repeated-symbol,
      indent: outline-indent,
    ),
    footer: (
      body: (
        font: footer-font,
        fill: footer-fill,
      ),
      number: (
        size: footer-size-number,
        weight: footer-weight-number,
      ),
      chapter: (
        size: footer-size-chapter,
        weight: footer-weight-chapter,
        style: footer-chapter-style,
      ),
      image: (
        debug: footer-debug-circle-fill,
        scale: footer-scale,
        left: (
          image: footer-image-left,
          number: (
            dx: footer-number-dx,
            dy: footer-number-dy,
          ),
          chapter: (
            dx: footer-chapter-dx,
            dy: footer-chapter-dy,
          ),
        ),
        right: (
          image: footer-image-right,
          number: (
            dx: -footer-number-dx,
            dy: footer-number-dy,
          ),
          chapter: (
            dx: -footer-chapter-dx,
            dy: footer-chapter-dy,
          ),
        ),
      ),
    ),
  )

  config.insert(
    "area",
    config-area(
      area-line-fill: area-line-fill,
      area-line-thickness: area-line-thickness,
      area-text-fill: area-text-fill,
      area-font: area-font,
      area-heading-1-size: area-heading-1-size,
      area-heading-1-weight: area-heading-1-weight,
      area-heading-1-style: area-heading-1-style,
      area-heading-1-fill: area-heading-1-fill,
      area-heading-1-font: area-heading-1-font,
      area-heading-2-size: area-heading-2-size,
      area-heading-2-weight: area-heading-2-weight,
      area-heading-2-style: area-heading-2-style,
      area-heading-2-fill: area-heading-2-fill,
      area-heading-2-font: area-heading-2-font,
      area-text-size: area-text-size,
    ).area,
  )

  config.insert(
    "commentbox",
    config-comment(
      commentbox-fill: commentbox-fill,
      commentbox-title-font: commentbox-title-font,
      commentbox-title-size: commentbox-title-size,
      commentbox-title-style: commentbox-title-style,
      commentbox-title-weight: commentbox-title-weight,
      commentbox-font: commentbox-font,
      commentbox-size: commentbox-size,
      commentbox-weight: commentbox-weight,
    ).commentbox,
  )

  config.insert("dropcap", config-dropcap(dropcap-font: dropcap-font).dropcap)

  config.insert(
    "feat",
    config-feat(
      feat-heading-1-fill: feat-heading-1-fill,
      feat-heading-1-font: feat-heading-1-font,
      feat-heading-1-size: feat-heading-1-size,
      feat-heading-1-weight: feat-heading-1-weight,
      feat-heading-1-style: feat-heading-1-style,
      feat-heading-2-fill: feat-heading-2-fill,
      feat-heading-2-font: feat-heading-2-font,
      feat-heading-2-size: feat-heading-2-size,
      feat-heading-2-weight: feat-heading-2-weight,
      feat-heading-2-style: feat-heading-2-style,
      feat-font: feat-font,
      feat-size: feat-size,
      feat-line-fill: feat-line-fill,
      feat-line-thickness: feat-line-thickness,
    ).feat,
  )

  config.insert(
    "item",
    config-item(
      item-heading-1-fill: item-heading-1-fill,
      item-heading-1-font: item-heading-1-font,
      item-heading-1-size: item-heading-1-size,
      item-heading-1-weight: item-heading-1-weight,
      item-heading-1-style: item-heading-1-style,
      item-heading-2-font: item-heading-2-font,
      item-heading-2-size: item-heading-2-size,
      item-heading-2-weight: item-heading-2-weight,
      item-heading-2-style: item-heading-2-style,
      item-font: item-font,
      item-size: item-size,
    ).item,
  )

  config.insert(
    "readaloud",
    config-readaloud(
      readaloud-background-fill: readaloud-background-fill,
      readaloud-edges-fill: readaloud-edges-fill,
      readaloud-transparentize-fill: readaloud-transparentize-fill,
      readaloud-font: readaloud-font,
      readaloud-size: readaloud-size,
    ).readaloud,
  )

  config.insert(
    "sidebar",
    config-sidebar(
      sidebar-background-fill: sidebar-background-fill,
      sidebar-edge-fill: sidebar-edge-fill,
      sidebar-title-font: sidebar-title-font,
      sidebar-title-size: sidebar-title-size,
      sidebar-title-weight: sidebar-title-weight,
      sidebar-title-style: sidebar-title-style,
      sidebar-font: sidebar-font,
      sidebar-size: sidebar-size,
    ).sidebar,
  )

  config.insert(
    "spell",
    config-spell(
      spell-title-fill: spell-title-fill,
      spell-font: spell-font,
      spell-size: spell-size,
    ).spell,
  )

  config.insert(
    "monster",
    config-monster(
      monster-style: monster-style,
      monster-title-fill: monster-title-fill,
      monster-bar-fill: monster-bar-fill,
      monster-ribbon-fill: monster-ribbon-fill,
      monster-background-fill: monster-background-fill,
      monster-background-transparency-fill: monster-background-transparency-fill,
      monster-title-font: monster-title-font,
      monster-title-weight: monster-title-weight,
      monster-title-style: monster-title-style,
      monster-title-size: monster-title-size,
      monster-subtitle-size: monster-subtitle-size,
      monster-subtitle-style: monster-subtitle-style,
      monster-size: monster-size,
      monster-font: monster-font,
    ).monster,
  )

  config.insert(
    "table",
    config-table(
      table-title-fill: table-title-fill,
      table-header-fill: table-header-fill,
      table-body-fill: table-body-fill,
      table-cell-fill: table-cell-fill,
      table-title-font: table-title-font,
      table-title-style: table-title-style,
      table-title-weight: table-title-weight,
      table-title-size: table-title-size,
      table-header-font: table-header-font,
      table-header-weight: table-header-weight,
      table-body-font: table-body-font,
      table-body-size: table-body-size,
    ).table,
  )

  config.insert(
    "global",
    config-global(
      global-text-fill: global-text-fill,
      global-text-font: global-text-font,
      global-text-size: global-text-size,
      global-text-weight: global-text-weight,
    ).global,
  )

  return config
}


/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
// SHORTCUTS

#let easy-colors(
  primary: red,
  secondary: red,
  tertiary: red,
  fourth: black,
  text-fill: black,
  readaloud-background: colors.bgtan,
  monster-ribbon: colors.statblockribbon,
  monster-background: colors.statblockbg,
  monster-bar: colors.rulered,
) = {
  return default-config(
    global-text-fill: text-fill,
    table-title-fill: text-fill,
    table-header-fill: text-fill,
    table-body-fill: text-fill,
    area-text-fill: text-fill,
    area-heading-2-fill: text-fill,
    outline-level-4-fill: text-fill,
    outline-level-5-fill: text-fill,

    par-fill: fourth,
    subpar-fill: fourth,
    sidebar-edge-fill: fourth,

    headers-level-1-fill: primary,
    headers-level-2-fill: primary,
    headers-level-3-fill: primary,
    headers-level-4-fill: primary,
    headers-level-5-fill: primary,
    outline-level-1-fill: primary,
    outline-level-2-fill: primary,
    outline-level-3-fill: primary,
    feat-heading-1-fill: primary,
    feat-heading-2-fill: primary,
    item-heading-1-fill: primary,
    area-heading-1-fill: primary,
    readaloud-edges-fill: primary,
    spell-title-fill: primary,
    monster-title-fill: primary,

    table-cell-fill: secondary,
    commentbox-fill: secondary,
    sidebar-background-fill: secondary,

    feat-line-fill: tertiary,
    area-line-fill: tertiary,
    headers-level-4-line-fill: tertiary,
    outline-line-fill: tertiary,
    footer-fill: tertiary,
    readaloud-background-fill: readaloud-background,
    monster-bar-fill: monster-background,
    monster-ribbon-fill: monster-ribbon,
    monster-background-fill: monster-background,
  )
}

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
// PRE-BUILT STYLES :)

// Pre-Defined config inspired by Tomb of Annihilation
/// 23-11-25 | Don't use it, it's not ready yet!
#let toa-config(lang: "en") = (
  default-config(
    background: image("/assets/paper/toa.jpg"),
    lang: lang,
    // show-part: false,
    // show-chapter: false,
    // using-parts: false,
    table-cell-fill: rgb("d5d9cf"),
    commentbox-fill: rgb("d5d9cf"),
    readaloud-background-fill: rgb("dbdcd6"),
    readaloud-edges-fill: rgb("565d59"),
    readaloud-transparentize-fill: 30%,
    sidebar-background-fill: rgb("dbdec8"),
    footer-fill: colors.titlered,
    footer-chapter-dx: 3%,
    footer-chapter-dy: 80%,
    footer-image-left: image("../assets/footer/toa/l.svg"),
    footer-image-right: image("../assets/footer/toa/r.svg"),
    footer-number-dx: -14.3%,
    footer-number-dy: 77%,
    headers-level-2-style: smallcaps,
    outline-level-1-style: none,
    outline-level-1-size: font-size.normalsize,
    outline-level-1-weight: font-weight.bold,
    outline-level-2-style: none,
    outline-level-2-size: font-size.normalsize,
    outline-level-2-weight: font-weight.bold,
    outline-level-3-size: 10pt,
    outline-level-3-weight: "bold",
  )
)
