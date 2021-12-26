SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .0165
InterMultX = 4.4
InterMultY = 3.1
X = 300: Y = 10
Min = 6
Max = 81
Q = 2
10 FOR Corner = Min TO Max STEP Q
RingMover = RingMover + Stepper
X = X + InterMultX * COS(RingMover)
Y = Y + InterMultY * SIN(RingMover)
EndX = X + Corner: EndY = Y + Corner
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
NEXT
FOR Corner = Max TO Min STEP -Q
RingMover = RingMover + Stepper
X = X + InterMultX * COS(RingMover)
Y = Y + InterMultY * SIN(RingMover)
EndX = X + Corner: EndY = Y + Corner
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
NEXT
20 A$ = INKEY$:
IF A$ = " " THEN GOTO 10 ELSE GOTO 20

