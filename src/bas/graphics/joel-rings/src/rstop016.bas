SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .017
InterMultX = 4.1
InterMultY = 3.1
X1 = -10: Y1 = 30
Min = 5
Max = 56
Twist = 1
10 FOR Corner = Min TO Max
RingMover = RingMover + Stepper
X1 = X1 + InterMultX * ABS(COS(Twist * RingMover))
Y1 = Y1 + InterMultY * SIN(RingMover)
X2 = X1 + Corner: Y2 = Y1 + Corner
LINE (X1, Y1)-(X2, Y2), 0, BF
LINE (X1, Y1)-(X2, Y2), 15, B
X3 = X2 + (Max - Corner)
Y3 = Y2 + (Max - Corner)
X4 = X3
Y4 = 479 - Y3
LINE (X3, Y3)-(X4, Y4), 0, BF
LINE (X3, Y3)-(X4, Y4), 15, B
NEXT
FOR Corner = Max TO Min STEP -1
RingMover = RingMover + Stepper
X1 = X1 + InterMultX * ABS(COS(Twist * RingMover))
Y1 = Y1 + InterMultY * SIN(RingMover)
X2 = X1 + Corner: Y2 = Y1 + Corner
LINE (X1, Y1)-(X2, Y2), 0, BF
LINE (X1, Y1)-(X2, Y2), 15, B
X3 = X2 + (Max - Corner)
Y3 = Y2 + (Max - Corner)
X4 = X3
Y4 = 479 - Y3
LINE (X3, Y3)-(X4, Y4), 0, BF
LINE (X3, Y3)-(X4, Y4), 15, B
NEXT
20 A$ = INKEY$:
IF A$ = "1" THEN GOTO 10 ELSE GOTO 20

