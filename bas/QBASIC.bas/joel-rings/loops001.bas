SCREEN 12: DEFDBL A-Z
RingMover = 0
Stepper = .027
InterMultX = 3
InterMultY = 3.3
X1 = -45
X2 = -20
Y1 = 140
Y2 = 310
10 RingMover = RingMover + Stepper
X1 = X1 + InterMultX * ABS(COS(RingMover)) + .14
X2 = X2 + InterMultX * ABS(COS(RingMover))
Y1 = Y1 + InterMultY * SIN(RingMover)
Y2 = Y2 - InterMultY * SIN(RingMover)
AddOn1 = ABS(X1 * (639 - X1) * Y1 * (479 - Y1)) / 66789123
AddOn2 = ABS(X2 * (639 - X2) * Y2 * (479 - Y2)) / 75678912
EndX1 = X1 + AddOn1
EndY1 = Y1 + AddOn1
EndX2 = X2 + AddOn2
EndY2 = Y2 + AddOn2
LINE (X1, Y1)-(EndX1, EndY1), 0, BF
LINE (X1, Y1)-(EndX1, EndY1), 15, B
LINE (X2, Y2)-(EndX2, EndY2), 0, BF
LINE (X2, Y2)-(EndX2, EndY2), 15, B
20 IF X1 < 700 OR X2 < 700 THEN GOTO 10 ELSE GOTO 20

