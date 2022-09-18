SCREEN 12
A = 639: B = 0: C = 0
GOTO B
A:
LINE (A - 1, 0)-(A - 1, 415), 0
LINE (A, 0)-(A, 415), C
A = A + 1
IF A > 639 THEN GOTO B
GOTO A

B:
C = C + 1
IF C = 0 OR C > 15 THEN C = 1
C:
LINE (A - 1, 0)-(A - 1, 415), 0
LINE (A, 0)-(A, 415), C
A = A - 1
IF A < 0 THEN GOTO A
GOTO C

