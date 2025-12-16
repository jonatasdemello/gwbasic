CLS
DIM Phone$(8)
LOCATE 1, 1, 0: PRINT "Ú"
LOCATE 1, 80, 0: PRINT "¿"
LOCATE 23, 1, 0: PRINT "À"
LOCATE 23, 80, 0: PRINT "Ù"
A = 2
A:
LOCATE A, 1, 0: PRINT "³"
A = A + 1
IF A = 23 THEN GOTO B
GOTO A
B:
A = 2
C:
LOCATE A, 80, 0: PRINT "³"
A = A + 1
IF A = 23 THEN GOTO D
GOTO C
D:
A = 2
E:
LOCATE 1, A, 0: PRINT "Ä"
A = A + 1
IF A = 80 THEN GOTO F
GOTO E
F:
A = 2
G:
LOCATE 23, A, 0: PRINT "Ä"
A = A + 1
IF A = 80 THEN GOTO H
GOTO G
H:

LOCATE 7, 20, 0: PRINT "Phone number: "

LOCATE 10, 20, 0: PRINT "Last Name: "

LOCATE 6, 34, 0: COLOR 1, 0: PRINT "1234567"
LOCATE 7, 34, 0: COLOR 0, 7: PRINT "       "
LOCATE 10, 31, 0: COLOR 0, 7: PRINT "                    "

PhoneType:
X = 34
Y = 7
LOCATE 22, 2, 0: COLOR 0, 0
AA:
LOCATE Y, X, 0: PRINT
B$ = INKEY$: IF B$ = "" THEN GOTO AA
LOCATE 2, 2, 0: COLOR 1, 0: PRINT ""; X; ","; Y; ""
LOCATE 3, 2, 0: COLOR 1, 0: PRINT X - 33
IF B$ = CHR$(9) THEN GOTO LNameType
IF B$ = CHR$(0) + "K" THEN
X = X - 1
IF X < 33 THEN X = X + 1
LOCATE Y, X + 1, 0: COLOR 0, 7: PRINT Phone$(X - 32)
IF X > 34 THEN LOCATE Y, X, 0: COLOR 7, 0: PRINT Phone$(X - 33)
END IF
IF B$ = CHR$(0) + "M" THEN
X = X + 1
IF X > 41 THEN X = X - 1
LOCATE Y, X + 1, 0: COLOR 0, 7: PRINT Phone$(X - 35)
IF X < 40 THEN LOCATE Y, X, 0: COLOR 7, 0: PRINT Phone$(X - 33)
END IF
IF X > 40 THEN X = 40
IF X < 34 THEN X = 34
IF B$ = "Q" OR B$ = "q" THEN GOTO DispNum
IF B$ = "1" OR B$ = "2" OR B$ = "3" OR B$ = "4" OR B$ = "5" OR B$ = "6" OR B$ = "7" OR B$ = "8" OR B$ = "9" OR B$ = "0" THEN
LOCATE Y, X, 1: COLOR 7, 0: PRINT B$: X = X + 1: Phone$(X - 34) = B$
END IF
IF X > 40 THEN X = 40
GOTO AA

LNameType:
AAA:
B$ = INKEY$: IF B$ = "" THEN GOTO AAA
IF B$ = CHR$(9) THEN GOTO PhoneType
          
DispNum:
LOCATE 22, 2, 0: COLOR 1
A = 1
EWW:
LOCATE 22, A + 1, 0: PRINT Phone$(A)
A = A + 1
IF A = 8 THEN GOTO ewe
GOTO EWW
ewe:
GOTO PhoneType

