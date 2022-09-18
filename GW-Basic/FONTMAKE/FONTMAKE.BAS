DECLARE SUB GetInfo ()
DECLARE SUB MakeFile ()
DECLARE SUB Pictload (FileName$)
DECLARE SUB Center (row, text$)
COMMON SHARED NewFile$, FontFile$
SCREEN 12: SOUND 1500, 2
CLS
COLOR 15: PRINT "Font Maker!"
COLOR 14: PRINT "": PRINT "What would you like to do?"
COLOR 11: PRINT "(A) - Make a new font file"
COLOR 11: PRINT "(B) - Edit a font file. "
MenuA:
B$ = INKEY$
B$ = UCASE$(B$)
IF B$ = "A" THEN GOTO MenuB
IF B$ = "B" THEN GOTO MenuC
GOTO MenuA
MenuB:
CLS
COLOR 14: PRINT "What should the name of the new file be?"
PRINT "": COLOR 9: PRINT "(*.fon)": COLOR 11
LINE INPUT NewFile$
NewFile$ = NewFile$ + ".FON"
MakeFile
GOTO Scr
MenuC:
CLS : COLOR 14
PRINT "What is the name of your file?"
PRINT "": COLOR 9
PRINT "(*.fon)": COLOR 11
LINE INPUT FontFile$
FontFile$ = FontFile$ + ".fon"
GetInfo
Scr:
Pictload "Fontfram.pic"
COLOR 15
Center 27, "ABCDEFGHIJKLMNOPQRSTUVWXYZ  ~!@#$%^&*()_+|{}:<>?"
Center 28, "abcdefghijklmnopqrstuvwxyz `1234567890-=\[];',./"
LINE (291, 200)-(313, 222), 1, B
LINE (290, 199)-(314, 223), 9, B
LINE (289, 198)-(315, 224), 11, B
LINE (288, 197)-(316, 225), 9, B
LINE (287, 196)-(317, 226), 1, B
DIM L$(94)
L$(1) = "A"
L$(2) = "B"
L$(3) = "C"
L$(4) = "D"
L$(5) = "E"
L$(6) = "F"
L$(7) = "G"
L$(8) = "H"
L$(9) = "I"
L$(10) = "J"
L$(11) = "K"
L$(12) = "L"
L$(13) = "M"
L$(14) = "N"
L$(15) = "O"
L$(16) = "P"
L$(17) = "Q"
L$(18) = "R"
L$(19) = "S"
L$(20) = "T"
L$(21) = "U"
L$(22) = "V"
L$(23) = "W"
L$(24) = "X"
L$(25) = "Y"
L$(26) = "Z"
L$(27) = " "
L$(28) = "~"
L$(29) = "!"
L$(30) = "@"
L$(31) = "#"
L$(32) = "$"
L$(33) = "%"
L$(34) = "^"
L$(35) = "&"
L$(36) = "*"
L$(37) = "("
L$(38) = ")"
L$(39) = "_"
L$(40) = "+"
L$(41) = "|"
L$(42) = "{"
L$(43) = "}"
L$(44) = ":"
L$(45) = "<"
L$(46) = ">"
L$(47) = "?"
L$(48) = "a"
L$(49) = "b"
L$(50) = "c"
L$(51) = "d"
L$(52) = "e"
L$(53) = "f"
L$(54) = "g"
L$(55) = "h"
L$(56) = "i"
L$(57) = "j"
L$(58) = "k"
L$(59) = "l"
L$(60) = "m"
L$(61) = "n"
L$(62) = "o"
L$(63) = "p"
L$(64) = "q"
L$(65) = "r"
L$(66) = "s"
L$(67) = "t"
L$(68) = "u"
L$(69) = "v"
L$(70) = "w"
L$(71) = "x"
L$(72) = "y"
L$(73) = "z"
L$(74) = "`"
L$(75) = "1"
L$(76) = "2"
L$(77) = "3"
L$(78) = "4"
L$(79) = "5"
L$(80) = "6"
L$(81) = "7"
L$(82) = "8"
L$(83) = "9"
L$(84) = "0"
L$(85) = "-"
L$(86) = "="
L$(87) = "\"
L$(88) = "["
L$(89) = "]"
L$(90) = ";"
L$(91) = "'"
L$(92) = ","
L$(93) = "."
L$(94) = "/"
PP = POINT(293, 202)
PSET (293, 202), 15
X = 293: Y = 202: C = 15
CursorXY:
LOCATE 27, 1, 0: COLOR C: PRINT "("; X - 293; ","; Y - 202; ")  ": IF C = 0 THEN COLOR 8: LOCATE 27, 1, 0: PRINT "("; X - 293; ","; Y - 202; ")  "
C = 15
PSET (X, Y), C
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN PSET (X, Y), PP: Y = Y - 1: PP = POINT(X, Y)
IF B$ = CHR$(0) + "P" THEN PSET (X, Y), PP: Y = Y + 1: PP = POINT(X, Y)
IF B$ = CHR$(0) + "K" THEN PSET (X, Y), PP: X = X - 1: PP = POINT(X, Y)
IF B$ = CHR$(0) + "M" THEN PSET (X, Y), PP: X = X + 1: PP = POINT(X, Y)
IF B$ = " " THEN GOTO DrawXY
IF B$ = CHR$(27) THEN GOTO Choose
IF X > 311 THEN X = 311
IF X < 293 THEN X = 293
IF Y > 220 THEN Y = 220
IF Y - 202 < 0 THEN Y = 202
GOTO CursorXY

DrawXY:
LOCATE 27, 1, 0: COLOR C: PRINT "("; X - 293; ","; Y - 202; ")  ": IF C = 0 THEN COLOR 8: LOCATE 27, 1, 0: PRINT "("; X - 293; ","; Y - 202; ")  "
PSET (X, Y), C
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN Y = Y - 1
IF B$ = CHR$(0) + "P" THEN Y = Y + 1
IF B$ = CHR$(0) + "K" THEN X = X - 1
IF B$ = CHR$(0) + "M" THEN X = X + 1
IF B$ = "C" OR B$ = "c" THEN C = C + 1: IF C > 15 THEN C = 0
IF B$ = " " THEN PP = POINT(X, Y): GOTO CursorXY
IF B$ = CHR$(27) THEN GOTO Choose
IF X > 311 THEN X = 311
IF X < 293 THEN X = 293
IF Y > 220 THEN Y = 220
IF Y - 202 < 0 THEN Y = 202
GOTO DrawXY

Choose:
XX = 17: YY = 27: L = 1
ChooseXY:
IF YY = 27 THEN IF XX = 44 THEN XX = 45: L = 28
LOCATE YY, XX, 0: COLOR 11: PRINT L$(L)
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN
LOCATE YY, XX, 0: COLOR 15: PRINT L$(L): YY = YY - 1
IF YY > 28 THEN YY = 27
IF YY = 28 THEN IF XX = 44 THEN XX = 42
IF YY = 27 THEN L = L - 47
IF YY = 28 THEN L = L + 47
IF YY < 27 THEN YY = 28: L = L + 47
END IF
IF B$ = CHR$(0) + "P" THEN
LOCATE YY, XX, 0: COLOR 15: PRINT L$(L): YY = YY + 1
IF YY > 28 THEN YY = 27
IF YY = 28 THEN IF XX = 44 THEN XX = 45
IF YY = 27 THEN L = L - 47
IF YY = 28 THEN L = L + 47
END IF
IF B$ = CHR$(0) + "K" THEN
LOCATE YY, XX, 0: COLOR 15: PRINT L$(L): XX = XX - 1
L = L - 1
IF YY = 27 THEN IF L < 0 THEN L = 47
IF YY = 28 THEN IF L < 47 THEN L = 94
IF XX < 17 THEN IF YY = 27 THEN XX = 64: L = 47
IF XX < 17 THEN IF YY = 28 THEN XX = 64: L = 94
IF XX = 43 THEN IF YY = 28 THEN XX = 42
IF XX = 44 THEN IF YY = 27 THEN XX = 42
IF L = 27 THEN L = 26
END IF
IF B$ = CHR$(0) + "M" THEN
LOCATE YY, XX, 0: COLOR 15: PRINT L$(L): XX = XX + 1
L = L + 1
IF YY = 27 THEN IF L > 47 THEN L = 1
IF YY = 28 THEN IF L > 94 THEN L = 48
IF XX > 64 THEN IF YY = 27 THEN XX = 17: L = 1
IF XX > 64 THEN IF YY = 28 THEN XX = 17: L = 48
IF XX = 43 THEN IF YY = 27 THEN XX = 45
IF XX = 43 THEN IF YY = 28 THEN XX = 44
IF L = 27 THEN L = 28
END IF
IF B$ = CHR$(27) THEN GOTO Ending
GOTO ChooseXY
Ending:
DIM DDD(500)
GET (293, 202)-(311, 220), DDD
PUT (0, 500), DDD
BEEP
FF = POINT(0, 500)
LOCATE 5: PRINT FF

SUB Center (row, text$)
    LOCATE row, 41 - LEN(text$) / 2
    PRINT text$;
END SUB

SUB GetInfo

END SUB

SUB MakeFile
END SUB

SUB Pictload (FileName$)
OPEN "I", 1, FileName$
PictLoadA:
INPUT #1, a$
IF a$ = "Circle" THEN GOTO PictLoadC
IF a$ = "BOX" THEN GOTO PictLoadBox
IF a$ = "PSET" THEN GOTO PictLoadPSET
IF a$ = "***" THEN CLOSE : EXIT SUB
IF a$ = "FILL" THEN GOTO PictLoadFill
DRAW a$
GOTO PictLoadA

PictLoadC:
INPUT #1, a
INPUT #1, B
INPUT #1, C
INPUT #1, D
CIRCLE (a, B), C, D
GOTO PictLoadA

PictLoadBox:
INPUT #1, a
INPUT #1, B
INPUT #1, C
INPUT #1, D
INPUT #1, E
LINE (a, B)-(C, D), E, B
GOTO PictLoadA

PictLoadFill:
INPUT #1, a
INPUT #1, B
INPUT #1, C
INPUT #1, D
PAINT (a, B), C, D
GOTO PictLoadA
PictLoadPSET:
INPUT #1, a
INPUT #1, B
INPUT #1, C
PSET (a, B), C
GOTO PictLoadA

END SUB

SUB PrintLetter (Letter$)
END SUB

