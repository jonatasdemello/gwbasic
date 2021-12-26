SCREEN 12: DEFSNG A-Z
RingMover = 0 'Circles around ring
Stepper = .019 'Size of interval
InterMult = 3.35 'Adds space between boxes
X = 300: Y = 20
Min = 2
Max = 99
Band = Max
10 FOR Corner = Min TO Max
RingMover = RingMover + Stepper
X = X + InterMult * COS(RingMover)
Y = Y + InterMult * SIN(RingMover)
EndX = X + Corner: EndY = Y + Corner
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
NEXT
FOR A = 1 TO Band
RingMover = RingMover + Stepper
X = X + InterMult * COS(RingMover)
Y = Y + InterMult * SIN(RingMover)
IF A / 2 = INT(A / 2) THEN EndX = X + A: EndY = Y + A ELSE EndX = X + (Max - A): EndY = Y + (Max - A)
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
NEXT
FOR Corner = Max TO Min STEP -1
RingMover = RingMover + Stepper
X = X + InterMult * COS(RingMover)
Y = Y + InterMult * SIN(RingMover)
EndX = X + Corner: EndY = Y + Corner
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
NEXT
20 A$ = INKEY$:
IF A$ = "1" THEN GOTO 10 ELSE GOTO 20

