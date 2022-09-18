DECLARE SUB EndChat ()
DECLARE SUB Actions ()
DECLARE SUB ErrorControl ()
DECLARE SUB Download ()
DECLARE SUB Upload ()
DECLARE SUB Commands ()
DECLARE SUB Transmit ()
DECLARE SUB Recieve ()
COMMON SHARED Name$
REM"ChatLine!!! By Larry!,  started on Aug. 17, 1994"
REM"                        finished on "


WIDTH 40: COLOR 13, 0: CLS : PLAY "MB C8C16F"
PRINT "ฦออออออออออออต Chat Line! ฦออออออออออออต"
LOCATE 1, 16, 0: COLOR 15: PRINT "Chat Line!"
PRINT ""
COLOR 11: PRINT "What is your name?"
COLOR 9: LINE INPUT "Name: ", Name$
SOUND 1500, 2
PRINT ""
LOCATE 3: COLOR 14: PRINT "Would you like to . . . . ."
PRINT "                                        ": COLOR 11
PRINT "1 - Call another person.                "
PRINT "2 - Recieve calls.                      "
PRINT "3 - Quit to DOS                         "
MainA:
B$ = INKEY$: IF B$ = "" THEN GOTO MainA
IF B$ = "1" THEN CALL Transmit
IF B$ = "2" THEN CALL Recieve
IF B$ = "3" THEN SYSTEM
GOTO MainA:

SUB Actions
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออออออออต Actions: ฦอออออออออออออต"
LOCATE 1, 17, 0: COLOR 15: PRINT "Actions:"
PRINT "": COLOR 15
PRINT "What would you like to do to "; TheirName$; "?"
PRINT "": COLOR 11
PRINT "1 - Slap "; TheirName$; "."
PRINT "2 - Punch "; TheirName$; "."
PRINT "3 - Pinch "; TheirName$; "."
PRINT "4 - Hug "; TheirName$; "."
PRINT "5 - Kiss "; TheirName$; "."
PRINT "6 - Give "; TheirName$; "a High-Five."
PRINT "7 - Shake "; TheirName$; "'s hand."
PRINT "8 - Give "; TheirName$; "a pat on the back!"
PRINT ""
ActionsA:
B$ = INKEY$
IF B$ = "1" THEN PRINT #1, Name$; " slapped you!": LOCATE 15: COLOR 4: PRINT TheirName$; " - Ouch!": GOTO ActionEnd
IF B$ = "2" THEN PRINT #1, Name$; " punched you!": LOCATE 15: COLOR 4: PRINT TheirName$; " - Ouch!": GOTO ActionEnd
IF B$ = "3" THEN PRINT #1, Name$; " pinched you!": LOCATE 15: COLOR 4: PRINT TheirName$; " - Ouch!": GOTO ActionEnd
IF B$ = "4" THEN PRINT #1, Name$; " hugged you!": GOTO ActionEnd
IF B$ = "5" THEN PRINT #1, Name$; " kissed you!": GOTO ActionEnd
IF B$ = "6" THEN PRINT #1, Name$; " gave you a High-Five!": LOCATE 15: COLOR 15: PRINT TheirName$; " - Yeah!": GOTO ActionEnd
IF B$ = "7" THEN PRINT #1, Name$; " shook your hand.": GOTO ActionEnd
IF B$ = "8" THEN PRINT #1, Name$; " gave you a pat on the back.": GOTO ActionEnd
GOTO ActionsA

ActionEnd:
END SUB

SUB Commands
WIDTH 80: COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออออออออออออออออออออออออออต Command List ฦอออออออออออออออออออออออออออออออต"
LOCATE 1, 35, 0: COLOR 15: PRINT "Command List."
PRINT "": COLOR 11
PRINT "#COMMAND    - Lets you see this command list."
PRINT "#END        - Ends the chat and takes you back to DOS."
PRINT "#BEEP       - Causes the other person's computer (and yours) to beep."
PRINT "#ACTION     - Lets you slap, punch, hug, etc. the other person."
PRINT "#UPLOAD     - Lets you send a DATA file to the other user."
PRINT "#PLAY       - Lets you play a song on the other person's computer. (and yours)"
PRINT "#DATE       - Sets the date on your computer acording to the other person's."
PRINT "#TIME       - Sets the time on your computer acording to the other person's."
PRINT "#COLOR      - Lets you send the next message in another color."
PRINT "#CLEAR      - Clears the screen."
PRINT "#SHELL      - Lets you shell to DOS."
PRINT "": COLOR 13
PRINT "Press <ENTER> or <SPACE> when you're done!"
CommandsA:
B$ = INKEY$: IF B$ = CHR$(13) OR B$ = " " THEN GOTO CommandsB
GOTO CommandsA

CommandsB:
WIDTH 40: COLOR 14, 0: CLS : SOUND 1500, 2
PRINT "Ok! it's your turn to type!"
PRINT ""
END SUB

SUB Download
COLOR 13, 0: CLS : SOUND 1500, 2
INPUT #1, FileName$
PRINT "ฦอออออออออต Download A File: ฦอออออออออต"
LOCATE 1, 12, 0: COLOR 15: PRINT "Download A File:"
PRINT "": COLOR 11
PRINT "The name of the file being sent is"
PRINT "called "; FileName$; ""
PRINT "Is this OK?"
DownLoadA:
B$ = INKEY$: IF B$ = "Y" OR B$ = "y" THEN PRINT #1, "Ready": GOTO DownloadB
IF B$ = "N" OR B$ = "n" THEN PRINT #1, "Cancled": GOTO DownLoadEnd
GOTO DownLoadA

DownloadB:
OPEN "O", 2, FileName$
DownLoadC:
INPUT #1, A$
IF A$ = "#CHATLINE#UPLOAD#DONE" THEN GOTO DownLoadD
PRINT #2, A$
GOTO DownLoadC

DownLoadD:
CLOSE 2: PRINT #1, "GotIt!"
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออออต Download A File: ฦอออออออออต"
LOCATE 1, 12, 0: COLOR 15: PRINT "Download A File:"
PRINT "": COLOR 11
PRINT "The file's been recieved!"
PRINT ""
PRINT "Press <ENTER> or <SPACE>."
DownLoadE:
B$ = INKEY$
IF B$ = CHR$(13) OR B$ = " " THEN GOTO DownLoadEnd
GOTO DownLoadE:


DownLoadEnd:
END SUB

SUB EndChat
WIDTH 40: COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออออต Chat Line! ฦออออออออออออต"
LOCATE 1, 16, 0: COLOR 15: PRINT "Chat Line!"
PRINT "": COLOR 15
PRINT "The chat has been ended."
PRINT ""
PRINT "Would you like to . . ."
PRINT "": COLOR 11
PRINT "1 - Return to the Main Menu"
PRINT "2 - Quit to DOS."
EndChatA:
B$ = INKEY$
IF B$ = "1" THEN GOTO EndChatB
IF B$ = "2" THEN COLOR 31, 0: CLS : SOUND 1500, 2: PRINT "Bye!": PLAY "P4": SYSTEM
GOTO EndChatA

EndChatB:
END SUB

SUB Recieve
CLS
COLOR 11: PRINT "Press <ENTER> when you are connected."
RecieveLA:
B$ = INKEY$: IF B$ = CHR$(13) THEN GOTO RecieveLB
GOTO RecieveLA
RecieveLB:
1 OPEN "Com2:2400,N,8,1" FOR RANDOM AS #1

RecieveA:
INPUT #1, A$
IF A$ = "#Connected T" THEN GOTO RecieveB
GOTO RecieveA

RecieveB:
PRINT #1, "#Connected R"
PRINT #1, Name$
INPUT #1, TheirName$

REM "Startup message"

PRINT #1, "Welcome to the CHAT LINE!!"
PRINT #1, ""
PRINT #1, "You're talking to "; Name$; "!"

COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออออต Chat Line! ฦออออออออออออต"
LOCATE 1, 16, 0: COLOR 15: PRINT "Chat Line!"
PRINT "": COLOR 15
PRINT "Welcome to the CHAT LINE!"
PRINT "": COLOR 11
PRINT "You're talking to "; TheirName$; ""
COLOR 14: PRINT ""
PRINT "Type #END to end the chat."
PRINT "Type #COMMAND for more commands."
PRINT "": COLOR 15
PRINT "Now talk to "; TheirName$; ""
PRINT ""
RecieveInput:
COLOR 11
LINE INPUT "You: ", A$
IF A$ = "" THEN A$ = "(No Response)"
IF A$ = "#BEEP" OR A$ = "#beep" OR A$ = "#Beep" THEN BEEP: A$ = "#BEEP"
IF A$ = "#PLAY" OR A$ = "#play" OR A$ = "#Play" THEN PRINT #1, "#PLAY": GOSUB RSongPlay
IF A$ = "#DATE" OR A$ = "#date" OR A$ = "#Date" THEN PRINT #1, "#DATE": LINE INPUT #1, CurDate$: DATE$ = CurDate$: GOTO RAfterCal
IF A$ = "#TIME" OR A$ = "#time" OR A$ = "#Time" THEN PRINT #1, "#TIME": LINE INPUT #1, CurTime$: TIME$ = CurTime$: GOTO RAfterCal
IF A$ = "#COMMAND" OR A$ = "#command" OR A$ = "#Command" THEN CALL Commands: GOTO RecieveInput
IF A$ = "#ACTION" OR A$ = "#action" OR A$ = "#Action" THEN GOSUB RActions
IF A$ = "#COLOR" OR A$ = "#color" OR A$ = "#Color" THEN GOSUB RColors
IF A$ = "#END" OR A$ = "#end" OR A$ = "#End" THEN PRINT #1, "#END": CALL EndChat: EXIT SUB
IF A$ = "#UPLOAD" OR A$ = "#upload" OR A$ = "#Upload" THEN CALL Upload: GOTO RecieveInput
IF A$ = "#CLEAR" OR A$ = "#clear" OR A$ = "#Clear" THEN CLS : GOTO RecieveInput
IF A$ = "#SHELL" OR A$ = "#shell" OR A$ = "#Shell" THEN PRINT #1, "#SHELL": CLS : SHELL: GOTO RecieveInput
PRINT #1, A$

RecievePrint:
C = 14
LINE INPUT #1, A$
IF A$ = "" THEN GOTO RecievePrint
IF A$ = "#BEEP" THEN BEEP
IF A$ = "#PLAY" THEN LINE INPUT #1, B$: PLAY B$
IF A$ = "#DATE" THEN PRINT #1, DATE$
IF A$ = "#TIME" THEN PRINT #1, TIME$
IF A$ = "#COLOR#CHANGE" THEN INPUT #1, C: LINE INPUT #1, A$
IF A$ = "#END" THEN
COLOR 15, 0: CLS : SOUND 1500, 2: PRINT ""; TheirName$; " has ended the chat."
RecievePrintB:
B$ = INKEY$: IF B$ = CHR$(13) OR B$ = " " THEN CALL EndChat: EXIT SUB
GOTO RecievePrintB
END IF
IF A$ = "#UPLOAD" THEN CALL Download: GOTO RecieveInput
IF A$ = "#SHELL" THEN COLOR 15: PRINT "": PRINT TheirName$; " has shelled to DOS.": GOTO RecievePrint
PRINT "": COLOR C
PRINT A$
GOTO RecieveInput

RSongPlay:
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออออต Chat Line! ฦออออออออออออต"
LOCATE 1, 16, 0: COLOR 15: PRINT "Chat Line!"
PRINT "": COLOR 15
PRINT "Please type the song here:"
PRINT "(as you would in BASIC)"
PRINT "": COLOR 11
LINE INPUT B$
PRINT #1, "#PLAY": PRINT #1, B$
PLAY B$
GOTO RecievePrint

RColors:
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออออต Chat Line! ฦออออออออออออต"
LOCATE 1, 16, 0: COLOR 15: PRINT "Chat Line!"
PRINT "": COLOR 15
PRINT "Please type the message you want use."
PRINT "": COLOR 11
LINE INPUT A$
LOCATE 7: PRINT "Now, choose a color."
PRINT "(Use the "; CHR$(23); " keys.)"
C = 0
RColorsB:
IF C > 31 THEN C = 0
IF C < 0 THEN C = 31
LOCATE 5: COLOR C: PRINT A$
RColorsC:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN C = C + 1: GOTO RColorsB
IF B$ = CHR$(0) + "P" THEN C = C - 1: GOTO RColorsB
IF B$ = CHR$(13) OR B$ = " " THEN PRINT #1, "#COLOR#CHANGE": PRINT #1, C: PRINT #1, A$
GOTO RColorsC

RAfterCal:
PRINT "": COLOR 15: PRINT "The changes have been made! Go ahead!"

RActions:
CALL Actions
GOTO RecievePrint

RecieveError:
IF ERR = 24 THEN
IF ERL = 1 THEN GOTO 1
END IF


































END SUB

SUB Transmit
CLS
COLOR 11: PRINT "Press <ENTER> when you are connected."
TransmitLA:
B$ = INKEY$: IF B$ = CHR$(13) THEN GOTO TransmitLB
GOTO TransmitLA
TransmitLB:
OPEN "Com2:2400,N,8,1" FOR RANDOM AS #1

TransmitB:
PRINT #1, "#Connected T"
transmitA:
INPUT #1, A$
TransmitAA:
IF A$ = "#Connected R" THEN GOTO TransMitD
GOTO transmitA

TransMitD:
INPUT #1, TheirName$

PRINT #1, Name$

REM "Startup message"

INPUT #1, A$
INPUT #1, B$
INPUT #1, C$

COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออออต Chat Line! ฦออออออออออออต"
LOCATE 1, 16, 0: COLOR 15: PRINT "Chat Line!"
PRINT "": COLOR 15
PRINT A$
PRINT B$: COLOR 11
PRINT C$
PRINT "": COLOR 14
PRINT "Type #END to end the chat."
PRINT "Type #COMMAND for more commands."

transmitprint:
C = 14
LINE INPUT #1, A$
IF A$ = "" THEN GOTO transmitprint
IF A$ = "#BEEP" THEN BEEP
IF A$ = "#PLAY" THEN LINE INPUT #1, B$: PLAY B$
IF A$ = "#DATE" THEN PRINT #1, DATE$
IF A$ = "#TIME" THEN PRINT #1, TIME$
IF A$ = "#COLOR#CHANGE" THEN INPUT #1, C: LINE INPUT #1, A$
IF A$ = "#END" THEN
IF A$ = "#Connected R" THEN GOTO TransmitAA
COLOR 15, 0: CLS : SOUND 1500, 2: PRINT ""; TheirName$; " has ended the chat."
TransmitPrintB:
B$ = INKEY$: IF B$ = CHR$(13) OR B$ = " " THEN CALL EndChat: EXIT SUB
GOTO TransmitPrintB
END IF
IF A$ = "#UPLOAD" THEN CALL Download: GOTO TransmitInput
IF A$ = "#SHELL" THEN COLOR 15: PRINT "": PRINT TheirName$; " has shelled to DOS.": GOTO transmitprint
PRINT "": COLOR C
PRINT A$
GOTO TransmitInput

TSongPlay:
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออออต Chat Line! ฦออออออออออออต"
LOCATE 1, 16, 0: COLOR 15: PRINT "Chat Line!"
PRINT "": COLOR 15
PRINT "Please type the song here:"
PRINT "(as you would in BASIC)"
PRINT "": COLOR 11
LINE INPUT B$
PRINT #1, "#PLAY": PRINT #1, B$
PLAY B$
GOTO transmitprint

TColors:
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออออต Chat Line! ฦออออออออออออต"
LOCATE 1, 16, 0: COLOR 15: PRINT "Chat Line!"
PRINT "": COLOR 15
PRINT "Please type the message you want use."
PRINT "": COLOR 11
LINE INPUT A$
LOCATE 7: PRINT "Now, choose a color."
PRINT "(Use the "; CHR$(23); " keys.)"
C = 0
TColorsB:
IF C > 31 THEN C = 0
IF C < 0 THEN C = 31
LOCATE 5: COLOR C: PRINT A$
TColorsC:
B$ = INKEY$
IF B$ = CHR$(0) + "H" THEN C = C + 1: GOTO TColorsB
IF B$ = CHR$(0) + "P" THEN C = C - 1: GOTO TColorsB
IF B$ = CHR$(13) OR B$ = " " THEN PRINT #1, "#COLOR#CHANGE": PRINT #1, C: PRINT #1, A$
GOTO TColorsC

TAfterCal:
PRINT "": COLOR 15: PRINT "The changes have been made! Go ahead!"

TActions:
CALL Actions
GOTO transmitprint

TransmitInput:
COLOR 11
LINE INPUT "You: ", A$
IF A$ = "" THEN A$ = "(No Response)"
IF A$ = "#BEEP" OR A$ = "#beep" OR A$ = "#Beep" THEN BEEP: A$ = "#BEEP"
IF A$ = "#PLAY" OR A$ = "#play" OR A$ = "#Play" THEN PRINT #1, "#PLAY": GOSUB TSongPlay
IF A$ = "#DATE" OR A$ = "#date" OR A$ = "#Date" THEN PRINT #1, "#DATE": LINE INPUT #1, CurDate$: DATE$ = CurDate$: GOTO TAfterCal
IF A$ = "#TIME" OR A$ = "#time" OR A$ = "#Time" THEN PRINT #1, "#TIME": LINE INPUT #1, CurTime$: TIME$ = CurTime$: GOTO TAfterCal
IF A$ = "#COMMAND" OR A$ = "#command" OR A$ = "#Command" THEN CALL Commands: GOTO TransmitInput
IF A$ = "#ACTION" OR A$ = "#action" OR A$ = "#Action" THEN GOSUB TActions
IF A$ = "#COLOR" OR A$ = "#color" OR A$ = "#Color" THEN GOSUB TColors
IF A$ = "#END" OR A$ = "#end" OR A$ = "#End" THEN PRINT #1, "#END": CALL EndChat: EXIT SUB
IF A$ = "#UPLOAD" OR A$ = "#upload" OR A$ = "#Upload" THEN CALL Upload: GOTO TransmitInput
IF A$ = "#CLEAR" OR A$ = "#clear" OR A$ = "#Clear" THEN CLS : GOTO TransmitInput
IF A$ = "#SHELL" OR A$ = "#shell" OR A$ = "#Shell" THEN PRINT #1, "#SHELL": CLS : SHELL: GOTO TransmitInput
PRINT #1, A$
GOTO transmitprint
TransmitError:




END SUB

SUB Upload
IF y = 0 THEN GOTO UploadError
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออต Upload A File: ฦออออออออออต"
LOCATE 1, 14, 0: COLOR 15: PRINT "Upload A File:"
PRINT "": COLOR 11
PRINT "What is the name of the DATA file"
PRINT "you want to upload?"
LINE INPUT FileName$
PRINT #1, "#UPLOAD"
PRINT #1, FileName$
INPUT #1, A$

UploadA:
IF A$ = "Ready" THEN PRINT #1, "Ready": GOTO UploadB
IF A$ = "Cancled" THEN GOTO UploadEnd
GOTO UploadA

UploadB:
OPEN "I", 2, FileName$
UploadC:
INPUT #1, A$
PRINT A$
GOTO UploadC:

UploadD:
CLOSE 2
PRINT #1, "#CHATLINE#UPLOAD#DONE"
INPUT #1, A$
IF A$ = "GotIt!" THEN GOTO UploadComplete

UploadComplete:
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออต Upload A File: ฦออออออออออต"
LOCATE 1, 14, 0: COLOR 15: PRINT "Upload A File:"
PRINT "": COLOR 11
PRINT "The file's been sent!!"
PRINT ""
PRINT "Press <ENTER> or <SPACE>."
UpLoadE:
B$ = INKEY$
IF B$ = CHR$(13) OR B$ = " " THEN GOTO UploadEndB
GOTO UpLoadE:




UploadError:
IF ERR = 62 THEN GOTO UploadD








UploadEnd:
COLOR 31, 0: CLS : SOUND 1500, 2: PRINT ""; TheirName$; " has cancled the upload!"
UploadEndA:
B$ = INKEY$: IF B$ = CHR$(13) OR B$ = " " THEN GOTO UploadEndB
GOTO UploadEndA
UploadEndB:
END SUB

