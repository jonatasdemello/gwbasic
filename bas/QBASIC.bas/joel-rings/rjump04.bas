SCREEN 11: DEFDBL A-Z
RingMover1 = 0
RingMover2 = 1
Stepper1 = .0131
Stepper2 = .016
MultX1 = 3.6
MultY1 = 3
MultX2 = 3.6
MultY2 = 3
BoxMult1 = .2
BoxMult2 = .19
VX1 = 1: VX2 = 2
VY1 = 1: VY2 = 1
X1 = 400: Y1 = 14
X2 = 430: Y2 = 95
Q = 1
10 RingMover1 = RingMover1 + Stepper1
Q = -Q
IF Q = 1 THEN VX = VX1: VY = VY1 ELSE VX = VX2: VY = VY2
X1 = X1 + MultX1 * COS(VX * RingMover1)
Y1 = Y1 + MultY1 * SIN(VY * RingMover1)
D1 = (479 - Y1) * BoxMult1
IF D1 > 1.5 THEN GOTO 30
20 A$ = INKEY$: IF A$ <> "1" THEN GOTO 20
30 EndX1 = X1 + D1: EndY1 = Y1 + D1
LINE (X1, Y1)-(EndX1, EndY1), 0, BF
LINE (X1, Y1)-(EndX1, EndY1), 1, B
RingMover2 = RingMover2 + Stepper2
Q = -Q
IF Q = 1 THEN VX = VX1: VY = VY1 ELSE VX = VX2: VY = VY2
X2 = X2 + MultX2 * COS(VX * RingMover2)
Y2 = Y2 + MultY2 * SIN(VY * RingMover2)
D2 = Y2 * BoxMult2
EndX2 = X2 + D2: EndY2 = Y2 + D2
LINE (X2, Y2)-(EndX2, EndY2), 0, BF
LINE (X2, Y2)-(EndX2, EndY2), 1, B
GOTO 10

