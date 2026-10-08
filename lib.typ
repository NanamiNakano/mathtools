#import "@preview/ctheorems:2.0.0": *
#import "@preview/frame-it:2.0.0": styles
#import "@preview/pigmentpedia:0.3.3": *
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4"
#import "@preview/equate:0.3.3": *

#let _theorem-fmt(thm, accent: pantone.c._707) = [
  #metadata((thm: thm, accent: accent)) <mathtools-theorem>
]

#let thm = thm.with(fmt: _theorem-fmt)
#let theorem = thm.with(
  counter: "Theorem",
  base: none,
)
#let definition = theorem.with(
  supplement: "Definition",
  body-fmt: it => it,
  fmt: _theorem-fmt.with(accent: pantone.c._530),
)
#let claim = theorem.with(
  supplement: "Claim",
  title-fmt: emph,
  body-fmt: it => it,
  separator: [. ],
  fmt: _theorem-fmt.with(accent: pantone.c._304),
)
#let corollary = theorem.with(
  supplement: "Corollary",
  fmt: _theorem-fmt.with(accent: pantone.c._1345),
)

#let def = definition
#let cor = corollary

#let _qed-symbol = context {
  // ctheorems 2.0.0 keeps one entry per active proof in this state.
  if state("thm-qed-done", ()).get().len() > 1 {
    $square$
  } else {
    $square.filled$
  }
}

#let _note-theorem(thm, accent) = {
  let supplement = thm.supplement
  let number = thm.number
  if type(supplement) == content {
    number = [#supplement#if number != none [~#number]]
    supplement = ""
  }
  block(spacing: 1.2em, (styles.boxy)(
    thm.name,
    (),
    thm.body,
    supplement,
    number,
    accent,
  ))
}

#let note(body) = {
  show: thm-rules.with(qed-symbol: _qed-symbol)
  show <mathtools-theorem>: it => _note-theorem(it.value.thm, it.value.accent)

  body
}

#let problem(nr, body) = block(width: 100%)[
  #context [
    #metadata(measure([*#nr.*]).width) <hw-problem-nr-width>
  ]

  #place[*#nr.*]

  #block[#body] <hw-problem-body>
]

#let hw(numbering: "(a).") = document => {
  show: thm-rules.with(qed-symbol: _qed-symbol)
  show <mathtools-theorem>: it => thm-fmt-block(it.value.thm)
  set enum(numbering: numbering)

  context {
    let widths = query(<hw-problem-nr-width>).map(it => it.value)
    let max-width = calc.max(0pt, ..widths)
    let indent = (max-width + 1em).to-absolute()

    show <hw-problem-body>: it => pad(
      left: indent,
      it.body,
    )

    document
  }
}
