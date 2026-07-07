# typst-templates

Shared [Typst](https://typst.app) style-anchor templates for MyThingsLab's
document/presentation tools ([MyTypster](../my-typster), [MyPresentation](../my-presentation)).

Not a `My[X]` tool itself — no code, no Engine call, no CI. Just the anchor
files each tool reads before drafting, plus the compile-gate the real `typst`
CLI runs against whatever a tool writes on top of one.

## Layout

`templates/<kind>.typ` — one anchor per document kind:

- `default.typ` — fallback when no kind can be inferred
- `report.typ`, `note.typ` — non-personal document kinds
- `letter.typ`, `resume.typ` — **personal** kinds; MyTypster routes any draft
  of these to the private `MyThingsLab/typst-personal-docs` repo, never here
- `presentation.typ` — slide deck anchor for MyPresentation

## Conventions a template must follow

- **Self-contained.** No `#import "@preview/..."` package dependencies —
  compilation must succeed with no network access, since CI and sandboxed
  agents may run with no egress. Layout is done with core Typst only (`set`/
  `show` rules, `align`, `line`, a hand-rolled `slide` function for decks).
- **One header/body split per file**, marked by a literal `// === body ===`
  comment line. Everything above the marker (document/page/text settings,
  any `#import`s) is the style anchor a tool must preserve; everything below
  is placeholder content a tool replaces. This is the fence a consuming
  tool's writer enforces: an Engine reply may only use imports already
  present above the marker, and a `NoopEngine` degrade keeps everything
  above the marker unchanged.
- Any new `<kind>.typ` added here must `typst compile` cleanly on its own
  before merging — that's the whole test for this repo.

## License

MIT — see [`LICENSE`](LICENSE).
