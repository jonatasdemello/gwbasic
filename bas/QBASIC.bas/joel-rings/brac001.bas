SCREEN 12: DEFSNG A-Z
'LINE (0, 0)-(639, 479), 12, B
RingMover = 0
Stepper = .007
InterMultX = 2.1
InterMultY = 4.4
BoxMult = .1
X = 305: Y = 8
10 RingMover = RingMover + Stepper
X = X + InterMultX * COS(RingMover)
Y = Y + InterMultY * SIN(3 * RingMover)
Q = Y * BoxMult
EndX = X + Q: EndY = Y + Q
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
IF Y > 20 THEN GOTO 10
20 A$ = INKEY$
IF A$ = " " THEN GOTO 10 ELSE GOTO 20

