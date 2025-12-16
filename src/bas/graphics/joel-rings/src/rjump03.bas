SCREEN 11: DEFDBL A-Z
RingMover = 0
Stepper = .018
InterMultX = 3.08
InterMultY = 3.5
BoxMult = .2
V1 = 1: V2 = .33333333#
Q = 1
X = 290: Y = 6
10 RingMover = RingMover + Stepper
Q = -Q: IF Q = 1 THEN V = V1 ELSE V = V2
X = X + InterMultX * COS(V * RingMover)
Y = Y + InterMultY * SIN(RingMover)
EndX = X + Y * BoxMult: EndY = Y + Y * BoxMult
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 1, B
GOTO 10

