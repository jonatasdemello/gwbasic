DECLARE SUB Save (Z)
SCREEN 9
OPEN "O", 1, "test.pic"
LINE (0, 0)-(50, 50), 1, B
PAINT (1, 1), 2, 1
PAINT (51, 51), 5, 1
LOCATE 10: PRINT "It worked!"
A = 0: B = 0: C = 0: L = 0
A:
E = POINT(A, B): D = 1: PRINT #1, "A": PRINT #1, "B": PRINT #1, "E"
A = A + 1: IF A > 639 THEN A = 0: B = B + 1
IF B > 349 THEN CLOSE : BEEP: END
LOCATE 23: COLOR 15: PRINT "Line "; B
GOTO A

SUB Save (Z)
PRINT #1, "R"; Z
END SUB

