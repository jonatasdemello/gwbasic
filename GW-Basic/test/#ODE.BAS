DECLARE SUB DeCode (S$)
DECLARE SUB Code (S$)
ON ERROR GOTO Errors
SCREEN 0: WIDTH 80
CLS
PRINT "Would you like to code or decode a file?"
COLOR 9: PRINT "(Type C or D and press enter)"
1 INPUT O$
IF UCASE$(O$) = "C" THEN GOTO MCode
IF UCASE$(O$) = "D" THEN GOTO MDecode
BEEP: COLOR 4: PRINT "Huh?": GOTO 1
MCode:
COLOR 15: PRINT "What is the name of the file you would like to encode?"
COLOR 11: LINE INPUT a$
COLOR 15: PRINT "What should the name of the new file be?"
COLOR 11: LINE INPUT B$
COLOR 31: PRINT "": PRINT "Working!"
OPEN "I", 2, a$
OPEN "O", 1, B$
2 LINE INPUT #2, D$
Code D$
GOTO 2
MDecode:
COLOR 15: PRINT "What is the name of the file you would like to decode?"
COLOR 11: LINE INPUT a$
COLOR 15: PRINT "What should the name of the uncoded file be?"
COLOR 11: LINE INPUT B$
COLOR 31: PRINT "": PRINT "Working!"
OPEN "I", 2, a$
OPEN "O", 1, B$
3 LINE INPUT #2, D$
DeCode D$
PRINT #1, D$
GOTO 3

Errors:
IF ERL = 2 OR ERL = 3 THEN BEEP: CLS : LOCATE 1: COLOR 9: PRINT "Done!": CLOSE : END
BEEP: COLOR 4: CLS : PRINT "Error!"

SUB Code (S$)
DIM SS$(255)

a = 1
CodeA:
SS$(a) = MID$(S$, a, 1)
a = a + 1
IF a < 255 THEN GOTO CodeA

a = 1
CodeB:
IF SS$(a) = "a" THEN SS$(a) = "m": GOTO CodeD
IF SS$(a) = "b" THEN SS$(a) = "n": GOTO CodeD
IF SS$(a) = "c" THEN SS$(a) = "b": GOTO CodeD
IF SS$(a) = "d" THEN SS$(a) = "v": GOTO CodeD
IF SS$(a) = "e" THEN SS$(a) = "c": GOTO CodeD
IF SS$(a) = "f" THEN SS$(a) = "x": GOTO CodeD
IF SS$(a) = "g" THEN SS$(a) = "z": GOTO CodeD
IF SS$(a) = "h" THEN SS$(a) = "l": GOTO CodeD
IF SS$(a) = "i" THEN SS$(a) = "k": GOTO CodeD
IF SS$(a) = "j" THEN SS$(a) = "j": GOTO CodeD
IF SS$(a) = "k" THEN SS$(a) = "h": GOTO CodeD
IF SS$(a) = "l" THEN SS$(a) = "g": GOTO CodeD
IF SS$(a) = "m" THEN SS$(a) = "f": GOTO CodeD
IF SS$(a) = "n" THEN SS$(a) = "d": GOTO CodeD
IF SS$(a) = "o" THEN SS$(a) = "s": GOTO CodeD
IF SS$(a) = "p" THEN SS$(a) = "a": GOTO CodeD
IF SS$(a) = "q" THEN SS$(a) = "p": GOTO CodeD
IF SS$(a) = "r" THEN SS$(a) = "o": GOTO CodeD
IF SS$(a) = "s" THEN SS$(a) = "i": GOTO CodeD
IF SS$(a) = "t" THEN SS$(a) = "u": GOTO CodeD
IF SS$(a) = "u" THEN SS$(a) = "y": GOTO CodeD
IF SS$(a) = "v" THEN SS$(a) = "t": GOTO CodeD
IF SS$(a) = "w" THEN SS$(a) = "r": GOTO CodeD
IF SS$(a) = "x" THEN SS$(a) = "e": GOTO CodeD
IF SS$(a) = "y" THEN SS$(a) = "w": GOTO CodeD
IF SS$(a) = "z" THEN SS$(a) = "q": GOTO CodeD
IF SS$(a) = "A" THEN SS$(a) = "Q": GOTO CodeD
IF SS$(a) = "B" THEN SS$(a) = "W": GOTO CodeD
IF SS$(a) = "C" THEN SS$(a) = "E": GOTO CodeD
IF SS$(a) = "D" THEN SS$(a) = "R": GOTO CodeD
IF SS$(a) = "E" THEN SS$(a) = "T": GOTO CodeD
IF SS$(a) = "F" THEN SS$(a) = "Y": GOTO CodeD
IF SS$(a) = "G" THEN SS$(a) = "U": GOTO CodeD
IF SS$(a) = "H" THEN SS$(a) = "I": GOTO CodeD
IF SS$(a) = "I" THEN SS$(a) = "O": GOTO CodeD
IF SS$(a) = "J" THEN SS$(a) = "P": GOTO CodeD
IF SS$(a) = "K" THEN SS$(a) = "A": GOTO CodeD
IF SS$(a) = "L" THEN SS$(a) = "S": GOTO CodeD
IF SS$(a) = "M" THEN SS$(a) = "D": GOTO CodeD
IF SS$(a) = "N" THEN SS$(a) = "F": GOTO CodeD
IF SS$(a) = "O" THEN SS$(a) = "G": GOTO CodeD
IF SS$(a) = "P" THEN SS$(a) = "H": GOTO CodeD
IF SS$(a) = "Q" THEN SS$(a) = "J": GOTO CodeD
IF SS$(a) = "R" THEN SS$(a) = "K": GOTO CodeD
IF SS$(a) = "S" THEN SS$(a) = "L": GOTO CodeD
IF SS$(a) = "T" THEN SS$(a) = "Z": GOTO CodeD
IF SS$(a) = "U" THEN SS$(a) = "X": GOTO CodeD
IF SS$(a) = "V" THEN SS$(a) = "C": GOTO CodeD
IF SS$(a) = "W" THEN SS$(a) = "V": GOTO CodeD
IF SS$(a) = "X" THEN SS$(a) = "B": GOTO CodeD
IF SS$(a) = "Y" THEN SS$(a) = "N": GOTO CodeD
IF SS$(a) = "Z" THEN SS$(a) = "M": GOTO CodeD
IF SS$(a) = "1" THEN SS$(a) = "0": GOTO CodeD
IF SS$(a) = "2" THEN SS$(a) = "1": GOTO CodeD
IF SS$(a) = "3" THEN SS$(a) = "9": GOTO CodeD
IF SS$(a) = "4" THEN SS$(a) = "2": GOTO CodeD
IF SS$(a) = "5" THEN SS$(a) = "8": GOTO CodeD
IF SS$(a) = "6" THEN SS$(a) = "3": GOTO CodeD
IF SS$(a) = "7" THEN SS$(a) = "7": GOTO CodeD
IF SS$(a) = "8" THEN SS$(a) = "4": GOTO CodeD
IF SS$(a) = "9" THEN SS$(a) = "6": GOTO CodeD
IF SS$(a) = "0" THEN SS$(a) = "5": GOTO CodeD
IF SS$(a) = " " THEN SS$(a) = "_": GOTO CodeD
CodeD:
a = a + 1
IF a > 255 THEN a = 1: S$ = "": GOTO CodeE
GOTO CodeB

CodeE:
S$ = S$ + SS$(a)
a = a + 1
IF a > 255 THEN GOTO CodeF
GOTO CodeE
CodeF:
PRINT #1, S$
END SUB

SUB DeCode (S$)
DIM SS$(255)

a = 1
DecodeA:
SS$(a) = MID$(S$, a, 1)
a = a + 1
IF a < 255 THEN GOTO DecodeA

a = 1
DecodeB:
IF SS$(a) = "m" THEN SS$(a) = "a": GOTO DecodeD
IF SS$(a) = "n" THEN SS$(a) = "b": GOTO DecodeD
IF SS$(a) = "b" THEN SS$(a) = "c": GOTO DecodeD
IF SS$(a) = "v" THEN SS$(a) = "d": GOTO DecodeD
IF SS$(a) = "c" THEN SS$(a) = "e": GOTO DecodeD
IF SS$(a) = "x" THEN SS$(a) = "f": GOTO DecodeD
IF SS$(a) = "z" THEN SS$(a) = "g": GOTO DecodeD
IF SS$(a) = "l" THEN SS$(a) = "h": GOTO DecodeD
IF SS$(a) = "k" THEN SS$(a) = "i": GOTO DecodeD
IF SS$(a) = "j" THEN SS$(a) = "j": GOTO DecodeD
IF SS$(a) = "h" THEN SS$(a) = "k": GOTO DecodeD
IF SS$(a) = "g" THEN SS$(a) = "l": GOTO DecodeD
IF SS$(a) = "f" THEN SS$(a) = "m": GOTO DecodeD
IF SS$(a) = "d" THEN SS$(a) = "n": GOTO DecodeD
IF SS$(a) = "s" THEN SS$(a) = "o": GOTO DecodeD
IF SS$(a) = "a" THEN SS$(a) = "p": GOTO DecodeD
IF SS$(a) = "p" THEN SS$(a) = "q": GOTO DecodeD
IF SS$(a) = "o" THEN SS$(a) = "r": GOTO DecodeD
IF SS$(a) = "i" THEN SS$(a) = "s": GOTO DecodeD
IF SS$(a) = "u" THEN SS$(a) = "t": GOTO DecodeD
IF SS$(a) = "y" THEN SS$(a) = "u": GOTO DecodeD
IF SS$(a) = "t" THEN SS$(a) = "v": GOTO DecodeD
IF SS$(a) = "r" THEN SS$(a) = "w": GOTO DecodeD
IF SS$(a) = "e" THEN SS$(a) = "x": GOTO DecodeD
IF SS$(a) = "w" THEN SS$(a) = "y": GOTO DecodeD
IF SS$(a) = "q" THEN SS$(a) = "z": GOTO DecodeD
IF SS$(a) = "Q" THEN SS$(a) = "A": GOTO DecodeD
IF SS$(a) = "W" THEN SS$(a) = "B": GOTO DecodeD
IF SS$(a) = "E" THEN SS$(a) = "C": GOTO DecodeD
IF SS$(a) = "R" THEN SS$(a) = "D": GOTO DecodeD
IF SS$(a) = "T" THEN SS$(a) = "E": GOTO DecodeD
IF SS$(a) = "Y" THEN SS$(a) = "F": GOTO DecodeD
IF SS$(a) = "U" THEN SS$(a) = "G": GOTO DecodeD
IF SS$(a) = "I" THEN SS$(a) = "H": GOTO DecodeD
IF SS$(a) = "O" THEN SS$(a) = "I": GOTO DecodeD
IF SS$(a) = "P" THEN SS$(a) = "J": GOTO DecodeD
IF SS$(a) = "A" THEN SS$(a) = "K": GOTO DecodeD
IF SS$(a) = "S" THEN SS$(a) = "L": GOTO DecodeD
IF SS$(a) = "D" THEN SS$(a) = "M": GOTO DecodeD
IF SS$(a) = "F" THEN SS$(a) = "N": GOTO DecodeD
IF SS$(a) = "G" THEN SS$(a) = "O": GOTO DecodeD
IF SS$(a) = "H" THEN SS$(a) = "P": GOTO DecodeD
IF SS$(a) = "J" THEN SS$(a) = "Q": GOTO DecodeD
IF SS$(a) = "K" THEN SS$(a) = "R": GOTO DecodeD
IF SS$(a) = "L" THEN SS$(a) = "S": GOTO DecodeD
IF SS$(a) = "Z" THEN SS$(a) = "T": GOTO DecodeD
IF SS$(a) = "X" THEN SS$(a) = "U": GOTO DecodeD
IF SS$(a) = "C" THEN SS$(a) = "V": GOTO DecodeD
IF SS$(a) = "V" THEN SS$(a) = "W": GOTO DecodeD
IF SS$(a) = "B" THEN SS$(a) = "X": GOTO DecodeD
IF SS$(a) = "N" THEN SS$(a) = "Y": GOTO DecodeD
IF SS$(a) = "M" THEN SS$(a) = "Z": GOTO DecodeD
IF SS$(a) = "0" THEN SS$(a) = "1": GOTO DecodeD
IF SS$(a) = "1" THEN SS$(a) = "2": GOTO DecodeD
IF SS$(a) = "9" THEN SS$(a) = "3": GOTO DecodeD
IF SS$(a) = "2" THEN SS$(a) = "4": GOTO DecodeD
IF SS$(a) = "8" THEN SS$(a) = "5": GOTO DecodeD
IF SS$(a) = "3" THEN SS$(a) = "6": GOTO DecodeD
IF SS$(a) = "7" THEN SS$(a) = "7": GOTO DecodeD
IF SS$(a) = "4" THEN SS$(a) = "8": GOTO DecodeD
IF SS$(a) = "6" THEN SS$(a) = "9": GOTO DecodeD
IF SS$(a) = "5" THEN SS$(a) = "0": GOTO DecodeD
IF SS$(a) = "_" THEN SS$(a) = " ": GOTO DecodeD
DecodeD:
a = a + 1
IF a > 255 THEN a = 1: S$ = "": GOTO DecodeE
GOTO DecodeB

DecodeE:
S$ = S$ + SS$(a)
a = a + 1
IF a > 255 THEN GOTO DecodeF
GOTO DecodeE
DecodeF:

END SUB

