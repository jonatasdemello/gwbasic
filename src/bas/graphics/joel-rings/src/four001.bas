SCREEN 12: DEFSNG A-Z
M = 0
S = .0225
X1 = 250
Ystart = 5
Y1 = Ystart
XA = 4.8
YA = 2.6
10 M = M + S
X1 = X1 + XA * COS(M)
Y1 = Y1 + YA * SIN(M)
B = ABS(Y1 - Ystart) / 4
X2 = X1 + B
Y2 = Y1 + B
LINE (X1, Y1)-(X2, Y2), 0, BF
LINE (X1, Y1)-(X2, Y2), 15, B
X3 = X2 + B
Y3 = Y2 + B
LINE (X2, Y2)-(X3, Y3), 0, BF
LINE (X2, Y2)-(X3, Y3), 15, B
X4 = X3 + B
Y4 = Y3 + B
LINE (X3, Y3)-(X4, Y4), 0, BF
LINE (X3, Y3)-(X4, Y4), 15, B
X5 = X4 + B
Y5 = Y4 + B
LINE (X4, Y4)-(X5, Y5), 0, BF
LINE (X4, Y4)-(X5, Y5), 15, B
20 A$ = INKEY$
IF A$ = " " OR Y1 > 10 THEN GOTO 10 ELSE GOTO 20

