SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .015
InterMultX = 4.5
InterMultY = 3.1
X = 170: Y = 10
Min = 6
Max = 45
Twist = 1
10 FOR Corner = Min TO Max
RingMover = RingMover + Stepper
X = X + InterMultX * COS(Twist * RingMover)
Y = Y + InterMultY * SIN(RingMover)
EndX = X + Corner: EndY = Y + Corner
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
X2 = 639 - X
EndX2 = X2 + Corner
LINE (X2, Y)-(EndX2, EndY), 0, BF
LINE (X2, Y)-(EndX2, EndY), 15, B
NEXT
FOR Corner = Max TO Min STEP -1
RingMover = RingMover + Stepper
X = X + InterMultX * COS(Twist * RingMover)
Y = Y + InterMultY * SIN(RingMover)
EndX = X + Corner: EndY = Y + Corner
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
X2 = 639 - X
EndX2 = X2 + Corner
LINE (X2, Y)-(EndX2, EndY), 0, BF
LINE (X2, Y)-(EndX2, EndY), 15, B
NEXT
20 A$ = INKEY$:
IF A$ = " " THEN GOTO 10 ELSE GOTO 20

