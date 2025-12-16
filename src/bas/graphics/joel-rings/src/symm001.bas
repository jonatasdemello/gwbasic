SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .023
InterMultX = 4.2
InterMultY = 3.3
BoxMultX1 = .7
BoxMultY1 = .19
BoxMultX2 = BoxMultX1
BoxMultY2 = BoxMultY1
X = 320: Y = 4
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
20 A$ = INKEY$
IF A$ = " " OR Y > 10 THEN GOTO 10 ELSE 20

