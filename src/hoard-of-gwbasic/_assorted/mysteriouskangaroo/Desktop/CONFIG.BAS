DECLARE SUB DriveSet ()
DECLARE SUB SSaverEdit ()
DECLARE SUB UserListEdit ()
DECLARE SUB NewUser ()
DECLARE SUB PassEntry ()
DECLARE SUB SaveUserInfo ()
DECLARE SUB StartScreen ()
DECLARE SUB MenuNames ()
DECLARE SUB MenuItems ()
DECLARE SUB BoardEdit ()
DECLARE SUB TopUserEdit ()
DECLARE SUB SecLevelEdit ()
DECLARE SUB BrowseEdit ()
DECLARE SUB BreakIn ()
DECLARE SUB AddADesk ()
DECLARE SUB WeeEdit ()
DECLARE SUB Coloredit ()
DECLARE SUB NameEdit ()
DECLARE SUB DesktopChoose ()
DECLARE SUB DeskChoose ()
DECLARE SUB MainMenus ()
DECLARE SUB MainMenu ()
COMMON SHARED User, SecLevel, D(), L(), N$, Desk$, P(), Pict$, Menu$, TopUser, One$, Two$, Three$, HOne$, HTwo$, HThree$
CONFIG:
CALL MainMenu
GOTO CONFIG

SUB BoardEdit
BoardEditBegin:
WIDTH 40: COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออต Message Board Editor ฦอออออออต"
LOCATE 1, 11, 0: COLOR 15: PRINT "Message Board Editor"
PRINT "": COLOR 11
DIM Z$(3)
Z$(1) = "Edit the Message Board."
Z$(2) = "Turn the message board on/off."
Z$(3) = "Return to the Main Menu"

COLOR 11
LOCATE 3, 1, 0: PRINT Z$(1)
LOCATE 4, 1, 0: PRINT Z$(2)
LOCATE 5, 1, 0: PRINT Z$(3)

A = 3: B = 1

BoardEditA:
LOCATE A, 1, 0: COLOR 15: PLAY "F32": PRINT Z$(B)
BoardEditB:
B$ = INKEY$: IF B$ = CHR$(13) OR B$ = " " THEN GOTO BoardEditCommands
IF B$ = CHR$(0) + "H" THEN GOTO BoardEditC
IF B$ = CHR$(0) + "P" THEN GOTO BoardEditD
GOTO BoardEditB

BoardEditC:
LOCATE A, 1, 0: COLOR 11: PRINT Z$(B)
A = A - 1: B = B - 1
IF B = 0 THEN A = 5: B = 3
GOTO BoardEditA:

BoardEditD:
LOCATE A, 1, 0: COLOR 11: PRINT Z$(B)
A = A + 1: B = B + 1
IF B = 4 THEN A = 3: B = 1
GOTO BoardEditA:

BoardEditCommands:
IF B = 1 THEN GOTO BoardEditEdit
IF B = 2 THEN GOTO BoardEditOnOff
IF B = 3 THEN ERASE D, L, P: EXIT SUB




BoardEditEdit:
WIDTH 40: COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออต Notepad: You Have 10 Lines ฦออออต"
LOCATE 1, 8, 0: COLOR 15: PRINT "Notepad: You Have 10 Lines"
PRINT "": COLOR 11
DIM Note$(10)
LINE INPUT "1: ", Note$(1)
LINE INPUT "2: ", Note$(2)
LINE INPUT "3: ", Note$(3)
LINE INPUT "4: ", Note$(4)
LINE INPUT "5: ", Note$(5)
LINE INPUT "6: ", Note$(6)
LINE INPUT "7: ", Note$(7)
LINE INPUT "8: ", Note$(8)
LINE INPUT "9: ", Note$(9)
LINE INPUT "10 :", Note$(10)

COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออต Message Board Editor ฦอออออออต"
LOCATE 1, 11, 0: COLOR 15: PRINT "Message Board Editor"
PRINT "": COLOR 15
PRINT "Would you like to save the changes?"
COLOR 11: PRINT "(Y / N)"

BoardEditEditA:
B$ = INKEY$
IF B$ = "Y" OR B$ = "y" THEN GOTO BoardEditEditSave
IF B$ = "N" OR B$ = "n" THEN ERASE Z$, Note$: GOTO BoardEditBegin
GOTO BoardEditEditA

BoardEditEditSave:
OPEN "I", 1, "MBoard.Dat"
INPUT #1, A$
CLOSE

OPEN "O", 1, "MBoard.Dat"
PRINT #1, A$
PRINT #1, Note$(1)
PRINT #1, Note$(2)
PRINT #1, Note$(3)
PRINT #1, Note$(4)
PRINT #1, Note$(5)
PRINT #1, Note$(6)
PRINT #1, Note$(7)
PRINT #1, Note$(8)
PRINT #1, Note$(9)
PRINT #1, Note$(10)
CLOSE : ERASE Z$, Note$: GOTO BoardEditBegin

BoardEditOnOff:

DIM Note$(10)
OPEN "I", 1, "MBoard.Dat"
INPUT #1, A$
LINE INPUT #1, Note$(1)
LINE INPUT #1, Note$(2)
LINE INPUT #1, Note$(3)
LINE INPUT #1, Note$(4)
LINE INPUT #1, Note$(5)
LINE INPUT #1, Note$(6)
LINE INPUT #1, Note$(7)
LINE INPUT #1, Note$(8)
LINE INPUT #1, Note$(9)
LINE INPUT #1, Note$(10)
CLOSE


IF A$ = "Yes" THEN GOTO MBoardIsOn
GOTO MBoardIsOff



MBoardIsOn:
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออต Message Board Editor ฦอออออออต"
LOCATE 1, 11, 0: COLOR 15: PRINT "Message Board Editor"
PRINT "": COLOR 11
PRINT "The Message Board is ON": LOCATE 3, 22, 0: COLOR 15: PRINT "ON"
PRINT "": COLOR 11: PRINT "Would you like to turn it off?"
MBoardIsOnA:
B$ = INKEY$
IF B$ = "Y" OR B$ = "y" THEN A$ = "No": GOTO BoardEditOnOffSave
IF B$ = "N" OR B$ = "n" THEN CALL BoardEdit
GOTO MBoardIsOnA

MBoardIsOff:
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออต Message Board Editor ฦอออออออต"
LOCATE 1, 11, 0: COLOR 15: PRINT "Message Board Editor"
PRINT "": COLOR 11
PRINT "The Message Board is OFF": LOCATE 3, 22, 0: COLOR 15: PRINT "OFF"
PRINT "": COLOR 11: PRINT "Would you like to turn it on?"
MBoardIsOffA:
B$ = INKEY$
IF B$ = "Y" OR B$ = "y" THEN A$ = "Yes": GOTO BoardEditOnOffSave
IF B$ = "N" OR B$ = "n" THEN EXIT SUB
GOTO MBoardIsOffA

BoardEditOnOffSave:
OPEN "O", 1, "MBoard.Dat"
PRINT #1, A$
PRINT #1, Note$(1)
PRINT #1, Note$(2)
PRINT #1, Note$(3)
PRINT #1, Note$(4)
PRINT #1, Note$(5)
PRINT #1, Note$(6)
PRINT #1, Note$(7)
PRINT #1, Note$(8)
PRINT #1, Note$(9)
PRINT #1, Note$(10)
CLOSE
ERASE Z$, Note$: GOTO BoardEditBegin

































END SUB

SUB BreakIn
BreakinList:
DIM N$(11)
BreakInRepeat:
OPEN "I", 1, "User0.Dat"
INPUT #1, N$(0)
CLOSE

OPEN "I", 1, "User1.Dat"
INPUT #1, N$(1)
CLOSE

OPEN "I", 1, "User2.Dat"
INPUT #1, N$(2)
CLOSE

OPEN "I", 1, "User3.Dat"
INPUT #1, N$(3)
CLOSE

OPEN "I", 1, "User4.Dat"
INPUT #1, N$(4)
CLOSE

OPEN "I", 1, "User5.Dat"
INPUT #1, N$(5)
CLOSE

OPEN "I", 1, "User6.Dat"
INPUT #1, N$(6)
CLOSE

OPEN "I", 1, "User7.Dat"
INPUT #1, N$(7)
CLOSE

OPEN "I", 1, "User8.Dat"
INPUT #1, N$(8)
CLOSE

OPEN "I", 1, "User9.Dat"
INPUT #1, N$(9)
CLOSE

OPEN "I", 1, "User10.Dat"
INPUT #1, N$(10)
CLOSE
N$(11) = "Just Browsing"
REM"Screen"
WIDTH 40
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออออต Sign on as Who?? ฦอออออออออต"
LOCATE 1, 13, 0: COLOR 15: PRINT "Sign on as Who??"
COLOR 1: PRINT ""
PRINT "          ษออออออออออออออออออป"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          ศออออออออออออออออออผ"
PRINT ""
COLOR 15: PRINT "Use the arrow keys to choose,"
PRINT "then press <ENTER> or <SPACE>."
COLOR 11: PRINT "Press <ESC> to return to the main menu."
c = 1: N$(0) = "Just Browsing": N$(11) = N$(0)
BreakInListA:
LOCATE 4, 12, 0: COLOR c: PRINT N$(1)
LOCATE 5, 12, 0: COLOR c: PRINT N$(2)
LOCATE 6, 12, 0: COLOR c: PRINT N$(3)
LOCATE 7, 12, 0: COLOR c: PRINT N$(4)
LOCATE 8, 12, 0: COLOR c: PRINT N$(5)
LOCATE 9, 12, 0: COLOR c: PRINT N$(6)
LOCATE 10, 12, 0: COLOR c: PRINT N$(7)
LOCATE 11, 12, 0: COLOR c: PRINT N$(8)
LOCATE 12, 12, 0: COLOR c: PRINT N$(9)
LOCATE 13, 12, 0: COLOR c: PRINT N$(10)
LOCATE 14, 12, 0: COLOR c: PRINT "Just Browsing"
IF c = 11 THEN GOTO BreakInListB
c = 11: GOTO BreakInListA

BreakInListB:
A = 4: B = 1
BreakInListC:
LOCATE A, 12, 0: COLOR 15: PLAY "F32": PRINT N$(B)
BreakInListD:
B$ = INKEY$: IF B$ = "" THEN GOTO BreakInListD
IF B$ = CHR$(0) + "H" THEN GOTO BreakInListE
IF B$ = CHR$(0) + "P" THEN GOTO BreakInListF
IF B$ = CHR$(13) THEN GOTO BreakInListG
IF B$ = CHR$(27) THEN ERASE D, L, P, N$: EXIT SUB
IF B$ = " " THEN GOTO BreakInListG
GOTO BreakInListD

BreakInListE:
LOCATE A, 12, 0: COLOR 11: PRINT N$(B)
A = A - 1: B = B - 1
IF B < 1 THEN B = 11: A = 14
GOTO BreakInListC

BreakInListF:
LOCATE A, 12, 0: COLOR 11: PRINT N$(B)
A = A + 1: B = B + 1
IF B > 11 THEN A = 4: B = 1
GOTO BreakInListC

BreakInListG:
IF B = 11 THEN B = 0
User = B: CALL DeskChoose



END SUB

SUB BrowseEdit
BrowseEditMainMenu:
SCREEN 1: SCREEN 0
OPEN "I", 1, "User0.Dat"
INPUT #1, N$
INPUT #1, P(1)
INPUT #1, P(2)
INPUT #1, P(3)
INPUT #1, P(4)
INPUT #1, P(5)
INPUT #1, P(6)
INPUT #1, Desk
INPUT #1, Pict$
INPUT #1, D(1)
INPUT #1, D(2)
INPUT #1, D(3)
INPUT #1, D(4)
INPUT #1, D(5)
INPUT #1, D(6)
INPUT #1, D(7)
INPUT #1, L(1)
INPUT #1, L(2)
INPUT #1, L(3)
INPUT #1, L(4)
INPUT #1, L(5)
INPUT #1, SecLevel
CLOSE


BrowseMenu:

WIDTH 40: COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออต Configuration! ฦออออออออออต": COLOR 1
LOCATE 1, 14, 0: COLOR 15: PRINT "Configuration!"
PRINT "": COLOR 1
PRINT "ษออออออออออออออออออออออออออออออออออออออป"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "ศออออออออออออออออออออออออออออออออออออออผ"
LOCATE 9, 1, 0: COLOR 14: PRINT "Use the cursor keys to choose,"
PRINT "Then press <ENTER> or <SPACE>."
DIM BZ$(4)
BZ$(1) = "Change the desktop/list colors."
BZ$(2) = "Change your name/password."
BZ$(3) = "Return to the Main Menu."
LOCATE 4, 2, 0: COLOR 3: PRINT BZ$(1)
LOCATE 5, 2, 0: COLOR 3: PRINT BZ$(2)
LOCATE 6, 2, 0: COLOR 3: PRINT BZ$(3)
A = 4: B = 1
BrowseMenuA:
LOCATE A, 2, 0: COLOR 15: PLAY "F32": PRINT BZ$(B)
BrowseMenuB:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO BrowseMenuC
IF B$ = CHR$(0) + "P" THEN GOTO BrowseMenuD
IF B$ = CHR$(13) THEN GOTO BrowseMenuE
IF B$ = " " THEN GOTO BrowseMenuE
GOTO BrowseMenuB

BrowseMenuC:
LOCATE A, 2, 0: COLOR 3: PRINT BZ$(B)
A = A - 1: B = B - 1
IF B = 0 THEN A = 6: B = 3
GOTO BrowseMenuA

BrowseMenuD:
LOCATE A, 2, 0: COLOR 3: PRINT BZ$(B)
A = A + 1: B = B + 1
IF B = 4 THEN A = 4: B = 1
GOTO BrowseMenuA

BrowseMenuE:
ERASE BZ$
IF B = 1 THEN GOTO BrowseColorEdit
IF B = 2 THEN GOTO BrowseNameEdit
IF B = 3 THEN ERASE D, L, P: EXIT SUB

BrowseColorEdit:
CLS

DIM WW(12)
WW(1) = D(1)
WW(2) = D(2)
WW(3) = D(3)
WW(4) = D(4)
WW(5) = D(5)
WW(6) = D(6)
WW(7) = D(7)
WW(8) = L(1)
WW(9) = L(2)
WW(10) = L(3)
WW(11) = L(4)

DIM CZ$(12)
CZ$(1) = "Frame"
CZ$(2) = "Menu Items"
CZ$(3) = "Hilighted Items"
CZ$(4) = "Help Message"
CZ$(5) = "Date/Time"
CZ$(6) = "Title"
CZ$(7) = "Instructions"
CZ$(8) = "Frame"
CZ$(9) = "Menu Items"
CZ$(10) = "Hilighted Items"
CZ$(11) = "Title/Quit Msg."
CZ$(12) = "Quit Message"
PALETTE 1, D(1): D(1) = 1
PALETTE 2, D(2): D(2) = 2
PALETTE 3, D(3): D(3) = 3
PALETTE 4, D(5): D(5) = 4
PALETTE 5, D(6): D(6) = 5
PALETTE 6, D(7): D(7) = 6
PALETTE 7, D(4): D(4) = 7
PALETTE 8, L(1): L(1) = 8
PALETTE 9, L(2): L(2) = 9
PALETTE 10, L(3): L(3) = 10
PALETTE 11, L(4): L(4) = 11
PALETTE 12, 3
PALETTE 13, 13
PALETTE 14, 1
PALETTE 15, 63

BScreendraw:
WIDTH 40: COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออออออต Color Editor ฦอออออออออออต": LOCATE 1, 15, 0: COLOR 15: PRINT "Color Editor": COLOR 14
PRINT ""
PRINT "ษต Desktop Colors ฦัออออป": LOCATE 3, 4, 0: COLOR 15: PRINT "Desktop Colors": COLOR 14
PRINT "บ Frame            ณ    บ"
PRINT "บ Menu Items       ณ    บ"
PRINT "บ Hilighted Items  ณ    บ"
PRINT "บ Help Message     ณ    บ"
PRINT "บ Date/Time        ณ    บ"
PRINT "บ Title            ณ    บ"
PRINT "บ Instructions     ณ    บ"
PRINT "ศออออออออออออออออออฯออออผ"
PRINT ""
PRINT "               ษอต List Colors ฦออัออออป": LOCATE 13, 20, 0: COLOR 15: PRINT "List Colors": COLOR 14
PRINT "               บ Frame            ณ    บ"
PRINT "               บ Menu Items       ณ    บ"
PRINT "   < Done >    บ Hilighted Items  ณ    บ"
PRINT "               บ Title/Quit Msg.  ณ    บ"
PRINT "  < Cancel >   ศออออออออออออออออออฯออออผ"
PRINT "": COLOR 15
LOCATE 4, 3, 0: COLOR 12: PRINT CZ$(1)
LOCATE 5, 3, 0: COLOR 12: PRINT CZ$(2)
LOCATE 6, 3, 0: COLOR 12: PRINT CZ$(3)
LOCATE 7, 3, 0: COLOR 12: PRINT CZ$(4)
LOCATE 8, 3, 0: COLOR 12: PRINT CZ$(5)
LOCATE 9, 3, 0: COLOR 12: PRINT CZ$(6)
LOCATE 10, 3, 0: COLOR 12: PRINT CZ$(7)
LOCATE 14, 18, 0: COLOR 12: PRINT CZ$(8)
LOCATE 15, 18, 0: COLOR 12: PRINT CZ$(9)
LOCATE 16, 18, 0: COLOR 12: PRINT CZ$(10)
LOCATE 17, 18, 0: COLOR 12: PRINT CZ$(11)
LOCATE 16, 6, 0: COLOR 12: PRINT "Done"
LOCATE 18, 5, 0: COLOR 12: PRINT "Cancel"

LOCATE 4, 21, 0: COLOR D(1): PRINT WW(1)
LOCATE 5, 21, 0: COLOR D(2): PRINT WW(2)
LOCATE 6, 21, 0: COLOR D(3): PRINT WW(3)
LOCATE 7, 21, 0: COLOR D(4): PRINT WW(4)
LOCATE 8, 21, 0: COLOR D(5): PRINT WW(5)
LOCATE 9, 21, 0: COLOR D(6): PRINT WW(6)
LOCATE 10, 21, 0: COLOR D(7): PRINT WW(7)
LOCATE 14, 36, 0: COLOR L(1): PRINT WW(8)
LOCATE 15, 36, 0: COLOR L(2): PRINT WW(9)
LOCATE 16, 36, 0: COLOR L(3): PRINT WW(10)
LOCATE 17, 36, 0: COLOR L(4): PRINT WW(11)

BDeskColor:
A = 4: B = 1
BDeskColorA:
LOCATE A, 3, 0: COLOR 15: PRINT CZ$(B)
LOCATE A, 21, 0: COLOR D(B): PLAY "F32": PRINT WW(B)
BDeskColorB:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO BDeskColorH
IF B$ = CHR$(0) + "P" THEN GOTO BDeskColorP
IF B$ = CHR$(0) + "K" THEN GOTO BDeskColorK
IF B$ = CHR$(0) + "M" THEN GOTO BDeskColorM
GOTO BDeskColorB

BDeskColorH:
LOCATE A, 3, 0: COLOR 12: PRINT CZ$(B)
A = A - 1: B = B - 1
IF B = 0 THEN GOTO BCancel
GOTO BDeskColorA

BDeskColorP:
LOCATE A, 3, 0: COLOR 12: PRINT CZ$(B)
A = A + 1: B = B + 1
IF B = 8 THEN GOTO BListColor
GOTO BDeskColorA

BDeskColorK:
WW(B) = WW(B) - 1
IF WW(B) < 0 THEN WW(B) = 63
PALETTE D(B), WW(B)
GOTO BDeskColorA

BDeskColorM:
WW(B) = WW(B) + 1
IF WW(B) = 64 THEN WW(B) = 0
PALETTE D(B), WW(B)
GOTO BDeskColorA

BListColor:
A = 14: B = 1
BListColorA:
LOCATE A, 18, 0: COLOR 15: PRINT CZ$(B + 7)
LOCATE A, 36, 0: COLOR L(B): PLAY "F32": PRINT WW(B + 7)
BListColorB:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO BListColorH
IF B$ = CHR$(0) + "P" THEN GOTO BListColorP
IF B$ = CHR$(0) + "K" THEN GOTO BListColorK
IF B$ = CHR$(0) + "M" THEN GOTO BListColorM
GOTO BListColorB

BListColorH:
LOCATE A, 18, 0: COLOR 12: PRINT CZ$(B + 7)
A = A - 1: B = B - 1
IF B = 0 THEN A = 10: B = 7: GOTO BDeskColorA
GOTO BListColorA

BListColorP:
LOCATE A, 18, 0: COLOR 12: PRINT CZ$(B + 7)
A = A + 1: B = B + 1
IF B = 5 THEN GOTO BDone
GOTO BListColorA

BListColorK:
WW(B + 7) = WW(B + 7) - 1
IF WW(B + 7) < 0 THEN WW(B + 7) = 63
PALETTE L(B), WW(B + 7)
GOTO BListColorA

BListColorM:
WW(B + 7) = WW(B + 7) + 1
IF WW(B + 7) = 64 THEN WW(B + 7) = 0
PALETTE L(B), WW(B + 7)
GOTO BListColorA

BDone:
LOCATE 16, 6, 0: COLOR 15: PLAY "F32": PRINT "Done"
BDoneA:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN LOCATE 16, 6, 0: COLOR 12: PRINT "Done": A = 17: B = 4: GOTO BListColorA
IF B$ = CHR$(0) + "P" THEN LOCATE 16, 6, 0: COLOR 12: PRINT "Done": GOTO BCancel
IF B$ = CHR$(13) THEN GOTO SaveBrowseColorInfo
IF B$ = " " THEN GOTO SaveBrowseColorInfo
GOTO BDoneA

SaveBrowseColorInfo:
D(1) = WW(1)
D(2) = WW(2)
D(3) = WW(3)
D(4) = WW(4)
D(5) = WW(5)
D(6) = WW(6)
D(7) = WW(7)
L(1) = WW(8)
L(2) = WW(9)
L(3) = WW(10)
L(4) = WW(11)
ERASE CZ$, WW
GOTO SaveBrowseInfo

BCancel:
LOCATE 18, 5, 0: COLOR 15: PLAY "F32": PRINT "Cancel"
BCancelA:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN LOCATE 18, 5, 0: COLOR 12: PRINT "Cancel": GOTO BDone
IF B$ = CHR$(0) + "P" THEN LOCATE 18, 5, 0: COLOR 12: PRINT "Cancel": GOTO BDeskColor
IF B$ = CHR$(13) THEN ERASE CZ$, WW: GOTO BrowseEditMainMenu
IF B$ = " " THEN ERASE CZ$, WW: GOTO BrowseEditMainMenu
GOTO BCancelA


BrowseNameEdit:
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออต Name Editor ฦอออออต": COLOR 1
LOCATE 1, 9, 0: COLOR 15: PRINT "Name Editor"
PRINT "": COLOR 11
PRINT "The Browser name is:": LOCATE 3, 23, 0: COLOR 15: PRINT N$
COLOR 11: PRINT "Would you like to change it?"
BNameChangeA:
B$ = INKEY$: IF B$ = "" THEN GOTO BNameChangeA
IF B$ = "Y" OR B$ = "y" THEN GOTO BChangeIt
IF B$ = "N" OR B$ = "n" THEN GOTO BrowseEditMainMenu
GOTO BNameChangeA

BChangeIt:
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออต Name Editor ฦอออออต": COLOR 1
LOCATE 1, 9, 0: COLOR 15: PRINT "Name Editor"
PRINT "": COLOR 11
PRINT "What should the new name be?"
PRINT "": COLOR 15
INPUT N$
IF N$ = "New" THEN GOTO BChangeItA
GOTO SaveBrowseUserInfo
GOTO BrowseEditMainMenu

BChangeItA:
COLOR 4, 0: SOUND 200, 5: SOUND 100, 5: LOCATE 8: PRINT "Sorry, the name `New' cannot be used."
PRINT "Please choose another."
BChangeItB:
B$ = INKEY$: IF B$ = "" THEN GOTO BChangeItB
GOTO BChangeIt

SaveBrowseUserInfo:
ERASE BZ$, CZ$
SaveBrowseInfo:
OPEN "O", 1, "User0.Dat"
PRINT #1, N$
PRINT #1, P(1)
PRINT #1, P(2)
PRINT #1, P(3)
PRINT #1, P(4)
PRINT #1, P(5)
PRINT #1, P(6)
PRINT #1, Desk$
PRINT #1, Pict$
PRINT #1, D(1)
PRINT #1, D(2)
PRINT #1, D(3)
PRINT #1, D(4)
PRINT #1, D(5)
PRINT #1, D(6)
PRINT #1, D(7)
PRINT #1, L(1)
PRINT #1, L(2)
PRINT #1, L(3)
PRINT #1, L(4)
PRINT #1, L(5)
PRINT #1, SecLevel
CLOSE
ERASE BZ$, CZ$: GOTO BrowseEditMainMenu
END SUB

SUB Coloredit
CLS


DIM W(12)
W(1) = D(1)
W(2) = D(2)
W(3) = D(3)
W(4) = D(4)
W(5) = D(5)
W(6) = D(6)
W(7) = D(7)
W(8) = L(1)
W(9) = L(2)
W(10) = L(3)
W(11) = L(4)


DIM Z$(12)
Z$(1) = "Frame"
Z$(2) = "Menu Items"
Z$(3) = "Hilighted Items"
Z$(4) = "Help Message"
Z$(5) = "Date/Time"
Z$(6) = "Title"
Z$(7) = "Instructions"
Z$(8) = "Frame"
Z$(9) = "Menu Items"
Z$(10) = "Hilighted Items"
Z$(11) = "Title/Quit Msg."
Z$(12) = "Quit Message"
PALETTE 1, D(1): D(1) = 1
PALETTE 2, D(2): D(2) = 2
PALETTE 3, D(3): D(3) = 3
PALETTE 4, D(5): D(5) = 4
PALETTE 5, D(6): D(6) = 5
PALETTE 6, D(7): D(7) = 6
PALETTE 7, D(4): D(4) = 7
PALETTE 8, L(1): L(1) = 8
PALETTE 9, L(2): L(2) = 9
PALETTE 10, L(3): L(3) = 10
PALETTE 11, L(4): L(4) = 11
PALETTE 12, 3
PALETTE 13, 13
PALETTE 14, 1
PALETTE 15, 63

Screendraw:
WIDTH 40: SOUND 1500, 2: COLOR 13: CLS
PRINT "ฦอออออออออออต Color Editor ฦอออออออออออต": LOCATE 1, 15, 0: COLOR 15: PRINT "Color Editor": COLOR 14
PRINT ""
PRINT "ษต Desktop Colors ฦัออออป": LOCATE 3, 4, 0: COLOR 15: PRINT "Desktop Colors": COLOR 14
PRINT "บ Frame            ณ    บ"
PRINT "บ Menu Items       ณ    บ"
PRINT "บ Hilighted Items  ณ    บ"
PRINT "บ Help Message     ณ    บ"
PRINT "บ Date/Time        ณ    บ"
PRINT "บ Title            ณ    บ"
PRINT "บ Instructions     ณ    บ"
PRINT "ศออออออออออออออออออฯออออผ"
PRINT ""
PRINT "               ษอต List Colors ฦออัออออป": LOCATE 13, 20, 0: COLOR 15: PRINT "List Colors": COLOR 14
PRINT "               บ Frame            ณ    บ"
PRINT "               บ Menu Items       ณ    บ"
PRINT "   < Done >    บ Hilighted Items  ณ    บ"
PRINT "               บ Title/Quit Msg.  ณ    บ"
PRINT "  < Cancel >   ศออออออออออออออออออฯออออผ"
PRINT "": COLOR 15
LOCATE 4, 3, 0: COLOR 12: PRINT Z$(1)
LOCATE 5, 3, 0: COLOR 12: PRINT Z$(2)
LOCATE 6, 3, 0: COLOR 12: PRINT Z$(3)
LOCATE 7, 3, 0: COLOR 12: PRINT Z$(4)
LOCATE 8, 3, 0: COLOR 12: PRINT Z$(5)
LOCATE 9, 3, 0: COLOR 12: PRINT Z$(6)
LOCATE 10, 3, 0: COLOR 12: PRINT Z$(7)
LOCATE 14, 18, 0: COLOR 12: PRINT Z$(8)
LOCATE 15, 18, 0: COLOR 12: PRINT Z$(9)
LOCATE 16, 18, 0: COLOR 12: PRINT Z$(10)
LOCATE 17, 18, 0: COLOR 12: PRINT Z$(11)
LOCATE 16, 6, 0: COLOR 12: PRINT "Done"
LOCATE 18, 5, 0: COLOR 12: PRINT "Cancel"

LOCATE 4, 21, 0: COLOR D(1): PRINT W(1)
LOCATE 5, 21, 0: COLOR D(2): PRINT W(2)
LOCATE 6, 21, 0: COLOR D(3): PRINT W(3)
LOCATE 7, 21, 0: COLOR D(4): PRINT W(4)
LOCATE 8, 21, 0: COLOR D(5): PRINT W(5)
LOCATE 9, 21, 0: COLOR D(6): PRINT W(6)
LOCATE 10, 21, 0: COLOR D(7): PRINT W(7)
LOCATE 14, 36, 0: COLOR L(1): PRINT W(8)
LOCATE 15, 36, 0: COLOR L(2): PRINT W(9)
LOCATE 16, 36, 0: COLOR L(3): PRINT W(10)
LOCATE 17, 36, 0: COLOR L(4): PRINT W(11)

DeskColor:
A = 4: B = 1
DeskColorA:
LOCATE A, 3, 0: COLOR 15: PRINT Z$(B)
LOCATE A, 21, 0: COLOR D(B): PLAY "F32": PRINT W(B)
DeskColorB:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO DeskColorH
IF B$ = CHR$(0) + "P" THEN GOTO DeskColorP
IF B$ = CHR$(0) + "K" THEN GOTO DeskColorK
IF B$ = CHR$(0) + "M" THEN GOTO DeskColorM
GOTO DeskColorB

DeskColorH:
LOCATE A, 3, 0: COLOR 12: PRINT Z$(B)
A = A - 1: B = B - 1
IF B = 0 THEN GOTO Cancel
GOTO DeskColorA

DeskColorP:
LOCATE A, 3, 0: COLOR 12: PRINT Z$(B)
A = A + 1: B = B + 1
IF B = 8 THEN GOTO ListColor
GOTO DeskColorA

DeskColorK:
W(B) = W(B) - 1
IF W(B) < 0 THEN W(B) = 63
PALETTE D(B), W(B)
GOTO DeskColorA

DeskColorM:
W(B) = W(B) + 1
IF W(B) > 63 THEN W(B) = 0
PALETTE D(B), W(B)
GOTO DeskColorA

ListColor:
A = 14: B = 1
ListColorA:
LOCATE A, 18, 0: COLOR 15: PRINT Z$(B + 7)
LOCATE A, 36, 0: COLOR L(B): PLAY "F32": PRINT W(B + 7)
ListColorB:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO ListColorH
IF B$ = CHR$(0) + "P" THEN GOTO ListColorP
IF B$ = CHR$(0) + "K" THEN GOTO ListColorK
IF B$ = CHR$(0) + "M" THEN GOTO ListColorM
GOTO ListColorB

ListColorH:
LOCATE A, 18, 0: COLOR 12: PRINT Z$(B + 7)
A = A - 1: B = B - 1
IF B = 0 THEN A = 10: B = 7: GOTO DeskColorA
GOTO ListColorA

ListColorP:
LOCATE A, 18, 0: COLOR 12: PRINT Z$(B + 7)
A = A + 1: B = B + 1
IF B = 5 THEN GOTO Done
GOTO ListColorA

ListColorK:
W(B + 7) = W(B + 7) - 1
IF W(B + 7) < 0 THEN W(B + 7) = 63
PALETTE L(B), W(B + 7)
GOTO ListColorA

ListColorM:
W(B + 7) = W(B + 7) + 1
IF W(B + 7) = 64 THEN L(B) = 0
PALETTE L(B), W(B + 7)
GOTO ListColorA

Done:
LOCATE 16, 6, 0: COLOR 15: PLAY "F32": PRINT "Done"
DoneA:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN LOCATE 16, 6, 0: COLOR 12: PRINT "Done": A = 17: B = 4: GOTO ListColorA
IF B$ = CHR$(0) + "P" THEN LOCATE 16, 6, 0: COLOR 12: PRINT "Done": GOTO Cancel
IF B$ = CHR$(13) THEN GOTO CallSaveUserInfo
IF B$ = " " THEN GOTO CallSaveUserInfo
GOTO DoneA

CallSaveUserInfo:
D(1) = W(1)
D(2) = W(2)
D(3) = W(3)
D(4) = W(4)
D(5) = W(5)
D(6) = W(6)
D(7) = W(7)
L(1) = W(8)
L(2) = W(9)
L(3) = W(10)
L(4) = W(11)
CALL SaveUserInfo
ERASE D, L, P
EXIT SUB

Cancel:
LOCATE 18, 5, 0: COLOR 15: PLAY "F32": PRINT "Cancel"
CancelA:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN LOCATE 18, 5, 0: COLOR 12: PRINT "Cancel": GOTO Done
IF B$ = CHR$(0) + "P" THEN LOCATE 18, 5, 0: COLOR 12: PRINT "Cancel": GOTO DeskColor
IF B$ = CHR$(13) THEN ERASE D, L, P: EXIT SUB
IF B$ = " " THEN ERASE D, L, P: EXIT SUB
GOTO CancelA


END SUB

SUB DeskChoose
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
INPUT #1, A$
INPUT #1, A
INPUT #1, A
INPUT #1, A
INPUT #1, A
INPUT #1, A
INPUT #1, A
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

SUB DesktopChoose
END SUB

SUB DriveSet
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออออต Drive Set: ฦออออออออออออต"
LOCATE 1, 16, 0: COLOR 15: PRINT "Drive Set:"
PRINT "": COLOR 11
PRINT "What drive are your desktop files on?": COLOR 9: PRINT "(Please just type the letter)"
DriveSetA:
B$ = INKEY$
IF B$ = "A" OR B$ = "a" THEN GOTO DriveSetB
IF B$ = "B" OR B$ = "b" THEN GOTO DriveSetB
IF B$ = "C" OR B$ = "c" THEN GOTO DriveSetB
IF B$ = "D" OR B$ = "d" THEN GOTO DriveSetB
IF B$ = "E" OR B$ = "e" THEN GOTO DriveSetB
IF B$ = "F" OR B$ = "f" THEN GOTO DriveSetB
IF B$ = "G" OR B$ = "g" THEN GOTO DriveSetB
IF B$ = "H" OR B$ = "h" THEN GOTO DriveSetB
IF B$ = "I" OR B$ = "i" THEN GOTO DriveSetB
IF B$ = "J" OR B$ = "j" THEN GOTO DriveSetB
IF B$ = "K" OR B$ = "k" THEN GOTO DriveSetB
IF B$ = "L" OR B$ = "l" THEN GOTO DriveSetB
IF B$ = "M" OR B$ = "m" THEN GOTO DriveSetB
IF B$ = "N" OR B$ = "n" THEN GOTO DriveSetB
IF B$ = "O" OR B$ = "o" THEN GOTO DriveSetB
IF B$ = "P" OR B$ = "p" THEN GOTO DriveSetB
IF B$ = "Q" OR B$ = "q" THEN GOTO DriveSetB
IF B$ = "R" OR B$ = "r" THEN GOTO DriveSetB
IF B$ = "S" OR B$ = "s" THEN GOTO DriveSetB
IF B$ = "T" OR B$ = "t" THEN GOTO DriveSetB
IF B$ = "U" OR B$ = "u" THEN GOTO DriveSetB
IF B$ = "V" OR B$ = "v" THEN GOTO DriveSetB
IF B$ = "W" OR B$ = "w" THEN GOTO DriveSetB
IF B$ = "X" OR B$ = "x" THEN GOTO DriveSetB
IF B$ = "Y" OR B$ = "y" THEN GOTO DriveSetB
IF B$ = "Z" OR B$ = "z" THEN GOTO DriveSetB
GOTO DriveSetA

DriveSetB:
B$ = B$ + ":"
OPEN "O", 1, "Drive.Dat"
PRINT #1, B$
CLOSE
ERASE D, L, P
END SUB

SUB ListName
END SUB

SUB MainMenu


SCREEN 1: SCREEN 0

OPEN "I", 1, "DeskInfo.Dat"
INPUT #1, One$
INPUT #1, Two$
INPUT #1, Three$
INPUT #1, HOne$
INPUT #1, HTwo$
INPUT #1, HThree$
INPUT #1, TopUser
CLOSE

DIM D(7)
DIM L(5)
DIM P(6)

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
INPUT #1, N$
INPUT #1, P(1)
INPUT #1, P(2)
INPUT #1, P(3)
INPUT #1, P(4)
INPUT #1, P(5)
INPUT #1, P(6)
INPUT #1, Desk
INPUT #1, Pict$
INPUT #1, D(1)
INPUT #1, D(2)
INPUT #1, D(3)
INPUT #1, D(4)
INPUT #1, D(5)
INPUT #1, D(6)
INPUT #1, D(7)
INPUT #1, L(1)
INPUT #1, L(2)
INPUT #1, L(3)
INPUT #1, L(4)
INPUT #1, L(5)
INPUT #1, SecLevel
CLOSE
IF N$ = "New" THEN CALL NewUser
IF User = TopUser THEN Menu$ = "Top": GOTO Menu
IF SecLevel = 1 THEN Menu$ = "A": GOTO Menu
IF SecLevel = 2 THEN Menu$ = "B": GOTO Menu
IF SecLevel = 0 THEN Menu$ = "0": GOTO Menu
sorry:
WIDTH 40: COLOR 13: CLS : SOUND 1500, 2
PRINT "ฦออออออออออต Configuration! ฦออออออออออต"
LOCATE 1, 14, 0: COLOR 15: PRINT "Configuration!"
COLOR 11: PRINT ""
PRINT "Sorry, You cannot configure the desktop."
PRINT ""
COLOR 14: PRINT "Press <ENTER> or <SPACE> to go on."
SorryA:
B$ = INKEY$
IF B$ = CHR$(13) THEN CALL DeskChoose
IF B$ = " " THEN CALL DeskChoose
GOTO SorryA

Menu:
WIDTH 40: COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออต Configuration! ฦออออออออออต": COLOR 1
LOCATE 1, 14, 0: COLOR 15: PRINT "Configuration!"
PRINT "": COLOR 1
PRINT "ษออออออออออออออออออออออออออออออออออออออป"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
IF Menu$ = "A" THEN GOTO AMenu
IF Menu$ = "Top" THEN GOTO topmenu
IF Menu$ = "0" THEN GOTO AAMenu
PRINT "ศออออออออออออออออออออออออออออออออออออออผ"
LOCATE 9, 1, 0: COLOR 14: PRINT "Use the cursor keys to choose,"
PRINT "Then press <ENTER> or <SPACE>."
DIM Z$(4)
Z$(1) = "Change your Desktop/List colors."
Z$(2) = "Change your name/password."
Z$(3) = "Return to the Desktop."
LOCATE 4, 2, 0: COLOR 3: PRINT Z$(1)
LOCATE 5, 2, 0: COLOR 3: PRINT Z$(2)
LOCATE 6, 2, 0: COLOR 3: PRINT Z$(3)
A = 4: B = 1
BMenuA:
LOCATE A, 2, 0: COLOR 15: PLAY "F32": PRINT Z$(B)
BMenuB:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO BMenuC
IF B$ = CHR$(0) + "P" THEN GOTO BMenuD
IF B$ = CHR$(13) THEN GOTO BMenuE
IF B$ = " " THEN GOTO BMenuE
GOTO BMenuB

BMenuC:
LOCATE A, 2, 0: COLOR 3: PRINT Z$(B)
A = A - 1: B = B - 1
IF B = 0 THEN A = 6: B = 3
GOTO BMenuA

BMenuD:
LOCATE A, 2, 0: COLOR 3: PRINT Z$(B)
A = A + 1: B = B + 1
IF B = 4 THEN A = 4: B = 1
GOTO BMenuA

BMenuE:
IF B = 1 THEN CALL Coloredit
IF B = 2 THEN CALL NameEdit
IF B = 3 THEN CALL DeskChoose
EXIT SUB

AMenu:
PRINT "บ                                      บ"
PRINT "ศออออออออออออออออออออออออออออออออออออออผ"
LOCATE 10, 1, 0: COLOR 14: PRINT "Use the cursor keys to choose,"
PRINT "Then press <ENTER> or <SPACE>."
DIM Z$(5)
Z$(1) = "Change your Desktop/List colors."
Z$(2) = "Change your name/password."
Z$(3) = "Edit the menu items."
Z$(4) = "Return to the Desktop."


LOCATE 4, 2, 0: COLOR 3: PRINT Z$(1)
LOCATE 5, 2, 0: COLOR 3: PRINT Z$(2)
LOCATE 6, 2, 0: COLOR 3: PRINT Z$(3)
LOCATE 7, 2, 0: COLOR 3: PRINT Z$(4)
A = 4: B = 1
AMenuA:
LOCATE A, 2, 0: COLOR 15: PLAY "F32": PRINT Z$(B)
AMenuB:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO AMenuC
IF B$ = CHR$(0) + "P" THEN GOTO AMenuD
IF B$ = CHR$(13) THEN GOTO AMenuE
IF B$ = " " THEN GOTO AMenuE
GOTO AMenuB

AMenuC:
LOCATE A, 2, 0: COLOR 3: PRINT Z$(B)
A = A - 1: B = B - 1
IF B = 0 THEN A = 7: B = 4
GOTO AMenuA

AMenuD:
LOCATE A, 2, 0: COLOR 3: PRINT Z$(B)
A = A + 1: B = B + 1
IF B = 5 THEN A = 4: B = 1
GOTO AMenuA

AMenuE:
IF B = 1 THEN CALL Coloredit
IF B = 2 THEN CALL NameEdit
IF B = 3 THEN CALL MenuItems
IF B = 4 THEN CALL DeskChoose
EXIT SUB

AAMenu:
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "ศออออออออออออออออออออออออออออออออออออออผ"
LOCATE 11, 1, 0: COLOR 14: PRINT "Use the cursor keys to choose,"
PRINT "Then press <ENTER> or <SPACE>."
DIM Z$(6)
Z$(1) = "Change your Desktop/List colors."
Z$(2) = "Change your name/password."
Z$(3) = "Edit the menu items."
Z$(4) = "Edit the message board."
Z$(5) = "Return to the Desktop."


LOCATE 4, 2, 0: COLOR 3: PRINT Z$(1)
LOCATE 5, 2, 0: COLOR 3: PRINT Z$(2)
LOCATE 6, 2, 0: COLOR 3: PRINT Z$(3)
LOCATE 7, 2, 0: COLOR 3: PRINT Z$(4)
LOCATE 8, 2, 0: COLOR 3: PRINT Z$(5)
A = 4: B = 1
AAMenuA:
LOCATE A, 2, 0: COLOR 15: PLAY "F32": PRINT Z$(B)
AAMenuB:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO AAMenuC
IF B$ = CHR$(0) + "P" THEN GOTO AAMenuD
IF B$ = CHR$(13) THEN GOTO AAMenuE
IF B$ = " " THEN GOTO AAMenuE
GOTO AAMenuB

AAMenuC:
LOCATE A, 2, 0: COLOR 3: PRINT Z$(B)
A = A - 1: B = B - 1
IF B = 0 THEN A = 8: B = 5
GOTO AAMenuA

AAMenuD:
LOCATE A, 2, 0: COLOR 3: PRINT Z$(B)
A = A + 1: B = B + 1
IF B = 6 THEN A = 4: B = 1
GOTO AAMenuA

AAMenuE:
IF B = 1 THEN CALL Coloredit
IF B = 2 THEN CALL NameEdit
IF B = 3 THEN CALL MenuItems
IF B = 4 THEN CALL BoardEdit
IF B = 5 THEN CALL DeskChoose
EXIT SUB

topmenu:
LOCATE 6: PRINT "ฬออออออออออออออออออออออออออออออออออออออน"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "ฬออออออออออออออออออออออออออออออออออออออน"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "ฬออออออออออออออออออออออออออออออออออออออน"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "ฬออออออออออออออออออออออออออออออออออออออน"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "ศออออออออออออออออออออออออออออออออออออออผ"
DIM Z$(14)
Z$(1) = "Change your Desktop/List colors."
Z$(2) = "Change your name/password."
Z$(3) = "Edit the menu items."
Z$(4) = "Edit the menu names."
Z$(5) = "Change users' security levels."
Z$(6) = "Choose another `Top User'."
Z$(7) = "Change the `Just Browsing' options."
Z$(8) = "Sign on as another user."
Z$(9) = "Edit the startup screen."
Z$(10) = "Delete a user."
Z$(11) = "Edit the message board."
Z$(12) = "Change Screen Saver settings."
Z$(13) = "Set the Desktop Drive."
Z$(14) = "Return to the Desktop."


LOCATE 4, 2, 0: COLOR 3: PRINT Z$(1)
LOCATE 5, 2, 0: COLOR 3: PRINT Z$(2)
LOCATE 7, 2, 0: COLOR 3: PRINT Z$(3)
LOCATE 8, 2, 0: COLOR 3: PRINT Z$(4)
LOCATE 10, 2, 0: COLOR 3: PRINT Z$(5)
LOCATE 11, 2, 0: COLOR 3: PRINT Z$(6)
LOCATE 13, 2, 0: COLOR 3: PRINT Z$(7)
LOCATE 14, 2, 0: COLOR 3: PRINT Z$(8)
LOCATE 16, 2, 0: COLOR 3: PRINT Z$(9)
LOCATE 17, 2, 0: COLOR 3: PRINT Z$(10)
LOCATE 18, 2, 0: COLOR 3: PRINT Z$(11)
LOCATE 19, 2, 0: COLOR 3: PRINT Z$(12)
LOCATE 20, 2, 0: COLOR 3: PRINT Z$(13)
LOCATE 21, 2, 0: COLOR 3: PRINT Z$(14)
A = 4: B = 1
TopMenuA:
LOCATE A, 2, 0: COLOR 15: PLAY "F32": PRINT Z$(B)
TopMenuB:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO TopMenuC
IF B$ = CHR$(0) + "P" THEN GOTO TopMenuD
IF B$ = CHR$(13) THEN GOTO TopMenuE
IF B$ = " " THEN GOTO TopMenuE
GOTO TopMenuB

TopMenuC:
LOCATE A, 2, 0: COLOR 3: PRINT Z$(B)
A = A - 1: B = B - 1
IF B = 2 THEN A = 5
IF B = 4 THEN A = 8
IF B = 6 THEN A = 11
IF B = 8 THEN A = 14
IF B = 0 THEN A = 21: B = 14
GOTO TopMenuA

TopMenuD:
LOCATE A, 2, 0: COLOR 3: PRINT Z$(B)
A = A + 1: B = B + 1
IF B = 15 THEN A = 4: B = 1
IF B = 3 THEN A = 7
IF B = 5 THEN A = 10
IF B = 7 THEN A = 13
IF B = 9 THEN A = 16
GOTO TopMenuA

TopMenuE:
IF B = 1 THEN CALL Coloredit
IF B = 2 THEN CALL NameEdit
IF B = 3 THEN CALL MenuItems
IF B = 4 THEN CALL MenuNames
IF B = 5 THEN CALL SecLevelEdit
IF B = 6 THEN CALL TopUserEdit
IF B = 7 THEN CALL BrowseEdit
IF B = 8 THEN CALL BreakIn
IF B = 9 THEN CALL StartScreen
IF B = 10 THEN CALL UserListEdit
IF B = 11 THEN CALL BoardEdit
IF B = 12 THEN CALL SSaverEdit
IF B = 13 THEN CALL DriveSet
IF B = 14 THEN CALL DeskChoose
EXIT SUB
END SUB

SUB MenuItems

DIM AList$(80)
DIM BList$(80)
DIM CList$(40)
DIM BasList$(40)

DIM AItem$(120)
DIM BItem$(120)
DIM CItem$(120)
DIM BasItem$(120)

OPEN "I", 1, "1List.Dat"
OPEN "I", 2, "2List.Dat"
OPEN "I", 3, "3List.Dat"
OPEN "I", 4, "BList.Dat"

A = 1
MenuItemsA:
INPUT #1, AList$(A)
A = A + 1
IF A > 40 THEN A = 1: GOTO MenuItemsB
GOTO MenuItemsA


MenuItemsB:
INPUT #2, BList$(A)
A = A + 1
IF A > 40 THEN A = 1: GOTO MenuItemsC
GOTO MenuItemsB

MenuItemsC:
INPUT #3, CList$(A)
A = A + 1
IF A > 40 THEN A = 1: GOTO MenuItemsD
GOTO MenuItemsC

MenuItemsD:
INPUT #4, BasList$(A)
A = A + 1
IF A > 40 THEN A = 1: GOTO MenuItemsE
GOTO MenuItemsD

MenuItemsE:
CLOSE

OPEN "I", 1, "AFiles.Dat"
OPEN "I", 2, "BFiles.Dat"
OPEN "I", 3, "CFiles.Dat"
OPEN "I", 4, "BasFiles.Dat"

A = 1
MenuItemsF:
INPUT #1, AItem$(A)
A = A + 1
IF A > 120 THEN A = 1: GOTO MenuItemsG
GOTO MenuItemsF


MenuItemsG:
INPUT #2, BItem$(A)
A = A + 1
IF A > 120 THEN A = 1: GOTO MenuItemsH
GOTO MenuItemsG

MenuItemsH:
INPUT #3, CItem$(A)
A = A + 1
IF A > 120 THEN A = 1: GOTO MenuItemsI
GOTO MenuItemsH

MenuItemsI:
INPUT #4, BasItem$(A)
A = A + 1
IF A > 120 THEN A = 1: GOTO MenuItemsJ
GOTO MenuItemsI

MenuItemsJ:
CLOSE





MenuItemsList:
KEY 1, ""
WIDTH 40: COLOR 1, 0: CLS : SOUND 1500, 2
PRINT "   ษออออออออต Program List ฦออออออออป  ": LOCATE 1, 15, 0: COLOR 15: PRINT "Program List": COLOR 1
PRINT "   บ                                บ  "
PRINT "   บ                                บ"
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ  "
PRINT "   บ                                บ"
PRINT "   ศอออออต Press ESC to quit. ฦอออออผ": LOCATE 22, 12, 0: COLOR 15: PRINT "Press ESC to quit."
PRINT "        Press F1 to change lists":
IF List$ = "" THEN GOTO ChooseList
IF List$ = "1" THEN GOTO MenuItemsList1
IF List$ = "2" THEN GOTO MenuItemsList2
IF List$ = "3" THEN GOTO MenuItemsList3
IF List$ = "B" THEN GOTO MenuItemsListB

ChooseList:
LOCATE 2, 5, 0: PRINT "               ": LOCATE 2, 22, 0: PRINT "               "
LOCATE 3, 5, 0: PRINT "               ": LOCATE 3, 22, 0: PRINT "               "
LOCATE 4, 5, 0: PRINT "               ": LOCATE 4, 22, 0: PRINT "               "
LOCATE 5, 5, 0: PRINT "               ": LOCATE 5, 22, 0: PRINT "               "
LOCATE 6, 5, 0: PRINT "               ": LOCATE 6, 22, 0: PRINT "               "
LOCATE 7, 5, 0: PRINT "               ": LOCATE 7, 22, 0: PRINT "               "
LOCATE 8, 5, 0: PRINT "               ": LOCATE 8, 22, 0: PRINT "               "
LOCATE 9, 5, 0: PRINT "               ": LOCATE 9, 22, 0: PRINT "               "
LOCATE 10, 5, 0: PRINT "               ": LOCATE 10, 22, 0: PRINT "               "
LOCATE 11, 5, 0: PRINT "               ": LOCATE 11, 22, 0: PRINT "               "
LOCATE 12, 5, 0: PRINT "               ": LOCATE 12, 22, 0: PRINT "               "
LOCATE 13, 5, 0: PRINT "               ": LOCATE 13, 22, 0: PRINT "               "
LOCATE 14, 5, 0: PRINT "               ": LOCATE 14, 22, 0: PRINT "               "
LOCATE 15, 5, 0: PRINT "               ": LOCATE 15, 22, 0: PRINT "               "
LOCATE 16, 5, 0: PRINT "               ": LOCATE 16, 22, 0: PRINT "               "
LOCATE 17, 5, 0: PRINT "               ": LOCATE 17, 22, 0: PRINT "               "
LOCATE 18, 5, 0: PRINT "               ": LOCATE 18, 22, 0: PRINT "               "
LOCATE 19, 5, 0: PRINT "               ": LOCATE 19, 22, 0: PRINT "               "
LOCATE 20, 5, 0: PRINT "               ": LOCATE 20, 22, 0: PRINT "               "
LOCATE 21, 5, 0: PRINT "               ": LOCATE 21, 22, 0: PRINT "               "
LOCATE 3, 7, 0: COLOR 15: PRINT "Please choose a list to edit"
LOCATE 4, 8, 0: COLOR 11: PRINT "(1) - Program List 1"
LOCATE 5, 8, 0: COLOR 11: PRINT "(2) - Program List 2"
LOCATE 6, 8, 0: COLOR 11: PRINT "(3) - Program List 3"
LOCATE 7, 8, 0: COLOR 11: PRINT "(4) - Basic Programs"
ChooseListA:
B$ = INKEY$
IF B$ = "1" THEN List$ = "1": GOTO MenuItemsList1
IF B$ = "2" THEN List$ = "2": GOTO MenuItemsList2
IF B$ = "3" THEN List$ = "3": GOTO MenuItemsList3
IF B$ = "4" THEN List$ = "B": GOTO MenuItemsListB
IF B$ = CHR$(27) THEN GOTO MenuItemsQuit
GOTO ChooseListA

MenuItemsList1:
LOCATE 3, 7, 0: COLOR 0: PRINT "Please choose a list to edit"
LOCATE 4, 8, 0: COLOR 0: PRINT "(1) - Program List 1"
LOCATE 5, 8, 0: COLOR 0: PRINT "(2) - Program List 2"
LOCATE 6, 8, 0: COLOR 0: PRINT "(3) - Program List 3"
LOCATE 7, 8, 0: COLOR 0: PRINT "(4) - Basic Programs"
LOCATE 2, 5, 0: COLOR 3: PRINT AList$(1): LOCATE 2, 22, 0: COLOR 3: PRINT AList$(21)
LOCATE 3, 5, 0: COLOR 3: PRINT AList$(2): LOCATE 3, 22, 0: COLOR 3: PRINT AList$(22)
LOCATE 4, 5, 0: COLOR 3: PRINT AList$(3): LOCATE 4, 22, 0: COLOR 3: PRINT AList$(23)
LOCATE 5, 5, 0: COLOR 3: PRINT AList$(4): LOCATE 5, 22, 0: COLOR 3: PRINT AList$(24)
LOCATE 6, 5, 0: COLOR 3: PRINT AList$(5): LOCATE 6, 22, 0: COLOR 3: PRINT AList$(25)
LOCATE 7, 5, 0: COLOR 3: PRINT AList$(6): LOCATE 7, 22, 0: COLOR 3: PRINT AList$(26)
LOCATE 8, 5, 0: COLOR 3: PRINT AList$(7): LOCATE 8, 22, 0: COLOR 3: PRINT AList$(27)
LOCATE 9, 5, 0: COLOR 3: PRINT AList$(8): LOCATE 9, 22, 0: COLOR 3: PRINT AList$(28)
LOCATE 10, 5, 0: COLOR 3: PRINT AList$(9): LOCATE 10, 22, 0: COLOR 3: PRINT AList$(29)
LOCATE 11, 5, 0: COLOR 3: PRINT AList$(10): LOCATE 11, 22, 0: COLOR 3: PRINT AList$(30)
LOCATE 12, 5, 0: COLOR 3: PRINT AList$(11): LOCATE 12, 22, 0: COLOR 3: PRINT AList$(31)
LOCATE 13, 5, 0: COLOR 3: PRINT AList$(12): LOCATE 13, 22, 0: COLOR 3: PRINT AList$(32)
LOCATE 14, 5, 0: COLOR 3: PRINT AList$(13): LOCATE 14, 22, 0: COLOR 3: PRINT AList$(33)
LOCATE 15, 5, 0: COLOR 3: PRINT AList$(14): LOCATE 15, 22, 0: COLOR 3: PRINT AList$(34)
LOCATE 16, 5, 0: COLOR 3: PRINT AList$(15): LOCATE 16, 22, 0: COLOR 3: PRINT AList$(35)
LOCATE 17, 5, 0: COLOR 3: PRINT AList$(16): LOCATE 17, 22, 0: COLOR 3: PRINT AList$(36)
LOCATE 18, 5, 0: COLOR 3: PRINT AList$(17): LOCATE 18, 22, 0: COLOR 3: PRINT AList$(37)
LOCATE 19, 5, 0: COLOR 3: PRINT AList$(18): LOCATE 19, 22, 0: COLOR 3: PRINT AList$(38)
LOCATE 20, 5, 0: COLOR 3: PRINT AList$(19): LOCATE 20, 22, 0: COLOR 3: PRINT AList$(39)
LOCATE 21, 5, 0: COLOR 3: PRINT AList$(20): LOCATE 21, 22, 0: COLOR 3: PRINT AList$(40)

A = 2: B = 1
AListK:
LOCATE A, 5, 0: COLOR 15: PLAY "F32": PRINT AList$(B)
AListL:
B$ = INKEY$: IF B$ = "" THEN GOTO AListL
IF B$ = CHR$(0) + "H" THEN GOTO AListM
IF B$ = CHR$(0) + "P" THEN GOTO AListN
IF B$ = CHR$(0) + "M" THEN GOTO AListO
IF B$ = CHR$(0) + "K" THEN GOTO AListO
IF B$ = CHR$(13) GOTO ItemEdit
IF B$ = CHR$(27) THEN GOTO MenuItemsQuit
IF B$ = "" THEN GOTO ChooseList
IF B$ = " " THEN GOTO ItemEdit
GOTO AListL

AListM:
LOCATE A, 5, 0: COLOR 3: PRINT AList$(B)
A = A - 1: B = B - 1
IF B = 0 THEN A = 21: B = 40: GOTO AListQ
GOTO AListK

AListN:
LOCATE A, 5, 0: COLOR 3: PRINT AList$(B)
A = A + 1: B = B + 1
IF B = 21 THEN A = 2: GOTO AListP
GOTO AListK

AListO:
LOCATE A, 5, 0: COLOR 3: PRINT AList$(B)
B = B + 20: GOTO AListQ

AListP:

A = 2: B = 21

AListQ:
LOCATE A, 22, 0: COLOR 15: PLAY "F32": PRINT AList$(B)
AListR:
B$ = INKEY$: IF B$ = "" THEN GOTO AListR
IF B$ = CHR$(0) + "H" THEN GOTO AListS
IF B$ = CHR$(0) + "P" THEN GOTO AListT
IF B$ = CHR$(0) + "M" THEN GOTO AListU
IF B$ = CHR$(0) + "K" THEN GOTO AListU
IF B$ = CHR$(13) GOTO ItemEdit
IF B$ = CHR$(27) THEN GOTO MenuItemsQuit
IF B$ = "" THEN GOTO ChooseList
IF B$ = " " THEN GOTO ItemEdit
GOTO AListR

AListS:
LOCATE A, 22, 0: COLOR 3: PRINT AList$(B)
A = A - 1: B = B - 1
IF B = 20 THEN A = 21: B = 20: GOTO AListK
GOTO AListQ

AListT:
LOCATE A, 22, 0: COLOR 3: PRINT AList$(B)
A = A + 1: B = B + 1
IF B = 41 THEN B = 1: A = 2: GOTO AListK
GOTO AListQ

AListU:
LOCATE A, 22, 0: COLOR 3: PRINT AList$(B)
B = B - 20: GOTO AListK


MenuItemsList2:
LOCATE 3, 7, 0: COLOR 0: PRINT "Please choose a list to edit"
LOCATE 4, 8, 0: COLOR 0: PRINT "(1) - Program List 1"
LOCATE 5, 8, 0: COLOR 0: PRINT "(2) - Program List 2"
LOCATE 6, 8, 0: COLOR 0: PRINT "(3) - Program List 3"
LOCATE 7, 8, 0: COLOR 0: PRINT "(4) - Basic Programs"
LOCATE 2, 5, 0: COLOR 3: PRINT BList$(1): LOCATE 2, 22, 0: COLOR 3: PRINT BList$(21)
LOCATE 3, 5, 0: COLOR 3: PRINT BList$(2): LOCATE 3, 22, 0: COLOR 3: PRINT BList$(22)
LOCATE 4, 5, 0: COLOR 3: PRINT BList$(3): LOCATE 4, 22, 0: COLOR 3: PRINT BList$(23)
LOCATE 5, 5, 0: COLOR 3: PRINT BList$(4): LOCATE 5, 22, 0: COLOR 3: PRINT BList$(24)
LOCATE 6, 5, 0: COLOR 3: PRINT BList$(5): LOCATE 6, 22, 0: COLOR 3: PRINT BList$(25)
LOCATE 7, 5, 0: COLOR 3: PRINT BList$(6): LOCATE 7, 22, 0: COLOR 3: PRINT BList$(26)
LOCATE 8, 5, 0: COLOR 3: PRINT BList$(7): LOCATE 8, 22, 0: COLOR 3: PRINT BList$(27)
LOCATE 9, 5, 0: COLOR 3: PRINT BList$(8): LOCATE 9, 22, 0: COLOR 3: PRINT BList$(28)
LOCATE 10, 5, 0: COLOR 3: PRINT BList$(9): LOCATE 10, 22, 0: COLOR 3: PRINT BList$(29)
LOCATE 11, 5, 0: COLOR 3: PRINT BList$(10): LOCATE 11, 22, 0: COLOR 3: PRINT BList$(30)
LOCATE 12, 5, 0: COLOR 3: PRINT BList$(11): LOCATE 12, 22, 0: COLOR 3: PRINT BList$(31)
LOCATE 13, 5, 0: COLOR 3: PRINT BList$(12): LOCATE 13, 22, 0: COLOR 3: PRINT BList$(32)
LOCATE 14, 5, 0: COLOR 3: PRINT BList$(13): LOCATE 14, 22, 0: COLOR 3: PRINT BList$(33)
LOCATE 15, 5, 0: COLOR 3: PRINT BList$(14): LOCATE 15, 22, 0: COLOR 3: PRINT BList$(34)
LOCATE 16, 5, 0: COLOR 3: PRINT BList$(15): LOCATE 16, 22, 0: COLOR 3: PRINT BList$(35)
LOCATE 17, 5, 0: COLOR 3: PRINT BList$(16): LOCATE 17, 22, 0: COLOR 3: PRINT BList$(36)
LOCATE 18, 5, 0: COLOR 3: PRINT BList$(17): LOCATE 18, 22, 0: COLOR 3: PRINT BList$(37)
LOCATE 19, 5, 0: COLOR 3: PRINT BList$(18): LOCATE 19, 22, 0: COLOR 3: PRINT BList$(38)
LOCATE 20, 5, 0: COLOR 3: PRINT BList$(19): LOCATE 20, 22, 0: COLOR 3: PRINT BList$(39)
LOCATE 21, 5, 0: COLOR 3: PRINT BList$(20): LOCATE 21, 22, 0: COLOR 3: PRINT BList$(40)

A = 2: B = 1: KEY 1, ""
BListK:
LOCATE A, 5, 0: COLOR 15: PLAY "F32": PRINT BList$(B)
BListL:
B$ = INKEY$: IF B$ = "" THEN GOTO BListL
IF B$ = CHR$(0) + "H" THEN GOTO BListM
IF B$ = "" THEN GOTO ChooseList
IF B$ = CHR$(0) + "P" THEN GOTO BListN
IF B$ = CHR$(0) + "M" THEN GOTO BListO
IF B$ = CHR$(0) + "K" THEN GOTO BListO
IF B$ = CHR$(13) GOTO ItemEdit
IF B$ = CHR$(27) THEN GOTO MenuItemsQuit
IF B$ = " " THEN GOTO ItemEdit
GOTO BListL

BListM:
LOCATE A, 5, 0: COLOR 3: PRINT BList$(B)
A = A - 1: B = B - 1
IF B = 0 THEN A = 21: B = 40: GOTO BListQ
GOTO BListK

BListN:
LOCATE A, 5, 0: COLOR 3: PRINT BList$(B)
A = A + 1: B = B + 1
IF B = 21 THEN A = 2: GOTO BListP
GOTO BListK

BListO:
LOCATE A, 5, 0: COLOR 3: PRINT BList$(B)
B = B + 20: GOTO BListQ

BListP:

A = 2: B = 21

BListQ:
LOCATE A, 22, 0: COLOR 15: PLAY "F32": PRINT BList$(B)
BListR:
B$ = INKEY$: IF B$ = "" THEN GOTO BListR
IF B$ = CHR$(0) + "H" THEN GOTO BListS
IF B$ = CHR$(0) + "P" THEN GOTO BListT
IF B$ = CHR$(0) + "M" THEN GOTO BListU
IF B$ = CHR$(0) + "K" THEN GOTO BListU
IF B$ = "" THEN GOTO ChooseList
IF B$ = CHR$(13) GOTO ItemEdit
IF B$ = CHR$(27) THEN GOTO MenuItemsQuit
IF B$ = " " THEN GOTO ItemEdit
GOTO BListR

BListS:
LOCATE A, 22, 0: COLOR 3: PRINT BList$(B)
A = A - 1: B = B - 1
IF B = 20 THEN A = 21: B = 20: GOTO BListK
GOTO BListQ

BListT:
LOCATE A, 22, 0: COLOR 3: PRINT BList$(B)
A = A + 1: B = B + 1
IF B = 41 THEN B = 1: A = 2: GOTO BListK
GOTO BListQ

BListU:
LOCATE A, 22, 0: COLOR 3: PRINT BList$(B)
B = B - 20: GOTO BListK

MenuItemsList3:
LOCATE 3, 7, 0: COLOR 0: PRINT "Please choose a list to edit"
LOCATE 4, 8, 0: COLOR 0: PRINT "(1) - Program List 1"
LOCATE 5, 8, 0: COLOR 0: PRINT "(2) - Program List 2"
LOCATE 6, 8, 0: COLOR 0: PRINT "(3) - Program List 3"
LOCATE 7, 8, 0: COLOR 0: PRINT "(4) - Basic Programs"
LOCATE 2, 5, 0: COLOR 3: PRINT CList$(1): LOCATE 2, 22, 0: COLOR 3: PRINT CList$(21)
LOCATE 3, 5, 0: COLOR 3: PRINT CList$(2): LOCATE 3, 22, 0: COLOR 3: PRINT CList$(22)
LOCATE 4, 5, 0: COLOR 3: PRINT CList$(3): LOCATE 4, 22, 0: COLOR 3: PRINT CList$(23)
LOCATE 5, 5, 0: COLOR 3: PRINT CList$(4): LOCATE 5, 22, 0: COLOR 3: PRINT CList$(24)
LOCATE 6, 5, 0: COLOR 3: PRINT CList$(5): LOCATE 6, 22, 0: COLOR 3: PRINT CList$(25)
LOCATE 7, 5, 0: COLOR 3: PRINT CList$(6): LOCATE 7, 22, 0: COLOR 3: PRINT CList$(26)
LOCATE 8, 5, 0: COLOR 3: PRINT CList$(7): LOCATE 8, 22, 0: COLOR 3: PRINT CList$(27)
LOCATE 9, 5, 0: COLOR 3: PRINT CList$(8): LOCATE 9, 22, 0: COLOR 3: PRINT CList$(28)
LOCATE 10, 5, 0: COLOR 3: PRINT CList$(9): LOCATE 10, 22, 0: COLOR 3: PRINT CList$(29)
LOCATE 11, 5, 0: COLOR 3: PRINT CList$(10): LOCATE 11, 22, 0: COLOR 3: PRINT CList$(30)
LOCATE 12, 5, 0: COLOR 3: PRINT CList$(11): LOCATE 12, 22, 0: COLOR 3: PRINT CList$(31)
LOCATE 13, 5, 0: COLOR 3: PRINT CList$(12): LOCATE 13, 22, 0: COLOR 3: PRINT CList$(32)
LOCATE 14, 5, 0: COLOR 3: PRINT CList$(13): LOCATE 14, 22, 0: COLOR 3: PRINT CList$(33)
LOCATE 15, 5, 0: COLOR 3: PRINT CList$(14): LOCATE 15, 22, 0: COLOR 3: PRINT CList$(34)
LOCATE 16, 5, 0: COLOR 3: PRINT CList$(15): LOCATE 16, 22, 0: COLOR 3: PRINT CList$(35)
LOCATE 17, 5, 0: COLOR 3: PRINT CList$(16): LOCATE 17, 22, 0: COLOR 3: PRINT CList$(36)
LOCATE 18, 5, 0: COLOR 3: PRINT CList$(17): LOCATE 18, 22, 0: COLOR 3: PRINT CList$(37)
LOCATE 19, 5, 0: COLOR 3: PRINT CList$(18): LOCATE 19, 22, 0: COLOR 3: PRINT CList$(38)
LOCATE 20, 5, 0: COLOR 3: PRINT CList$(19): LOCATE 20, 22, 0: COLOR 3: PRINT CList$(39)
LOCATE 21, 5, 0: COLOR 3: PRINT CList$(20): LOCATE 21, 22, 0: COLOR 3: PRINT CList$(40)

A = 2: B = 1
CListK:
LOCATE A, 5, 0: COLOR 15: PLAY "F32": PRINT CList$(B)
CListL:
B$ = INKEY$: IF B$ = "" THEN GOTO CListL
IF B$ = CHR$(0) + "H" THEN GOTO CListM
IF B$ = CHR$(0) + "P" THEN GOTO CListN
IF B$ = CHR$(0) + "M" THEN GOTO CListO
IF B$ = CHR$(0) + "K" THEN GOTO CListO
IF B$ = CHR$(13) GOTO ItemEdit
IF B$ = CHR$(27) THEN GOTO MenuItemsQuit
IF B$ = "" THEN GOTO ChooseList
IF B$ = " " THEN GOTO ItemEdit
GOTO CListL

CListM:
LOCATE A, 5, 0: COLOR 3: PRINT CList$(B)
A = A - 1: B = B - 1
IF B = 0 THEN A = 21: B = 40: GOTO CListQ
GOTO CListK

CListN:
LOCATE A, 5, 0: COLOR 3: PRINT CList$(B)
A = A + 1: B = B + 1
IF B = 21 THEN A = 2: GOTO CListP
GOTO CListK

CListO:
LOCATE A, 5, 0: COLOR 3: PRINT CList$(B)
B = B + 20: GOTO CListQ

CListP:

A = 2: B = 21

CListQ:
LOCATE A, 22, 0: COLOR 15: PLAY "F32": PRINT CList$(B)
CListR:
B$ = INKEY$: IF B$ = "" THEN GOTO CListR
IF B$ = CHR$(0) + "H" THEN GOTO CListS
IF B$ = CHR$(0) + "P" THEN GOTO CListT
IF B$ = CHR$(0) + "M" THEN GOTO CListU
IF B$ = CHR$(0) + "K" THEN GOTO CListU
IF B$ = CHR$(13) GOTO ItemEdit
IF B$ = CHR$(27) THEN GOTO MenuItemsQuit
IF B$ = "" THEN GOTO ChooseList
IF B$ = " " THEN GOTO ItemEdit
GOTO CListR

CListS:
LOCATE A, 22, 0: COLOR 3: PRINT CList$(B)
A = A - 1: B = B - 1
IF B = 20 THEN A = 21: B = 20: GOTO CListK
GOTO CListQ

CListT:
LOCATE A, 22, 0: COLOR 3: PRINT CList$(B)
A = A + 1: B = B + 1
IF B = 41 THEN B = 1: A = 2: GOTO CListK
GOTO CListQ

CListU:
LOCATE A, 22, 0: COLOR 3: PRINT CList$(B)
B = B - 20: GOTO CListK


MenuItemsListB:
LOCATE 3, 7, 0: COLOR 0: PRINT "Please choose a list to edit"
LOCATE 4, 8, 0: COLOR 0: PRINT "(1) - Program List 1"
LOCATE 5, 8, 0: COLOR 0: PRINT "(2) - Program List 2"
LOCATE 6, 8, 0: COLOR 0: PRINT "(3) - Program List 3"
LOCATE 7, 8, 0: COLOR 0: PRINT "(4) - Basic Programs"
LOCATE 2, 5, 0: COLOR 3: PRINT BasList$(1): LOCATE 2, 22, 0: COLOR 3: PRINT BasList$(21)
LOCATE 3, 5, 0: COLOR 3: PRINT BasList$(2): LOCATE 3, 22, 0: COLOR 3: PRINT BasList$(22)
LOCATE 4, 5, 0: COLOR 3: PRINT BasList$(3): LOCATE 4, 22, 0: COLOR 3: PRINT BasList$(23)
LOCATE 5, 5, 0: COLOR 3: PRINT BasList$(4): LOCATE 5, 22, 0: COLOR 3: PRINT BasList$(24)
LOCATE 6, 5, 0: COLOR 3: PRINT BasList$(5): LOCATE 6, 22, 0: COLOR 3: PRINT BasList$(25)
LOCATE 7, 5, 0: COLOR 3: PRINT BasList$(6): LOCATE 7, 22, 0: COLOR 3: PRINT BasList$(26)
LOCATE 8, 5, 0: COLOR 3: PRINT BasList$(7): LOCATE 8, 22, 0: COLOR 3: PRINT BasList$(27)
LOCATE 9, 5, 0: COLOR 3: PRINT BasList$(8): LOCATE 9, 22, 0: COLOR 3: PRINT BasList$(28)
LOCATE 10, 5, 0: COLOR 3: PRINT BasList$(9): LOCATE 10, 22, 0: COLOR 3: PRINT BasList$(29)
LOCATE 11, 5, 0: COLOR 3: PRINT BasList$(10): LOCATE 11, 22, 0: COLOR 3: PRINT BasList$(30)
LOCATE 12, 5, 0: COLOR 3: PRINT BasList$(11): LOCATE 12, 22, 0: COLOR 3: PRINT BasList$(31)
LOCATE 13, 5, 0: COLOR 3: PRINT BasList$(12): LOCATE 13, 22, 0: COLOR 3: PRINT BasList$(32)
LOCATE 14, 5, 0: COLOR 3: PRINT BasList$(13): LOCATE 14, 22, 0: COLOR 3: PRINT BasList$(33)
LOCATE 15, 5, 0: COLOR 3: PRINT BasList$(14): LOCATE 15, 22, 0: COLOR 3: PRINT BasList$(34)
LOCATE 16, 5, 0: COLOR 3: PRINT BasList$(15): LOCATE 16, 22, 0: COLOR 3: PRINT BasList$(35)
LOCATE 17, 5, 0: COLOR 3: PRINT BasList$(16): LOCATE 17, 22, 0: COLOR 3: PRINT BasList$(36)
LOCATE 18, 5, 0: COLOR 3: PRINT BasList$(17): LOCATE 18, 22, 0: COLOR 3: PRINT BasList$(37)
LOCATE 19, 5, 0: COLOR 3: PRINT BasList$(18): LOCATE 19, 22, 0: COLOR 3: PRINT BasList$(38)
LOCATE 20, 5, 0: COLOR 3: PRINT BasList$(19): LOCATE 20, 22, 0: COLOR 3: PRINT BasList$(39)
LOCATE 21, 5, 0: COLOR 3: PRINT BasList$(20): LOCATE 21, 22, 0: COLOR 3: PRINT BasList$(40)

A = 2: B = 1: KEY 1, ""
BasListK:
LOCATE A, 5, 0: COLOR 15: PLAY "F32": PRINT BasList$(B)
BasListL:
B$ = INKEY$: IF B$ = "" THEN GOTO BasListL
IF B$ = CHR$(0) + "H" THEN GOTO BasListM
IF B$ = "" THEN GOTO ChooseList
IF B$ = CHR$(0) + "P" THEN GOTO BasListN
IF B$ = CHR$(0) + "M" THEN GOTO BasListO
IF B$ = CHR$(0) + "K" THEN GOTO BasListO
IF B$ = CHR$(13) GOTO ItemEdit
IF B$ = CHR$(27) THEN GOTO MenuItemsQuit
IF B$ = " " THEN GOTO ItemEdit
GOTO BasListL

BasListM:
LOCATE A, 5, 0: COLOR 3: PRINT BasList$(B)
A = A - 1: B = B - 1
IF B = 0 THEN A = 21: B = 40: GOTO BasListQ
GOTO BasListK

BasListN:
LOCATE A, 5, 0: COLOR 3: PRINT BasList$(B)
A = A + 1: B = B + 1
IF B = 21 THEN A = 2: GOTO BasListP
GOTO BasListK

BasListO:
LOCATE A, 5, 0: COLOR 3: PRINT BasList$(B)
B = B + 20: GOTO BasListQ

BasListP:

A = 2: B = 21

BasListQ:
LOCATE A, 22, 0: COLOR 15: PLAY "F32": PRINT BasList$(B)
BasListR:
B$ = INKEY$: IF B$ = "" THEN GOTO BasListR
IF B$ = CHR$(0) + "H" THEN GOTO BasListS
IF B$ = CHR$(0) + "P" THEN GOTO BasListT
IF B$ = CHR$(0) + "M" THEN GOTO BasListU
IF B$ = CHR$(0) + "K" THEN GOTO BasListU
IF B$ = "" THEN GOTO ChooseList
IF B$ = CHR$(13) GOTO ItemEdit
IF B$ = CHR$(27) THEN GOTO MenuItemsQuit
IF B$ = " " THEN GOTO ItemEdit
GOTO BasListR

BasListS:
LOCATE A, 22, 0: COLOR 3: PRINT BasList$(B)
A = A - 1: B = B - 1
IF B = 20 THEN A = 21: B = 20: GOTO BasListK
GOTO BasListQ

BasListT:
LOCATE A, 22, 0: COLOR 3: PRINT BasList$(B)
A = A + 1: B = B + 1
IF B = 41 THEN B = 1: A = 2: GOTO BasListK
GOTO BasListQ

BasListU:
LOCATE A, 22, 0: COLOR 3: PRINT BasList$(B)
B = B - 20: GOTO BasListK

ItemEdit:
WIDTH 40: COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออออต Menu Items ฦออออออออออออต"
LOCATE 22: COLOR 15: PRINT ""
LOCATE 1, 16, 0: COLOR 15: PRINT "Menu Items"
PRINT "": COLOR 15
PRINT "What drive is the file on?": COLOR 9
PRINT "(Please type the letter only!)": COLOR 11
DDriveSetA:
INPUT B$
IF B$ = "A" OR B$ = "a" THEN GOTO DDriveSetB
IF B$ = "B" OR B$ = "b" THEN GOTO DDriveSetB
IF B$ = "C" OR B$ = "c" THEN GOTO DDriveSetB
IF B$ = "D" OR B$ = "d" THEN GOTO DDriveSetB
IF B$ = "E" OR B$ = "e" THEN GOTO DDriveSetB
IF B$ = "F" OR B$ = "f" THEN GOTO DDriveSetB
IF B$ = "G" OR B$ = "g" THEN GOTO DDriveSetB
IF B$ = "H" OR B$ = "h" THEN GOTO DDriveSetB
IF B$ = "I" OR B$ = "i" THEN GOTO DDriveSetB
IF B$ = "J" OR B$ = "j" THEN GOTO DDriveSetB
IF B$ = "K" OR B$ = "k" THEN GOTO DDriveSetB
IF B$ = "L" OR B$ = "l" THEN GOTO DDriveSetB
IF B$ = "M" OR B$ = "m" THEN GOTO DDriveSetB
IF B$ = "N" OR B$ = "n" THEN GOTO DDriveSetB
IF B$ = "O" OR B$ = "o" THEN GOTO DDriveSetB
IF B$ = "P" OR B$ = "p" THEN GOTO DDriveSetB
IF B$ = "Q" OR B$ = "q" THEN GOTO DDriveSetB
IF B$ = "R" OR B$ = "r" THEN GOTO DDriveSetB
IF B$ = "S" OR B$ = "s" THEN GOTO DDriveSetB
IF B$ = "T" OR B$ = "t" THEN GOTO DDriveSetB
IF B$ = "U" OR B$ = "u" THEN GOTO DDriveSetB
IF B$ = "V" OR B$ = "v" THEN GOTO DDriveSetB
IF B$ = "W" OR B$ = "w" THEN GOTO DDriveSetB
IF B$ = "X" OR B$ = "x" THEN GOTO DDriveSetB
IF B$ = "Y" OR B$ = "y" THEN GOTO DDriveSetB
IF B$ = "Z" OR B$ = "z" THEN GOTO DDriveSetB
IF B$ = "" THEN GOTO DDriveSetB
DDriveSetB:
IF List$ = "1" THEN AItem$(B + 80) = B$: AItem$(B + 80) = AItem$(B + 80) + ":"
IF List$ = "2" THEN BItem$(B + 80) = B$: BItem$(B + 80) = BItem$(B + 80) + ":"
IF List$ = "3" THEN CItem$(B + 80) = B$: CItem$(B + 80) = CItem$(B + 80) + ":"
IF List$ = "B" THEN BasItem$(B + 80) = B$: BasItem$(B + 80) = BasItem$(B + 80) + ":"
IF List$ = "1" THEN IF AItem$(B + 80) = "" THEN AList$(B) = "Empty": GOTO MenuItemsList
IF List$ = "2" THEN IF BItem$(B + 80) = "" THEN BList$(B) = "Empty": GOTO MenuItemsList
IF List$ = "3" THEN IF CItem$(B + 80) = "" THEN CList$(B) = "Empty": GOTO MenuItemsList
IF List$ = "B" THEN IF BasItem$(B + 80) = "" THEN BasList$(B) = "Empty": GOTO MenuItemsList

PRINT "": COLOR 15
PRINT "What directory is the file in?": COLOR 11
IF List$ = "1" THEN LINE INPUT AItem$(B + 40)
IF List$ = "2" THEN LINE INPUT BItem$(B + 40)
IF List$ = "3" THEN LINE INPUT CItem$(B + 40)
IF List$ = "B" THEN LINE INPUT BasItem$(B + 40)
IF List$ = "1" THEN IF AItem$(B + 40) = "" THEN AList$(B) = "Empty": GOTO MenuItemsList
IF List$ = "2" THEN IF BItem$(B + 40) = "" THEN BList$(B) = "Empty": GOTO MenuItemsList
IF List$ = "3" THEN IF CItem$(B + 40) = "" THEN CList$(B) = "Empty": GOTO MenuItemsList
IF List$ = "B" THEN IF BasItem$(B + 40) = "" THEN BasList$(B) = "Empty": GOTO MenuItemsList

PRINT "": COLOR 15
PRINT "What is the name of the file?": COLOR 9: PRINT ""
PRINT "If the file is a batch file, type:"
PRINT "CALL <filename>.BAT": COLOR 15
IF List$ = "1" THEN LINE INPUT AItem$(B)
IF List$ = "2" THEN LINE INPUT BItem$(B)
IF List$ = "3" THEN LINE INPUT CItem$(B)
IF List$ = "B" THEN LINE INPUT BasItem$(B)
PRINT "": COLOR 15
PRINT "What name should appear on the list?": COLOR 11
IF List$ = "1" THEN LINE INPUT AList$(B)
IF List$ = "2" THEN LINE INPUT BList$(B)
IF List$ = "3" THEN LINE INPUT CList$(B)
IF List$ = "B" THEN LINE INPUT BasList$(B)
PRINT "": COLOR 31
GOTO MenuItemsList
MenuItemsQuit:
MenuItemsSaveInfo:
OPEN "O", 1, "1List.Dat"
OPEN "O", 2, "2List.Dat"
OPEN "O", 3, "3List.Dat"
OPEN "O", 4, "BList.Dat"

A = 1
SaveItemsA:
PRINT #1, AList$(A)
A = A + 1
IF A > 40 THEN A = 1: GOTO SaveItemsB
GOTO SaveItemsA


SaveItemsB:
PRINT #2, BList$(A)
A = A + 1
IF A > 40 THEN A = 1: GOTO SaveItemsC
GOTO SaveItemsB

SaveItemsC:
PRINT #3, CList$(A)
A = A + 1
IF A > 40 THEN A = 1: GOTO SaveItemsD
GOTO SaveItemsC

SaveItemsD:
PRINT #4, BasList$(A)
A = A + 1
IF A > 40 THEN A = 1: GOTO SaveItemsE
GOTO SaveItemsD

SaveItemsE:
CLOSE

OPEN "O", 1, "AFiles.Dat"
OPEN "O", 2, "BFiles.Dat"
OPEN "O", 3, "CFiles.Dat"
OPEN "O", 4, "BasFiles.Dat"

A = 1
SaveItemsF:
PRINT #1, AItem$(A)
A = A + 1
IF A > 120 THEN A = 1: GOTO SaveItemsG
GOTO SaveItemsF


SaveItemsG:
PRINT #2, BItem$(A)
A = A + 1
IF A > 120 THEN A = 1: GOTO SaveItemsH
GOTO SaveItemsG

SaveItemsH:
PRINT #3, CItem$(A)
A = A + 1
IF A > 120 THEN A = 1: GOTO SaveItemsI
GOTO SaveItemsH

SaveItemsI:
PRINT #4, BasItem$(A)
A = A + 1
IF A > 120 THEN A = 1: GOTO SaveItemsJ
GOTO SaveItemsI

SaveItemsJ:
CLOSE

ERASE D, L, P: EXIT SUB
END SUB

SUB MenuNames

DIM Z$(4)
Z$(1) = One$
Z$(2) = Two$
Z$(3) = Three$
Z$(4) = "Return to the main menu."

DIM H$(3)
H$(1) = HOne$
H$(2) = HTwo$
H$(3) = HThree$

COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออออต Menu Name Editor ฦอออออออออต"
LOCATE 1, 13, 0: COLOR 15: PRINT "Menu Name Editor"
PRINT "": COLOR 15
PRINT "Which name do you want to change?"
PRINT "": COLOR 3
PRINT Z$(1)
PRINT Z$(2)
PRINT Z$(3)
PRINT ""
PRINT Z$(4)

A = 5: B = 1



MenuNamesA:
LOCATE A, 1, 0: COLOR 15: PLAY "F32": PRINT Z$(B)
MenuNamesB:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO MenuNamesC
IF B$ = CHR$(0) + "P" THEN GOTO MenuNamesD
IF B$ = CHR$(13) OR B$ = " " THEN GOTO MenuNamesCommands
GOTO MenuNamesB

MenuNamesC:
LOCATE A, 1, 0: COLOR 3: PRINT Z$(B)
A = A - 1: B = B - 1
IF B = 0 THEN A = 9: B = 4
IF B = 3 THEN A = 7
GOTO MenuNamesA

MenuNamesD:
LOCATE A, 1, 0: COLOR 3: PRINT Z$(B)
A = A + 1: B = B + 1
IF B = 4 THEN A = 9
IF B = 5 THEN A = 5: B = 1
GOTO MenuNamesA

MenuNamesCommands:
IF B = 4 THEN ERASE D, L, P: EXIT SUB
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออออต Menu Name Editor ฦอออออออออต"
LOCATE 1, 13, 0: COLOR 15: PRINT "Menu Name Editor"
PRINT "": COLOR 15
PRINT "What should the new name be?"
COLOR 11: LINE INPUT Z$(B)
PRINT "": COLOR 15
PRINT "What should the new help message be?"
COLOR 11: LINE INPUT H$(B)

OPEN "O", 1, "DeskInfo.Dat"
PRINT #1, Z$(1)
PRINT #1, Z$(2)
PRINT #1, Z$(3)
PRINT #1, H$(1)
PRINT #1, H$(2)
PRINT #1, H$(3)
PRINT #1, TopUser
CLOSE
OPEN "I", 1, "DeskInfo.Dat"
INPUT #1, One$
INPUT #1, Two$
INPUT #1, Three$
INPUT #1, HOne$
INPUT #1, HTwo$
INPUT #1, HThree$
INPUT #1, TopUser
CLOSE
CALL MenuNames








































END SUB

SUB NameEdit
IF User = 0 THEN GOTO NameEditSorry
NameEditMenu:
WIDTH 40: COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออต Name and Password Editor ฦอออออต": COLOR 1
LOCATE 1, 9, 0: COLOR 15: PRINT "Name and Password Editor"
PRINT "": COLOR 1
PRINT "ษออออออออออออออออออออออออออออออออออออออป"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "บ                                      บ"
PRINT "ศออออออออออออออออออออออออออออออออออออออผ"
LOCATE 9, 1, 0: COLOR 14: PRINT "Use the cursor keys to choose,"
PRINT "Then press <ENTER> or <SPACE>."
DIM Z$(3)
Z$(1) = "Change your name."
Z$(2) = "Change your password."
Z$(3) = "Return to the Main Menu"
LOCATE 4, 2, 0: COLOR 3: PRINT Z$(1)
LOCATE 5, 2, 0: COLOR 3: PRINT Z$(2)
LOCATE 6, 2, 0: COLOR 3: PRINT Z$(3)
A = 4: B = 1
NMenuA:
LOCATE A, 2, 0: COLOR 15: PLAY "F32": PRINT Z$(B)
NMenuB:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO NMenuC
IF B$ = CHR$(0) + "P" THEN GOTO NMenuD
IF B$ = CHR$(13) THEN GOTO NMenuE
IF B$ = " " THEN GOTO NMenuE
GOTO NMenuB

NMenuC:
LOCATE A, 2, 0: COLOR 3: PRINT Z$(B)
A = A - 1: B = B - 1
IF B = 0 THEN A = 6: B = 3
GOTO NMenuA

NMenuD:
LOCATE A, 2, 0: COLOR 3: PRINT Z$(B)
A = A + 1: B = B + 1
IF B = 4 THEN A = 4: B = 1
GOTO NMenuA

NMenuE:
IF B = 1 THEN GOTO NameChange
IF B = 2 THEN GOTO PassEdit
IF B = 3 THEN ERASE D, L, P: EXIT SUB

PassEdit:
SOUND 1500, 2: COLOR 13, 0: CLS
PRINT "ฦอออออต Name and Password Editor ฦอออออต": COLOR 1
LOCATE 1, 9, 0: COLOR 15: PRINT "Name and Password Editor"
PRINT "": COLOR 11
PRINT "Do you want to have a password?"
PassEditA:
B$ = INKEY$
IF B$ = "Y" OR B$ = "y" THEN GOTO CallPassEntry
IF B$ = "N" OR B$ = "n" THEN P(1) = 6: CALL SaveUserInfo: ERASE Z$: GOTO NameEditMenu
GOTO PassEditA

CallPassEntry:
CALL PassEntry
CALL SaveUserInfo
ERASE Z$: GOTO NameEditMenu
NameEditSorry:
COLOR 13, 0: CLS
PRINT "ฦอออออต Name and Password Editor ฦอออออต": COLOR 1
LOCATE 1, 9, 0: COLOR 15: PRINT "Name and Password Editor"
PRINT "": COLOR 11
PRINT "Sorry, you cannot change names or"
PRINT "passwords on "; N$; "'s Desktop"
NameEditSorryA:
B$ = INKEY$: IF B$ = "" THEN GOTO NameEditSorryA
ERASE D, P, L: EXIT SUB

NameChange:
SOUND 1500, 2: COLOR 13, 0: CLS
PRINT "ฦอออออต Name and Password Editor ฦอออออต": COLOR 1
LOCATE 1, 9, 0: COLOR 15: PRINT "Name and Password Editor"
PRINT "": COLOR 11
PRINT "Your name is": LOCATE 3, 14, 0: COLOR 15: PRINT N$
COLOR 11: PRINT "Would you like to change it?"
NameChangeA:
B$ = INKEY$: IF B$ = "" THEN GOTO NameChangeA
IF B$ = "Y" OR B$ = "y" THEN GOTO ChangeIt
IF B$ = "N" OR B$ = "n" THEN ERASE Z$: GOTO NameEditMenu
GOTO NameChangeA

ChangeIt:
SOUND 1500, 2: COLOR 13, 0: CLS
PRINT "ฦอออออต Name and Password Editor ฦอออออต": COLOR 1
LOCATE 1, 9, 0: COLOR 15: PRINT "Name and Password Editor"
PRINT "": COLOR 11
PRINT "What should the new name be?"
PRINT "": COLOR 15
INPUT N$
IF N$ = "New" THEN GOTO ChangeItA
CALL SaveUserInfo
ERASE D, P, L: EXIT SUB

ChangeItA:
COLOR 4, 0: SOUND 200, 5: SOUND 100, 5: LOCATE 8: PRINT "Sorry, the name `New' cannot be used."
PRINT "Please choose another."
ChangeItB:
B$ = INKEY$: IF B$ = "" THEN GOTO ChangeItB
GOTO ChangeIt



END SUB

SUB NewUser
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออต Welcome New User!! ฦออออออออต"
LOCATE 1, 12, 0: COLOR 15: PRINT "Welcome New User!!": COLOR 11
NewUserA:
COLOR 11
PRINT ""
PRINT "Please enter the name you want to use:"
PRINT ""
COLOR 15: INPUT N$
IF N$ = "New" THEN SOUND 200, 5: SOUND 100, 5: GOTO NewUserA
LOCATE 3: PRINT "                                       "
LOCATE 2: PRINT "": SOUND 1500, 2
COLOR 11: PRINT "Hello "; N$; "!! "
PRINT ""
PRINT "Do you want to have a password?        "
PRINT "                                       "
PRINT "                                       "
NewUserB:
B$ = INKEY$
IF B$ = "Y" OR B$ = "y" THEN GOTO NewUserC
IF B$ = "N" OR B$ = "n" THEN GOTO NewUserD
GOTO NewUserB

NewUserC:
CALL PassEntry
GOTO NewUserE

NewUserD:
P(1) = 6

NewUserE:
        OPEN "I", 1, "Default.Dat"
        INPUT #1, A$
        INPUT #1, A
        INPUT #1, A
        INPUT #1, A
        INPUT #1, A
        INPUT #1, A
        INPUT #1, A
        INPUT #1, Desk$
        INPUT #1, Pict$
        INPUT #1, D(1)
        INPUT #1, D(2)
        INPUT #1, D(3)
        INPUT #1, D(4)
        INPUT #1, D(5)
        INPUT #1, D(6)
        INPUT #1, D(7)
        INPUT #1, L(1)
        INPUT #1, L(2)
        INPUT #1, L(3)
        INPUT #1, L(4)
        INPUT #1, L(5)
        INPUT #1, SecLevel
        CLOSE

CALL SaveUserInfo
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออต Welcome New User!! ฦออออออออต"
LOCATE 1, 12, 0: COLOR 15: PRINT "Welcome New User!!": COLOR 11
LOCATE 2: PRINT ""
COLOR 11: PRINT "Your user file has been saved.": PRINT ""
IF User = TopUser THEN PRINT "You are the TOP user,": PRINT "You have the hightst possible security": PRINT "level!": COLOR 15: GOTO NewUserFF
PRINT "Your security level is "
LOCATE 5, 24, 0: COLOR 13: PRINT SecLevel
NewUserFF:
PRINT ""
PRINT "Press any key to go to the Desktop!!!"
NewUserF:
B$ = INKEY$: IF B$ = "" THEN GOTO NewUserF
CALL DeskChoose





END SUB

SUB PassEntry
WIDTH 40: COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออต Please enter your new password ฦออต"
LOCATE 1, 6, 0: COLOR 15: PRINT "Please enter your new password"
PRINT "": COLOR 1
PRINT "            ษออออออออออออออป"
PRINT "            บ * * *  * * * บ"
PRINT "            ศออออออออออออออผ"
PRINT ""
PRINT "                < Done >"
COLOR 14: PRINT ""
PRINT "Use the cursor keys to choose,"
PRINT "then choose `Done'."
LOCATE 7, 19, 0: COLOR 11: PRINT "Done"
LOCATE 4, 15, 0: COLOR 11: PRINT "0 0 0  0 0 0"
A = 14: c = 1
DIM B(6)

PassEntryA:
LOCATE 4, A, 0: COLOR 15: PLAY "F32": PRINT B(c)
PassEntryB:
B$ = INKEY$: IF B$ = "" THEN GOTO PassEntryB
IF B$ = CHR$(0) + "P" THEN GOTO PassEntryC
IF B$ = CHR$(0) + "H" THEN GOTO PassEntryD
IF B$ = CHR$(0) + "M" THEN GOTO PassEntryE
IF B$ = CHR$(0) + "K" THEN GOTO PassEntryF
GOTO PassEntryB

PassEntryC:
B(c) = B(c) - 1
IF B(c) < 0 THEN B(c) = 5
GOTO PassEntryA

PassEntryD:
B(c) = B(c) + 1
IF B(c) > 5 THEN B(c) = 0
GOTO PassEntryA

PassEntryE:
LOCATE 4, A, 0: COLOR 11: PRINT B(c)
A = A + 2: c = c + 1
IF A = 20 THEN A = 21
IF A = 27 THEN GOTO PassEntryG
GOTO PassEntryA

PassEntryF:
LOCATE 4, A, 0: COLOR 11: PRINT B(c)
A = A - 2: c = c - 1
IF A = 19 THEN A = 18
IF A = 12 THEN GOTO PassEntryG
GOTO PassEntryA

PassEntryG:
LOCATE 7, 19, 0: COLOR 15: PLAY "F32": PRINT "Done"
PassEntryH:
B$ = INKEY$: IF B$ = "" THEN GOTO PassEntryH
IF B$ = CHR$(0) + "K" THEN GOTO PassEntryI
IF B$ = CHR$(0) + "M" THEN GOTO PassEntryJ
IF B$ = CHR$(13) THEN GOTO PassCheck
IF B$ = " " THEN GOTO PassCheck
GOTO PassEntryH

PassEntryI:
LOCATE 7, 19, 0: COLOR 11: PRINT "Done"
A = 25: c = 6
GOTO PassEntryA

PassEntryJ:
LOCATE 7, 19, 0: COLOR 11: PRINT "Done"
A = 14: c = 1
GOTO PassEntryA

PassCheck:

SOUND 1500, 2
P(1) = B(1)
P(2) = B(2)
P(3) = B(3)
P(4) = B(4)
P(5) = B(5)
P(6) = B(6)
END SUB

SUB SaveUserInfo
IF User = 0 THEN OPEN "O", 1, "User0.Dat"
IF User = 1 THEN OPEN "O", 1, "User1.Dat"
IF User = 2 THEN OPEN "O", 1, "User2.Dat"
IF User = 3 THEN OPEN "O", 1, "User3.Dat"
IF User = 4 THEN OPEN "O", 1, "User4.Dat"
IF User = 5 THEN OPEN "O", 1, "User5.Dat"
IF User = 6 THEN OPEN "O", 1, "User6.Dat"
IF User = 7 THEN OPEN "O", 1, "User7.Dat"
IF User = 8 THEN OPEN "O", 1, "User8.Dat"
IF User = 9 THEN OPEN "O", 1, "User9.Dat"
IF User = 10 THEN OPEN "O", 1, "User10.Dat"
PRINT #1, N$
PRINT #1, P(1)
PRINT #1, P(2)
PRINT #1, P(3)
PRINT #1, P(4)
PRINT #1, P(5)
PRINT #1, P(6)
PRINT #1, Desk$
PRINT #1, Pict$
PRINT #1, D(1)
PRINT #1, D(2)
PRINT #1, D(3)
PRINT #1, D(4)
PRINT #1, D(5)
PRINT #1, D(6)
PRINT #1, D(7)
PRINT #1, L(1)
PRINT #1, L(2)
PRINT #1, L(3)
PRINT #1, L(4)
PRINT #1, L(5)
PRINT #1, SecLevel
CLOSE
END SUB

SUB SecLevelEdit
SecLevelUserList:
DIM N$(11)

OPEN "I", 1, "User0.Dat"
INPUT #1, N$(0)
CLOSE

OPEN "I", 1, "User1.Dat"
INPUT #1, N$(1)
CLOSE

OPEN "I", 1, "User2.Dat"
INPUT #1, N$(2)
CLOSE

OPEN "I", 1, "User3.Dat"
INPUT #1, N$(3)
CLOSE

OPEN "I", 1, "User4.Dat"
INPUT #1, N$(4)
CLOSE

OPEN "I", 1, "User5.Dat"
INPUT #1, N$(5)
CLOSE

OPEN "I", 1, "User6.Dat"
INPUT #1, N$(6)
CLOSE

OPEN "I", 1, "User7.Dat"
INPUT #1, N$(7)
CLOSE

OPEN "I", 1, "User8.Dat"
INPUT #1, N$(8)
CLOSE

OPEN "I", 1, "User9.Dat"
INPUT #1, N$(9)
CLOSE

OPEN "I", 1, "User10.Dat"
INPUT #1, N$(10)
CLOSE

REM"Screen"
WIDTH 40
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออต Change Who's Sceurity Level? ฦอออต"
LOCATE 1, 7, 0: COLOR 15: PRINT "Change Who's Security Level?"
COLOR 1: PRINT ""
PRINT "          ษออออออออออออออออออป"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          ศออออออออออออออออออผ"
PRINT ""
COLOR 15: PRINT "Use the arrow keys to choose,"
PRINT "then press <ENTER> or <SPACE>."
COLOR 11: PRINT "Press <ESC> to quit."
c = 1: N$(0) = "Just Browsing": N$(11) = N$(0)
SecLevelUserListA:
LOCATE 4, 12, 0: COLOR c: PRINT N$(1)
LOCATE 5, 12, 0: COLOR c: PRINT N$(2)
LOCATE 6, 12, 0: COLOR c: PRINT N$(3)
LOCATE 7, 12, 0: COLOR c: PRINT N$(4)
LOCATE 8, 12, 0: COLOR c: PRINT N$(5)
LOCATE 9, 12, 0: COLOR c: PRINT N$(6)
LOCATE 10, 12, 0: COLOR c: PRINT N$(7)
LOCATE 11, 12, 0: COLOR c: PRINT N$(8)
LOCATE 12, 12, 0: COLOR c: PRINT N$(9)
LOCATE 13, 12, 0: COLOR c: PRINT N$(10)
LOCATE 14, 12, 0: COLOR c: PRINT N$(0)
IF c = 11 THEN GOTO SecLevelUserListB
c = 11: GOTO SecLevelUserListA

SecLevelUserListB:
A = 4: B = 1
SecLevelUserListC:
LOCATE A, 12, 0: COLOR 15: PLAY "F32": PRINT N$(B)
SecLevelUserListD:
B$ = INKEY$: IF B$ = "" THEN GOTO SecLevelUserListD
IF B$ = CHR$(0) + "H" THEN GOTO SecLevelUserListE
IF B$ = CHR$(0) + "P" THEN GOTO SecLevelUserListF
IF B$ = CHR$(13) THEN GOTO SecLevelUserListG
IF B$ = " " THEN GOTO SecLevelUserListG
IF B$ = CHR$(27) THEN ERASE D, L, P: EXIT SUB
GOTO SecLevelUserListD

SecLevelUserListE:
LOCATE A, 12, 0: COLOR 11: PRINT N$(B)
A = A - 1: B = B - 1
IF B < 1 THEN B = 11: A = 14
GOTO SecLevelUserListC

SecLevelUserListF:
LOCATE A, 12, 0: COLOR 11: PRINT N$(B)
A = A + 1: B = B + 1
IF B > 11 THEN A = 4: B = 1
GOTO SecLevelUserListC

SecLevelUserListG:
IF B = 11 THEN B = 0

IF B = 0 THEN OPEN "I", 1, "User0.Dat"
IF B = 1 THEN OPEN "I", 1, "User1.Dat"
IF B = 2 THEN OPEN "I", 1, "User2.Dat"
IF B = 3 THEN OPEN "I", 1, "User3.Dat"
IF B = 4 THEN OPEN "I", 1, "User4.Dat"
IF B = 5 THEN OPEN "I", 1, "User5.Dat"
IF B = 6 THEN OPEN "I", 1, "User6.Dat"
IF B = 7 THEN OPEN "I", 1, "User7.Dat"
IF B = 8 THEN OPEN "I", 1, "User8.Dat"
IF B = 9 THEN OPEN "I", 1, "User9.Dat"
IF B = 10 THEN OPEN "I", 1, "User10.Dat"
INPUT #1, N$
INPUT #1, P(1)
INPUT #1, P(2)
INPUT #1, P(3)
INPUT #1, P(4)
INPUT #1, P(5)
INPUT #1, P(6)
INPUT #1, Desk
INPUT #1, Pict$
INPUT #1, D(1)
INPUT #1, D(2)
INPUT #1, D(3)
INPUT #1, D(4)
INPUT #1, D(5)
INPUT #1, D(6)
INPUT #1, D(7)
INPUT #1, L(1)
INPUT #1, L(2)
INPUT #1, L(3)
INPUT #1, L(4)
INPUT #1, L(5)
INPUT #1, SecLevel
CLOSE

COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออออต Security Levels: ฦอออออออออต"
LOCATE 1, 13, 0: COLOR 15: PRINT "Security Levels:"
PRINT "": COLOR 11
PRINT N$; " has a security level of "; SecLevel
COLOR 15: PRINT "What should the new level be?": LOCATE 22, 1, 0: COLOR 15: PRINT "Press ? for help."
COLOR 11: PRINT "0, 1, 2, or 3"
SecLevelB:
B$ = INKEY$
IF B$ = "0" THEN SecLevel = 0: GOTO LeaveSecLevel
IF B$ = "1" THEN SecLevel = 1: GOTO LeaveSecLevel
IF B$ = "2" THEN SecLevel = 2: GOTO LeaveSecLevel
IF B$ = "3" THEN SecLevel = 3: GOTO LeaveSecLevel
IF B$ = "?" THEN GOTO SecLevelHelp
GOTO SecLevelB

SecLevelHelp:
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออออต Security Levels: ฦอออออออออต"
LOCATE 1, 13, 0: COLOR 15: PRINT "Security Levels:"
PRINT "": COLOR 11
PRINT "3 - No Configuration."
PRINT "2 - Desktop colors, Name, and passwords."
PRINT "1 - Level 2 + Menu Items."
PRINT "0 - Level 3 + Message Board editing."
PRINT "": COLOR 15
COLOR 15: PRINT "What should the new level be?"
COLOR 11: PRINT "0, 1, 2, or 3"
SecLevelC:
B$ = INKEY$
IF B$ = "0" THEN SecLevel = 0: GOTO LeaveSecLevel
IF B$ = "1" THEN SecLevel = 1: GOTO LeaveSecLevel
IF B$ = "2" THEN SecLevel = 2: GOTO LeaveSecLevel
IF B$ = "3" THEN SecLevel = 3: GOTO LeaveSecLevel
GOTO SecLevelC

LeaveSecLevel:
IF B = 0 THEN OPEN "O", 1, "User0.Dat"
IF B = 1 THEN OPEN "O", 1, "User1.Dat"
IF B = 2 THEN OPEN "O", 1, "User2.Dat"
IF B = 3 THEN OPEN "O", 1, "User3.Dat"
IF B = 4 THEN OPEN "O", 1, "User4.Dat"
IF B = 5 THEN OPEN "O", 1, "User5.Dat"
IF B = 6 THEN OPEN "O", 1, "User6.Dat"
IF B = 7 THEN OPEN "O", 1, "User7.Dat"
IF B = 8 THEN OPEN "O", 1, "User8.Dat"
IF B = 9 THEN OPEN "O", 1, "User9.Dat"
IF B = 10 THEN OPEN "O", 1, "User10.Dat"
PRINT #1, N$
PRINT #1, P(1)
PRINT #1, P(2)
PRINT #1, P(3)
PRINT #1, P(4)
PRINT #1, P(5)
PRINT #1, P(6)
PRINT #1, Desk$
PRINT #1, Pict$
PRINT #1, D(1)
PRINT #1, D(2)
PRINT #1, D(3)
PRINT #1, D(4)
PRINT #1, D(5)
PRINT #1, D(6)
PRINT #1, D(7)
PRINT #1, L(1)
PRINT #1, L(2)
PRINT #1, L(3)
PRINT #1, L(4)
PRINT #1, L(5)
PRINT #1, SecLevel
CLOSE
ERASE N$: GOTO SecLevelUserList











END SUB

SUB SSaverEdit
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออต Screen  Savers ฦออออออออออต"
LOCATE 1, 14, 0: COLOR 15: PRINT "Screen  Savers"
PRINT "": COLOR 15: PRINT "Please Choose a Screen Saver:"
PRINT "": COLOR 3
DIM SZ$(2)
SZ$(1) = "Boxes!"
SZ$(2) = "Zoom!"
PRINT SZ$(1)
PRINT SZ$(2)

A = 5: B = 1

SCA:
LOCATE A, 1, 0: COLOR 15: PLAY "F32": PRINT SZ$(B)
SCB:
B$ = INKEY$
IF B$ = " " OR B$ = CHR$(13) THEN GOTO SCModes
IF B$ = CHR$(0) + "H" OR B$ = CHR$(0) + "P" THEN GOTO SCC
GOTO SCB

SCC:
LOCATE A, 1, 0: COLOR 3: PRINT SZ$(B)
A = A + 1: B = B + 1
IF B > 2 THEN A = 5: B = 1
GOTO SCA

SCModes:
IF B = 1 THEN Saver$ = "A"
IF B = 2 THEN Saver$ = "B"
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออต Screen  Savers ฦออออออออออต"
LOCATE 1, 14, 0: COLOR 15: PRINT "Screen  Savers"
PRINT "": COLOR 15: PRINT "Please choose a Screen mode."
LOCATE 20: PRINT "For  GA monitors.  ( Or better )"
LOCATE 4: PRINT "": COLOR 3
IF Saver$ = "B" THEN GOTO SCModesE

DIM ZZ$(3)
ZZ$(1) = "Black and White"
ZZ$(2) = "16 Color"
ZZ$(3) = "256 Color"

PRINT ZZ$(1)
PRINT ZZ$(2)
PRINT ZZ$(3)

A = 5: B = 1

SCModesA:
LOCATE A, 1, 0: PLAY "F32": COLOR 15: PRINT ZZ$(B)
LOCATE 20, 5, 0: COLOR 15
IF B = 1 THEN PRINT "C"
IF B = 2 THEN PRINT "E"
IF B = 3 THEN PRINT "V"
SCModesB:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO SCModesC
IF B$ = CHR$(0) + "P" THEN GOTO SCModesD
IF B$ = " " OR B$ = CHR$(13) THEN GOTO SCSaveInfo
GOTO SCModesB

SCModesC:
LOCATE A, 1, 0: COLOR 3: PRINT ZZ$(B)
A = A - 1: B = B - 1
IF B < 1 THEN A = 7: B = 3
GOTO SCModesA

SCModesD:
LOCATE A, 1, 0: COLOR 3: PRINT ZZ$(B)
A = A + 1: B = B + 1
IF B > 3 THEN A = 5: B = 1
GOTO SCModesA

SCModesE:
DIM ZZ$(2)
ZZ$(1) = "Black and White"
ZZ$(2) = "16 Color"

PRINT ZZ$(1)
PRINT ZZ$(2)

A = 5: B = 1

SCModesF:
LOCATE A, 1, 0: PLAY "F32": COLOR 15: PRINT ZZ$(B)
LOCATE 20, 5, 0: COLOR 15
IF B = 1 THEN PRINT "C"
IF B = 2 THEN PRINT "E"
SCModesG:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN GOTO SCModesH
IF B$ = CHR$(0) + "P" THEN GOTO SCModesI
IF B$ = " " OR B$ = CHR$(13) THEN GOTO SCSaveInfo
GOTO SCModesG

SCModesH:
LOCATE A, 1, 0: COLOR 3: PRINT ZZ$(B)
A = A - 1: B = B - 1
IF B < 1 THEN A = 6: B = 2
GOTO SCModesF

SCModesI:
LOCATE A, 1, 0: COLOR 3: PRINT ZZ$(B)
A = A + 1: B = B + 1
IF B > 2 THEN A = 5: B = 1
GOTO SCModesF


SCSaveInfo:
IF B = 1 THEN Mode = 0
IF B = 2 THEN Mode = 16
IF B = 3 THEN Mode = 256
OPEN "O", 1, "SSaver.Dat"
PRINT #1, Saver$
PRINT #1, Mode
CLOSE
ERASE D, L, P: EXIT SUB













END SUB

SUB StartScreen

SSB:
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออต Startup Screen ฦออออออออออต"
LOCATE 1, 14, 0: COLOR 15, 0: PRINT "Startup Screen"
PRINT "": COLOR 11
PRINT "Would you like to use a [C]ustom or the"
PRINT "[D]efault screen?"
PRINT "": COLOR 13: PRINT "Press <ESC> to cancel."
LOCATE 3, 26, 0: COLOR 15: PRINT "C"
LOCATE 4, 2, 0: COLOR 15: PRINT "D"
SSC:
B$ = INKEY$
IF B$ = "C" OR B$ = "c" THEN GOTO SSCustom
IF B$ = "D" OR B$ = "d" THEN GOTO SSSaveInfo
IF B$ = CHR$(27) THEN ERASE D, L, P: EXIT SUB
GOTO SSC

SSCustom:
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออต Startup Screen ฦออออออออออต"
LOCATE 1, 14, 0: COLOR 15, 0: PRINT "Startup Screen"
PRINT "": COLOR 11
PRINT "What is the name of the file you want to"
PRINT "use?"
LOCATE 13: COLOR 15
PRINT "NOTE: The picture file MUST be saved in"
PRINT "COM or EXE format."
PRINT ""
PRINT "(COM files can be created using TheDraw)"
LOCATE 5:
SSD:
LOCATE 6, 1, 0: COLOR 13: LINE INPUT Picture$
GOTO SSSaveInfo

SSSaveInfo:
IF Picture$ = "" THEN Picture$ = "No"
OPEN "O", 1, "Startup.Dat"
PRINT #1, Picture$
CLOSE
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออต Startup Screen ฦออออออออออต"
LOCATE 1, 14, 0: COLOR 15, 0: PRINT "Startup Screen"
PRINT "": COLOR 31
PRINT "Changes have been saved!"
SSEnd:
B$ = INKEY$: IF B$ = "" THEN GOTO SSEnd
CALL StartScreen

SSColors:
DIM Default$(12)








END SUB

SUB TopUserEdit

DIM A$(6)
OPEN "I", 1, "DeskInfo.Dat"
INPUT #1, A$(1)
INPUT #1, A$(2)
INPUT #1, A$(3)
INPUT #1, A$(4)
INPUT #1, A$(5)
INPUT #1, A$(6)
INPUT #1, TopUser
CLOSE



TopUserMenu:
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออออออออต Top User ฦอออออออออออออต"
LOCATE 1, 17, 0: COLOR 15: PRINT "Top User"
PRINT "": COLOR 15
PRINT " The Top User is user # "; TopUser; ""
PRINT "": COLOR 11
PRINT "Do you want to change it?"
TopUserA:
B$ = INKEY$
IF B$ = "Y" OR B$ = "y" THEN GOTO TopUserChange
IF B$ = "N" OR B$ = "n" THEN ERASE D, L, P: EXIT SUB
GOTO TopUserA


TopUserChange:
DIM N$(10)
OPEN "I", 1, "User0.Dat"
INPUT #1, N$(0)
CLOSE

OPEN "I", 1, "User1.Dat"
INPUT #1, N$(1)
CLOSE

OPEN "I", 1, "User2.Dat"
INPUT #1, N$(2)
CLOSE

OPEN "I", 1, "User3.Dat"
INPUT #1, N$(3)
CLOSE

OPEN "I", 1, "User4.Dat"
INPUT #1, N$(4)
CLOSE

OPEN "I", 1, "User5.Dat"
INPUT #1, N$(5)
CLOSE

OPEN "I", 1, "User6.Dat"
INPUT #1, N$(6)
CLOSE

OPEN "I", 1, "User7.Dat"
INPUT #1, N$(7)
CLOSE

OPEN "I", 1, "User8.Dat"
INPUT #1, N$(8)
CLOSE

OPEN "I", 1, "User9.Dat"
INPUT #1, N$(9)
CLOSE

OPEN "I", 1, "User10.Dat"
INPUT #1, N$(10)
CLOSE

COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออออออออต Top User ฦอออออออออออออต"
LOCATE 1, 17, 0: COLOR 15: PRINT "Top User"
PRINT "": COLOR 15
PRINT "Which of these users should be the new,"
PRINT "               TOP USER!!"
PRINT "": COLOR 11
PRINT "1 - "; N$(1)
PRINT "2 - "; N$(2)
PRINT "3 - "; N$(3)
PRINT "4 - "; N$(4)
PRINT "5 - "; N$(5)
PRINT "6 - "; N$(6)
PRINT "7 - "; N$(7)
PRINT "8 - "; N$(8)
PRINT "9 - "; N$(9)
PRINT "10 = "; N$(10)
PRINT "0 - Just Browsing!"
PRINT "": COLOR 15
TopUserB:
INPUT "User: ", B
IF B > 10 THEN SOUND 200, 5: SOUND 100, 5: GOTO TopUserB
IF B < 0 THEN SOUND 200, 5: SOUND 100, 5: GOTO TopUserB

OPEN "O", 1, "DeskInfo.Dat"
PRINT #1, A$(1)
PRINT #1, A$(2)
PRINT #1, A$(3)
PRINT #1, A$(4)
PRINT #1, A$(5)
PRINT #1, A$(6)
PRINT #1, B
CLOSE

COLOR 11, 0: CLS : PRINT N$(B); " is the new TOP USER": PLAY "P2"
ERASE D, L, P: EXIT SUB











END SUB

SUB UserListEdit
DelUserList:
DIM N$(11)
DelUserRepeat:
OPEN "I", 1, "User0.Dat"
INPUT #1, N$(0)
CLOSE

OPEN "I", 1, "User1.Dat"
INPUT #1, N$(1)
CLOSE

OPEN "I", 1, "User2.Dat"
INPUT #1, N$(2)
CLOSE

OPEN "I", 1, "User3.Dat"
INPUT #1, N$(3)
CLOSE

OPEN "I", 1, "User4.Dat"
INPUT #1, N$(4)
CLOSE

OPEN "I", 1, "User5.Dat"
INPUT #1, N$(5)
CLOSE

OPEN "I", 1, "User6.Dat"
INPUT #1, N$(6)
CLOSE

OPEN "I", 1, "User7.Dat"
INPUT #1, N$(7)
CLOSE

OPEN "I", 1, "User8.Dat"
INPUT #1, N$(8)
CLOSE

OPEN "I", 1, "User9.Dat"
INPUT #1, N$(9)
CLOSE

OPEN "I", 1, "User10.Dat"
INPUT #1, N$(10)
CLOSE

REM"Screen"
WIDTH 40
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "  ฦอออต Choose a user to delete: ฦอออต"
LOCATE 1, 9, 0: COLOR 15: PRINT "Choose a user to delete:"
COLOR 1: PRINT ""
PRINT "          ษออออออออออออออออออป"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          บ                  บ"
PRINT "          ศออออออออออออออออออผ"
PRINT ""
COLOR 15: PRINT "Use the arrow keys to choose,"
PRINT "then press <ENTER> or <SPACE>."
COLOR 11: PRINT "Press <ESC> to return to the main menu."
c = 1: N$(0) = "Just Browsing": N$(11) = N$(0)
DelUserListA:
LOCATE 4, 12, 0: COLOR c: PRINT N$(1)
LOCATE 5, 12, 0: COLOR c: PRINT N$(2)
LOCATE 6, 12, 0: COLOR c: PRINT N$(3)
LOCATE 7, 12, 0: COLOR c: PRINT N$(4)
LOCATE 8, 12, 0: COLOR c: PRINT N$(5)
LOCATE 9, 12, 0: COLOR c: PRINT N$(6)
LOCATE 10, 12, 0: COLOR c: PRINT N$(7)
LOCATE 11, 12, 0: COLOR c: PRINT N$(8)
LOCATE 12, 12, 0: COLOR c: PRINT N$(9)
LOCATE 13, 12, 0: COLOR c: PRINT N$(10)
IF c = 11 THEN GOTO DelUserListB
c = 11: GOTO DelUserListA

DelUserListB:
A = 4: B = 1
DelUserListC:
LOCATE A, 12, 0: COLOR 15: PLAY "F32": PRINT N$(B)
DelUserListD:
B$ = INKEY$: IF B$ = "" THEN GOTO DelUserListD
IF B$ = CHR$(0) + "H" THEN GOTO DelUserListE
IF B$ = CHR$(0) + "P" THEN GOTO DelUserListF
IF B$ = CHR$(13) THEN GOTO DelUserListG
IF B$ = CHR$(27) THEN ERASE N$, D, L, P: EXIT SUB
IF B$ = " " THEN GOTO DelUserListG
GOTO DelUserListD

DelUserListE:
LOCATE A, 12, 0: COLOR 11: PRINT N$(B)
A = A - 1: B = B - 1
IF B < 1 THEN B = 10: A = 13
GOTO DelUserListC

DelUserListF:
LOCATE A, 12, 0: COLOR 11: PRINT N$(B)
A = A + 1: B = B + 1
IF B > 10 THEN A = 4: B = 1
GOTO DelUserListC

DelUserListG:
IF B = 11 THEN B = 0
IF B = 0 THEN SOUND 200, 5: SOUND 100, 5: GOTO DelUserRepeat





IF B = 0 THEN OPEN "O", 1, "User0.Dat"
IF B = 1 THEN OPEN "O", 1, "User1.Dat"
IF B = 2 THEN OPEN "O", 1, "User2.Dat"
IF B = 3 THEN OPEN "O", 1, "User3.Dat"
IF B = 4 THEN OPEN "O", 1, "User4.Dat"
IF B = 5 THEN OPEN "O", 1, "User5.Dat"
IF B = 6 THEN OPEN "O", 1, "User6.Dat"
IF B = 7 THEN OPEN "O", 1, "User7.Dat"
IF B = 8 THEN OPEN "O", 1, "User8.Dat"
IF B = 9 THEN OPEN "O", 1, "User9.Dat"
IF B = 10 THEN OPEN "O", 1, "User10.Dat"
PRINT #1, "New"
PRINT #1, "6"
PRINT #1, "0"
PRINT #1, "0"
PRINT #1, "0"
PRINT #1, "0"
PRINT #1, "0"
PRINT #1, Desk$
PRINT #1, Pict$
PRINT #1, D(1)
PRINT #1, D(2)
PRINT #1, D(3)
PRINT #1, D(4)
PRINT #1, D(5)
PRINT #1, D(6)
PRINT #1, D(7)
PRINT #1, L(1)
PRINT #1, L(2)
PRINT #1, L(3)
PRINT #1, L(4)
PRINT #1, L(5)
PRINT #1, DefaultSecLevel
CLOSE
GOTO DelUserRepeat
END SUB

