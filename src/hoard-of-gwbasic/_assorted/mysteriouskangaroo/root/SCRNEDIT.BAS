'screen editor test
SCREEN 0: WIDTH 80
CLS
SOUND 1500, 2
LOCATE 1, 1, 0: COLOR 15, 1: PRINT " "
X = 1: Y = 1
A:
B$ = INKEY$
IF B$ = CHR$(27) THEN END
IF B$ = "" THEN GOTO A
IF B$ = CHR$(13) OR B$ = CHR$(8) OR B$ = CHR$(0) + "H" OR B$ = CHR$(0) + "P" OR B$ = CHR$(0) + "K" OR B$ = CHR$(0) + "M" THEN LOCATE Y, X, 0: COLOR 15, 0: PRINT CHR$(A)
IF B$ = CHR$(8) THEN X = X - 1: Z = 1
IF B$ = CHR$(13) THEN Y = Y + 1: X = 0: Z = 1
IF B$ = CHR$(0) + "H" THEN Y = Y - 1: Z = 1
IF B$ = CHR$(0) + "P" THEN Y = Y + 1: Z = 1
IF B$ = CHR$(0) + "K" THEN X = X - 1: Z = 1
IF B$ = CHR$(0) + "M" THEN X = X + 1: Z = 1
IF X < 1 THEN X = 1
IF X > 80 THEN X = 80
IF Y < 1 THEN Y = 1
IF Y > 23 THEN Y = 23
IF Z = 1 THEN Z = 0: GOTO C
LOCATE Y, X, 1: COLOR 15, 0: PRINT B$
X = X + 1
Z = SCREEN(Y, X - 1, 0)
LOCATE Y, X - 1, 0: COLOR 15, 0: PRINT CHR$(Z)
C:
IF X > 80 THEN X = 80
A = SCREEN(Y, X, 0)
LOCATE Y, X, 0: COLOR 15, 1: PRINT CHR$(A)
GOTO A

