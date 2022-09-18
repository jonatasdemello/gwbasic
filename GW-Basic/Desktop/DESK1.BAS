DECLARE SUB SSaverA16 ()
DECLARE SUB SSaverB16 ()
DECLARE SUB SSaverBBW ()
DECLARE SUB SSaverABW ()
DECLARE SUB SSaverA256 ()
DECLARE SUB BWSSaver ()
DECLARE SUB SSaver ()
DECLARE SUB Desk ()
COMMON SHARED USER
ON ERROR GOTO MainC
OPEN "I", 1, "Return.Dat"
INPUT #1, A
CLOSE
IF A = 11 THEN GOTO MainA
USER = A

MainA:
OPEN "O", 1, "Return.Dat"
PRINT #1, "11"
CLOSE

MainB:
CALL Desk
GOTO MainB

MainC:
IF ERR = 53 THEN CHDIR "\Desktop": GOTO MainB
IF ERR = 5 THEN
IF ERL = 11 THEN CALL SSaverABW: CHAIN "Desk1"
END IF
ERROR ERR
TimeUpdate:
        RETURN

SUB Desk
SCREEN 1: SCREEN 0
CHDIR "\Desktop"
DeskStart:
KEY 4, "~"
SCREEN 0
IF USER = 0 THEN OPEN "I", 1, "User0.Dat"
IF USER = 1 THEN OPEN "I", 1, "User1.Dat"
IF USER = 2 THEN OPEN "I", 1, "User2.Dat"
IF USER = 3 THEN OPEN "I", 1, "User3.Dat"
IF USER = 4 THEN OPEN "I", 1, "User4.Dat"
IF USER = 5 THEN OPEN "I", 1, "User5.Dat"
IF USER = 6 THEN OPEN "I", 1, "User6.Dat"
IF USER = 7 THEN OPEN "I", 1, "User7.Dat"
IF USER = 8 THEN OPEN "I", 1, "User8.Dat"
IF USER = 9 THEN OPEN "I", 1, "User9.Dat"
IF USER = 10 THEN OPEN "I", 1, "User10.Dat"
INPUT #1, N$
INPUT #1, A$
INPUT #1, A$
INPUT #1, A$
INPUT #1, A$
INPUT #1, A$
INPUT #1, A$
INPUT #1, A$
INPUT #1, A$
INPUT #1, CF
INPUT #1, CM
INPUT #1, CH
INPUT #1, CB
INPUT #1, CD
INPUT #1, CT
INPUT #1, CI
CLOSE
PALETTE 1, CF: CF = 1
PALETTE 2, CM: CM = 2
PALETTE 3, CH: CH = 3
PALETTE 4, CD: CD = 4
PALETTE 5, CT: CT = 5
PALETTE 6, CI: CI = 6
PALETTE 7, CB: CB = 7

WIDTH 40: COLOR CF, 0: CLS : PLAY "MB C32D32E32F32G32F32E32D32C"
PRINT "ษอออออออออออออหออออออออออหอออออออออออออป"
PRINT "บ             บ          บ             บ"
PRINT "ฬอออออออออออออน          ฬอออออออออออออน"
PRINT "บ             ศออออออออออผ             บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "ฬออออออออออออออออออออออออออออออออออออออน"
PRINT "บ                                      บ"
PRINT "ศออออออออออออออออออออออออออออออออออออออผ"
DIM Z$(13)
OPEN "I", 1, "DeskInfo.Dat"
INPUT #1, one$
INPUT #1, two$
INPUT #1, three$
INPUT #1, Hone$
INPUT #1, Htwo$
INPUT #1, Hthree$
INPUT #1, Topuser
CLOSE
Z$(1) = "Use a Basic program."
Z$(2) = one$
Z$(3) = two$
Z$(4) = three$
Z$(5) = "Set the Date/Time."
Z$(6) = "Re-Configure the Desktop."
Z$(7) = "Shell to DOS."
Z$(8) = "Quit the QBasic Desktop"
Z$(9) = "Load Microsoft Windows."
Z$(10) = "Return to the startup screen."
Z$(11) = ""
Z$(12) = ""
DIM H$(13)
H$(1) = "Lets you use a QBasic program.        "
H$(2) = Hone$
H$(3) = Htwo$
H$(4) = Hthree$
H$(5) = "Lets you set the date/time."
H$(6) = "Lets you change your desktop settings."
H$(7) = "Lets you go to DOS."
H$(8) = "Takes you out of QBasic."
H$(9) = "Starts up Microsoft Windows."
H$(10) = "Takes you to the startup screen.     "
H$(11) = ""
H$(12) = ""
LOCATE 2, 3, 0: COLOR CD: PRINT TIME$
LOCATE 2, 28, 0: COLOR CD: PRINT DATE$
LOCATE 2, 16, 0: COLOR CT: PRINT N$; "'s"
LOCATE 3, 18, 0: COLOR CT: PRINT "Desktop!"
LOCATE 5, 2, 0: COLOR CI: PRINT "Use cursor keys to choose,"
LOCATE 6, 2, 0: COLOR CI: PRINT "Then press enter or spacebar."
A:
A = 8: B = 1: C = 1
B:
LOCATE A, 2, 0: COLOR C: PRINT Z$(B)
A = A + 1: B = B + 1
IF B = 11 THEN A = 8: B = 1: GOTO C
GOTO B:
C:
IF C = CM THEN GOTO D
C = CM: GOTO B
D:
A = 8: B = 1
E:
LOCATE A, 2, 0: COLOR CH: PLAY "F32": PRINT Z$(B)
LOCATE 22, 2, 0: COLOR CB: PRINT H$(B)


    ON TIMER(1) GOSUB TimeUpdate
    TIMER ON
    StartTime = TIMER
    WHILE TimePast < 60
       
        TimePast = TIMER - StartTime
LOCATE 2, 3, 0: COLOR CD: PRINT TIME$
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO eg
IF B$ = CHR$(0) + "P" THEN GOTO ef
IF B$ = CHR$(13) THEN SOUND 1500, 2: GOTO commands
IF B$ = " " THEN SOUND 1500, 2: GOTO commands
IF B$ = "~" THEN CALL SSaver: EXIT SUB
    WEND
    CALL SSaver: EXIT SUB

ef:
LOCATE A, 2, 0: COLOR CM: PRINT Z$(B)
LOCATE 22, 2, 0: COLOR 0: PRINT "                                      "
A = A + 1: B = B + 1
IF B = 11 THEN A = 8: B = 1
GOTO E
eg:
LOCATE A, 2, 0: COLOR CM: PRINT Z$(B)
LOCATE 22, 2, 0: COLOR 0: PRINT "**************************************"
A = A - 1: B = B - 1
IF B = 0 THEN A = 17: B = 10
GOTO E

commands:
IF B = 1 THEN A = 0: GOTO ListChoose
IF B = 2 THEN A = 1: GOTO ListChoose
IF B = 3 THEN A = 2: GOTO ListChoose
IF B = 4 THEN A = 3: GOTO ListChoose
IF B = 5 THEN CHAIN "Cal"
IF B = 6 THEN CHAIN "Config"
IF B = 7 THEN WIDTH 80: SOUND 1500, 2: LOCATE 1, 1, 0: COLOR 14: PRINT "Type EXIT to return to the desktop.": SOUND 0, 0: SHELL
IF B = 8 THEN LOCATE 2, 16, 0: COLOR 31: PRINT "Good-Bye!": LOCATE 3, 16, 0: COLOR 0: PRINT "  Desktop!": COLOR 11, 0: CLS : SYSTEM
IF B = 9 THEN GOTO MakeBatch
IF B = 10 THEN CHAIN "Startup"
CALL Desk

ListChoose:
IF A = 0 THEN CHAIN "Blist"
IF A = 1 THEN CHAIN "1list"
IF A = 2 THEN CHAIN "2list"
IF A = 3 THEN CHAIN "3list"
CALL Desk


MakeBatch:
OPEN "O", 1, "DeskShel.Bat"
PRINT #1, "Echo Off"
PRINT #1, "CD \Windows"
PRINT #1, "Win"
PRINT #1, "cd \Desktop"
CLOSE

OPEN "O", 1, "Return.Bat"
PRINT #1, "@Echo Off"
PRINT #1, "CD \Desktop"
PRINT #1, "QBasic /run Desk1"
CLOSE
OPEN "O", 1, "Return.Dat"
PRINT #1, USER
CLOSE
SYSTEM









END SUB

SUB SSaver
OPEN "I", 1, "SSaver.Dat"
INPUT #1, Saver$
INPUT #1, Mode
CLOSE

IF Saver$ = "A" THEN GOTO SaverA

SaverB:
IF Mode = 16 THEN CALL SSaverB16: EXIT SUB
CALL SSaverBBW: EXIT SUB

SaverA:
IF Mode = 256 THEN CALL SSaverA256: EXIT SUB
IF Mode = 16 THEN CALL SSaverA16: EXIT SUB
CALL SSaverABW: EXIT SUB
END SUB

SUB SSaverA16
1111 SCREEN 9: CLS
1112 RANDOMIZE TIMER
1113 C = INT(RND * 15)
1114 A = INT(RND * 640)
1115 B = INT(RND * 350)
1116 D = INT(RND * 640)
1117 E = INT(RND * 350)
1118 LINE (A, B)-(D, E), C, BF
1119 B$ = INKEY$: IF B$ = "" THEN GOTO 1129
EXIT SUB
1129 PLAY "MF P64": GOTO 1113


END SUB

SUB SSaverA256

11 SCREEN 13: CLS
12 RANDOMIZE TIMER
13 C = INT(RND * 256)
14 A = INT(RND * 319)
15 B = INT(RND * 199)
16 D = INT(RND * 319)
17 E = INT(RND * 199)
18 LINE (A, B)-(D, E), C, BF
19 B$ = INKEY$: IF B$ = "" THEN GOTO 29
   EXIT SUB
29 PLAY "MF P64": GOTO 13


END SUB

SUB SSaverABW

111 SCREEN 2: CLS
112 RANDOMIZE TIMER
113 C = INT(RND * 1)
114 A = INT(RND * 639)
115 B = INT(RND * 199)
116 D = INT(RND * 639)
117 E = INT(RND * 199)
D = D + 1
IF D = 800 THEN CLS
118 LINE (A, B)-(D, E), , B
119 B$ = INKEY$: IF B$ = "" THEN GOTO 129
    EXIT SUB
129 PLAY "MF P64": GOTO 113



END SUB

SUB SSaverB16
SCREEN 9: CLS
RANDOMIZE TIMER
APL:
B$ = INKEY$
IF B$ = "" THEN GOTO SSGGD
EXIT SUB

SSGGD:
A = 225
B = 100

RANO:
E = INT(RND * 640)
IF E < 100 OR E > 580 THEN GOTO RANO

RANP:
F = INT(RND * 350)
IF F < 80 OR F > 290 THEN GOTO RANP

SSA:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 2
B = B + 5
IF B > 260 THEN GOTO SSB
GOTO SSA

SSB:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 5
A = A + 5
IF A > 415 THEN GOTO SSC
GOTO SSB

SSC:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 1
B = B - 5
IF B < 100 THEN GOTO SSD
GOTO SSC

SSD:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 4
A = A - 5
IF A < 225 THEN GOTO EDD
GOTO SSD

EDD:
A = 225
B = 100

SSE:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 10
B = B + 5
IF B > 260 THEN GOTO SSF
GOTO SSE

SSF:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 13
A = A + 5
IF A > 415 THEN GOTO SSG
GOTO SSF

SSG:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 9
B = B - 5
IF B < 100 THEN GOTO SSH
GOTO SSG

SSH:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 12
A = A - 5
IF A < 225 THEN GOTO EDD2
GOTO SSH



EDD2:
A = 225
B = 100

SSI:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 0
B = B + 5
IF B > 260 THEN GOTO SSJ
GOTO SSI

SSJ:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 0
A = A + 5
IF A > 415 THEN GOTO SSK
GOTO SSJ

SSK:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 0
B = B - 5
IF B < 100 THEN GOTO SSL
GOTO SSK

SSL:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 0
A = A - 5
IF A < 225 THEN GOTO APL
GOTO SSL
END
END SUB

SUB SSaverBBW
SCREEN 2: CLS
RANDOMIZE TIMER
BWAPL:
B$ = INKEY$
IF B$ = "" THEN
A = 225
B = 100

BWRANO:
E = INT(RND * 639)
IF E < 100 OR E > 580 THEN GOTO BWRANO

BWRANP:
F = INT(RND * 199)
IF F < 80 OR F > 100 THEN GOTO BWRANP

BWA:
CO = INT(RND * 15)
LINE (E, F)-(A, B), CO
B = B + 5
IF B > 149 THEN GOTO BWB
GOTO BWA

BWB:
CO = INT(RND * 15)
LINE (E, F)-(A, B), CO
A = A + 5
IF A > 415 THEN GOTO BWC
GOTO BWB

BWC:
CO = INT(RND * 15)
LINE (E, F)-(A, B), CO
B = B - 5
IF B < 50 THEN GOTO BWD
GOTO BWC

BWD:
CO = INT(RND * 15)
LINE (E, F)-(A, B), CO
A = A - 5
IF A < 225 THEN GOTO BWEDD
GOTO BWD

BWEDD:
A = 225
B = 100

BWE:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 0
B = B + 5
IF B > 149 THEN GOTO BWF
GOTO BWE

BWF:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 0
A = A + 5
IF A > 415 THEN GOTO BWG
GOTO BWF

BWG:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 0
B = B - 5
IF B < 50 THEN GOTO BWH
GOTO BWG

BWH:
CO = INT(RND * 15)
LINE (E, F)-(A, B), 0
A = A - 5
IF A < 225 THEN GOTO BWAPL
GOTO BWH
END IF
EXIT SUB


END SUB

