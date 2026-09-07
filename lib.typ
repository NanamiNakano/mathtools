#import "@preview/frame-it:2.0.0": *
#import "@preview/pigmentpedia:0.3.3": *
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4"
#import "@preview/equate:0.3.3": *

#let (theorem, def, claim) = frames(
  theorem: ("Theorem", pantone.c._707),
  def: ("Definition", pantone.c._530),
  claim: ("Claim", pantone.c._304),
)

#let proof(body) = [
  *Proof.* #body #h(1fr) $square.filled$
]

#let claim-proof(body) = [
  *Proof of Claim.* #body #h(1fr) $square$
]

#let note(body) = {
  show ref: it => {
    if it.element != none and inspect.is-frame(it.element) {
      link(it.element.location(), underline(inspect.lookup-frame-info(it.element).title))
    } else {
      it
    }
  }

  show: frame-style(styles.boxy)

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
  show: frame-style(styles.hint)
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
