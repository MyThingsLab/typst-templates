#import "@preview/touying:0.6.1": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")
#set text(font: "New Computer Modern", size: 20pt)

#let slide(title, body, notes: none) = [
  == #title
  #body
  #if notes != none and notes != "" [#speaker-note[#notes]]
]

// === body ===
#slide("Untitled Talk")[
  Replace this placeholder body with the drafted slide-by-slide content.
]
