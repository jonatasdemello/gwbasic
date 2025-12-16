SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .016
InterMultX = 3
InterMultY = 3
BoxMult = .2
V1 = 2: V2 = 1
Q = 1
X = 320: Y = 8
10 RingMover = RingMover + Stepper
Q = -Q: IF Q = 1 THEN V = V1 ELSE V = V2
X = X + InterMultX * COS(V * RingMover)
Y = Y + InterMultY * SIN(RingMover)
EndX = X + Y * BoxMult: EndY = Y + Y * BoxMult
LINE (X, Y)-(EndX, EndY), 0, BF
LINE (X, Y)-(EndX, EndY), 15, B
GOTO 10






