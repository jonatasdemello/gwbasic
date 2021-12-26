SCREEN 11: DEFSNG A-Z
M = 0
S = .023
X = 325
Ystart = 25
Y = Ystart
XA = 5
YA = 3.14
10 M = M + S
X = X + XA * COS(M)
Y = Y + YA * SIN(M)
B = ABS(Y - Ystart) / 4
X1 = X - B
Y1 = Y - B
X2 = X1 - B
Y2 = Y1 - B
LINE (X1, Y1)-(X2, Y2), 0, BF
LINE (X1, Y1)-(X2, Y2), 1, B
X3 = X + B
Y3 = Y + B
X4 = X3 + B
Y4 = Y3 + B
LINE (X3, Y3)-(X4, Y4), 0, BF
LINE (X3, Y3)-(X4, Y4), 1, B
GOTO 10

