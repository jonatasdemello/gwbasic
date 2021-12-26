SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .011
InterMult = 3
BoxMult = .2
X = 295: Y = 3
10 RingMover = RingMover + Stepper
X = X + InterMult * COS(RingMover)
Y = Y + InterMult * SIN(1.5 * RingMover)
EndX = X + Y * BoxMult: EndY = Y + Y * BoxMult + 1
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
GOTO 10






