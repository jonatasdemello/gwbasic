SCREEN 9: CLS : SOUND 1500, 2
Normal:
A = 1: B = 1: C = 1: D = 0
A:
D = D + 1
LINE (1, A)-(749, A), C
A = A + 5: IF A > 346 THEN C = C + 1: B = B + 1: A = B: GOTO C
GOTO A

C:
IF C > 15 THEN C = 1
IF D > 12200 THEN GOTO Normal
GOTO A

