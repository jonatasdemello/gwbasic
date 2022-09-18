SCREEN 9
CLS
PSET (1, 2), 1
PSET (1, 3), 1
PSET (1, 4), 1
PSET (1, 5), 1
PSET (1, 6), 1
PSET (1, 7), 1
PSET (1, 8), 1
PSET (1, 9), 1
PSET (1, 10), 1
PSET (1, 11), 1
PSET (1, 12), 1
PSET (1, 13), 1
PSET (1, 14), 1
PSET (1, 15), 1
PSET (1, 16), 1
PSET (1, 15), 1
PSET (2, 15), 1
PSET (2, 14), 1
PSET (3, 14), 0
PSET (3, 13), 1
PSET (4, 13), 0
PSET (4, 12), 1
PSET (5, 12), 0
PSET (6, 12), 1
PSET (6, 11), 1
PSET (6, 12), 1
PSET (7, 12), 1
PSET (8, 12), 1
PSET (9, 12), 1
PSET (9, 13), 0
PSET (9, 14), 1
PSET (10, 14), 1
PSET (10, 15), 0
PSET (10, 16), 1
PSET (11, 16), 1
PSET (11, 17), 0
PSET (11, 18), 1
PSET (12, 18), 1
PSET (12, 19), 0
PSET (13, 19), 1
PSET (14, 19), 1
PSET (14, 18), 0
PSET (14, 17), 1
PSET (14, 16), 1
PSET (13, 16), 0
PSET (13, 15), 1
PSET (13, 14), 1
PSET (12, 14), 0
PSET (12, 13), 1
PSET (12, 12), 1
PSET (11, 12), 0
PSET (11, 11), 1
PSET (11, 10), 1
PSET (12, 10), 1
PSET (13, 10), 1
PSET (14, 10), 1
PSET (15, 10), 1
PSET (14, 10), 1
PSET (14, 9), 1
PSET (14, 8), 1
PSET (13, 8), 0
PSET (13, 7), 1
PSET (12, 7), 0
PSET (12, 6), 1
PSET (11, 6), 0
PSET (11, 5), 1
PSET (10, 5), 0
PSET (10, 4), 1
PSET (9, 4), 0
PSET (9, 3), 1
PSET (8, 3), 0
PSET (8, 2), 1
PSET (7, 2), 0
PSET (7, 1), 1
PSET (6, 1), 0
PSET (6, 0), 1
PSET (5, 0), 0
PSET (4, 0), 1
PSET (3, 0), 1
PSET (2, 0), 1
PSET (1, 0), 1
PSET (2, 0), 1
PSET (3, 0), 0
PSET (4, 0), 0
PSET (4, -1), 0
PSET (4, -2), 15
PSET (4, -1), 15
PSET (4, 0), 15
PSET (3, 0), 15
PSET (4, 0), 1
PSET (3, 0), 1
PSET (2, 0), 1
DIM A(300)
DIM B(300)
GET (0, 0)-(40, 40), A
CLS
X = 0: Y = 0
D:
PUT (X, Y), A
A:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN PUT (X, Y), A: Y = Y - 1: GOTO D
IF B$ = CHR$(0) + "P" THEN PUT (X, Y), A: Y = Y + 1: GOTO D
IF B$ = CHR$(0) + "K" THEN PUT (X, Y), A: X = X - 1: GOTO D
IF B$ = CHR$(0) + "M" THEN PUT (X, Y), A: X = X + 1: GOTO D
GOTO A
LOCATE 23: COLOR 0: INPUT enter

