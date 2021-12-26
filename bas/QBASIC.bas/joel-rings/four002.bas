SCREEN 12: DEFSNG A-Z
M = 0
S = .023
X1 = 230
Ystart = 5
Y1 = Ystart
XA = 4.8
YA = 2.6
10 M = M + S
X1 = X1 + XA * COS(M)
Y1 = Y1 + YA * SIN(M)
B = ABS(Y1 - Ystart) * 1.2
X2 = X1 + B / 9
Y2 = Y1 + B / 5
LINE (X1, Y1)-(X2, Y2), 0, BF
LINE (X1, Y1)-(X2, Y2), 15, B
X3 = X2 + B / 4
Y3 = Y2 + B / 8
LINE (X2, Y2)-(X3, Y3), 0, BF
LINE (X2, Y2)-(X3, Y3), 15, B
X4 = X3 + B / 7
Y4 = Y3 + B / 3
LINE (X3, Y3)-(X4, Y4), 0, BF
LINE (X3, Y3)-(X4, Y4), 15, B
X5 = X4 + B / 2
Y5 = Y4 + B / 6
LINE (X4, Y4)-(X5, Y5), 0, BF
LINE (X4, Y4)-(X5, Y5), 15, B
GOTO 10

