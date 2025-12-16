DECLARE SUB Dialog (X!, Y!, CC!, C!, M$)
DECLARE SUB NameEnter (M$, N!, CC)
DECLARE SUB Title (T$)
DECLARE SUB NewGame ()
DECLARE SUB BeginGame ()
DECLARE SUB Continue ()
DECLARE SUB DeleteGame ()
DECLARE SUB Choose (N, L, C)
DECLARE SUB Center80 (row, text$)
DECLARE SUB Frame (TX, TY, BX, BY, C, CC, CCC)
DECLARE SUB MainMenu ()
DECLARE SUB ErrorControl ()
COMMON SHARED PlayerName$(), HP, MP, GP, Item$(), Item(), Level, Choice$(), Extra$, Extra, Ex$, Ex
DIM Choice$(50)
DIM PlayerName$(3)
0
CALL MainMenu
GOTO 0
END
Errors:
Extra = ERR
Ex = ERL
CALL ErrorControl
END

SUB BeginGame

END SUB

SUB box (TX, TY, BX, BY, C)
LINE (TX, TY)-(BX, BY), C, B
END SUB

SUB Center40 (row, text$)
LOCATE row, 21 - LEN(text$) / 2, 0
    PRINT text$;
END SUB

SUB Center80 (row, text$)
LOCATE row, 41 - LEN(text$) / 2, 0
    PRINT text$;
END SUB

SUB Choose (N, L, C)
'(N = Number of choices, L = top line of list, C = Column where list is printed)
A = L: B = 1
ChoiceAA:
LOCATE A, C, 0: COLOR 3: PRINT Choice$(B)
B = B + 1: A = A + 1
IF B > N THEN B = 1: A = L: GOTO Choice
GOTO ChoiceAA
Choice:
LOCATE A, C, 0: COLOR 15: PLAY "F32": PRINT Choice$(B)
ChoiceA:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN
LOCATE A, C, 0: COLOR 3: PRINT Choice$(B)
A = A - 1: B = B - 1
IF B < 1 THEN B = N: A = A + N
GOTO Choice
END IF
IF B$ = CHR$(0) + "P" THEN
LOCATE A, C, 0: COLOR 3: PRINT Choice$(B)
A = A + 1: B = B + 1
IF B > N THEN B = 1: A = L
GOTO Choice
END IF
IF B$ = CHR$(13) OR B$ = " " THEN Ex = B:  EXIT SUB
GOTO ChoiceA

END SUB

SUB Continue
END SUB

SUB DeleteGame
END SUB

SUB Dialog (X, Y, CC, C, M$)
A = LEN(M$)

LINE (X, Y)-(X + A * 8 + 16, Y + 45), CC, B
LINE (X + 1, Y + 1)-(X + A * 8 + 16 - 1, Y + 44), CC, B
LINE (X + 3, Y + 3)-(X + A * 8 + 16 - 3, Y + 42), CC, B

Y = Y + 32
B = Y / 16
X = X + 16
BB = X / 8
LOCATE B, BB, 0: COLOR C: PRINT M$

END SUB

SUB ErrorControl
BEEP
SCREEN 0: CLS
COLOR 20
PRINT "Error!"
COLOR 7: PRINT "Error Code: "; Extra
PRINT "Last Line number: "; Ex
END SUB

SUB Frame (TX, TY, BX, BY, C, CC, CCC)
LINE (TX, TY)-(BX, BY), C, B
LINE (TX - 1, TY - 1)-(BX + 1, BY + 1), CC, B
LINE (TX - 2, TY - 2)-(BX + 2, BY + 2), CCC, B
LINE (TX - 3, TY - 3)-(BX + 3, BY + 3), CC, B
LINE (TX - 4, TY - 4)-(BX + 4, BY + 4), C, B
END SUB

SUB MainMenu
MainMenu:
1
SCREEN 12: SOUND 1500, 2
LOCATE 1, 1, 0: COLOR 5: PRINT "ฦออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออต"
Center80 1, "ต Main  Menu ฦ"
COLOR 15: Center80 1, "Main  Menu"
LOCATE 2, 1, 0: COLOR 15: PRINT "What would you like to do?"
Choice$(1) = "Begin a new game."
Choice$(2) = "Continue a saved game."
Choice$(3) = "Erase a saved game."
Choice$(4) = "Quit this game."
Choose 4, 4, 1
IF Ex = 1 THEN GOTO New
IF Ex = 2 THEN GOTO Old
IF Ex = 3 THEN GOTO EraseGame
IF Ex = 4 THEN SYSTEM

New:
CALL NewGame
CALL BeginGame
GOTO MainMenu

Old:
CALL Continue
CALL BeginGame
GOTO MainMenu

EraseGame:
CALL DeleteGame
GOTO MainMenu
END SUB

SUB NameEnter (M$, N, CC)
X = 320 - 316 / 2
Y = 100
LINE (X, Y)-(X + 316, Y + 80), CC, B
LINE (X + 1, Y + 1)-(X + 315, Y + 79), CC, B
LINE (X + 3, Y + 3)-(X + 313, Y + 77), CC, B

LINE (245, 143)-(395, 161), CC, B

COLOR 15: Center80 8, M$
LOCATE 10, 32, 0: COLOR 15: LINE INPUT PlayerName$(N)
LINE (245, 143)-(395, 161), 0, B
PAINT (X + 4, Y + 4), 0, 1
LINE (X + 3, Y + 3)-(X + 297, Y + 77), 0, B
PAINT (X + 1, Y + 1), 0, 1
PAINT (X, Y), 0, 0
LOCATE 8, 23, 0: COLOR 0: PRINT M$
LOCATE 10, 32, 0: COLOR 0: PRINT PlayerName$(N)
END SUB

SUB NewGame
CLS
Title "New Game"
NameEnter "What is your name?", 1, 1
SOUND 1500, 2
NameEnter "Please choose a name for your partner:", 2, 4
LOCATE 2: COLOR 15: PRINT "Hello "; PlayerName$(1); " would you like some instructions?"

END SUB

SUB Title (T$)
M$ = "ต "
M$ = M$ + T$
M$ = M$ + " ฦ"
SCREEN 12: SOUND 1500, 2
LOCATE 1, 1, 0: COLOR 5: PRINT "ฦออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออต"
Center80 1, M$
COLOR 15: Center80 1, T$
LOCATE 2, 1, 0: COLOR 15
END SUB

