SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .043
InterMultX = 3
InterMultY = 3.3
BoxMult = .11
X1 = -20
Y1 = 190
Y2 = 260
10 RingMover = RingMover + Stepper
X1 = X1 + InterMultX * ABS(COS(RingMover))
X2 = X1 * .94
Y1 = Y1 + InterMultY * SIN(RingMover)
Y2 = Y2 - InterMultY * SIN(RingMover)
EndX = X1 + Y1 * BoxMult
EndY1 = Y1 + Y1 * BoxMult
EndY2 = Y2 + Y2 * BoxMult
LINE (X1, Y1)-(EndX, EndY1), 0, BF
LINE (X1, Y1)-(EndX, EndY1), 15, B
LINE (X2, Y2)-(EndX, EndY2), 0, BF
LINE (X2, Y2)-(EndX, EndY2), 15, B
GOTO 10






