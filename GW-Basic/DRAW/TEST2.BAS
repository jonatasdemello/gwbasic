SCREEN 12
A = 0: B = 0
OPEN "I", 1, "Pic.fil"
A:
INPUT #1, C
PSET (A, B), C
A = A + 1: IF A > 639 THEN A = 0: B = B + 1
IF B > 200 THEN BEEP: CLOSE : END
GOTO A

