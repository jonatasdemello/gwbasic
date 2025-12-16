SCREEN 12: DEFSNG A-Z
RingMover = 0 'Circles around ring
Stepper = .0151 'Size of interval
InterMultX = 4.1
InterMultY = 3.1
X = 320: Y = 30
Min = 5
Max = 56
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

