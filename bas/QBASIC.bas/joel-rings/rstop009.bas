SCREEN 12: DEFDBL A-Z
RingMover = 0 'Circles around ring
Stepper = .00871 'Size of interval
D = 1
E = 20
InterMultX = 2.5
InterMultY = 1.7
XV = 310: YV = 45
Min = 3
Max = E + 5.1
Q = .5
10 FOR Corner = Min TO Max STEP Q
RingMover = RingMover + Stepper
XV = XV + InterMultX * COS(RingMover)
YV = YV + InterMultY * SIN(RingMover)
D = -D
IF D > 0 THEN X = XV: Y = YV ELSE X = XV + E: Y = YV + E
StartX = X - Corner: StartY = Y - Corner
EndX = X + Corner: EndY = Y + Corner
LINE (StartX, StartY)-(EndX, EndY), 0, BF
LINE (StartX, StartY)-(EndX, EndY), 15, B
NEXT
FOR Corner = Max TO Min STEP -Q
RingMover = RingMover + Stepper
XV = XV + InterMultX * COS(RingMover)
YV = YV + InterMultY * SIN(RingMover)
D = -D
IF D > 0 THEN X = XV: Y = YV ELSE X = XV + E: Y = YV + E
StartX = X - Corner: StartY = Y - Corner
EndX = X + Corner: EndY = Y + Corner
LINE (StartX, StartY)-(EndX, EndY), 0, BF
LINE (StartX, StartY)-(EndX, EndY), 15, B
NEXT
20 A$ = INKEY$:
IF A$ = "1" THEN GOTO 10 ELSE GOTO 20

