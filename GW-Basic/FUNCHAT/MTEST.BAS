DECLARE SUB ChatChoose ()
DECLARE SUB Center (row!, Test$)
DECLARE SUB RPic ()
DECLARE SUB Command (A$)
DECLARE SUB Action (A$)
DECLARE SUB ChatMode ()
' FunChat!!  By Larry!   1995
DECLARE SUB SignOn ()
COMMON SHARED Mode$, YName$, TName$, TColor, CB, CD, YColor, ER, File$(), Chat(), CDone(), CH
DIM CDone(500)
DIM File$(500)

A = 0
OPEN "I", 1, "Chat2"
FileA:
LINE INPUT #1, File$(A)
A = A + 1
IF A > 500 OR File$(A - 1) = "*****" THEN GOTO FileB
GOTO FileA

FileB:
A = 0: B = 1
DIM Chat(501)
FileC:
IF File$(A) = "#@" THEN Chat(B) = A: B = B + 1
A = A + 1
IF A > 500 OR File$(A - 1) = "*****" THEN GOTO MainStart
GOTO FileC


MainStart:
CB = B
OPEN "O", 2, "FunChat.Log"
WIDTH 40: COLOR 5, 0: CLS : PLAY "MB C8C16F"
PRINT "ฦออออออออออออออออออออออออออออออออออออออต"
Center 1, "ต Fun Chat!! ฦ"
COLOR 15: Center 1, "Fun Chat!!"

LOCATE 2: PRINT ""
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
OPEN "I", 3, "Actions.dat"
AA = 1
DIM Actions$(61)
ActA:
INPUT #3, Actions$(AA)
AA = AA + 1
IF AA > 60 THEN CLOSE 3: GOTO ActB
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
PRINT #2, , "\#ACTION"
COLOR 4: PRINT B$
COLOR YColor
END SUB

SUB Center (row, Text$)
    LOCATE row, 21 - LEN(Text$) / 2
    PRINT Text$;
END SUB

SUB ChatChoose
CChooseBegin:
RANDOMIZE TIMER: A = INT(RND * CB)
IF A = 0 THEN A = 3
PRINT A
IF CD = 0 THEN CD = 1
B = 1
CChooseA:
'IF A = CDone(B) THEN GOTO CChooseBegin
'B = B + 1
'IF B > CD THEN GOTO CChooseB
'GOTO CChooseA

CChooseB:
CD = CD + 1
CDone(CD) = A
CH = A
END SUB

SUB ChatMode

Transmit:
IF YColor = 0 THEN YColor = 11
PRINT "": COLOR YColor
LINE INPUT "You: ", A$
IF MID$(A$, 1, 1) = "." THEN Action A$
IF MID$(A$, 1, 1) = "\" THEN
Command A$
IF ER = 1 THEN ER = 0: GOTO Transmit
IF ER <> 1 THEN GOTO Recieve
END IF
PRINT #2, YName$; ": "; A$
GOTO Recieve

Recieve:
IF TColor = 0 THEN TColor = 14
PRINT "": COLOR TColor
RecieveAA:
IF File$(A) = "#@END" THEN CALL ChatChoose: A = CH
IF File$(A) = "#@" THEN A = A + 1
A$ = File$(A)
IF A$ = "\#ACTION" THEN COLOR 4: INPUT #1, A$: PRINT A$: COLOR YColor: GOTO Transmit
IF A$ = "\#BEEP" THEN BEEP: GOTO Transmit
IF A$ = "\#PLAY" THEN INPUT #1, A$: PLAY A$: GOTO Transmit
IF A$ = "\#PIC" THEN CALL RPic: GOTO Transmit
IF A$ = "\#COLOR" THEN INPUT #1, C: TColor = C: GOTO Recieve
PRINT #2, TName$; ": "; A$
PRINT TName$; ": "; A$
A = A + 1
GOTO Transmit
END SUB

SUB Command (A$)
A$ = UCASE$(A$)
IF A$ = "\SHELL" THEN SHELL
IF A$ = "\BEEP" THEN BEEP: PRINT #2, , "\#BEEP"
IF A$ = "\PLAY" THEN CLS : PRINT "Please type in a song:": LINE INPUT Song$: PLAY Song$: PRINT #2, , "\#Play": PRINT #2, , Song$
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
PRINT #2, , "\#COLOR"
PRINT #2, , YColor
ER = 1
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

COLOR 3: PRINT "Please press <ENTER> to Continue."
WaitA:
B$ = INKEY$: IF B$ = CHR$(13) OR B$ = " " THEN GOTO Connect
GOTO WaitA

Connect:

GOTO ConnectR


ConnectT:
INPUT #1, A$
IF A$ = "Connect R" THEN GOTO ConnectT1
GOTO ConnectT

ConnectT1:
PRINT #2, , "Connect T"
PRINT #2, , YName$
TName$ = File$(0)
COLOR 14: PRINT "Welcome to the Chat Line!"
PRINT "": COLOR 11
PRINT "You are talking to "; TName$
LOCATE 4, 20, 0: COLOR 15: PRINT TName$
PRINT "": COLOR 15
PRINT "Ok!  Go ahead and CHAT!!"
PRINT "": COLOR 11
CALL ChatMode


ConnectR:
PRINT #2, "Connect R"

ConnectR2:
TName$ = File$(0)
PRINT #2, , YName$
COLOR 14: PRINT "Welcome to the Chat Line!"
PRINT "": COLOR 11
PRINT "You are talking to "; TName$
LOCATE 4, 20, 0: COLOR 15: PRINT TName$
PRINT "": COLOR 14
PRINT TName$; ": Hello "; YName$; "!"
CALL ChatMode





END SUB

