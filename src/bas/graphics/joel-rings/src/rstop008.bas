SCREEN 12: DEFSNG A-Z
RingMover = 0 'Circles around ring
Stepper = .01665 'Size of interval
D = 1
E = 29
InterMultX = 4.3
InterMultY = 3
XV = 310: YV = 50
Min = 3
Max = E
Q = 1
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

