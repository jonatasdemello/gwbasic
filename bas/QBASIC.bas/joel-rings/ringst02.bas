SCREEN 11: DEFSNG A-Z
M = 4.712388
S = .016
Xstart = 5
X1 = Xstart
Y1 = 180
XA = 3.25
YA = 2.25
10 M = M + S
X1 = X1 + XA * COS(M)
Y1 = Y1 + YA * SIN(M)
B = ABS(X1 - Xstart) / 2
X2 = X1 + B
Y2 = Y1 + B
LINE (X1, Y1)-(X2, Y2), 0, BF
LINE (X1, Y1)-(X2, Y2), 1, B
GOTO 10

