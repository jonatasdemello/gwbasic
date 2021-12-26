SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .04
InterMultX = 3
InterMultY = 3.3
X = -30
Y1 = 190
Y2 = 260
10 RingMover = RingMover + Stepper
X = X + InterMultX * ABS(COS(RingMover))
Y1 = Y1 + InterMultY * SIN(RingMover)
Y2 = Y2 - InterMultY * SIN(RingMover)
Size1 = ABS(Y1 - 240) / 2 + 6
Size2 = ABS(Y2 - 240) / 2 + 5
EndX = X + Size1
EndY1 = Y1 + Size1
EndY2 = Y2 + Size2
LINE (X, Y1)-(EndX, EndY1), 0, BF
LINE (X, Y1)-(EndX, EndY1), 15, B
LINE (X, Y2)-(EndX, EndY2), 0, BF
LINE (X, Y2)-(EndX, EndY2), 15, B
20 IF X < 700 THEN GOTO 10 ELSE GOTO 20

