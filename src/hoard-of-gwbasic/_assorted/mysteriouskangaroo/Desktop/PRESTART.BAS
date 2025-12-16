ON ERROR GOTO E
SCREEN 12
A:
COLOR 9: PRINT "Desktop loading"
COLOR 13: PRINT "Please Wait. . . ."
CHAIN "Startup"

E:
SCREEN 2: SCREEN 0: GOTO A

