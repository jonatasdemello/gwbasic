DECLARE SUB EndChat ()
DECLARE SUB Actions ()
DECLARE SUB ErrorControl ()
DECLARE SUB Download ()
DECLARE SUB Upload ()
DECLARE SUB Commands ()
DECLARE SUB Transmit ()
DECLARE SUB Recieve ()
DECLARE SUB HighLow ()
COMMON SHARED Name$, Theirname$, Type$
ON ERROR GOTO ErrorControl
REM"ChatLine!!! By Larry!,  started on Aug. 17, 1994"
REM"                        finished on "

BIGStart:
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

ErrorControl:
A = ERR
IF A = 5 THEN A$ = "Illegal Function Call": B$ = "This error was probably caused when you": C$ = "or the other user tried to play a song": D$ = "that was typed in incorrectly."
IF A = 24 THEN A$ = "Device Timeout": B$ = "This error means you are either not": C$ = "connected to another user, or your modem": D$ = "is not on, or connected corectly."
IF A = 25 THEN A$ = "Device Fault": B$ = "Your modem or printer is not working": C$ = "correctly. Be sure it is connected."
IF A = 57 THEN A$ = "Device I/O Error": B$ = "You may be using a bad disk."
IF A = 68 THEN A$ = "Device Unavailble": B$ = "Your modem or printer is not connected"
IF A = 7 THEN A$ = "Out Of Memory": B$ = "You have no memory left!": C$ = "Try Closing other applicatons."
IF A = 71 THEN A$ = "Disk Not Ready": B$ = "The disk drive you want to use is empty": C$ = "or not closed correctly. Try again"
IF A = 76 THEN A$ = "Path Not Found": B$ = "The path of the file you want to open": C$ = "does not exist!!  Try again."
IF A = 64 THEN A$ = "Bad File Name": B$ = "You chose a bad name for a file to send": C$ = "or recieve.  Try again!"
IF A = 61 THEN A$ = "Disk Full": B$ = "The disk you are trying to put a file on": C$ = "is full. Try another disk."
IF A = 53 THEN A$ = "File Not Found": B$ = "The file you are trying to send,": C$ = "does not exist. Try again!"
IF A = 75 THEN A$ = "Path/File Access Error": B$ = "There may be a problem with your disk."
IF A$ = "" THEN A$ = "Unknown Error": B$ = "If you've edited this file,": C$ = "it might be what has caused this error."

COLOR 13, 0: CLS : SOUND 200, 5: SOUND 100, 5
PRINT "ฦอออออออออออต System Error ฦอออออออออออต"
LOCATE 1, 15, 0: COLOR 15: PRINT "System Error"
PRINT "": COLOR 11
PRINT "An error has occured:"
LOCATE 4, 23, 0: COLOR 15: PRINT A$
LOCATE 6: COLOR 15
PRINT B$: PRINT C$: PRINT D$
LOCATE 10: COLOR 11
PRINT "Press <ENTER> or <SPACE> to return to"
PRINT "return to the main menu"
ErrorsA:
B$ = INKEY$: IF B$ = CHR$(13) OR B$ = " " THEN GOTO BIGStart
GOTO ErrorsA

SUB Actions
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออออออออต Actions: ฦอออออออออออออต"
LOCATE 1, 17, 0: COLOR 15: PRINT "Actions:"
PRINT "": COLOR 15
PRINT "What would you like to do to "; Theirname$; "?"
PRINT "": COLOR 11
PRINT "1 - Slap "; Theirname$; "."
PRINT "2 - Punch "; Theirname$; "."
PRINT "3 - Pinch "; Theirname$; "."
PRINT "4 - Hug "; Theirname$; "."
PRINT "5 - Kiss "; Theirname$; "."
PRINT "6 - Give "; Theirname$; "a High-Five."
PRINT "7 - Shake "; Theirname$; "'s hand."
PRINT "8 - Give "; Theirname$; "a pat on the back!"
PRINT ""
ActionsA:
B$ = INKEY$
IF B$ = "1" THEN PRINT #2, Name$; " slapped you!": LOCATE 15: COLOR 4: PRINT Theirname$; " - Ouch!": GOTO ActionEnd
IF B$ = "2" THEN PRINT #2, Name$; " punched you!": LOCATE 15: COLOR 4: PRINT Theirname$; " - Ouch!": GOTO ActionEnd
IF B$ = "3" THEN PRINT #2, Name$; " pinched you!": LOCATE 15: COLOR 4: PRINT Theirname$; " - Ouch!": GOTO ActionEnd
IF B$ = "4" THEN PRINT #2, Name$; " hugged you!": GOTO ActionEnd
IF B$ = "5" THEN PRINT #2, Name$; " kissed you!": GOTO ActionEnd
IF B$ = "6" THEN PRINT #2, Name$; " gave you a High-Five!": LOCATE 15: COLOR 15: PRINT Theirname$; " - Yeah!": GOTO ActionEnd
IF B$ = "7" THEN PRINT #2, Name$; " shook your hand.": GOTO ActionEnd
IF B$ = "8" THEN PRINT #2, Name$; " gave you a pat on the back.": GOTO ActionEnd
GOTO ActionsA

ActionEnd:
END SUB

SUB Commands
WIDTH 80: COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦอออออออออออออออออออออออออออออออต Command List ฦอออออออออออออออออออออออออออออออต"
LOCATE 1, 35, 0: COLOR 15: PRINT "Command List."
PRINT "": COLOR 11
PRINT "#COMMAND    - Lets you see this command list."
PRINT "#HI-LO      - Lets you and the other user play, HI or LOW!!"
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
PRINT "#"
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
B$ = INKEY$: IF B$ = "Y" OR B$ = "y" THEN PRINT #2, "Ready": GOTO DownloadB
IF B$ = "N" OR B$ = "n" THEN PRINT #2, "Cancled": GOTO DownLoadEnd
GOTO DownLoadA

DownloadB:
OPEN "O", 2, FileName$
DownLoadC:
INPUT #1, A$
IF A$ = "#CHATLINE#UPLOAD#DONE" THEN GOTO DownLoadD
PRINT #2, A$
GOTO DownLoadC

DownLoadD:
CLOSE 2: PRINT #2, "GotIt!"
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

SUB HighLow
CLS
COLOR 13
PRINT "ฦออออออออออออต High / Low ฦออออออออออออต"
LOCATE 1, 16
COLOR 15
PRINT "High / Low"
PRINT ""
PRINT ""
COLOR 14
PRINT "(1)  I am the one who called"
PRINT "(2)  I am the one who didn't call"
PRINT ""
COLOR 12
PRINT "Please Select One."
DO UNTIL B$ = "1" OR B$ = "2"
B$ = INKEY$
LOOP
IF B$ = "1" THEN GOTO Caller
IF B$ = "2" THEN GOTO Caller
Caller:
  CLS : COLOR 15
  PRINT "Press <ENTER> when connected."
  DO UNTIL B$ <> ""
  B$ = INKEY$
  LOOP
  OPEN "Com1:2400,N,8,1" FOR RANDOM AS 1
CPrintScreen:
  COLOR 4
  CLS
  PRINT "ษออออออออออออออออออออออออออออออออออออออป"
  PRINT "บ                                      บ"
  PRINT "ศออออออออออออออออออออออออออออออออออออออผ"
  COLOR 15
  LOCATE 2, 3
  PRINT "H I G H   /   L O W"
  LOCATE 5, 3
  COLOR 14
  PRINT "By, Michael Sao Pedro"
  PRINT ""
  COLOR 13
  PRINT "Press <ENTER>"
  DO UNTIL B$ <> ""
  B$ = INKEY$
  LOOP

END SUB

SUB Recieve
CLS
COLOR 11: PRINT "Press <ENTER> when you are connected."
RecieveLA:
B$ = INKEY$: IF B$ = CHR$(13) OR B$ = " " THEN GOTO RecieveLB
GOTO RecieveLA

RecieveLB:
OPEN "I", 1, "CHAT"
OPEN "O", 2, "GGG"
RecieveA:
INPUT #1, A$
IF A$ = "#Connected T" THEN GOTO RecieveB
GOTO RecieveA

RecieveB:
PRINT #2, "#Connected R"
PRINT #2, Name$
INPUT #1, Theirname$

REM "Startup message"

PRINT #2, "Welcome to the CHAT LINE!!"
PRINT #2, ""
PRINT #2, "You're talking to "; Name$; "!"

COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออออต Chat Line! ฦออออออออออออต"
LOCATE 1, 16, 0: COLOR 15: PRINT "Chat Line!"
PRINT "": COLOR 15
PRINT "Welcome to the CHAT LINE!"
PRINT "": COLOR 11
PRINT "You're talking to "; Theirname$; ""
COLOR 14: PRINT ""
PRINT "Type #END to end the chat."
PRINT "Type #COMMAND for more commands."
PRINT "": COLOR 15
PRINT "Now talk to "; Theirname$; ""
PRINT ""
RecieveInput:
COLOR 11
LINE INPUT "You: ", A$
IF A$ = "" THEN A$ = "(No Response)"
IF A$ = "#BEEP" OR A$ = "#beep" OR A$ = "#Beep" THEN BEEP: A$ = "#BEEP"
IF A$ = "#PLAY" OR A$ = "#play" OR A$ = "#Play" THEN PRINT #2, "#PLAY": GOSUB RSongPlay
IF A$ = "#DATE" OR A$ = "#date" OR A$ = "#Date" THEN PRINT #2, "#DATE": LINE INPUT #1, CurDate$: DATE$ = CurDate$: GOTO RAfterCal
IF A$ = "#TIME" OR A$ = "#time" OR A$ = "#Time" THEN PRINT #2, "#TIME": LINE INPUT #1, CurTime$: TIME$ = CurTime$: GOTO RAfterCal
IF A$ = "#COMMAND" OR A$ = "#command" OR A$ = "#Command" THEN CALL Commands: GOTO RecieveInput
IF A$ = "#ACTION" OR A$ = "#action" OR A$ = "#Action" THEN GOSUB RActions
IF A$ = "#COLOR" OR A$ = "#color" OR A$ = "#Color" THEN GOSUB RColors
IF A$ = "#END" OR A$ = "#end" OR A$ = "#End" THEN PRINT #2, "#END": CALL EndChat: EXIT SUB
IF A$ = "#UPLOAD" OR A$ = "#upload" OR A$ = "#Upload" THEN CALL Upload: GOTO RecieveInput
IF A$ = "#CLEAR" OR A$ = "#clear" OR A$ = "#Clear" THEN CLS : GOTO RecieveInput
IF A$ = "#SHELL" OR A$ = "#shell" OR A$ = "#Shell" THEN PRINT #2, "#SHELL": CLS : SHELL: GOTO RecieveInput
PRINT #2, A$

RecievePrint:
C = 14
LINE INPUT #1, A$
IF A$ = "" THEN GOTO RecievePrint
IF A$ = "#BEEP" THEN BEEP
IF A$ = "#PLAY" THEN INPUT #1, B$: PLAY B$
IF A$ = "#DATE" THEN PRINT #2, DATE$
IF A$ = "#TIME" THEN PRINT #2, TIME$
IF A$ = "#COLOR#CHANGE" THEN INPUT #1, C: LINE INPUT #1, A$
IF A$ = "#ERROR#T" THEN COLOR 15: CLS : SOUND 1500, 2: PRINT "The other user had an error.": PLAY "P": COLOR 11: CLS : PRINT "Press <ENTER> when you are connected.": GOTO RecieveLA
IF A$ = "#END" THEN
COLOR 15, 0: CLS : SOUND 1500, 2: PRINT ""; Theirname$; " has ended the chat."
RecievePrintB:
B$ = INKEY$: IF B$ = CHR$(13) OR B$ = " " THEN CALL EndChat: EXIT SUB
GOTO RecievePrintB
END IF
IF A$ = "#UPLOAD" THEN CALL Download: GOTO RecieveInput
IF A$ = "#SHELL" THEN COLOR 15: PRINT "": PRINT Theirname$; " has shelled to DOS.": GOTO RecievePrint
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
INPUT B$
PRINT #2, "#PLAY"
PRINT #2, B$
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
IF B$ = CHR$(13) OR B$ = " " THEN PRINT #2, "#COLOR#CHANGE": PRINT #2, C: PRINT #2, A$
GOTO RColorsC

RAfterCal:
PRINT "": COLOR 15: PRINT "The changes have been made! Go ahead!"

RActions:
CALL Actions
GOTO RecievePrint





















END SUB

SUB Transmit
CLS
COLOR 11: PRINT "Press <ENTER> when you are connected."
TransmitLA:
B$ = INKEY$: IF B$ = CHR$(13) THEN GOTO TransmitLB
GOTO TransmitLA
TransmitLB:
OPEN "Com1:2400,N,8,1" FOR RANDOM AS #1

TransmitB:
PRINT #2, "#Connected T"
transmitA:
INPUT #1, A$
TransmitAA:
IF A$ = "#Connected R" THEN GOTO TransMitD
GOTO transmitA

TransMitD:
INPUT #1, Theirname$

PRINT #2, Name$

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
IF A$ = "#PLAY" THEN INPUT #1, B$: PLAY B$
IF A$ = "#DATE" THEN PRINT #2, DATE$
IF A$ = "#TIME" THEN PRINT #2, TIME$
IF A$ = "#ERROR#R" THEN COLOR 15: CLS : SOUND 1500, 2: PRINT "The other user had an error.": PLAY "P": COLOR 11: CLS : PRINT "Press <ENTER> when you are connected.": GOTO TransmitLA
IF A$ = "#COLOR#CHANGE" THEN INPUT #1, C: LINE INPUT #1, A$
IF A$ = "#END" THEN
IF A$ = "#Connected R" THEN GOTO TransmitAA
COLOR 15, 0: CLS : SOUND 1500, 2: PRINT ""; Theirname$; " has ended the chat."
TransmitPrintB:
B$ = INKEY$: IF B$ = CHR$(13) OR B$ = " " THEN CALL EndChat: EXIT SUB
GOTO TransmitPrintB
END IF
IF A$ = "#UPLOAD" THEN CALL Download: GOTO TransmitInput
IF A$ = "#SHELL" THEN COLOR 15: PRINT "": PRINT Theirname$; " has shelled to DOS.": GOTO transmitprint
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
INPUT B$
PRINT #2, "#PLAY"
PRINT #2, B$
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
IF B$ = CHR$(13) OR B$ = " " THEN PRINT #2, "#COLOR#CHANGE": PRINT #2, C: PRINT #2, A$
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
IF A$ = "#PLAY" OR A$ = "#play" OR A$ = "#Play" THEN PRINT #2, "#PLAY": GOSUB TSongPlay
IF A$ = "#DATE" OR A$ = "#date" OR A$ = "#Date" THEN PRINT #2, "#DATE": LINE INPUT #1, CurDate$: DATE$ = CurDate$: GOTO TAfterCal
IF A$ = "#TIME" OR A$ = "#time" OR A$ = "#Time" THEN PRINT #2, "#TIME": LINE INPUT #1, CurTime$: TIME$ = CurTime$: GOTO TAfterCal
IF A$ = "#COMMAND" OR A$ = "#command" OR A$ = "#Command" THEN CALL Commands: GOTO TransmitInput
IF A$ = "#ACTION" OR A$ = "#action" OR A$ = "#Action" THEN GOSUB TActions
IF A$ = "#COLOR" OR A$ = "#color" OR A$ = "#Color" THEN GOSUB TColors
IF A$ = "#END" OR A$ = "#end" OR A$ = "#End" THEN PRINT #2, "#END": CALL EndChat: EXIT SUB
IF A$ = "#UPLOAD" OR A$ = "#upload" OR A$ = "#Upload" THEN CALL Upload: GOTO TransmitInput
IF A$ = "#CLEAR" OR A$ = "#clear" OR A$ = "#Clear" THEN CLS : GOTO TransmitInput
IF A$ = "#SHELL" OR A$ = "#shell" OR A$ = "#Shell" THEN PRINT #2, "#SHELL": CLS : SHELL: GOTO TransmitInput
PRINT #2, A$
GOTO transmitprint
TransmitError:




END SUB

SUB Upload
IF y = 0 THEN GOTO UploadError
COLOR 13, 0: CLS : SOUND 1500, 2
PRINT "ฦออออออออออต Upload A File: ฦออออออออออต"
LOCATE 1, 14, 0: COLOR 15: PRINT "Upload A File:"
PRINT "": COLOR 11
PRINT "Where is the DATA file"
PRINT "you want to upload?"
LINE INPUT FilePath$

PRINT #2, "#UPLOAD"
PRINT #2, FileName$
INPUT #1, A$

UploadA:
IF A$ = "Ready" THEN PRINT #2, "Ready": GOTO UploadB
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
PRINT #2, "#CHATLINE#UPLOAD#DONE"
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
COLOR 31, 0: CLS : SOUND 1500, 2: PRINT ""; Theirname$; " has cancled the upload!"
UploadEndA:
B$ = INKEY$: IF B$ = CHR$(13) OR B$ = " " THEN GOTO UploadEndB
GOTO UploadEndA
UploadEndB:
END SUB

