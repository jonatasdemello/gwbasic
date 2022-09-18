DECLARE SUB deskchoose ()
DECLARE SUB newuser ()
DECLARE SUB mboard ()
DECLARE SUB PassEntry ()
DECLARE SUB startup ()
COMMON SHARED User
CALL startup

SUB deskchoose
IF User = 0 THEN OPEN "I", 1, "User0.Dat"
IF User = 1 THEN OPEN "I", 1, "User1.Dat"
IF User = 2 THEN OPEN "I", 1, "User2.Dat"
IF User = 3 THEN OPEN "I", 1, "User3.Dat"
IF User = 4 THEN OPEN "I", 1, "User4.Dat"
IF User = 5 THEN OPEN "I", 1, "User5.Dat"
IF User = 6 THEN OPEN "I", 1, "User6.Dat"
IF User = 7 THEN OPEN "I", 1, "User7.Dat"
IF User = 8 THEN OPEN "I", 1, "User8.Dat"
IF User = 9 THEN OPEN "I", 1, "User9.Dat"
IF User = 10 THEN OPEN "I", 1, "User10.Dat"
INPUT #1, a$
INPUT #1, a
INPUT #1, a
INPUT #1, a
INPUT #1, a
INPUT #1, a
INPUT #1, a
INPUT #1, Desk$
CLOSE

IF Desk$ = "1" THEN CHAIN "Desk1"
IF Desk$ = "2" THEN CHAIN "Desk2"
IF Desk$ = "3" THEN CHAIN "Desk3"
IF Desk$ = "4" THEN CHAIN "Desk4"
IF Desk$ = "5" THEN CHAIN "Desk5"
IF Desk$ = "6" THEN CHAIN "Desk6"
IF Desk$ = "7" THEN CHAIN "Desk7"
IF Desk$ = "8" THEN CHAIN "Desk8"
IF Desk$ = "9" THEN CHAIN "Desk9"
IF Desk$ = "10" THEN CHAIN "Desk10"
IF Desk$ = "S" THEN CHAIN "DeskS"
CHAIN "Desk1"







END SUB

SUB mboard
DIM R$(10)
OPEN "I", 1, "MBoard.Dat"
INPUT #1, a$
LINE INPUT #1, R$(1)
LINE INPUT #1, R$(2)
LINE INPUT #1, R$(3)
LINE INPUT #1, R$(4)
LINE INPUT #1, R$(5)
LINE INPUT #1, R$(6)
LINE INPUT #1, R$(7)
LINE INPUT #1, R$(8)
LINE INPUT #1, R$(9)
LINE INPUT #1, R$(10)
CLOSE

IF a$ = "No" THEN CALL deskchoose

WIDTH 40: COLOR 14: CLS : SOUND 1500, 2
PRINT "<<<<<<<<<<<< Message Board! >>>>>>>>>>>>": COLOR 1
PRINT "ฦออออออออออออออออออออออออออออออออออออออต": COLOR 11
PRINT R$(1)
PRINT R$(2)
PRINT R$(3)
PRINT R$(4)
PRINT R$(5)
PRINT R$(6)
PRINT R$(7)
PRINT R$(8)
PRINT R$(9)
PRINT R$(10): COLOR 1
PRINT "ฦออออออออออออออออออออออออออออออออออออออต": COLOR 15
PRINT ""
PRINT "Press any key to go on."
MBoardA:
B$ = INKEY$: IF B$ = "" THEN GOTO MBoardA
SOUND 1500, 2: CALL deskchoose
                            












END SUB

SUB PassEntry
WIDTH 40: COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออต Please enter your password ฦออออต"
LOCATE 1, 8, 0: COLOR 15: PRINT "Please enter your password"
PRINT "": COLOR 1
PRINT "            ษออออออออออออออป"
PRINT "            บ * * *  * * * บ"
PRINT "            ศออออออออออออออผ"
PRINT ""
PRINT "                < Done >"
COLOR 14: PRINT ""
PRINT "Use the cursor keys to choose,"
PRINT "then choose `Done'."
LOCATE 7, 19, 0: COLOR 11: PRINT "Done"
LOCATE 4, 15, 0: COLOR 11: PRINT "0 0 0  0 0 0"
a = 14: c = 1
DIM B(6)

PassEntryA:
LOCATE 4, a, 0: COLOR 15: PLAY "F32": PRINT B(c)
PassEntryB:
B$ = INKEY$: IF B$ = "" THEN GOTO PassEntryB
IF B$ = CHR$(0) + "P" THEN GOTO PassEntryC
IF B$ = CHR$(0) + "H" THEN GOTO PassEntryD
IF B$ = CHR$(0) + "M" THEN GOTO PassEntryE
IF B$ = CHR$(0) + "K" THEN GOTO PassEntryF
GOTO PassEntryB

PassEntryC:
B(c) = B(c) - 1
IF B(c) < 0 THEN B(c) = 5
GOTO PassEntryA

PassEntryD:
B(c) = B(c) + 1
IF B(c) > 5 THEN B(c) = 0
GOTO PassEntryA

PassEntryE:
LOCATE 4, a, 0: COLOR 11: PRINT B(c)
a = a + 2: c = c + 1
IF a = 20 THEN a = 21
IF a = 27 THEN GOTO PassEntryG
GOTO PassEntryA

PassEntryF:
LOCATE 4, a, 0: COLOR 11: PRINT B(c)
a = a - 2: c = c - 1
IF a = 19 THEN a = 18
IF a = 12 THEN GOTO PassEntryG
GOTO PassEntryA

PassEntryG:
LOCATE 7, 19, 0: COLOR 15: PLAY "F32": PRINT "Done"
PassEntryH:
B$ = INKEY$: IF B$ = "" THEN GOTO PassEntryH
IF B$ = CHR$(0) + "K" THEN GOTO PassEntryI
IF B$ = CHR$(0) + "M" THEN GOTO PassEntryJ
IF B$ = CHR$(13) THEN GOTO PassCheck
IF B$ = " " THEN GOTO PassCheck
GOTO PassEntryH

PassEntryI:
LOCATE 7, 19, 0: COLOR 11: PRINT "Done"
a = 25: c = 6
GOTO PassEntryA

PassEntryJ:
LOCATE 7, 19, 0: COLOR 11: PRINT "Done"
a = 14: c = 1
GOTO PassEntryA

PassCheck:

DIM P(6)

IF User = 1 THEN OPEN "I", 1, "User1.Dat"
IF User = 2 THEN OPEN "I", 1, "User2.Dat"
IF User = 3 THEN OPEN "I", 1, "User3.Dat"
IF User = 4 THEN OPEN "I", 1, "User4.Dat"
IF User = 5 THEN OPEN "I", 1, "User5.Dat"
IF User = 6 THEN OPEN "I", 1, "User6.Dat"
IF User = 7 THEN OPEN "I", 1, "User7.Dat"
IF User = 8 THEN OPEN "I", 1, "User8.Dat"
IF User = 9 THEN OPEN "I", 1, "User9.Dat"
IF User = 10 THEN OPEN "I", 1, "User10.Dat"
INPUT #1, N$
INPUT #1, P(1)
INPUT #1, P(2)
INPUT #1, P(3)
INPUT #1, P(4)
INPUT #1, P(5)
INPUT #1, P(6)
CLOSE
IF B(1) = P(1) THEN GOTO 1
CHAIN "Security"
1 IF B(2) = P(2) THEN GOTO 2
CHAIN "Security"
2 IF B(3) = P(3) THEN GOTO 3
CHAIN "Security"
3 IF B(4) = P(4) THEN GOTO 4
CHAIN "Security"
4 IF B(5) = P(5) THEN GOTO 5
CHAIN "Security"
5 IF B(6) = P(6) THEN GOTO 6
CHAIN "Security"
6 CALL mboard
END SUB

SUB startup
SCREEN 1: SCREEN 0
OPEN "I", 1, "Startup.Dat"
INPUT #1, a$
CLOSE
IF a$ = "No" THEN GOTO normal
SCREEN 2: SCREEN 0: CLS
SHELL a$
PLAY "MB C8C16F"
a:
LOCATE 23: B$ = INKEY$: IF B$ = "" THEN GOTO a
GOTO UserList
normal:
WIDTH 40: COLOR 1, 0: CLS : PLAY "MB C8C16F"
PRINT "          ษออออออออออออออออออป"
PRINT "          บ    Welcome To    บ"
PRINT "          บ                  บ"
PRINT "          บ     Larry's!     บ"
PRINT "          บ                  บ"
PRINT "          บ    Computer!!    บ"
PRINT "          ศออออออออออออออออออผ"
COLOR 30: PRINT ""
PRINT "    <<<< Press any key to go on >>>>"
LOCATE 2, 16, 0: COLOR 15: PRINT "Welcome To"
LOCATE 4, 17, 0: COLOR 15: PRINT "Larry's!"
LOCATE 6, 16, 0: COLOR 15: PRINT "Computer!!"
normalb:
LOCATE 12: B$ = INKEY$: IF B$ = "" THEN GOTO normalb
GOTO UserList


UserList:
DIM pass(10)
DIM N$(11)

OPEN "I", 1, "User0.Dat"
INPUT #1, N$(0)
INPUT #1, pass(0)
CLOSE

OPEN "I", 1, "User1.Dat"
INPUT #1, N$(1)
INPUT #1, pass(1)
CLOSE

OPEN "I", 1, "User2.Dat"
INPUT #1, N$(2)
INPUT #1, pass(2)
CLOSE

OPEN "I", 1, "User3.Dat"
INPUT #1, N$(3)
INPUT #1, pass(3)
CLOSE

OPEN "I", 1, "User4.Dat"
INPUT #1, N$(4)
INPUT #1, pass(4)
CLOSE

OPEN "I", 1, "User5.Dat"
INPUT #1, N$(5)
INPUT #1, pass(5)
CLOSE

OPEN "I", 1, "User6.Dat"
INPUT #1, N$(6)
INPUT #1, pass(6)
CLOSE

OPEN "I", 1, "User7.Dat"
INPUT #1, N$(7)
INPUT #1, pass(7)
CLOSE

OPEN "I", 1, "User8.Dat"
INPUT #1, N$(8)
INPUT #1, pass(8)
CLOSE

OPEN "I", 1, "User9.Dat"
INPUT #1, N$(9)
INPUT #1, pass(9)
CLOSE

OPEN "I", 1, "User10.Dat"
INPUT #1, N$(10)
INPUT #1, pass(10)
CLOSE
N$(10) = "New"
REM"Screen"
WIDTH 40
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "     ฦอออต What's Your Name?? ฦอออต"
LOCATE 1, 12, 0: COLOR 15: PRINT "What's Your Name??"
COLOR 1: PRINT ""
PRINT "          ษออออออออออออออออออป"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          ศออออออออออออออออออผ"
PRINT ""
COLOR 15: PRINT "Use the arrow keys to choose,"
PRINT "then press <ENTER> or <SPACE>."
COLOR 11: PRINT "Press <ESC> to quit."
c = 1: N$(10) = "New": N$(0) = "Just Browsing": N$(11) = N$(0)
UserListA:
LOCATE 4, 12, 0: COLOR c: PRINT N$(1)
LOCATE 5, 12, 0: COLOR c: PRINT N$(2)
LOCATE 6, 12, 0: COLOR c: PRINT N$(3)
LOCATE 7, 12, 0: COLOR c: PRINT N$(4)
LOCATE 8, 12, 0: COLOR c: PRINT N$(5)
LOCATE 9, 12, 0: COLOR c: PRINT N$(6)
LOCATE 10, 12, 0: COLOR c: PRINT N$(7)
LOCATE 11, 12, 0: COLOR c: PRINT N$(8)
LOCATE 12, 12, 0: COLOR c: PRINT N$(9)
LOCATE 13, 12, 0: COLOR c: PRINT N$(10)
LOCATE 14, 12, 0: COLOR c: PRINT N$(0)
IF c = 11 THEN GOTO UserListB
c = 11: GOTO UserListA

UserListB:
a = 4: B = 1
UserListC:
LOCATE a, 12, 0: COLOR 15: PLAY "F32": PRINT N$(B)
UserListD:
B$ = INKEY$: IF B$ = "" THEN GOTO UserListD
IF B$ = CHR$(0) + "H" THEN GOTO UserListE
IF B$ = CHR$(0) + "P" THEN GOTO UserListF
IF B$ = CHR$(13) THEN GOTO UserListG
IF B$ = " " THEN GOTO UserListG
IF B$ = CHR$(27) THEN SYSTEM
GOTO UserListD

UserListE:
LOCATE a, 12, 0: COLOR 11: PRINT N$(B)
a = a - 1: B = B - 1
IF B < 1 THEN B = 11: a = 14
GOTO UserListC

UserListF:
LOCATE a, 12, 0: COLOR 11: PRINT N$(B)
a = a + 1: B = B + 1
IF B > 11 THEN a = 4: B = 1
GOTO UserListC

UserListG:
IF B = 11 THEN B = 0
User = B
IF N$(B) = "New" THEN CHAIN "Config"
IF User = 0 THEN CALL mboard
IF pass(B) = 6 THEN CALL mboard
CALL PassEntry
END SUB

