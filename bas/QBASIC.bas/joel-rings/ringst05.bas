SCREEN 12: DEFSNG A-Z
M = 0
S = .023
X1 = 270
Ystart = 5
Y1 = Ystart
XA = 5
YA = 3.14
10 M = M + S
X1 = X1 + XA * COS(M)
Y1 = Y1 + YA * SIN(M)
B = ABS(Y1 - Ystart) / 3
X2 = X1 + B
Y2 = Y1 + B
LINE (X1, Y1)-(X2, Y2), 0, BF
LINE (X1, Y1)-(X2, Y2), 15, B
X3 = X1 + B
Y3 = Y1 + B
X4 = X3 + B
Y4 = Y3 + B
LINE (X3, Y3)-(X4, Y4), 0, BF
LINE (X3, Y3)-(X4, Y4), 15, B
GOTO 10

