SCREEN 11: DEFSNG A-Z
RingMover = 0 'Circles around ring
Stepper = .0136
InterMultX = 3
InterMultY = 3
BoxMultX = .6
BoxMultY = .05
X = 240: Y = 6
10 RingMover = RingMover + Stepper
X = X + InterMultX * COS(RingMover)
Y = Y + InterMultY * SIN(RingMover)
EndX = X + Y * BoxMultX: EndY = Y + Y * BoxMultY
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 1, B
GOTO 10






