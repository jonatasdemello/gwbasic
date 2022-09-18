SCREEN 12
LINE (0, 0)-(50, 50), 1, B
PAINT (1, 1), 2, 1
PAINT (51, 51), 5, 1
LOCATE 10: PRINT "It worked!"
OPEN "O", 1, "pic.fil"
A = 0: B = 0
g:
C = POINT(A, B)
PRINT #1, C
A = A + 1: IF A > 639 THEN A = 0: B = B + 1
IF B > 200 THEN BEEP: CLOSE : END
GOTO g

