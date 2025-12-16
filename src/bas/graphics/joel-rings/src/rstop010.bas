SCREEN 12: DEFSNG A-Z
RingMover = 4.71 'Circles around ring
Stepper = .01606 'Size of interval
InterMult = 2.6 'Adds space between boxes
X = 320: Y = 200
Min = 4
Max = 101
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

