SCREEN 12: DEFSNG A-Z
M = 0
S = .018
X = 330
Ystart = 14
Y = Ystart
XA = 3
YA = 3
10 M = M + S
X = X + XA * COS(M)
Y = Y + YA * SIN(M)
B = ABS(Y - Ystart) / 3
X1 = X - B
Y1 = Y - B
X2 = X + B
Y2 = Y + B
LINE (X1, Y1)-(X2, Y2), 0, BF
LINE (X1, Y1)-(X2, Y2), 15, B
GOTO 10

