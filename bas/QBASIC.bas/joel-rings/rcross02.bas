SCREEN 11: DEFSNG A-Z
RingMover = 0 'Circles around ring
Stepper = .016 'Size of interval
DX = 4.5: DY = 3 'Expands size of total figure
X1 = 320: Y1 = 5
10 RingMover = RingMover + Stepper
X1 = X1 + DX * COS(RingMover)
Y1 = Y1 + DY * SIN(RingMover)
V1 = (Y1 - 10) / 4: H1 = V1
V2 = V1 * .4: H2 = V2
V3 = V1 * .2: H3 = V3
X2 = X1 + H3: X3 = X1 - H2: X4 = X3 + H1
Y2 = Y1 + V1: Y3 = Y1 + V2: Y4 = Y3 + V3
LINE (X1, Y1)-(X2, Y2), 0, BF
LINE (X1, Y1)-(X2, Y2), 1, B
LINE (X3, Y3)-(X4, Y4), 0, BF
LINE (X3, Y3)-(X4, Y4), 1, B
GOTO 10






