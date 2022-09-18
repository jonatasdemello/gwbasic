SCREEN 12: CLS
D = 1
A:
B$ = INKEY$
IF B$ = "" THEN GOTO A
C = C + 1

IF B$ = CHR$(13) THEN LOCATE D, 1, 0: COLOR 9: D = D + 1: C = 0: PRINT A$: A$ = "": GOTO A
A$ = A$ + B$
IF C > 81 THEN LOCATE D, 1, 0: COLOR 9: D = D + 1: C = 0: PRINT A$: A$ = "": GOTO A
LOCATE D, 1, 0: COLOR 9: PRINT A$
GOTO A

