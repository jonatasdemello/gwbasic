DECLARE SUB WaitForAction (X!, Y!, KeyPress$)
DECLARE SUB ShowLoc (X!, Y!)

SCREEN 0
WIDTH 80, 25
Cols = 80
Rows = 25

X = 1: Y = 1










DIM ScrnLayout(1 TO Cols, 1 TO Rows)
DIM Button$(1 TO 10)




AA:


CALL WaitForAction(X, Y, KeyPress$)
CALL ShowLoc(X, Y)
GOTO AA

SUB InitializeButton (X, Y, C, Text$)





END SUB

SUB ShowLoc (X, Y)
LOCATE 23, 70, 0: COLOR 15, 1
PRINT "("; X; ","; Y; ")"
END SUB

SUB WaitForAction (X, Y, KeyPress$)
COLOR 0, 0
Cols = 80
Rows = 25

SOUND 1500, 2
LOCATE Y, X, 0: COLOR C, BC + 1: PRINT " "

C = 15
BC = 0

A:
B$ = INKEY$
REM IF B$ = CHR$(9) THEN
REM BC = BC + 1
REM IF BC > 15 THEN BC = 0
REM LOCATE Y, X, 0: COLOR C, BC: PRINT " ": GOTO A
REM END IF
IF B$ = "" THEN GOTO A
IF B$ = CHR$(27) THEN GOTO ending
IF B$ = CHR$(13) OR B$ = CHR$(8) OR B$ = CHR$(0) + "H" OR B$ = CHR$(0) + "P" OR B$ = CHR$(0) + "K" OR B$ = CHR$(0) + "M" THEN LOCATE Y, X, 0: COLOR C, BC: PRINT CHR$(A)
IF B$ = CHR$(8) THEN X = X - 1: Z = 1
IF B$ = CHR$(0) + "H" THEN Y = Y - 1: Z = 1
IF B$ = CHR$(0) + "P" THEN Y = Y + 1: Z = 1
IF B$ = CHR$(0) + "K" THEN X = X - 1: Z = 1
IF B$ = CHR$(0) + "M" THEN X = X + 1: Z = 1
IF X < 1 THEN X = 1
IF X > Cols THEN X = Cols
IF Y < 1 THEN Y = 1
IF Y > Rows - 3 THEN Y = Rows - 3
IF Z = 1 THEN Z = 0: GOTO C
IF NOT X = 1 THEN
Z = SCREEN(Y, X - 1, 0)
LOCATE Y, X - 1, 0: COLOR C, BC: PRINT CHR$(Z)
END IF
C:
IF X > 80 THEN X = 80
A = SCREEN(Y, X, 0)
LOCATE Y, X, 0: COLOR C, BC + 1: PRINT CHR$(A)

IF B$ = CHR$(0) + "H" THEN GOTO A
IF B$ = CHR$(0) + "P" THEN GOTO A
IF B$ = CHR$(0) + "K" THEN GOTO A
IF B$ = CHR$(0) + "M" THEN GOTO A


ending:


END SUB

