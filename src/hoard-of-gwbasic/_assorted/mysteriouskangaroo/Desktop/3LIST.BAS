DECLARE SUB Proglist ()
DECLARE SUB deskchoose ()
COMMON SHARED user, Drive$
ON ERROR GOTO MainC
OPEN "I", 1, "Drive.Dat"
INPUT #1, Drive$
CLOSE
OPEN "I", 1, "Return.Dat"
INPUT #1, a
CLOSE
IF a = 11 THEN GOTO MainA
user = a

MainA:
OPEN "O", 1, "Return.Dat"
PRINT #1, "11"
CLOSE

MakeReturnBatch:
OPEN "O", 1, "Return.Bat"
PRINT #1, "@Echo Off"
PRINT #1, "CD \Desktop"
PRINT #1, "QBasic /Run 3List.Bas"
CLOSE

MainB:
CALL Proglist

MainC:
IF ERR = 53 THEN GOTO MainB:

SUB deskchoose
IF user = 0 THEN OPEN "I", 1, "User0.Dat"
IF user = 1 THEN OPEN "I", 1, "User1.Dat"
IF user = 2 THEN OPEN "I", 1, "User2.Dat"
IF user = 3 THEN OPEN "I", 1, "User3.Dat"
IF user = 4 THEN OPEN "I", 1, "User4.Dat"
IF user = 5 THEN OPEN "I", 1, "User5.Dat"
IF user = 6 THEN OPEN "I", 1, "User6.Dat"
IF user = 7 THEN OPEN "I", 1, "User7.Dat"
IF user = 8 THEN OPEN "I", 1, "User8.Dat"
IF user = 9 THEN OPEN "I", 1, "User9.Dat"
IF user = 10 THEN OPEN "I", 1, "User10.Dat"
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

SUB Proglist

DIM N$(40)
DIM Z$(120)


OPEN "I", 1, "3List.Dat"
a = 1

ListA:
INPUT #1, N$(a)
a = a + 1
IF a = 41 THEN GOTO ListB
GOTO ListA

ListB:

CLOSE
OPEN "I", 1, "CFiles.Dat"
a = 1

ListC:
INPUT #1, Z$(a)
a = a + 1
IF a = 121 THEN GOTO ListD
GOTO ListC

ListD:

CLOSE
IF user = 0 THEN OPEN "I", 1, "User0.Dat"
IF user = 1 THEN OPEN "I", 1, "User1.Dat"
IF user = 2 THEN OPEN "I", 1, "User2.Dat"
IF user = 3 THEN OPEN "I", 1, "User3.Dat"
IF user = 4 THEN OPEN "I", 1, "User4.Dat"
IF user = 5 THEN OPEN "I", 1, "User5.Dat"
IF user = 6 THEN OPEN "I", 1, "User6.Dat"
IF user = 7 THEN OPEN "I", 1, "User7.Dat"
IF user = 8 THEN OPEN "I", 1, "User8.Dat"
IF user = 9 THEN OPEN "I", 1, "User9.Dat"
IF user = 10 THEN OPEN "I", 1, "User10.Dat"
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, a$
INPUT #1, PF
INPUT #1, PM
INPUT #1, PH
INPUT #1, PT
INPUT #1, PQ
CLOSE
SCREEN 0: WIDTH 40
PALETTE 1, PF: PF = 1
PALETTE 2, PM: PM = 2
PALETTE 3, PH: PH = 3
PALETTE 4, PT: PT = 4
PQ = PT
 
COLOR PF, 0: CLS : SOUND 1500, 2
PRINT "ษออออออออต Program List ฦออออออออป"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "บ                                บ"
PRINT "ศอออออต Press ESC to quit. ฦอออออผ"
LOCATE 1, 12, 0: COLOR PT: PRINT "Program List"
LOCATE 22, 9, 0: COLOR PQ: PRINT "Press ESC to quit."

a = 2: B = 1: c = 1

ListE:
LOCATE a, 2, 0: COLOR c: PRINT N$(B)
a = a + 1: B = B + 1
IF B = 21 THEN GOTO ListF
GOTO ListE

ListF:
IF c = PM THEN GOTO ListG
c = PM: a = 2: B = 1: GOTO ListE

ListG:
a = 2: B = 21: c = 1

ListH:
LOCATE a, 19, 0: COLOR c: PRINT N$(B)
a = a + 1: B = B + 1
IF B = 41 THEN GOTO ListI
GOTO ListH

ListI:
IF c = PM THEN GOTO ListJ
c = PM: a = 2: B = 21: GOTO ListH

ListJ:
 
a = 2: B = 1

ListK:
LOCATE a, 2, 0: COLOR PH: PLAY "F32": PRINT N$(B)
ListL:
B$ = INKEY$: IF B$ = "" THEN GOTO ListL
IF B$ = CHR$(0) + "H" THEN GOTO ListM
IF B$ = CHR$(0) + "P" THEN GOTO ListN
IF B$ = CHR$(0) + "M" THEN GOTO ListO
IF B$ = CHR$(0) + "K" THEN GOTO ListO
IF B$ = CHR$(13) GOTO MakeBatch
IF B$ = CHR$(27) THEN CALL deskchoose
IF B$ = " " THEN GOTO MakeBatch
GOTO ListL

ListM:
LOCATE a, 2, 0: COLOR PM: PRINT N$(B)
a = a - 1: B = B - 1
IF B = 0 THEN a = 21: B = 40: GOTO ListQ
GOTO ListK

ListN:        
LOCATE a, 2, 0: COLOR PM: PRINT N$(B)
a = a + 1: B = B + 1
IF B = 21 THEN a = 2: GOTO ListP
GOTO ListK

ListO:
LOCATE a, 2, 0: COLOR PM: PRINT N$(B)
B = B + 20: GOTO ListQ

ListP:

a = 2: B = 21

ListQ:
LOCATE a, 19, 0: COLOR PH: PLAY "F32": PRINT N$(B)
ListR:
B$ = INKEY$: IF B$ = "" THEN GOTO ListR
IF B$ = CHR$(0) + "H" THEN GOTO ListS
IF B$ = CHR$(0) + "P" THEN GOTO ListT
IF B$ = CHR$(0) + "M" THEN GOTO ListU
IF B$ = CHR$(0) + "K" THEN GOTO ListU
IF B$ = CHR$(13) GOTO MakeBatch
IF B$ = CHR$(27) THEN CALL deskchoose
IF B$ = " " THEN GOTO MakeBatch
GOTO ListR

ListS:
LOCATE a, 19, 0: COLOR PM: PRINT N$(B)
a = a - 1: B = B - 1
IF B = 20 THEN a = 21: B = 20: GOTO ListK
GOTO ListQ

ListT:
LOCATE a, 19, 0: COLOR PM: PRINT N$(B)
a = a + 1: B = B + 1
IF B = 41 THEN B = 1: a = 2: GOTO ListK
GOTO ListQ

ListU:
LOCATE a, 19, 0: COLOR PM: PRINT N$(B)
B = B - 20: GOTO ListK

MakeBatch:
SOUND 1500, 2
IF N$(B) = "Empty" THEN CALL Proglist
OPEN "O", 1, "Return.Dat"
PRINT #1, user
CLOSE

OPEN "O", 1, "DeskShel.Bat"
PRINT #1, "Echo Off"
PRINT #1, Z$(B + 80)
PRINT #1, "CD "; Z$(B + 40)
PRINT #1, Z$(B)
PRINT #1, Drive$
PRINT #1, "CD \Desktop"
CLOSE
SYSTEM
END SUB

