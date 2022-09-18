DECLARE SUB ALoad (FileName$)
DECLARE SUB HelpScreen ()
DECLARE SUB Center80 (row!, text$)
DECLARE SUB NewPic ()
DECLARE SUB Work ()
DECLARE SUB OldView ()
DECLARE SUB OldWork ()
DECLARE SUB ErrorControl (ER!, EL!)
DECLARE SUB Center40 (row!, text$)
'Ascii Draw!!    Made by Larry!!!!   Feb, 1995!
COMMON SHARED Mode, Cols, Rows, FileName$
Top:
SCREEN 0: WIDTH 40, 25: PLAY "MB C8C16F"
COLOR 5, 0: PRINT "ฦออออออออออออออออออออออออออออออออออออออต"
Center40 1, "ต Ascii Draw!! ฦ"
COLOR 15: Center40 1, "Ascii Draw!!"
LOCATE 2: COLOR 15: PRINT "What would you like to do?"
COLOR 3: PRINT "(1) - Create a new picture"
PRINT "(2) - Work on a saved picture"
PRINT "(3) - View a saved picture"
PRINT "(4) - Quit"
MainA:
B$ = INKEY$
IF B$ = "1" THEN GOTO MainB
IF B$ = "2" THEN GOTO MainC
IF B$ = "3" THEN GOTO MainD
IF B$ = "4" THEN WIDTH 80: END
GOTO MainA

MainB:
CALL NewPic
CALL HelpScreen
CALL Work
GOTO Top

MainC:
CALL OldWork
CALL HelpScreen
CALL Work
GOTO Top

MainD:
CALL OldView
GOTO Top

Errors:
A = ERR
B = ERL
CALL ErrorControl(ERR, ERL)
GOTO Top

SUB ALoad (FileName$)
CLS
X = 1: Y = 1
OPEN "I", 1, FileName$
INPUT #1, Mode, Cols, Rows
SCREEN Mode
WIDTH Cols, Rows
ALoadA:
INPUT #1, A, B
AA = 0: BB = 0
AA = B
IF B > 16 THEN BB = 1: AA = B - 16
IF B > 32 THEN BB = 2: AA = B - 32
IF B > 48 THEN BB = 3: AA = B - 48
IF B > 64 THEN BB = 4: AA = B - 64
IF B > 80 THEN BB = 5: AA = B - 80
IF B > 96 THEN BB = 6: AA = B - 96
IF B > 112 THEN BB = 7: AA = B - 112
IF B > 128 THEN BB = 0: AA = B - 112
IF B > 144 THEN BB = 1: AA = B - 128
IF B > 160 THEN BB = 2: AA = B - 144
IF B > 176 THEN BB = 3: AA = B - 160
IF B > 194 THEN BB = 4: AA = B - 176
IF B > 210 THEN BB = 5: AA = B - 194
IF B > 226 THEN BB = 6: AA = B - 210
IF B > 242 THEN BB = 7: AA = B - 226
LOCATE Y, X, 0: COLOR AA, BB: PRINT CHR$(A)
X = X + 1
IF X > Cols THEN X = 1: Y = Y + 1
IF Y > Rows - 3 THEN CLOSE : GOTO ALoadB
GOTO ALoadA

ALoadB:
END SUB

SUB Center40 (row, text$)
    LOCATE row, 21 - LEN(text$) / 2
    PRINT text$;

END SUB

SUB Center80 (row, text$)
    LOCATE row, 41 - LEN(text$) / 2
    PRINT text$;
END SUB

SUB ErrorControl (ER, EL)
END SUB

SUB HelpScreen
SCREEN 12
CLS : SOUND 1500, 2
COLOR 5: PRINT "ฦออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออต"
Center80 1, "ต Help  Screen ฦ"
COLOR 15: Center80 1, "Help  Screen"
LOCATE 2, 1, 0: COLOR 15
PRINT "Here are some commands you will NEED to know!"
COLOR 3: PRINT ""
PRINT "ESC = Quit and save."
PRINT "PgUp & PgDn = Change Colors."
PRINT "Home & End = Change character set."
PRINT "TAB = change background color."
PRINT "": COLOR 15
PRINT "Press any key to continue...."
HelpA:
B$ = INKEY$
IF B$ = "" THEN GOTO HelpA
END SUB

SUB NewPic
DIM S$(10)
S$(1) = "80x25"
S$(2) = "80x43"
S$(3) = "80x50"
S$(4) = "40x25"
S$(5) = "40x43"
S$(6) = "40x50"
S$(7) = "80x30"
S$(8) = "80x60"
SCREEN 12: WIDTH 80: SOUND 1500, 2
COLOR 5: PRINT "ฦออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออต"
Center80 1, "ต New Picture! ฦ"
COLOR 15: Center80 1, "New Picture!"
LOCATE 2, 1: COLOR 15: PRINT "What screen mode would you like to use?"
COLOR 14
PRINT "Screen 0"
LOCATE 11, 1, 0: COLOR 14: PRINT "Screen 12"
A = 4: B = 1: C = 3
NewPicA:
LOCATE A, 1, 0: COLOR C: PRINT S$(B)
A = A + 1: B = B + 1
IF A = 10 THEN A = 12: B = 7
IF B = 9 THEN GOTO NewPicB
GOTO NewPicA

NewPicB:
A = 4: B = 1: C = 15
NewPicC:
LOCATE A, 1, 0: COLOR 15: PLAY "F32": PRINT S$(B)
NewPicD:
B$ = INKEY$
IF B$ = " " OR B$ = CHR$(13) THEN GOTO NewPicE
IF B$ = CHR$(0) + "H" THEN
LOCATE A, 1, 0: COLOR 3: PRINT S$(B)
A = A - 1: B = B - 1
IF B = 0 THEN A = 13: B = 8
IF A = 11 THEN A = 9
GOTO NewPicC
END IF
IF B$ = CHR$(0) + "P" THEN
LOCATE A, 1, 0: COLOR 3: PRINT S$(B)
A = A + 1: B = B + 1
IF A = 10 THEN A = 12
IF A = 14 THEN A = 4: B = 1
GOTO NewPicC
END IF
GOTO NewPicD

NewPicE:
IF B = 1 THEN Cols = 80: Rows = 25
IF B = 2 THEN Cols = 80: Rows = 43
IF B = 3 THEN Cols = 80: Rows = 50
IF B = 4 THEN Cols = 40: Rows = 25
IF B = 5 THEN Cols = 40: Rows = 43
IF B = 6 THEN Cols = 40: Rows = 50
IF B = 7 THEN Cols = 80: Rows = 30
IF B = 8 THEN Cols = 80: Rows = 60
IF B > 6 THEN Mode = 12
CLS : SOUND 1500, 2
COLOR 5: PRINT "ฦออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออต"
Center80 1, "ต New Picture! ฦ"
COLOR 15: Center80 1, "New Picture!"
LOCATE 2, 1, 0: COLOR 15: PRINT "What should this picture be saved as?"
COLOR 9: PRINT "8 char. max. (*.ASC)"
LOCATE 27, 1, 0: COLOR 15: PRINT "Please type the file name without an extention!"
LOCATE 4, 1, 0: LINE INPUT FileName$
FileName$ = FileName$ + ".ASC"
END SUB

SUB OldView
SCREEN 0: WIDTH 80
CLS
PRINT "What is the name of the file you would like to open?"
LINE INPUT FileName$
FileName$ = FileName$ + ".ASC"
ALoad (FileName$)
LOCATE Rows - 2: INPUT Enter
END SUB

SUB OldWork
END SUB

SUB Work
SCREEN Mode
WIDTH Cols, Rows
CLS
SOUND 1500, 2
LOCATE 1, 1, 0: COLOR C, BC + 1: PRINT " "
X = 1: Y = 1
C = 15
BC = 0
A:
B$ = INKEY$
IF B$ = CHR$(0) + "Q" THEN
C = C + 1
IF C > 31 THEN C = 0
LOCATE Y, X, 0: COLOR C, BC: PRINT " ": GOTO A
END IF
IF B$ = CHR$(0) + "I" THEN
C = C - 1
IF C < 1 THEN C = 31
LOCATE Y, X, 0: COLOR C, BC: PRINT " ": GOTO A
END IF
IF B$ = CHR$(9) THEN
BC = BC + 1
IF BC > 15 THEN BC = 0
LOCATE Y, X, 0: COLOR C, BC: PRINT " ": GOTO A
END IF
IF B$ = CHR$(27) THEN GOTO SavePic
IF B$ = "" THEN GOTO A
IF B$ = CHR$(13) OR B$ = CHR$(8) OR B$ = CHR$(0) + "H" OR B$ = CHR$(0) + "P" OR B$ = CHR$(0) + "K" OR B$ = CHR$(0) + "M" THEN LOCATE Y, X, 0: COLOR C, BC: PRINT CHR$(A)
IF B$ = CHR$(8) THEN X = X - 1: Z = 1
IF B$ = CHR$(13) THEN Y = Y + 1: X = 0: Z = 1
IF B$ = CHR$(0) + "H" THEN Y = Y - 1: Z = 1
IF B$ = CHR$(0) + "P" THEN Y = Y + 1: Z = 1
IF B$ = CHR$(0) + "K" THEN X = X - 1: Z = 1
IF B$ = CHR$(0) + "M" THEN X = X + 1: Z = 1
IF X < 1 THEN X = 1
IF X > Cols THEN X = Cols
IF Y < 1 THEN Y = 1
IF Y > Rows - 3 THEN Y = Rows - 3
IF Z = 1 THEN Z = 0: GOTO C
LOCATE Y, X, 1: COLOR C, 0: PRINT B$
X = X + 1
Z = SCREEN(Y, X - 1, 0)
LOCATE Y, X - 1, 0: COLOR C, BC: PRINT CHR$(Z)
C:
IF X > 80 THEN X = 80
A = SCREEN(Y, X, 0)
LOCATE Y, X, 0: COLOR C, BC + 1: PRINT CHR$(A)
GOTO A

SavePic:
OPEN "O", 1, FileName$
PRINT #1, Mode, Cols, Rows
X = 1: Y = 1
SaveA:
WRITE #1, SCREEN(Y, X, 0), SCREEN(Y, X, 1)
X = X + 1
IF X > Cols THEN
X = 1: Y = Y + 1
IF Y > Rows - 3 THEN CLOSE : GOTO SaveB
END IF
GOTO SaveA

SaveB:
END SUB

