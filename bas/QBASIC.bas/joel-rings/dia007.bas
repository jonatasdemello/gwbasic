SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .03
InterMultX = 6
InterMultY = 4.5
BoxMult = .2
XA = 300: YA = 9
10 RingMover = RingMover + Stepper
XA = XA + InterMultX * COS(RingMover)
YA = YA + InterMultY * SIN(RingMover)
Q = YA * BoxMult
X1 = XA - Q: Y1 = YA - Q
X2 = XA + Q: Y2 = YA + Q
FOR XV = X1 TO X2 STEP 1
LINE (XA, Y1)-(XV, YA), 0
LINE (XA, Y2)-(XV, YA), 0
NEXT
LINE (XA, Y1)-(X2, YA), 15
LINE (X2, YA)-(XA, Y2), 15
LINE (XA, Y2)-(X1, YA), 15
LINE (X1, YA)-(XA, Y1), 15
XB = (XA + 320) / 2: X3 = (X1 + 320) / 2: X4 = (X2 + 320) / 2
YB = (YA + 240) / 2: Y3 = (Y1 + 240) / 2: Y4 = (Y2 + 240) / 2
XB = (XB + XA) / 2: X3 = (X3 + X1) / 2: X4 = (X4 + X2) / 2
YB = (YB + YA) / 2: Y3 = (Y3 + Y1) / 2: Y4 = (Y4 + Y2) / 2
XB = (XB + XA) / 2: X3 = (X3 + X1) / 2: X4 = (X4 + X2) / 2
YB = 479 - (YB + YA) / 2: Y3 = 479 - (Y3 + Y1) / 2: Y4 = 479 - (Y4 + Y2) / 2
FOR XV = X3 TO X4 STEP 1
LINE (XB, Y3)-(XV, YB), 0
LINE (XB, Y4)-(XV, YB), 0
NEXT
LINE (XB, Y3)-(X4, YB), 15
LINE (X4, YB)-(XB, Y4), 15
LINE (XB, Y4)-(X3, YB), 15
LINE (X3, YB)-(XB, Y3), 15
20 A$ = INKEY$: IF A$ = " " XOR YA < 10 THEN GOTO 20
GOTO 10

