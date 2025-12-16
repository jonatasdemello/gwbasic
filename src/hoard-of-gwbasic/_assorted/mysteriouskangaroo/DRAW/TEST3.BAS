DECLARE SUB Save (Z)
SCREEN 12
OPEN "O", 1, "test.pic"
PRINT #1, "PSET"
PRINT #1, "0"
PRINT #1, "0"
PRINT #1, "0"
LINE (0, 0)-(50, 50), 1, B
PAINT (1, 1), 2, 1
PAINT (51, 51), 5, 1
LOCATE 10: PRINT "It worked!"
A = 0: B = 0: C = 0: L = 0
A:
E = POINT(A, B): D = 1: PRINT #1, "A":Print#1, "B", print# 1, "E"

SUB Save (Z)
PRINT #1, "R"; Z
END SUB

