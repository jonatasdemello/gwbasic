SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .016
InterMultX = 3.3
InterMultY = 3
BoxMult = .2
X = 320: Y = 8
10 RingMover = RingMover + Stepper
X = X + InterMultX * COS(RingMover)
Y = Y + InterMultY * SIN(RingMover)
Q = Y * BoxMult
EndX = X + Q: EndY = Y + Q
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
IF Y > 20 THEN GOTO 10
20 A$ = INKEY$
IF A$ = " " THEN GOTO 10 ELSE GOTO 20

