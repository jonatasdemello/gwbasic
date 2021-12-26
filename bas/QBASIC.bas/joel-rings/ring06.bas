SCREEN 11: DEFSNG A-Z
RingMover1 = 1 'Circles around ring
RingMover2 = 6
Stepper = .02 'Size of interval
InterMult1 = 3.8
InterMult2 = 3.7
BoxMult1 = .2
BoxMult2 = .09
BoxAdj1 = 5
BoxAdj2 = 4
X1 = 420: Y1 = 100
X2 = 360: Y2 = 50
10 RingMover1 = RingMover1 + Stepper
X1 = X1 + InterMult1 * COS(RingMover1)
Y1 = Y1 + InterMult1 * SIN(RingMover1)
EndX1 = X1 + Y1 * BoxMult1 - BoxAdj1
EndY1 = Y1 + Y1 * BoxMult1 - BoxAdj1
LINE (X1, Y1)-(EndX1, EndY1), 0, BF
LINE (X1, Y1)-(EndX1, EndY1), 1, B
RingMover2 = RingMover2 + Stepper
X2 = X2 - InterMult2 * COS(RingMover2)
Y2 = Y2 + InterMult2 * SIN(RingMover2)
EndX2 = X2 + Y2 * BoxMult2 - BoxAdj2
EndY2 = Y2 + Y2 * BoxMult2 - BoxAdj2
LINE (X2, Y2)-(EndX2, EndY2), 0, BF
LINE (X2, Y2)-(EndX2, EndY2), 1, B
20 A$ = INKEY$
IF A$ = " " OR Y1 > 70 THEN GOTO 10 ELSE GOTO 20
GOTO 10

