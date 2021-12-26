SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .043
InterMultX = 3
InterMultY = 3.3
X1 = -30
Y1 = 190
Y2 = 260
10 RingMover = RingMover + Stepper
X1 = X1 + InterMultX * ABS(COS(RingMover))
X2 = X1 - InterMultX * COS(RingMover)
Y1 = Y1 + InterMultY * SIN(RingMover)
Y2 = Y2 - InterMultY * SIN(RingMover)
AddX = ABS(X1 * (639 - X1)) / 9
AddY = ABS(Y1 * (479 - Y1)) / 9
EndX1 = X1 + AddX
EndY1 = Y1 + AddY
EndX2 = X2 + AddX
EndY2 = Y2 + AddY
LINE (X1, Y1)-(EndX1, EndY1), 0, BF
LINE (X1, Y1)-(EndX1, EndY1), 15, B
LINE (X2, Y2)-(EndX2, EndY2), 0, BF
LINE (X2, Y2)-(EndX2, EndY2), 15, B
20 IF X < 700 THEN GOTO 10 ELSE GOTO 20






