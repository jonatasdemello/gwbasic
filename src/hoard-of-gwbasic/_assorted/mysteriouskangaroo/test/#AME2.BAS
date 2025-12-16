DECLARE SUB Decode ()
DECLARE SUB Frame (TX!, TY!, BX!, BY!, C!, CC!, CCC!)
DECLARE SUB Code (S$)
DECLARE SUB Box (TX, TY, BX, BY, C)
DECLARE SUB MainMenu ()
DECLARE SUB Title ()
DECLARE SUB ErrorControl (ER, EL)
COMMON SHARED A$()
DIM A$(20)
Title
MainMenu

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
IF SS$(A) = "" THEN PRINT #1, "900009": GOTO CodeE
D = ASC(SS$(A))
D = D * 3: D = D + 9: D = D * 3: D = D - 7
CodeD:
PRINT #1, D;
A = A + 1
IF A > 80 THEN A = 1: S$ = "": GOTO CodeE
GOTO CodeB

CodeE:
PRINT #1, "900009"
END SUB

SUB Decode
DIM SS$(80)
A = 1: L = 1
DecodeA:
IF L > 20 THEN EXIT SUB
INPUT #1, D
IF D = 900009 THEN L = L + 1: GOTO DecodeF
D = D + 7: D = D / 3: D = D - 9: D = D / 3
SS$(A) = CHR$(D)
A = A + 1
IF A > 80 THEN GOTO DecodeF
GOTO DecodeA

DecodeF:
A = 1: S$ = ""
DecodeG:
A$(L) = A$(L) + SS$(A)
A = A + 1
IF A > 80 THEN L = L + 1: A = 1: GOTO DecodeA
GOTO DecodeG

DecodeH:

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
INPUT RER$
IF RER$ = "r" THEN GOTO Decodeeee
DIM F$(20)
F$(1) = "Larry is the best!!!  PHONE:  (617)-289-9036"
F$(2) = "My birthday is tomorrow   Feb. 7, 1995!!"
F$(3) = "Bye!!!!"
F$(4) = "La La La!"
F$(5) = "La La La!"
F$(6) = "La La La!"
F$(7) = "La La La!"
F$(8) = "La La La!"
F$(9) = "La La La!"
F$(10) = "La La La!"
F$(11) = "La La La!"
F$(12) = "La La La!"
F$(13) = "La La La!"
F$(14) = "La La La!"
F$(15) = "La La La!"
F$(16) = "La La La!"
F$(17) = "La La La!"
F$(18) = "La La La!"
F$(19) = "La La La!"
F$(20) = "La La La!"

OPEN "O", 1, "CodeTest.Dat"
E = 1
DDD:
Code F$(E)
E = E + 1
IF E > 20 THEN CLOSE : GOTO Decodeeee
GOTO DDD
Decodeeee:
PRINT "Press Enter to Decode!"
INPUT Enter
OPEN "I", 1, "CodeTest.Dat"
CALL Decode
PRINT A$(1)
PRINT A$(2)
PRINT A$(3)
END SUB

SUB Title
END SUB

