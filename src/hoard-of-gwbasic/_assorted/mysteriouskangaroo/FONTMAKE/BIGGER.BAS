DECLARE SUB Save (Z)
COMMON SHARED ggg
SCREEN 12
OPEN "O", 1, "test.pic"
PRINT #1, "PSET"
PRINT #1, "0"
PRINT #1, "0"
PRINT #1, "0"
LINE (200, 200)-(250, 250), 1, B
PAINT (251, 251), 2, 1
PAINT (640, 415), 5, 1
LOCATE 10: PRINT "It worked!"
LOCATE 1, 1, 0: PRINT "a"
A = 0: B = 0: C = 0: L = 0
A:
E = POINT(A, B): D = 1: PRINT #1, "C"; E
B:
F = POINT(A + 1, B)
IF F = E THEN D = D + 1: GOTO C
Save D: A = A + 1
IF A > 7 THEN A = 0: B = B + 1: PRINT #1, "PSET": PRINT #1, "0": PRINT #1, B: PRINT #1, "0": LOCATE 28: PRINT "Line"; B: GOTO A
GOTO A
C:
A = A + 1: IF A > 7 THEN A = 0: B = B + 2: PRINT #1, "PSET": PRINT #1, "0": PRINT #1, B: PRINT #1, "0": B = B - 1: LOCATE 28: PRINT "Line"; B
IF B > 15 THEN PRINT #1, "***": CLOSE : BEEP: END
GOTO B

SUB Save (Z)
Z = Z * 2
PRINT #1, "R"; Z
PRINT #1, "R"; Z
END SUB

