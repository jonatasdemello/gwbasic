DECLARE SUB commands ()
ON ERROR GOTO Errors
WIDTH 40: CLS : COLOR 14, 0: PLAY "C8C16F"
PRINT "Welcome to the CHAT LINE!": PRINT ""
PRINT "What is your name?"
COLOR 11: INPUT Myname$
COLOR 14: CLS : PRINT "Press <ENTER> when connected:"
INPUT enter

OPEN "Com2:2400,N,8,1" FOR RANDOM AS #1
TroubleRestart:
PRINT #1, "Connected!"
SA:
INPUT #1, A$
IF A$ = "Connected!" THEN GOTO OK
GOTO SA
OK:
INPUT #1, Theirname$
IF Theirname$ = "" THEN GOTO SA
INPUT #1, A$
INPUT #1, B$
INPUT #1, C$
INPUT #1, D$
INPUT #1, E$
COLOR 11: PRINT A$: PRINT B$: PRINT C$: PRINT D$: PRINT E$
PRINT ""
COLOR 31: PRINT "Type `#END' when you want to quit"
COLOR 7: PRINT "Type `#Commands' for MORE commands!"
PRINT #1, Myname$
COLOR 11: PRINT "You're talking to "; Theirname$; ""
GOTO B:
A:
C = 14
AA:
LINE INPUT #1, A$
IF A$ = "" THEN GOTO AA
IF A$ = "ErrorOnMain" THEN GOTO Trouble
IF A$ = "#BEEP" OR A$ = "#beep" OR A$ = "#Beep" THEN BEEP: GOTO B
IF A$ = "#PLAY" OR A$ = "#play" OR A$ = "#Play" THEN LINE INPUT #1, Play$: PLAY Play$: GOTO B
IF A$ = "#DATE" OR A$ = "#date" OR A$ = "#Date" THEN PRINT #1, DATE$: GOTO B
IF A$ = "#TIME" OR A$ = "#time" OR A$ = "#Time" THEN PRINT #1, TIME$: GOTO B
IF A$ = "ColorChange" THEN INPUT #1, C: LINE INPUT #1, A$
: PRINT ""
COLOR C
PRINT A$
B:
COLOR 11: LINE INPUT B$
IF B$ = "#BEEP" OR B$ = "#beep" OR B$ = "Beep" THEN BEEP
IF B$ = "#COLOR" OR B$ = "#color" OR B$ = "#Color" THEN GOSUB Colors
IF B$ = "#COMMAND" OR B$ = "#command" OR B$ = "#Command" THEN CALL commands: GOTO B
IF B$ = "#Play" OR B$ = "#play" OR B$ = "#PLAY" THEN GOSUB SongPlay
IF B$ = "#DATE" OR B$ = "#date" OR B$ = "#Date" THEN GOSUB Date
IF B$ = "#TIME" OR B$ = "#time" OR B$ = "#Time" THEN GOSUB Time
IF B$ = "#ACTION" OR B$ = "#action" OR B$ = "#Action" THEN GOSUB Actions
IF B$ = "#END" OR B$ = "#end" OR B$ = "#End" THEN COLOR 14, 0: CLS : PRINT "Chat has been ended.": PRINT #1, "Chat has been ended. Bye!!": COLOR 0: INPUT enter
IF B$ = "" THEN B$ = "(No response)"
C:
PRINT #1, B$
GOTO A

Actions:
COLOR 14, 0: CLS : SOUND 1500, 2
PRINT "What do you want to do to the other user?"
PRINT ""
COLOR 11: PRINT "1 - Slap him/her"
PRINT "2 - Punch him/her"
PRINT "3 - Pinch him/her"
PRINT "4 - Hug him/her"
PRINT "5 - Kiss him/her"
PRINT "6 - Dope slap him/her"
PRINT "7 - Give a high five to him/her"
repeatA:
B$ = INKEY$: IF B$ = "" THEN GOTO repeatA:
IF B$ = "1" THEN PRINT #1, Myname$; " slapped you!!!": PRINT "": COLOR 4: PRINT Theirname$; " - Ouch!": GOTO A
IF B$ = "2" THEN PRINT #1, Myname$; " punched you hard!!!": PRINT "": COLOR 4: PRINT Theirname$; " - Ouch!": GOTO A
IF B$ = "3" THEN PRINT #1, Myname$; " pinched you!!!": PRINT "": COLOR 4: PRINT Theirname$; " - Ouch!": GOTO A
IF B$ = "4" THEN PRINT #1, Myname$; " hugged you!": COLOR 4: PRINT "": PRINT Theirname$; " - Squeeze!": GOTO A
IF B$ = "5" THEN PRINT #1, Myname$; " kissed you on the lips!": COLOR 4: PRINT "": PRINT Theirname$; " - Smooch!": GOTO A
IF B$ = "6" THEN PRINT #1, Myname$; " gave you a dope slap!": COLOR 4: PRINT "": PRINT Theirname$; " - Shhlap!": GOTO A
IF B$ = "7" THEN PRINT #1, Myname$; " just gave you a high-five!": COLOR 4: PRINT "": PRINT Theirname$; " - Alright!": GOTO A
GOTO repeatA

SongPlay:
COLOR 14: CLS : PRINT "Please type the song here:"
PRINT "(as you would in BASIC)"
COLOR 11: INPUT Song$
PLAY Song$
PRINT #1, B$
PRINT #1, Song$
GOTO A

Date:
PRINT #1, B$
INPUT #1, curdate$
DATE$ = curdate$
GOTO A

Time:
PRINT #1, B$
INPUT #1, curtime$
TIME$ = curtime$
GOTO A

Colors:
COLOR 14: CLS : PRINT "Please type the number of the color you want to use:"
colorsA:
COLOR 11: INPUT A
IF A > 31 THEN BEEP: GOTO colorsA
IF A < 0 THEN BEEP: GOTO colorsA
COLOR 14: PRINT ""
PRINT "Now, what would you line to say to them?"
LINE INPUT B$
PRINT #1, "ColorChange": PRINT #1, A: PRINT #1, B$
GOTO A

Errors:
IF ERR = 24 OR ERR = 25 OR ERR = 57 OR ERR = 58 THEN
COLOR 15, 0: CLS : BEEP: PRINT "Communications Error!"
PRINT ""
COLOR 13: PRINT "Error code "; ERR; ""
PRINT ""
COLOR 11: PRINT "Please check your connections"
PRINT "and restart the program"
INPUT enter
END IF
END

Trouble:
COLOR 15, 0: CLS : PRINT "Sorry, there has been a problem": PRINT "with "; N$; "'s system.": PRINT "": PRINT "Please wait while the system is restarted.": GOTO TroubleRestart

SUB commands
WIDTH 80: COLOR 14, 0: CLS : SOUND 1500, 2
PRINT "Command List"
COLOR 11
PRINT ""
PRINT "#Beep       - Causes the other person's computer ( and yours ) to beep."
PRINT "#Color      - Lets you send messages in different colors."
PRINT "#Play       - Lets you play a song."
PRINT "#Action     - Lets you use `actions' such as: Slap, Kiss, Hug, Pinch, and so on!"
PRINT "#End        - Ends this program."
PRINT "#Date       - Sets your date according to the other person's."
PRINT "#Time       - Sets your time according to the other person's."
COLOR 14
PRINT ""
PRINT "Press <ENTER> to go on."
COLOR 0: INPUT enter
LOCATE 1, 1, 0: WIDTH 40: COLOR 14: PRINT "Go ahead! it's your turn to type!!": PRINT ""





END SUB

SUB ErrorControl









































































END SUB

