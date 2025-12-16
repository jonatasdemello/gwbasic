DECLARE SUB ChatMode ()
DECLARE SUB SignOn ()
DECLARE SUB Center40 (row!, text$)
DECLARE SUB MainStartup ()
COMMON SHARED User$(), Jack$(), Jack(), ChatA$, ChatB$, R, YName$, TName$, YColor, TColor
DIM User$(500)

A:
CALL MainStartup
CALL SignOn
GOTO A

SUB Center40 (row, text$)
LOCATE row, 21 - LEN(text$) / 2
    PRINT text$;
END SUB

SUB Center80 (row, text$)
LOCATE row, 41 - LEN(text$) / 2
    PRINT text$;
END SUB

SUB ChatMode
COLOR TColor
CALL Brain
END SUB

SUB MainStartup
SCREEN 0: WIDTH 40: CLS : PLAY "MB C8C16F"
COLOR 5: PRINT "ฦออออออออออออออออออออออออออออออออออออออต"
Center40 1, "ต Fun Chat!! ฦ"
COLOR 15: Center40 1, "Fun Chat!!"
LOCATE 2: PRINT "": COLOR 11
PRINT "What is your name?"
COLOR 9: LINE INPUT "Name: ", YName$
LOCATE 6: COLOR 11: PRINT "Are you (M)ale or (F)emale?"
LOCATE 6, 10, 0: COLOR 15: PRINT "M": LOCATE 6, 20, 0: PRINT "F"
MS:
B$ = INKEY$
B$ = UCASE$(B$)
IF B$ = "M" THEN User$(0) = "M": EXIT SUB
IF B$ = "F" THEN User$(0) = "F": EXIT SUB
GOTO MS
END SUB

SUB Rand (MAX)
R = 0
RANDOMIZE TIMER: R = INT(RND * MAX)
END SUB

SUB SignOn
TName$ = "Jack"
OPEN "O", 1, "FunChat.Log"
PRINT #1, "Log created on "; DATE$; " at "; TIME$; ""
PRINT #1, "People chatting:   "; YName$; " (real person), and "; TName$; " (Fake person)"
SCREEN 12: CLS
COLOR 3: PRINT "Press any key to continue....."
SO:
B$ = INKEY$
IF B$ = "" THEN GOTO SO
SOUND 1500, 2
CALL ChatMode
END SUB

