SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .021
InterMultX = 3.1
InterMultY = 3.1
BoxMultX1 = .01
BoxMultY1 = .2
BoxMultX2 = 1.1
BoxMultY2 = .05
X = 250: Y = 3
10 RingMover = RingMover + Stepper
X = X + InterMultX * COS(RingMover)
Y = Y + InterMultY * SIN(RingMover)
StartX1 = X - Y * BoxMultX1: StartY1 = Y - Y * BoxMultY1
EndX1 = X + Y * BoxMultX2: EndY1 = Y + Y * BoxMultY2
LINE (StartX1, StartY1)-(EndX1, EndY1), 0, BF
LINE (StartX1, StartY1)-(EndX1, EndY1), 15, B
StartX2 = 639 - StartX1: StartY2 = 479 - StartY1
EndX2 = 639 - EndX1: EndY2 = 479 - EndY1
LINE (StartX2, StartY2)-(EndX2, EndY2), 0, BF
LINE (StartX2, StartY2)-(EndX2, EndY2), 15, B
20 A$ = INKEY$: IF Y > 6 OR A$ = " " THEN GOTO 10 ELSE GOTO 20

