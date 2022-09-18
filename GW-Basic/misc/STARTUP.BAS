'Larry's Startup File!!!
SCREEN 7: SCREEN 0: COLOR 5, 0: CLS : SOUND 1500, 2
PRINT "ÆÍÍÍµ Welcome to Larry's Computer! ÆÍÍÍµ"
LOCATE 1, 7, 0: COLOR 15: PRINT "Welcome to Larry's Computer!"
PRINT "": COLOR 11
PRINT "(1) - Go to Windows 3.1"
PRINT "(2) - Go to the Qbasic Desktop"
PRINT "(3) - Exit to DOS"
A:
B$ = INKEY$
IF B$ = "1" THEN GOTO Commands
IF B$ = "2" THEN GOTO Commands
IF B$ = "3" THEN GOTO Commands
GOTO A

Commands:
SOUND 1500, 2
IF B$ = "1" THEN OPEN "O", 1, "Shell.BAT": PRINT #1, "Echo Off": PRINT #1, "C:": PRINT #1, "Win": PRINT #1, "CD \": PRINT #1, "Startup"
IF B$ = "2" THEN OPEN "O", 1, "Shell.BAT": PRINT #1, "Echo Off": PRINT #1, "C:": PRINT #1, "Desktop": PRINT #1, "CD \:": PRINT #1, "Startup"
IF B$ = "3" THEN OPEN "O", 1, "Shell.BAT": PRINT #1, "Echo Off": PRINT #1, "C:": PRINT #1, "CD \": PRINT #1, "Command": PRINT #1, "CD \:": PRINT #1, "Startup"
SYSTEM

