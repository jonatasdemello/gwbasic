SCREEN 12: DEFSNG A-Z
RingMover = 0 'Circles around ring
Stepper = .0208 'Size of interval
InterMultX = 5
InterMultY = 3
X = 290: Y = 20
Min = 4
Max = 154
Twist = 1
10 FOR Corner = Min TO Max
RingMover = RingMover + Stepper
X = X + InterMultX * COS(Twist * RingMover)
Y = Y + InterMultY * SIN(RingMover)
EndX = X + Corner: EndY = Y + Corner
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
NEXT
FOR Corner = Max TO Min STEP -1
RingMover = RingMover + Stepper
X = X + InterMultX * COS(Twist * RingMover)
Y = Y + InterMultY * SIN(RingMover)
EndX = X + Corner: EndY = Y + Corner
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
NEXT
20 A$ = INKEY$:
IF A$ = "1" THEN GOTO 10 ELSE GOTO 20

