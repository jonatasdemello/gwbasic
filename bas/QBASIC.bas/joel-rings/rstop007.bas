SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .0166
D = 1
InterMultX = 4.2
InterMultY = 3
XV = 330: YV = 60
Min = 3
Max = 55
Q = .54
10 FOR Corner = Min TO Max STEP Q
RingMover = RingMover + Stepper
XV = XV + InterMultX * COS(RingMover)
YV = YV + InterMultY * SIN(RingMover)
D = -D
IF D > 0 THEN X = XV: Y = YV ELSE X = 639 - XV: Y = 479 - YV
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
IF D > 0 THEN X = XV: Y = YV ELSE X = 639 - XV: Y = 479 - YV
StartX = X - Corner: StartY = Y - Corner
EndX = X + Corner: EndY = Y + Corner
LINE (StartX, StartY)-(EndX, EndY), 0, BF
LINE (StartX, StartY)-(EndX, EndY), 15, B
NEXT
20 A$ = INKEY$:
IF A$ = " " THEN GOTO 10 ELSE GOTO 20

