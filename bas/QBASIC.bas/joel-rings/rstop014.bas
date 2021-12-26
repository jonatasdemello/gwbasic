SCREEN 12: DEFSNG A-Z
RingMover = 0 'Circles around ring
Stepper = .06 'Size of interval
InterMultX = 3.5
InterMultY = 5
X = 10: Y = 150
Min = 2
Max = 39
Q = .55
10 FOR Corner = Min TO Max STEP Q
RingMover = RingMover + Stepper
X = X + InterMultX * ABS(COS(2 * RingMover))
Y = Y + InterMultY * SIN(RingMover)
StartX = X - Corner: StartY = Y - Corner
EndX = X + Corner: EndY = Y + Corner
LINE (StartX, StartY)-(EndX, EndY), 0, BF
LINE (StartX, StartY)-(EndX, EndY), 15, B
NEXT
FOR Corner = Max TO Min STEP -Q
RingMover = RingMover + Stepper
X = X + InterMultX * ABS(COS(2 * RingMover))
Y = Y + InterMultY * SIN(RingMover)
StartX = X - Corner: StartY = Y - Corner
EndX = X + Corner: EndY = Y + Corner
LINE (StartX, StartY)-(EndX, EndY), 0, BF
LINE (StartX, StartY)-(EndX, EndY), 15, B
NEXT
20 A$ = INKEY$:
IF A$ = "1" THEN GOTO 10 ELSE GOTO 20

