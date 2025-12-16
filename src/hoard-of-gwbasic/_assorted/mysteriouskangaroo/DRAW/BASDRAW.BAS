DECLARE SUB Save (D!)
DECLARE SUB PictLoad ()
' If you want to be able to load pictures from this program
' Copy everything in the "PictLoad" sub into your program
COMMON SHARED Filename$
1 SCREEN 1: SCREEN 0: COLOR 14, 0: CLS : SOUND 1500, 2
PRINT "<<<<<<<<<< Basic Draw! >>>>>>>>>>"
PRINT "": COLOR 3
PRINT "(1) Start new picture."
PRINT "(2) Look at a saved picture"
PRINT "(3) Draw on a saved picture"
PRINT "(4) Quit": LOCATE 22, 1, 0: COLOR 15: PRINT "You must have a color VGA monitor to usethis program"
A:
B$ = INKEY$
IF B$ = "1" THEN GOTO B
IF B$ = "2" THEN GOTO PictLoad
IF B$ = "3" THEN GOTO DrawLoad
IF B$ = "4" THEN END
GOTO A

B:
SCREEN 0: WIDTH 40, 25
CLS : COLOR 14: SOUND 1500, 2
PRINT "<<<<<<<<<< Commands >>>>>>>>>>"
PRINT "": COLOR 15
PRINT "Here are the commands you can use."
PRINT "": COLOR 11
PRINT "S - Save picture."
PRINT "C - Change Colors."
PRINT "F - Fill "
PRINT "O - Draw Circle"
COLOR 15: PRINT "Use cursor keys to move"
PRINT "": COLOR 14
PRINT "Please type a name for this file."
COLOR 9: PRINT "8 char. max   (*.PIC)"
Z$ = ".PIC"
LINE INPUT Filename$
Filename$ = Filename$ + Z$
COLOR 15: PRINT "Let's go to the drawing board!"
C:
B$ = INKEY$: IF B$ = "" THEN GOTO C

C = 15
SCREEN 12: COLOR 15: CLS
OPEN "O", 1, Filename$
PRINT #1, "PSET"
PRINT #1, "0"
PRINT #1, "0"
PRINT #1, "0"
VIEW (0, 0)-(639, 415)
DrawBegin:
LOCATE 27, 1, 0: COLOR 15: PRINT "Color": LOCATE 27, 8, 0: COLOR 11: PRINT "S = Skip mode,  Q = Quit and save,  <Space> = Draw on/off"
LOCATE 28, 1, 0: COLOR 13: PRINT "( 0 , 0 )"
CursorMode:
LOCATE 27, 1, 0: COLOR 15: PRINT "Color": LOCATE 27, 8, 0: COLOR 11: PRINT "S = Skip mode,  Q = Quit and save,  <Space> = Draw on/off  "
LOCATE 28, 20, 0: COLOR 15: PRINT "Press <space> to begin drawing.    "
CursorA:
LOCATE 28, 1, 0: COLOR 13: PRINT "("; X; ","; Y; ")    "
PSET (X, Y), 15
D:
B$ = INKEY$
IF B$ = " " THEN PRINT #1, "PSET": PRINT #1, X: PRINT #1, Y: PRINT #1, "15": C = 15: GOTO DrawMode
IF B$ = CHR$(0) + "H" THEN IF Y > 0 THEN PSET (X, Y), 0: Y = Y - 1: GOTO CursorA
IF B$ = CHR$(0) + "P" THEN IF Y < 415 THEN PSET (X, Y), 0: Y = Y + 1: GOTO CursorA
IF B$ = CHR$(0) + "K" THEN IF X > 0 THEN PSET (X, Y), 0: X = X - 1: GOTO CursorA
IF B$ = CHR$(0) + "M" THEN IF X < 639 THEN PSET (X, Y), 0: X = X + 1: GOTO CursorA
IF B$ = "S" OR B$ = "s" THEN GOTO SkipCursor
GOTO D

SkipCursor:
LOCATE 27, 8, 0: COLOR 11: PRINT "N = Normal mode,  Q = Quit and save,  <Space> = Draw on/off"
SkipCursorA:
IF Y > 415 THEN Y = 415
IF Y < 0 THEN Y = 0
IF X > 639 THEN X = 639
IF X < 0 THEN X = 0
LOCATE 28, 1, 0: COLOR 13: PRINT "("; X; ","; Y; ")    "
PSET (X, Y), 15
SkipD:
B$ = INKEY$
IF B$ = " " THEN PRINT #1, "PSET": PRINT #1, X: PRINT #1, Y: PRINT #1, "15": C = 15: GOTO DrawMode
IF B$ = CHR$(0) + "H" THEN IF Y > 0 THEN PSET (X, Y), 0: Y = Y - 10: GOTO SkipCursorA
IF B$ = CHR$(0) + "P" THEN IF Y < 415 THEN PSET (X, Y), 0: Y = Y + 10: GOTO SkipCursorA
IF B$ = CHR$(0) + "K" THEN IF X > 0 THEN PSET (X, Y), 0: X = X - 10: GOTO SkipCursorA
IF B$ = CHR$(0) + "M" THEN IF X < 639 THEN PSET (X, Y), 0: X = X + 10: GOTO SkipCursorA
IF B$ = "N" OR B$ = "n" THEN GOTO CursorMode
GOTO SkipD

DrawMode:
LOCATE 27, 8, 0: COLOR 11: PRINT "C = Colors,  B = Draw a Box,    O = Draw a Circle,  Q = Save and quit."
LOCATE 28, 20, 0: COLOR 14: PRINT "Press <space> to go to cursor mode."

DrawA:
LOCATE 27, 1, 0: COLOR C: PRINT "Color"
LOCATE 28, 1, 0: COLOR 13: PRINT "("; X; ","; Y; ")    "
LOCATE 27, 8, 0: COLOR 11: PRINT "C = Colors,  B = Draw a Box,    O = Draw a Circle,  Q = Save and quit."
LOCATE 28, 20, 0: COLOR 14: PRINT "Press <space> to go to cursor mode."
DrawD:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN IF Y > 0 THEN DRAW "U1": PRINT #1, "U1": Y = Y - 1: GOTO DrawA
IF B$ = CHR$(0) + "P" THEN IF Y < 415 THEN DRAW "D1": PRINT #1, "D1": Y = Y + 1: GOTO DrawA
IF B$ = CHR$(0) + "K" THEN IF X > 0 THEN DRAW "L1": PRINT #1, "L1": X = X - 1: GOTO DrawA
IF B$ = CHR$(0) + "M" THEN IF X < 639 THEN DRAW "R1": PRINT #1, "R1": X = X + 1: GOTO DrawA
IF B$ = " " THEN GOTO CursorMode
IF B$ = "C" OR B$ = "c" THEN GOTO ColorChange
IF B$ = "O" OR B$ = "o" THEN GOTO CircleDraw
IF B$ = "B" OR B$ = "b" THEN GOTO BoxDraw
IF B$ = "F" OR B$ = "f" THEN GOTO Fill
IF B$ = "Q" OR B$ = "q" THEN GOTO Quit
GOTO DrawD

ColorChange:
C = C + 1: IF C = 16 THEN C = 0:
PRINT #1, "C"; C
IF C = 0 THEN DRAW "C0"
IF C = 1 THEN DRAW "C1"
IF C = 2 THEN DRAW "C2"
IF C = 3 THEN DRAW "C3"
IF C = 4 THEN DRAW "C4"
IF C = 5 THEN DRAW "C5"
IF C = 6 THEN DRAW "C6"
IF C = 7 THEN DRAW "C7"
IF C = 8 THEN DRAW "C8"
IF C = 9 THEN DRAW "C9"
IF C = 10 THEN DRAW "C10"
IF C = 11 THEN DRAW "C11"
IF C = 12 THEN DRAW "C12"
IF C = 13 THEN DRAW "C13"
IF C = 14 THEN DRAW "C14"
IF C = 15 THEN DRAW "C15"
GOTO DrawA

CircleDraw:
LOCATE 28, 20, 0: COLOR 10: PRINT "Use cursor keys to change the circle, press <Enter> to save."
A = 5
CirA:
CIRCLE (X, Y), A, C
CirB:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN CIRCLE (X, Y), A, 0: A = A + 1: GOTO CirA
IF B$ = CHR$(0) + "P" THEN IF A > 0 THEN CIRCLE (X, Y), A, 0: A = A - 1: GOTO CirA
IF B$ = CHR$(13) OR B$ = " " THEN GOTO SaveCir
GOTO CirB
SaveCir:
PRINT #1, "Circle"
PRINT #1, X
PRINT #1, Y
PRINT #1, A
PRINT #1, C
LOCATE 28, 20, 0: COLOR 10: PRINT "Use cursor keys to change the circle, press <Enter> to save."
GOTO DrawA

BoxDraw:
LOCATE 28, 20, 0: COLOR 10: PRINT "Use cursor keys to change the box, press <Enter> when done."
V = X: W = Y
BoxA:
LINE (V, W)-(X, Y), C, B
BoxB:
LOCATE 28, 1, 0: COLOR 13: PRINT "("; X; ","; Y; ")    "
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN IF Y > 0 THEN LINE (V, W)-(X, Y), 0, B: Y = Y - 1: GOTO BoxA
IF B$ = CHR$(0) + "P" THEN IF Y < 415 THEN LINE (V, W)-(X, Y), 0, B: Y = Y + 1: GOTO BoxA
IF B$ = CHR$(0) + "K" THEN IF X > 0 THEN LINE (V, W)-(X, Y), 0, B: X = X - 1: GOTO BoxA
IF B$ = CHR$(0) + "M" THEN IF X < 639 THEN LINE (V, W)-(X, Y), 0, B: X = X + 1: GOTO BoxA
IF B$ = CHR$(13) OR B$ = " " THEN GOTO SaveBox
GOTO BoxB
SaveBox:
PRINT #1, "BOX"
PRINT #1, V
PRINT #1, W
PRINT #1, X
PRINT #1, Y
PRINT #1, C
X = V: Y = W
PSET (X, Y), C
PRINT #1, "PSET": PRINT #1, X: PRINT #1, Y: PRINT #1, C
LOCATE 28, 20, 0: COLOR 0: PRINT "Use cursor keys to change the box, press <Enter> when done."
GOTO DrawA

Fill:
LOCATE 28, 20, 0: COLOR 10: PRINT "What is the color of the border of the area?(0-15).        ": LOCATE 28, 73, 0: INPUT "", C

LOCATE 28, 20, 0: COLOR 10: PRINT "Please choose a fill color (0-15).                         ": LOCATE 28, 73, 0: INPUT "", D
PAINT (X, Y), D, C
PRINT #1, "FILL"
PRINT #1, X
PRINT #1, Y
PRINT #1, D
PRINT #1, C
LOCATE 28, 20, 0: COLOR 10: PRINT "Please choose a fill color (0-15).                         ": LOCATE 28, 53, 0:
GOTO DrawA

PictLoad:
COLOR 11, 0: CLS : SOUND 1500, 2
PRINT "What is the name of your file?"
COLOR 9: PRINT "8 char. max   (*.PIC)"
Z$ = ".PIC"
LINE INPUT Filename$
Filename$ = Filename$ + Z$
SCREEN 12
CALL PictLoad
LOCATE 28: COLOR 0: INPUT enter
GOTO 1

Quit:
A = 0: B = 0: C = 0: L = 0
AAA:
E = POINT(A, B): D = 1: PRINT #1, "C"; E
BBB:
F = POINT(A + 1, B)
IF F = E THEN D = D + 1: GOTO CCC
Save D: A = A + 1
IF A > 639 THEN A = 0: B = B + 1: PRINT #1, "PSET": PRINT #1, "0": PRINT #1, B: PRINT #1, "0": LOCATE 28: PRINT "Line"; B: GOTO AAA
GOTO AAA
CCC:
A = A + 1: IF A > 639 THEN A = 0: B = B + 1: PRINT #1, "PSET": PRINT #1, "0": PRINT #1, B: PRINT #1, "0": LOCATE 29: COLOR 15: PRINT "Line"; BBB
IF B > 415 THEN PRINT #1, "***": CLOSE : BEEP: GOTO 1
GOTO BBB
GOTO 1

DrawLoad:
SCREEN 12
DIM File$(10)
COLOR 15: CLS : SOUND 1500, 2
PRINT "This will let you start a new picture, but you will be drawing on a background"
PRINT "you already created."
PRINT "": COLOR 11
PRINT "What is the name of the file you want to use as the background?"
COLOR 9: PRINT "8 char. max   (*.PIC)"
Z$ = ".PIC"
LINE INPUT File$(1)
File$(1) = File$(1) + Z$
D = 2

DrawLoadA:
PRINT "What is the name of background file"; D
COLOR 9: PRINT "8 char. max   (*.PIC)"
COLOR 10: PRINT "Leave blank for none."
Z$ = ".PIC"
LINE INPUT File$(D)
IF File$(D) = "" THEN GOTO DrawLoadC
File$(D) = File$(D) + Z$
D = D + 1: IF D > 10 THEN GOTO DrawLoadC
PRINT "": COLOR 11: GOTO DrawLoadA

DrawLoadC:
PRINT "": COLOR 11
PRINT "What should the name of the new file be?"
COLOR 9: PRINT "8 char. max   (*.PIC)"
Z$ = ".PIC"
LINE INPUT File$(0)
File$(0) = File$(0) + Z$
D = 1
CLS
DrawLoadD:
Filename$ = File$(D)
CALL PictLoad
D = D + 1: IF D > 10 THEN GOTO DrawLoadE
IF File$(D) = "" THEN GOTO DrawLoadE
GOTO DrawLoadD

DrawLoadE:
Filename$ = File$(0)
OPEN "O", 1, Filename$
ERASE File$
GOTO DrawBegin

SUB PictLoad
' If you add this into a file, be sure to make your program change to the
' proper screen mode!!  
VIEW (0, 0)-(639, 415)
OPEN "I", 1, Filename$
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

SUB Save (D)
PRINT #1, "R"; D
END SUB

