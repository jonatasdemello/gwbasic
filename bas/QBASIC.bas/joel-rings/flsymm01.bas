SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .0245
InterMultX = 3
InterMultY = 3
BoxMultX1 = .9
BoxMultY1 = .08
BoxMultX2 = .9
BoxMultY2 = .08
X = 320: Y = 6
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
20 A$ = INKEY$: IF Y > 10 OR A$ = " " THEN GOTO 10 ELSE GOTO 20


