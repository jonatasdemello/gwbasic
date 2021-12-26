SCREEN 12: DEFSNG A-Z
RingMover = 5 'Circles around ring
Stepper = .03 'Size of interval
InterMult = 3 'Adds space between boxes
X = 320: Y = 240
Min = 5
Max = 56
10 FOR Corner = Min TO Max
RingMover = RingMover + Stepper
X = X + InterMult * COS(2 * RingMover)
Y = Y + InterMult * SIN(RingMover)
EndX = X + Corner: EndY = Y + Corner
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
NEXT
FOR Corner = Max TO Min STEP -1
RingMover = RingMover + Stepper
X = X + InterMult * COS(2 * RingMover)
Y = Y + InterMult * SIN(RingMover)
EndX = X + Corner: EndY = Y + Corner
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
NEXT
20 A$ = INKEY$:
IF A$ = "1" THEN GOTO 10 ELSE GOTO 20

