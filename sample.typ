#import "lib.typ": *
#show: note

= Notes

#theorem[Sample Theorem][
  Content
] <sample-theorem>
#definition[Sample Definition][
  Content
]
#claim[Sample Claim][
  Content
] <sample-claim>
#corollary[Sample Corollary][
  Content
]

See @sample-theorem, also referenced by name as @sample-theorem[!].

#proof[
  #lorem(14)
]

#proof[
  #lorem(20)

  #proof[of an auxiliary claim][
    #lorem(12)
  ]

  The claim completes the proof.
]

#proof[of @sample-claim][
  #lorem(12)
]

#proof(supplement: "Disproof")[
  #lorem(12)
]

#show: hw()

= Homework

#theorem[Sample Theorem][
  Content
]
#definition[Sample Definition][
  Content
]
#claim[Sample Claim][
  Content
]
#corollary[Sample Corollary][
  Content
]

#proof[
  #proof[of an auxiliary claim][
    $ x y = y x. #qedhere $
  ]

  A proof ending in a displayed equation:
  $ (x + y)^2 = x^2 + 2 x y + y^2. #qedhere $
]

#problem(1)[
  #lorem(30)
] <problem-1>

#problem("6.7")[
  #lorem(30)
]
