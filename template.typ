#let project(
  title: "",
  subtitle: none,
  authors: (),
  affiliation: none,
  year: none,
  class: none,
  other: none,
  date: datetime.today().display(),
  logo: image("logo.png") ,
  main-color: "9b3d37",
  alpha: 60%,
  color-words: (),
  body,
) = {
  set document(author: authors, title: title)
  set text(font: ("New Computer Modern", "Noto Serif CJK SC"), lang: "zh")
  // Save heading and body font families in variables.
  let body-font = ("New Computer Modern", "Noto Serif CJK SC")
  let title-font = ("New Computer Modern", "Noto Serif CJK SC")

  // Set colors
  let primary-color = rgb(main-color) // alpha = 100%
  // change alpha of primary color
  let secondary-color = color.mix(color.rgb(100%, 100%, 100%, alpha), primary-color, space:rgb)

  // highlight important words
  show regex(if color-words.len() == 0 { "$ " } else { color-words.join("|") }): text.with(fill: primary-color)

  //customize look of figure
  set figure.caption(separator: [ --- ], position: bottom)

  //customize inline raw code
  show raw.where(block: false) : it => h(0.5em) + box(fill: primary-color.lighten(90%), outset: 0.2em, it) + h(0.5em)

  // Set body font family.
  set text(font: body-font, 12pt)
  show heading: set text(font: title-font, fill: primary-color)

  // heading numbering
  set heading(numbering: (..nums) => {
    let level = nums.pos().len()
    // only level 1 and 2 are numbered
    let pattern = if level == 1 {
      "I."
    } else if level == 2 {
      "I.1."
    }
    if pattern != none {
      numbering(pattern, ..nums)
    }
  })

  // add space for heading
  show heading.where(level:1): it => it + v(0.5em)
 
  // Set link style
  show link: it => underline(text(fill: primary-color, it))

  //numbered list colored
  set enum(indent: 1em, numbering: n => [#text(fill: primary-color, numbering("1.", n))])

  //unordered list colored
  set list(indent: 1em, marker: n => [#text(fill: primary-color, "•")])


  // display of outline entries
  show outline.entry: it => text(size: 12pt, weight: "regular",it)

  // Title page.
  // Logo at top right if given
  if logo != none {
    set image(width: 6cm)
    place(top + right, logo)
  }
  // decorations at top left
  place(top + left, dx: -35%, dy: -28%, circle(radius: 150pt, fill: primary-color))
  place(top + left, dx: -10%, circle(radius: 75pt, fill: secondary-color))
  
  // decorations at bottom right
  place(bottom + right, dx: 40%, dy: 30%, circle(radius: 150pt, fill: secondary-color))

  
  v(2fr)

  align(center, text(font: title-font, 3em, weight: 700, title))
  v(2em, weak: true)
  if subtitle != none {
  align(center, text(font: title-font, 2em, weight: 700, subtitle))
  v(2em, weak: true)
  }
  align(center, text(1.1em, date))

  v(2fr)

  // Author and other information.
  align(center)[
      #if authors != "" {
        grid(
          columns: (3fr,) * calc.min(3, authors.len()),
          // gutter: 1em,
          ..authors.map(author => align(center, strong(author))),
        );linebreak();
      }
      #if affiliation != none {affiliation; linebreak();}
      #if year != none {year; linebreak();}
      #if class != none {emph(class); linebreak();}
      #if other != none {emph(other.join(linebreak())); linebreak();}
    ]

  pagebreak()


  // Table of contents.
  set page(
    numbering: "1 / 1", 
    number-align: center, 
    )

  // Main body.
  set page(
    header: [#emph()[#title #h(1fr) ]]
  )
  set par(justify: true)

  
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
  )
  show link: underline
  
  set heading(numbering: "1.")
  
  show table.cell.where(y: 0): strong
  set table(
    stroke: (x, y) => if y == 0 {
      (none)
    },
    align: (x, y) => (
      if x > 0 { center }
      else { left }
    )
  )

  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }
  
  body

}

//useful functions
//set block-quote
#let blockquote = rect.with(stroke: (left: 2.5pt + luma(170)), inset: (left: 1em))

// use primary-color and secondary-color in main
#let primary-color = rgb("E94845")
#let secondary-color = rgb(255, 80, 69, 60%)
