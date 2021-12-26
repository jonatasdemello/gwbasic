SCREEN 11: DEFSNG A-Z
RingMover = 0 'Circles around ring
Stepper = .016 'Size of interval
InterMult1 = 3
InterMult2 = 3.1
BoxMult1 = .2
BoxMult2 = .1
BoxAdj1 = 2
BoxAdj2 = 1.8
X1 = 200: Y1 = 8
X2 = 400: Y2 = 12
10 RingMover = RingMover + Stepper
X1 = X1 + InterMult1 * COS(RingMover)
Y1 = Y1 + InterMult1 * SIN(RingMover)
EndX1 = X1 + Y1 * BoxMult1 - BoxAdj1
EndY1 = Y1 + Y1 * BoxMult1 - BoxAdj1
LINE (X1, Y1)-(EndX1, EndY1), 0, BF
LINE (X1, Y1)-(EndX1, EndY1), 1, B
X2 = X2 - InterMult2 * COS(RingMover)
Y2 = Y2 + InterMult2 * SIN(RingMover)
EndX2 = X2 + Y2 * BoxMult2 - BoxAdj2
EndY2 = Y2 + Y2 * BoxMult2 - BoxAdj2
LINE (X2, Y2)-(EndX2, EndY2), 0, BF
LINE (X2, Y2)-(EndX2, EndY2), 1, B
GOTO 10






