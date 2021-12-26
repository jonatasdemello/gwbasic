SCREEN 11: DEFSNG A-Z
M = 0
S = .012
X = 325
Ystart = 5
Y = Ystart
XA = 3
YA = 3.6
10 M = M + S
X = X + XA * COS(M)
Y = Y + YA * SIN(1.5 * M)
B = ABS(Y - Ystart) / 8
X1 = X - B
Y1 = Y - B
X2 = X + B
Y2 = Y + B
LINE (X1, Y1)-(X, Y), 0, BF
LINE (X1, Y1)-(X, Y), 1, B
LINE (X, Y)-(X2, Y2), 0, BF
LINE (X, Y)-(X2, Y2), 1, B
GOTO 10

