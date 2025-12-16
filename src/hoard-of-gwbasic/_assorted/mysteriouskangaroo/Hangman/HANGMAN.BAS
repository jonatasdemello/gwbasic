DECLARE SUB Redo ()
DECLARE SUB PictLoad ()
DECLARE SUB Game ()
DECLARE SUB Config ()
'  Qbasic Hangman Game!   By Larry Strong  1994
'  You need a color VGA monitor to use this program
COMMON SHARED FileName$, Games
1
SCREEN 0: WIDTH 40: CLS : PLAY "MB C8C16F"

COLOR 5: PRINT "ฦอออออออออออออต Hangman! ฦอออออออออออออต"
LOCATE 1, 17, 0: COLOR 15: PRINT "Hangman!"
PRINT "": COLOR 3
PRINT "(1) Start the Game!"
PRINT "(2) Change game settings."
PRINT "(3) Quit the game."

AA:
B$ = INKEY$
IF B$ = "1" THEN GOTO BeginGame: GOTO 1
IF B$ = "2" THEN GOTO CallConfig: GOTO 1
IF B$ = "3" THEN SYSTEM
GOTO AA

BeginGame:
CALL Game
SCREEN 0: WIDTH 40
GOTO 1

CallConfig:
CALL Config
GOTO 1

SUB Config
CLS : SOUND 1500, 2
COLOR 5: PRINT "ฦอออออออออออออต Hangman! ฦอออออออออออออต"
LOCATE 1, 17, 0: COLOR 15: PRINT "Hangman!"
PRINT "": COLOR 15
PRINT "How many letters should be in each word?"
PRINT "": COLOR 3:
PRINT "3,4,5,6,7,8, or (R)andom?"
ConfigA:
B$ = INKEY$:
IF B$ = "3" OR B$ = "4" OR B$ = "5" OR B$ = "6" OR B$ = "7" OR B$ = "8" OR B$ = "R" OR B$ = "r" THEN GOTO ConfigB
GOTO ConfigA
ConfigB:
IF B$ = "r" THEN B$ = "R"
OPEN "O", 1, "Hangman.dat"
PRINT #1, B$
CLOSE
PRINT "": COLOR 31: PRINT "All Set!!"
A = 0
ConfigC:
A = A + 1: IF A = 1500 THEN GOTO ConfigD
GOTO ConfigC:
ConfigD:
END SUB

SUB Game
MainBegin:
Z = 0
DIM CC$(8)
RR = 0
SOUND 1500, 2
SCREEN 12
FileName$ = "Hangroom.pic"
CALL PictLoad
MainFileLoad:
OPEN "I", 1, "Hangman.Dat"
INPUT #1, A$
CLOSE
LOCATE 21, 46, 0: COLOR 15: PRINT "Countdown: "; Count
IF A$ = "R" THEN GOTO RandomOpen
IF A$ = "3" THEN WL = 3: OPEN "I", 1, "HangWD3.Dat"
IF A$ = "4" THEN WL = 4: OPEN "I", 1, "HangWD4.Dat"
IF A$ = "5" THEN WL = 5: OPEN "I", 1, "HangWD5.Dat"
IF A$ = "6" THEN WL = 6: OPEN "I", 1, "HangWD6.Dat"
IF A$ = "7" THEN WL = 7: OPEN "I", 1, "HangWD7.Dat"
IF A$ = "8" THEN WL = 8: OPEN "I", 1, "HangWD8.Dat"
DIM W$(1800): W = 0
FileLoadA:
LOCATE 11, 10, 0: COLOR 14: PRINT "Please Wait"
INPUT #1, W$(W)
IF W$(W) = "***" OR W + 1 > 1800 THEN WF = W - 1: GOTO fileLoadB:
W = W + 1: IF W > 1800 THEN WF = W - 1: GOTO fileLoadB
GOTO FileLoadA:
fileLoadB:
W = 0
CLOSE
GOTO WordChoose

RandomOpen:
RANDOMIZE TIMER
RandomOpenA:
A = INT(RND * 8)
IF A < 3 THEN A = 3: GOTO RandomOpenA
IF A = 3 THEN OPEN "I", 1, "HangWD3.Dat"
IF A = 4 THEN OPEN "I", 1, "HangWD4.Dat"
IF A = 5 THEN OPEN "I", 1, "HangWD5.Dat"
IF A = 6 THEN OPEN "I", 1, "HangWD6.Dat"
IF A = 7 THEN OPEN "I", 1, "HangWD7.Dat"
IF A = 8 THEN OPEN "I", 1, "HangWD8.Dat"
WL = A
DIM W$(1800): W = 0
GOTO FileLoadA

WordChoose:
RANDOMIZE TIMER
Word = INT(RND * WF)
Word$ = W$(Word)
ERASE W$

WordBreak:
DIM L$(WL)
L$(1) = MID$(Word$, 1, 1)
L$(2) = MID$(Word$, 2, 1)
L$(3) = MID$(Word$, 3, 1)
IF WL = 3 THEN GOTO Main
L$(4) = MID$(Word$, 4, 1)
IF WL = 4 THEN GOTO Main
L$(5) = MID$(Word$, 5, 1)
IF WL = 5 THEN GOTO Main
L$(6) = MID$(Word$, 6, 1)
IF WL = 6 THEN GOTO Main
L$(7) = MID$(Word$, 7, 1)
IF WL = 7 THEN GOTO Main
L$(8) = MID$(Word$, 8, 1)
GOTO Main

Main:
LOCATE 27: PRINT "                                                                   "
LOCATE 28: PRINT "                                                                   "
M = 1
DIM M$(15)
LOCATE 28: PRINT "Press <ESC> to quit."
LOCATE 14, 15, 0: COLOR 15
IF WL = 3 THEN PRINT "_ _ _"
IF WL = 4 THEN PRINT "_ _ _ _"
IF WL = 5 THEN PRINT "_ _ _ _ _"
IF WL = 6 THEN PRINT "_ _ _ _ _ _"
IF WL = 7 THEN PRINT "_ _ _ _ _ _ _"
IF WL = 8 THEN PRINT "_ _ _ _ _ _ _ _"
Count = WL
LOCATE 21, 46, 0: COLOR 15: PRINT "Countdown: "; Count
LOCATE 11, 10, 0: COLOR 15: PRINT "Please choose a letter:"
LOCATE 24, 5, 0: PRINT "Letters missed:"
MainA:
LOCATE 29: B$ = INKEY$
IF B$ = "a" OR B$ = "A" THEN B$ = "A": GOTO MainB
IF B$ = "b" OR B$ = "B" THEN B$ = "B": GOTO MainB
IF B$ = "c" OR B$ = "C" THEN B$ = "C": GOTO MainB
IF B$ = "d" OR B$ = "D" THEN B$ = "D": GOTO MainB
IF B$ = "e" OR B$ = "E" THEN B$ = "E": GOTO MainB
IF B$ = "f" OR B$ = "F" THEN B$ = "F": GOTO MainB
IF B$ = "g" OR B$ = "G" THEN B$ = "G": GOTO MainB
IF B$ = "h" OR B$ = "H" THEN B$ = "H": GOTO MainB
IF B$ = "i" OR B$ = "I" THEN B$ = "I": GOTO MainB
IF B$ = "j" OR B$ = "J" THEN B$ = "J": GOTO MainB
IF B$ = "k" OR B$ = "K" THEN B$ = "K": GOTO MainB
IF B$ = "l" OR B$ = "L" THEN B$ = "L": GOTO MainB
IF B$ = "m" OR B$ = "M" THEN B$ = "M": GOTO MainB
IF B$ = "n" OR B$ = "N" THEN B$ = "N": GOTO MainB
IF B$ = "o" OR B$ = "O" THEN B$ = "O": GOTO MainB
IF B$ = "p" OR B$ = "P" THEN B$ = "P": GOTO MainB
IF B$ = "q" OR B$ = "Q" THEN B$ = "Q": GOTO MainB
IF B$ = "r" OR B$ = "R" THEN B$ = "R": GOTO MainB
IF B$ = "s" OR B$ = "S" THEN B$ = "S": GOTO MainB
IF B$ = "t" OR B$ = "T" THEN B$ = "T": GOTO MainB
IF B$ = "u" OR B$ = "U" THEN B$ = "U": GOTO MainB
IF B$ = "v" OR B$ = "V" THEN B$ = "V": GOTO MainB
IF B$ = "w" OR B$ = "W" THEN B$ = "W": GOTO MainB
IF B$ = "x" OR B$ = "X" THEN B$ = "X": GOTO MainB
IF B$ = "y" OR B$ = "Y" THEN B$ = "Y": GOTO MainB
IF B$ = "z" OR B$ = "Z" THEN B$ = "Z": GOTO MainB
IF B$ = CHR$(27) THEN ERASE L$: EXIT SUB
GOTO MainA

MainB:

EE = 0
MainBB:
IF B$ = M$(EE) THEN SOUND 40, 2: R = R + RR: GOTO MainA
EE = EE + 1: IF EE < 13 THEN GOTO MainBB
RR = 0
IF B$ = L$(1) THEN RR = RR + 1: LOCATE 14, 15, 0: COLOR 15: PRINT B$:
IF B$ = L$(2) THEN RR = RR + 1: LOCATE 14, 17, 0: COLOR 15: PRINT B$:
IF B$ = L$(3) THEN RR = RR + 1: LOCATE 14, 19, 0: COLOR 15: PRINT B$:
IF WL = 3 THEN
IF win = 3 THEN GOTO win
GOTO MainC
END IF
IF B$ = L$(4) THEN RR = RR + 1: LOCATE 14, 21, 0: COLOR 15: PRINT B$:
IF WL = 4 THEN
IF win = 4 THEN GOTO win
GOTO MainC
END IF
IF B$ = L$(5) THEN RR = RR + 1:  LOCATE 14, 23, 0: COLOR 15: PRINT B$:
IF WL = 5 THEN
IF win = 5 THEN GOTO win
GOTO MainC
END IF
IF B$ = L$(6) THEN RR = RR + 1:  LOCATE 14, 25, 0: COLOR 15: PRINT B$:
IF WL = 6 THEN
IF win = 6 THEN GOTO win
GOTO MainC
END IF
IF B$ = L$(7) THEN RR = RR + 1:  LOCATE 14, 27, 0: COLOR 15: PRINT B$:
IF WL = 7 THEN
IF win = 7 THEN GOTO win
GOTO MainC
END IF
IF B$ = L$(8) THEN RR = RR + 1: LOCATE 14, 29, 0: COLOR 15: PRINT B$:
IF win = 8 THEN GOTO win
MainC:
IF RR = 0 THEN GOTO Wrong
LL = 0
MainD:
IF B$ = CC$(LL) THEN SOUND 100, 2: LOCATE 1: PRINT "Nope!": RR = 0: R = R - RR: GOTO MainA
LL = LL + 1
IF LL = 9 THEN SOUND 1500, 2: CC$(R) = B$: R = R + RR: GOTO MainE
GOTO MainD
MainE:
IF R = WL THEN GOTO win
GOTO MainA

Wrong:
ZZ = ZZ + 1
SOUND 40, 2: Count = Count - 1: IF Count < 0 THEN Count = 0
LOCATE 21, 46, 0: COLOR 15: PRINT "Countdown: "; Count
IF Count = 0 THEN Z = Z + 1
M$(ZZ) = B$

LOCATE 24, 22, 0: COLOR 15: PRINT M$(1); " "; M$(2); " "; M$(3); " "; M$(4); " "; M$(5); " "; M$(6); " "; M$(7); " "; M$(8); " "; M$(9); " "; M$(10); " "; M$(11); " "; M$(12)
IF Z = 0 THEN R = R + RR: GOTO MainA
IF Z = 1 THEN FileName$ = "Hung0001.Pic"
IF Z = 2 THEN FileName$ = "Hung0002.Pic"
IF Z = 3 THEN FileName$ = "Hung0003.Pic"
IF Z = 4 THEN FileName$ = "Hung0004.Pic"
IF Z = 5 THEN FileName$ = "Hung0005.Pic"
IF Z = 6 THEN FileName$ = "Hung0006.Pic": CALL PictLoad: GOTO Loose
CALL PictLoad
R = R + RR: GOTO MainA

win:
PLAY "C8C16F"
IF Games < 5 THEN LOCATE 27: COLOR 15: PRINT "You won!!!!"
IF Games = 5 THEN LOCATE 27: COLOR 15: PRINT "YOU WON FIVE TIMES!!!!      Game over,      Play again!!"
LOCATE 28: COLOR 11: PRINT "Press any key to continue..."
WinB:
B$ = INKEY$: IF B$ = "" THEN GOTO WinB
ERASE CC$, M$, L$
RR = 0: R = 0
CALL Redo
GOTO MainBegin

Loose:
SOUND 200, 5
SOUND 100, 5
DeadA:
B$ = INKEY$: IF B$ = "" THEN GOTO DeadA
SCREEN 12: CLS 1: CLS 2
PLAY "mb g16a16g16f16e16d16c"
COLOR 15: PRINT "Game Over!!"
PRINT "": COLOR 14: PRINT "Thank you for playing!!"
DeadB:
B$ = INKEY$: IF B$ = "" THEN GOTO DeadB
END SUB

SUB PictLoad
VIEW (0, 0)-(639, 415)
OPEN "I", 1, FileName$
PictLoadA:
INPUT #1, A$
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

SUB Redo
Games = Games + 1
CLS 2
IF Games = 6 THEN CHAIN "Hangman"
END SUB

