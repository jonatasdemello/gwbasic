DECLARE SUB ChatMode ()
' MegaChat!!  By Larry!   1994
' You MUST have a color VGA monitor for this to work!!!
DECLARE SUB SignOn ()
COMMON SHARED Mode$, YName$, TName$, Act$(), Action$()
MainStart:
WIDTH 40: COLOR 13, 0: CLS : PLAY "MB C8C16F"
PRINT "突様様様様様裕 Chat Line! 突様様様様様裕"
LOCATE 1, 16, 0: COLOR 15: PRINT "Chat Line!"
PRINT ""
COLOR 11: PRINT "What is your name?"
COLOR 9: LINE INPUT "Name: ", YName$

SOUND 1500, 2
PRINT ""
LOCATE 3: COLOR 14: PRINT "Would you like to . . . . ."
PRINT "                                        ": COLOR 11
PRINT "1 - Call another person.                "
PRINT "2 - Recieve calls.                      "
PRINT "3 - Quit to DOS                         "

MainA:
B$ = INKEY$: IF B$ = "" THEN GOTO MainA
IF B$ = "1" THEN Mode$ = "T": CALL SignOn
IF B$ = "2" THEN Mode$ = "R": CALL SignOn
IF B$ = "3" THEN SYSTEM
GOTO MainA:

SUB ChatMode
IF Mode$ = "R" THEN GOTO Recieve

Transmit:
PRINT "": COLOR 14
LINE INPUT "You: ", A$
IF MID$(A$, 1, 1) = "." THEN GOTO YActions
IF MID$(A$, 1, 1) = "\" THEN GOTO YFunction
END SUB

SUB SignOn
SCREEN 12

COLOR 3: PRINT "Please press <ENTER> or <SPACE> when connected."
WaitA:
B$ = INKEY$: IF B$ = CHR$(13) OR B$ = " " THEN GOTO Connect
GOTO WaitA

Connect:

OPEN "COM1:2400,N,8,1" FOR RANDOM AS #1

IF Mode$ = "R" THEN GOTO ConnectR


ConnectT:
INPUT #1, A$
IF A$ = "Connect R" THEN GOTO ConnectT1
GOTO ConnectT

ConnectT1:
PRINT #1, "Connect T"
PRINT #1, YName$
INPUT #1, TName$
COLOR 14: PRINT "Welcome to the Chat Line!"
PRINT "": COLOR 11
PRINT "You are talking to "; TName$
LOCATE 3, 20, 0: COLOR 15: PRINT TName$
PRINT "": COLOR 15
PRINT "Ok!  Go ahead and CHAT!!"
PRINT "": COLOR 11
CALL ChatMode


ConnectR:
PRINT #1, "Connect R"
ConnectR1:
INPUT #1, A$
IF A$ = "Connect T" THEN GOTO ConnectR2
GOTO ConnectR1

ConnectR2:
INPUT #1, TName$
PRINT #1, YName$
COLOR 14: PRINT "Welcome to the Chat Line!"
PRINT "": COLOR 11
PRINT "You are talking to "; TName$
LOCATE 3, 20, 0: COLOR 15: PRINT TName$
PRINT "": COLOR 14
CALL ChatMode





END SUB

