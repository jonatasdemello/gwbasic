SCREEN 12: DEFSNG A-Z
M = 0
S = .026
X1 = 230
Ystart = 4
Y1 = Ystart
XA = 3
YA = 3
10 M = M + S
X1 = X1 + XA * COS(M)
Y1 = Y1 + YA * SIN(M)
B = ABS(Y1 - Ystart)
X2 = X1 + B
Y2 = Y1 + B
LINE (X1, Y1)-(X2, Y2), 0, BF
LINE (X1, Y1)-(X2, Y2), 15, B
GOTO 10

