SCREEN 11: DEFSNG A-Z
M = 4.712388
S = .021
Xstart = 300
X1 = Xstart
Y1 = 240
XA = 3.25
YA = 4.1
10 M = M + S
X1 = X1 + XA * COS(2 * M)
Y1 = Y1 + YA * SIN(M)
B = ABS(X1 - Xstart) / 2
X2 = X1 + B
Y2 = Y1 + B
LINE (X1, Y1)-(X2, Y2), 0, BF
LINE (X1, Y1)-(X2, Y2), 1, B
X3 = 639 - X1
Y3 = 479 - Y1
X4 = X3 - B
Y4 = Y3 - B
LINE (X3, Y3)-(X4, Y4), 0, BF
LINE (X3, Y3)-(X4, Y4), 1, B
GOTO 10

