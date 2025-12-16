SCREEN 12: DEFDBL A-Z
RingMover1 = 0
RingMover2 = 1
Stepper1 = .016
Stepper2 = .0171
MultX1 = 3.6
MultY1 = 3
MultX2 = 3.6
MultY2 = 3
BoxMult1 = .15
BoxMult2 = .19
VX1 = 1: VX2 = 2
VY1 = 1: VY2 = 1
X1 = 300: Y1 = 20
X2 = 430: Y2 = 95
10 A$ = INKEY$
IF A$ = "1" THEN GOSUB 20
IF A$ = "2" THEN GOSUB 30
GOTO 10
20 RingMover1 = RingMover1 + Stepper1
X1 = X1 + MultX1 * COS(VX1 * RingMover1)
Y1 = Y1 + MultY1 * SIN(VY1 * RingMover1)
D1 = Y1 * BoxMult1
EndX1 = X1 + D1: EndY1 = Y1 + D1
LINE (X1, Y1)-(EndX1, EndY1), 0, BF
LINE (X1, Y1)-(EndX1, EndY1), 15, B
RETURN
GOTO 10
30 RingMover2 = RingMover2 + Stepper2
X2 = X2 + MultX2 * COS(VX2 * RingMover2)
Y2 = Y2 + MultY2 * SIN(VY2 * RingMover2)
D2 = Y2 * BoxMult2
EndX2 = X2 + D2: EndY2 = Y2 + D2
LINE (X2, Y2)-(EndX2, EndY2), 0, BF
LINE (X2, Y2)-(EndX2, EndY2), 15, B
RETURN

