DECLARE SUB deskchoose ()
COMMON SHARED User
ON ERROR GOTO E
0 SCREEN 12
Date:
COLOR 14: SOUND 1500, 2
PRINT "Current Date is: "; DATE$
PRINT "": PRINT "Enter new Date: (mm-dd-yy)"
1
COLOR 3: INPUT "", CurDate$
Time:
COLOR 13
PRINT ""
PRINT "Current Time is: "; TIME$
PRINT "": PRINT "Enter new Time: (hh:mm:ss)": PRINT "(millitary time)"
2
COLOR 1: INPUT "", CurTime$

3
DATE$ = CurDate$
TIME$ = CurTime$

Leave:
CALL deskchoose


E:
IF ERR = 5 THEN
IF ERL = 0 THEN SCREEN 2: SCREEN 0: GOTO Date
END IF
IF ERL = 1 THEN GOTO Time
IF ERL = 2 THEN GOTO 3
GOTO Leave

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

