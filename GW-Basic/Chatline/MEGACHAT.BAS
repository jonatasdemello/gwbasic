DECLARE SUB TPic (FileName$)
DECLARE SUB RPic ()
DECLARE SUB Command (A$)
DECLARE SUB Action (A$)
DECLARE SUB ChatMode ()
' MegaChat!!  By Larry!   1994
DECLARE SUB SignOn ()
COMMON SHARED Mode$, YName$, TName$, TColor, YColor, ER

MainStart:
WIDTH 40: COLOR 13, 0: CLS : PLAY "MB C8C16F"
PRINT "突様様様様様裕 Chat Line! 突様様様様様裕"
LOCATE 1, 16, 0: COLOR 15: PRINT "Chat Line!"
PRINT ""
COLOR 11: PRINT "What is your name?"
COLOR 9: LINE INPUT "Name: ", YName$
PRINT "": COLOR 11
PRINT "Are you Male or Female (M/F)?"
MainA:
B$ = INKEY$
IF B$ = "m" OR B$ = "M" THEN Y$ = "M": GOTO MainB
IF B$ = "f" OR B$ = "F" THEN Y$ = "F": GOTO MainB
GOTO MainA

MainB:
SOUND 1500, 2
PRINT ""
LOCATE 3: COLOR 14: PRINT "Would you like to . . . . ."
PRINT "                                        ": COLOR 11
PRINT "1 - Call another person.                "
PRINT "2 - Recieve calls.                      "
PRINT "3 - Quit to DOS                         "

MainC:
B$ = INKEY$: IF B$ = "" THEN GOTO MainC
IF B$ = "1" THEN Mode$ = "T": CALL SignOn
IF B$ = "2" THEN Mode$ = "R": CALL SignOn
IF B$ = "3" THEN SYSTEM
GOTO MainC:

SUB Action (A$)
A$ = UCASE$(A$)
A$ = MID$(A$, 2, 80)
OPEN "I", 2, "Actions.dat"
AA = 1
DIM Actions$(61)
ActA:
INPUT #2, Actions$(AA)
AA = AA + 1
IF AA > 60 THEN CLOSE 2: GOTO ActB
GOTO ActA

ActB:
AA = 1
ActBB:
Actions$(AA) = UCASE$(Actions$(AA))
AA = AA + 1
IF AA > 30 THEN GOTO ActC
GOTO ActBB

ActC:
AA = 1
ActCC:
IF A$ = Actions$(AA) THEN GOTO ActD
AA = AA + 1
IF AA > 30 THEN SOUND 200, 5: SOUND 100, 5: COLOR 4: PRINT "Action does not exist!": ER = 1: EXIT SUB
GOTO ActCC

ActD:
AA = AA + 30
A = 1
DIM Act$(75)
ActDD:
Act$(A) = MID$(Actions$(AA), A, 1)
A = A + 1
IF A > 75 THEN GOTO ActE
GOTO ActDD

ActE:
A$ = "": B$ = ""
A$ = YName$ + " "
B$ = "You "
A = 1
ActEE:
IF A > 75 THEN GOTO ActF
IF Act$(A) = "@" THEN
IF Y$ = "M" THEN A$ = A$ + "his"
IF Y$ = "F" THEN A$ = A$ + "her"
A = A + 1: GOTO ActEE
END IF
IF Act$(A) = "^" THEN
A$ = A$ + "is"
A = A + 1: GOTO ActEE
END IF
IF Act$(A) = "|" THEN
A$ = A$ + "has"
A = A + 1: GOTO ActEE
END IF
IF Act$(A) = "~" THEN
A$ = A$ + "you"
A = A + 1: GOTO ActEE
END IF
A$ = A$ + Act$(A)
A = A + 1: GOTO ActEE

ActF:
A = 1
ActFF:
IF A > 75 THEN GOTO ActG
IF Act$(A) = "@" THEN
B$ = B$ + "your"
A = A + 1: GOTO ActFF
END IF
IF Act$(A) = "^" THEN
B$ = B$ + "are"
A = A + 1: GOTO ActFF
END IF
IF Act$(A) = "|" THEN
B$ = B$ + "have"
A = A + 1: GOTO ActFF
END IF
IF Act$(A) = "~" THEN
B$ = B$ + TName$
A = A + 1: GOTO ActFF
END IF
B$ = B$ + Act$(A)
A = A + 1: GOTO ActFF

ActG:
PRINT #1, "\#ACTION"
COLOR 4: PRINT B$
COLOR YColor
END SUB

SUB ChatMode
IF Mode$ = "R" THEN GOTO recieve

Transmit:
IF YColor = 0 THEN YColor = 11
PRINT "": COLOR YColor
LINE INPUT "You: ", A$
IF MID$(A$, 1, 1) = "." THEN Action A$
IF MID$(A$, 1, 1) = "\" THEN
Command A$
IF ER = 1 THEN ER = 0: GOTO Transmit
IF ER <> 1 THEN GOTO recieve
END IF
PRINT #1, A$
GOTO recieve

recieve:
IF TColor = 0 THEN TColor = 14
PRINT "": COLOR TColor
LINE INPUT #1, A$
IF A$ = "\#ACTION" THEN COLOR 4: INPUT #1, A$: PRINT A$: COLOR YColor: GOTO Transmit
IF A$ = "\#BEEP" THEN BEEP: GOTO Transmit
IF A$ = "\#PLAY" THEN INPUT #1, A$: PLAY A$: GOTO Transmit
IF A$ = "\#PIC" THEN CALL RPic: GOTO Transmit
IF A$ = "\#COLOR" THEN INPUT #1, C: TColor = C: GOTO recieve
PRINT TName$; ": "; A$
GOTO Transmit
END SUB

SUB Command (A$)
A$ = UCASE$(A$)
IF A$ = "\SHELL" THEN SHELL
IF A$ = "\PIC" THEN
CLS : COLOR 15: PRINT "What is the name of your PIC file?":
INPUT FileName$:
TPic FileName$:
LOCATE 27: PRINT "Press any key to continue..."
commandG:
B$ = INKEY$: IF B$ = "" THEN GOTO commandG
EXIT SUB
END IF
IF A$ = "\BEEP" THEN BEEP: PRINT #1, "\#BEEP"
IF A$ = "\PLAY" THEN CLS : PRINT "Please type in a song:": LINE INPUT Song$: PLAY Song$: PRINT #1, "\#Play": PRINT #1, Song$
IF MID$(A$, 1, 6) = "\COLOR" THEN
IF MID$(A$, 8, 2) = "1" THEN YColor = 1
IF MID$(A$, 8, 2) = "2" THEN YColor = 2
IF MID$(A$, 8, 2) = "3" THEN YColor = 3
IF MID$(A$, 8, 2) = "4" THEN YColor = 4
IF MID$(A$, 8, 2) = "5" THEN YColor = 5
IF MID$(A$, 8, 2) = "6" THEN YColor = 6
IF MID$(A$, 8, 2) = "7" THEN YColor = 7
IF MID$(A$, 8, 2) = "8" THEN YColor = 8
IF MID$(A$, 8, 2) = "9" THEN YColor = 9
IF MID$(A$, 8, 2) = "10" THEN YColor = 10
IF MID$(A$, 8, 2) = "11" THEN YColor = 11
IF MID$(A$, 8, 2) = "12" THEN YColor = 12
IF MID$(A$, 8, 2) = "13" THEN YColor = 13
IF MID$(A$, 8, 2) = "14" THEN YColor = 14
IF MID$(A$, 8, 2) = "15" THEN YColor = 15
PRINT #1, "\#COLOR"
PRINT #1, YColor
END IF
END SUB

SUB RPic
CLS
VIEW (0, 0)-(639, 415)
RPictLoadA:
INPUT #1, A$
IF A$ = "Circle" THEN GOTO RPictLoadC
IF A$ = "BOX" THEN GOTO RPictLoadBox
IF A$ = "PSET" THEN GOTO RPictLoadPSET
IF A$ = "***" THEN
COLOR 15: LOCATE 27: PRINT "Press any key to continue..."
RPicEnd:
B$ = INKEY$: IF B$ = "" THEN GOTO RPicEnd
CLS
COLOR YColor
EXIT SUB
END IF
IF A$ = "FILL" THEN GOTO RPictLoadFill
DRAW A$
GOTO RPictLoadA

RPictLoadC:
INPUT #1, A
INPUT #1, B
INPUT #1, C
INPUT #1, D
CIRCLE (A, B), C, D
GOTO RPictLoadA

RPictLoadBox:
INPUT #1, A
INPUT #1, B
INPUT #1, C
INPUT #1, D
INPUT #1, E
LINE (A, B)-(C, D), E, B
GOTO RPictLoadA

RPictLoadFill:
INPUT #1, A
INPUT #1, B
INPUT #1, C
INPUT #1, D
PAINT (A, B), C, D
GOTO RPictLoadA
RPictLoadPSET:
INPUT #1, A
INPUT #1, B
INPUT #1, C
PSET (A, B), C
GOTO RPictLoadA

END SUB

SUB SignOn
SCREEN 12

COLOR 3: PRINT "Please press <ENTER> or <SPACE> when connected."
WaitA:
B$ = INKEY$: IF B$ = CHR$(13) OR B$ = " " THEN GOTO Connect
GOTO WaitA

Connect:

OPEN "COM1:2400,N,8,1" FOR RANDOM AS #1
PRINT #1, "ATDT2896670"
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
LOCATE 4, 20, 0: COLOR 15: PRINT TName$
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
LOCATE 4, 20, 0: COLOR 15: PRINT TName$
PRINT "": COLOR 14
CALL ChatMode





END SUB

SUB TPic (FileName$)
VIEW (0, 0)-(639, 415)
OPEN "I", 3, FileName$
PRINT #1, "\#PIC"
PictLoadA:
INPUT #3, A$
PRINT #1, A$
IF A$ = "Circle" THEN GOTO PictLoadC
IF A$ = "BOX" THEN GOTO PictLoadBox
IF A$ = "PSET" THEN GOTO PictLoadPSET
IF A$ = "***" THEN CLOSE : EXIT SUB
IF A$ = "FILL" THEN GOTO PictLoadFill
DRAW A$
GOTO PictLoadA

PictLoadC:
INPUT #1, A
INPUT #1, B
INPUT #1, C
INPUT #1, D
CIRCLE (A, B), C, D
GOTO PictLoadA

PictLoadBox:
INPUT #1, A
INPUT #1, B
INPUT #1, C
INPUT #1, D
INPUT #1, E
LINE (A, B)-(C, D), E, B
GOTO PictLoadA

PictLoadFill:
INPUT #1, A
INPUT #1, B
INPUT #1, C
INPUT #1, D
PAINT (A, B), C, D
GOTO PictLoadA
PictLoadPSET:
INPUT #1, A
INPUT #1, B
INPUT #1, C
PSET (A, B), C
GOTO PictLoadA

END SUB

