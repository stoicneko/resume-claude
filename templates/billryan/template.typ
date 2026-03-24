// Billryan-style resume template for Typst
// Adapted from gvariable/billryan-typst, stripped to pure-text style
// Original: https://github.com/billryan/resume

#let bounding_box_height = 1.1em
#let icon_path = "assets/"
#let latin_font = ("IBM Plex Serif", "Times New Roman")
#let cjk_font = "Noto Sans CJK SC"
#let font_size = 10pt

// Render an SVG icon inline
#let icon(name, shift: 1.5pt, height: bounding_box_height) = {
  box(
    baseline: shift,
    height: height,
    image(icon_path + name),
  )
  h(3pt)
}

// Calendar icon + date string
#let date(period) = {
  icon("calendar.svg")
  period
}

// Location pin icon + location string
#let loc-icon(loc) = {
  icon("location.svg")
  loc
}

// Right-aligned date + location block (used in entries)
#let term(period, loc) = {
  box(width: 1fr)[
    #align(right)[
      #date(period)
      #h(1em)
      #loc-icon(loc)
    ]
  ]
}

// Main document configuration
// name: display name string
// info: array of (icon_name, text, link_or_none) tuples for contact bar
// lang: "en" or "zh"
// body: document content
#let conf(name: "", info: (), lang: "en", body: []) = {
  let fonts = if lang == "zh" {
    (cjk_font,) + latin_font
  } else {
    latin_font
  }

  set text(font: fonts, size: font_size, lang: lang)
  set page(
    paper: "a4",
    margin: (x: 5em, y: 3em),
  )
  set align(left + top)
  set list(indent: 4pt)
  set par(justify: true)

  // Section headings: bold italic + horizontal rule
  show heading.where(level: 2): it => block[
    #set text(font: fonts, weight: "bold", size: font_size + 2pt)
    #set align(left)
    #emph(it.body)
    #v(-10pt)
    #line(length: 100%)
  ]

  // Subtle link styling
  show link: it => {
    underline(it)
  }

  // Header: centered name
  align(center)[
    #text(size: 20pt, weight: "bold")[#name]
  ]

  v(4pt)

  // Contact info bar: icons + text, centered, separated by pipes
  if info.len() > 0 {
    let items = info.map(item => {
      let (icon_name, display, url) = item
      icon(icon_name)
      if url != none and url != "" {
        link(url)[#display]
      } else {
        display
      }
    })
    align(center)[
      #text(size: 9pt)[
        #items.join([ | ])
      ]
    ]
  }

  v(6pt)

  body
}
