SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .029
InterMultX = 3
InterMultY = 3.3
BoxMult = .11
X = -30
Y1 = 190
Y2 = 260
10 RingMover = RingMover + Stepper
X = X + InterMultX * ABS(COS(INT(2 * RingMover)))
Y1 = Y1 + InterMultY * SIN(INT(2 * RingMover))
Y2 = Y2 - InterMultY * SIN(INT(2 * RingMover))
EndX = X + Y1 * BoxMult
EndY1 = Y1 + Y1 * BoxMult
EndY2 = Y2 + Y2 * BoxMult
LINE (X, Y1)-(EndX, EndY1), 0, BF
LINE (X, Y1)-(EndX, EndY1), 15, B
LINE (X, Y2)-(EndX, EndY2), 0, BF
LINE (X, Y2)-(EndX, EndY2), 15, B
20 IF X < 700 THEN GOTO 10 ELSE GOTO 20

