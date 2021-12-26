SCREEN 11: DEFSNG A-Z
M = 0
S = .02
X1 = 420
Ystart = 3
Y1 = Ystart
XA = 3
YA = 3
10 M = M + S
X1 = X1 + XA * COS(M)
Y1 = Y1 + YA * SIN(M)
B = ABS(Y1 - Ystart) / 3
X2 = X1 + B
Y2 = Y1 + B
LINE (X1, Y1)-(X2, Y2), 0, BF
LINE (X1, Y1)-(X2, Y2), 1, B
X3 = X1 - 70
Y3 = Y1 + 140
X4 = X3 - B
Y4 = Y3 - B
LINE (X3, Y3)-(X4, Y4), 0, BF
LINE (X3, Y3)-(X4, Y4), 1, B
GOTO 10

