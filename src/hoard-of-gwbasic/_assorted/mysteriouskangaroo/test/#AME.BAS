DECLARE SUB Frame (TX!, TY!, BX!, BY!, C!, CC!, CCC!)
DECLARE SUB Decode (S$)
DECLARE SUB Code (S$)
DECLARE SUB Box (TX, TY, BX, BY, C)
DECLARE SUB MainMenu ()
DECLARE SUB Title ()
DECLARE SUB ErrorControl (ER, EL)
ON ERROR GOTO Errors
Title
MainMenu

Errors:
ErrorControl ERR, ERL

SUB Box (TX, TY, BX, BY, C)
LINE (TX, TY)-(BX, BY), C, B
END SUB

SUB Code (S$)
S$ = UCASE$(S$)
DIM SS$(80)

A = 1
CodeA:
SS$(A) = MID$(S$, A, 1)
A = A + 1
IF A < 80 THEN GOTO CodeA

A = 1
CodeB:
IF SS$(A) = "A" THEN SS$(A) = "Q": GOTO CodeD
IF SS$(A) = "B" THEN SS$(A) = "W": GOTO CodeD
IF SS$(A) = "C" THEN SS$(A) = "E": GOTO CodeD
IF SS$(A) = "D" THEN SS$(A) = "R": GOTO CodeD
IF SS$(A) = "E" THEN SS$(A) = "T": GOTO CodeD
IF SS$(A) = "F" THEN SS$(A) = "Y": GOTO CodeD
IF SS$(A) = "G" THEN SS$(A) = "U": GOTO CodeD
IF SS$(A) = "H" THEN SS$(A) = "I": GOTO CodeD
IF SS$(A) = "I" THEN SS$(A) = "O": GOTO CodeD
IF SS$(A) = "J" THEN SS$(A) = "P": GOTO CodeD
IF SS$(A) = "K" THEN SS$(A) = "A": GOTO CodeD
IF SS$(A) = "L" THEN SS$(A) = "S": GOTO CodeD
IF SS$(A) = "M" THEN SS$(A) = "D": GOTO CodeD
IF SS$(A) = "N" THEN SS$(A) = "F": GOTO CodeD
IF SS$(A) = "O" THEN SS$(A) = "G": GOTO CodeD
IF SS$(A) = "P" THEN SS$(A) = "H": GOTO CodeD
IF SS$(A) = "Q" THEN SS$(A) = "J": GOTO CodeD
IF SS$(A) = "R" THEN SS$(A) = "K": GOTO CodeD
IF SS$(A) = "S" THEN SS$(A) = "L": GOTO CodeD
IF SS$(A) = "T" THEN SS$(A) = "Z": GOTO CodeD
IF SS$(A) = "U" THEN SS$(A) = "X": GOTO CodeD
IF SS$(A) = "V" THEN SS$(A) = "C": GOTO CodeD
IF SS$(A) = "W" THEN SS$(A) = "V": GOTO CodeD
IF SS$(A) = "X" THEN SS$(A) = "B": GOTO CodeD
IF SS$(A) = "Y" THEN SS$(A) = "N": GOTO CodeD
IF SS$(A) = "Z" THEN SS$(A) = "M": GOTO CodeD
IF SS$(A) = "1" THEN SS$(A) = "0": GOTO CodeD
IF SS$(A) = "2" THEN SS$(A) = "1": GOTO CodeD
IF SS$(A) = "3" THEN SS$(A) = "9": GOTO CodeD
IF SS$(A) = "4" THEN SS$(A) = "2": GOTO CodeD
IF SS$(A) = "5" THEN SS$(A) = "8": GOTO CodeD
IF SS$(A) = "6" THEN SS$(A) = "3": GOTO CodeD
IF SS$(A) = "7" THEN SS$(A) = "7": GOTO CodeD
IF SS$(A) = "8" THEN SS$(A) = "4": GOTO CodeD
IF SS$(A) = "9" THEN SS$(A) = "6": GOTO CodeD
IF SS$(A) = "0" THEN SS$(A) = "5": GOTO CodeD
IF SS$(A) = " " THEN SS$(A) = "_": GOTO CodeD
CodeD:
A = A + 1
IF A > 80 THEN A = 1: S$ = "": GOTO CodeE
GOTO CodeB

CodeE:
S$ = S$ + SS$(A)
A = A + 1
IF A > 80 THEN GOTO CodeF
GOTO CodeE
CodeF:
PRINT #1, S$
END SUB

SUB Decode (S$)
S$ = UCASE$(S$)
DIM SS$(80)

A = 1
DecodeA:
SS$(A) = MID$(S$, A, 1)
A = A + 1
IF A < 80 THEN GOTO DecodeA

A = 1
DecodeB:
IF SS$(A) = "Q" THEN SS$(A) = "A": GOTO DecodeD
IF SS$(A) = "W" THEN SS$(A) = "B": GOTO DecodeD
IF SS$(A) = "E" THEN SS$(A) = "C": GOTO DecodeD
IF SS$(A) = "R" THEN SS$(A) = "D": GOTO DecodeD
IF SS$(A) = "T" THEN SS$(A) = "E": GOTO DecodeD
IF SS$(A) = "Y" THEN SS$(A) = "F": GOTO DecodeD
IF SS$(A) = "U" THEN SS$(A) = "G": GOTO DecodeD
IF SS$(A) = "I" THEN SS$(A) = "H": GOTO DecodeD
IF SS$(A) = "O" THEN SS$(A) = "I": GOTO DecodeD
IF SS$(A) = "P" THEN SS$(A) = "J": GOTO DecodeD
IF SS$(A) = "A" THEN SS$(A) = "K": GOTO DecodeD
IF SS$(A) = "S" THEN SS$(A) = "L": GOTO DecodeD
IF SS$(A) = "D" THEN SS$(A) = "M": GOTO DecodeD
IF SS$(A) = "F" THEN SS$(A) = "N": GOTO DecodeD
IF SS$(A) = "G" THEN SS$(A) = "O": GOTO DecodeD
IF SS$(A) = "H" THEN SS$(A) = "P": GOTO DecodeD
IF SS$(A) = "J" THEN SS$(A) = "Q": GOTO DecodeD
IF SS$(A) = "K" THEN SS$(A) = "R": GOTO DecodeD
IF SS$(A) = "L" THEN SS$(A) = "S": GOTO DecodeD
IF SS$(A) = "Z" THEN SS$(A) = "T": GOTO DecodeD
IF SS$(A) = "X" THEN SS$(A) = "U": GOTO DecodeD
IF SS$(A) = "C" THEN SS$(A) = "V": GOTO DecodeD
IF SS$(A) = "V" THEN SS$(A) = "W": GOTO DecodeD
IF SS$(A) = "B" THEN SS$(A) = "X": GOTO DecodeD
IF SS$(A) = "N" THEN SS$(A) = "Y": GOTO DecodeD
IF SS$(A) = "M" THEN SS$(A) = "Z": GOTO DecodeD
IF SS$(A) = "0" THEN SS$(A) = "1": GOTO DecodeD
IF SS$(A) = "1" THEN SS$(A) = "2": GOTO DecodeD
IF SS$(A) = "9" THEN SS$(A) = "3": GOTO DecodeD
IF SS$(A) = "2" THEN SS$(A) = "4": GOTO DecodeD
IF SS$(A) = "8" THEN SS$(A) = "5": GOTO DecodeD
IF SS$(A) = "3" THEN SS$(A) = "6": GOTO DecodeD
IF SS$(A) = "7" THEN SS$(A) = "7": GOTO DecodeD
IF SS$(A) = "4" THEN SS$(A) = "8": GOTO DecodeD
IF SS$(A) = "6" THEN SS$(A) = "9": GOTO DecodeD
IF SS$(A) = "5" THEN SS$(A) = "0": GOTO DecodeD
IF SS$(A) = "_" THEN SS$(A) = " ": GOTO DecodeD
DecodeD:
A = A + 1
IF A > 80 THEN A = 1: S$ = "": GOTO DecodeE
GOTO DecodeB

DecodeE:
S$ = S$ + SS$(A)
A = A + 1
IF A > 80 THEN GOTO DecodeF
GOTO DecodeE
DecodeF:

END SUB

SUB ErrorControl (ER, EL)
END SUB

SUB Frame (TX, TY, BX, BY, C, CC, CCC)
LINE (TX, TY)-(BX, BY), C, B
LINE (TX - 1, TY - 1)-(BX + 1, BY + 1), CC, B
LINE (TX - 2, TY - 2)-(BX + 2, BY + 2), CCC, B
LINE (TX - 3, TY - 3)-(BX + 3, BY + 3), CC, B
LINE (TX - 4, TY - 4)-(BX + 4, BY + 4), C, B
END SUB

SUB MainMenu
SCREEN 12
COLOR 13: CLS : SOUND 900, 1: SOUND 1200, 1
Box 0, 0, 639, 479, 5
Frame 100, 100, 400, 400, 1, 9, 11
LOCATE 1: PRINT "Press Enter to Code, type r to decode"
A$ = "Larry is the best!!!  PHONE:  (617)-289-9036"
B$ = "My birthday is tomorrow   Feb. 7, 1995!!"
C$ = "Bye!!!!"
INPUT RER$
IF RER$ = "r" THEN GOTO Decodeeee
OPEN "O", 1, "CodeTest.Dat"
Code A$
Code B$
Code C$
CLOSE
Decodeeee:
PRINT "Press Enter to Decode!"
INPUT Enter
OPEN "I", 1, "CodeTest.Dat"
LINE INPUT #1, A$
LINE INPUT #1, B$
LINE INPUT #1, C$
Decode A$: S$ = A$
Decode B$: S$ = B$
Decode C$: S$ = C$
PRINT A$
PRINT B$
PRINT C$
LOCATE 20: INPUT Enter

END SUB

SUB Title
END SUB

