SCREEN 12: DEFDBL A-Z
RingMover = 0 'Circles around ring
Stepper = .01705 'Size of interval
InterMultX = 4.4
InterMultY = 3.25
X = 330: Y = 60
Min = 3
Max = 48
Q = 2
10 FOR Corner = Min TO Max STEP Q
RingMover = RingMover + Stepper
X = X + InterMultX * COS(RingMover)
Y = Y + InterMultY * SIN(RingMover)
StartX = X - Corner: StartY = Y - Corner
EndX = X + Corner: EndY = Y + Corner
LINE (StartX, StartY)-(EndX, EndY), 0, BF
LINE (StartX, StartY)-(EndX, EndY), 15, B
NEXT
FOR Corner = Max TO Min STEP -Q
RingMover = RingMover + Stepper
X = X + InterMultX * COS(RingMover)
Y = Y + InterMultY * SIN(RingMover)
StartX = X - Corner: StartY = Y - Corner
EndX = X + Corner: EndY = Y + Corner
LINE (StartX, StartY)-(EndX, EndY), 0, BF
LINE (StartX, StartY)-(EndX, EndY), 15, B
NEXT
20 A$ = INKEY$:
IF A$ = "1" THEN GOTO 10 ELSE GOTO 20

