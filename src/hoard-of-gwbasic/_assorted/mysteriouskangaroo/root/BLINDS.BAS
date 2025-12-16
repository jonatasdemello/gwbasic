SCREEN 13
A = 1: B = A
D = 1
A:
LINE (0, A)-(655, A), D
A = A + 10
IF A = 340 THEN D = D + 1: GOTO Backwards
IF A > 349 THEN A = B: B = B + 1
GOTO A

Backwards:
A = A + 10: B = A: C = 0
B:
LINE (0, A)-(655, A), D
A = A - 10: C = C - 1
IF A < 0 THEN A = B: B = B - 1
IF C = -420 THEN A = 1: B = A: D = D + D: GOTO A
GOTO B

