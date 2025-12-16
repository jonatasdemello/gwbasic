DECLARE SUB commands ()
WIDTH 40: CLS : COLOR 14, 0: PLAY "C8C16F"
PRINT "Welcome to the CHAT LINE!": PRINT ""
PRINT "What is your name?"
COLOR 11: INPUT MyName$
COLOR 14: CLS : PRINT "Press <ENTER> when connected:"
INPUT enter
OPEN "I", 1, "Chat"
OPEN "ggg" FOR OUTPUT AS #2
check:
INPUT #1, A$
IF A$ = "Connected!" THEN GOTO CheckA
GOTO check
CheckA:
PRINT #2, "Connected!"
PRINT #2, MyName$
PRINT #2, "You're connected to the CHAT LINE!!!"
PRINT #2, ""
PRINT #2, "You're talking to "; MyName$; ""
PRINT #2, "": PRINT #2, "Now type!"
COLOR 31: PRINT "Type `#END' when you want to quit"
COLOR 7: PRINT "Type `#Commands' for MORE commands!"
INPUT #1, TheirName$
COLOR 11: PRINT "You're talking to "; TheirName$; ""

A:
C = 14
AA:
LINE INPUT #1, A$
IF A$ = "" THEN GOTO AA
IF A$ = "Connected!" THEN PRINT #2, "Connected!"
IF A$ = "#BEEP" OR A$ = "#beep" OR A$ = "#Beep" THEN BEEP: GOTO b
IF A$ = "#PLAY" OR A$ = "#play" OR A$ = "#Play" THEN LINE INPUT #1, Play$: PLAY Play$: GOTO b
IF A$ = "#DATE" OR A$ = "#date" OR A$ = "#Date" THEN PRINT #2, DATE$: GOTO b
IF A$ = "#TIME" OR A$ = "#time" OR A$ = "#Time" THEN PRINT #2, TIME$: GOTO b
IF A$ = "ColorChange" THEN INPUT #1, C: LINE INPUT #1, A$
: PRINT ""
COLOR C
PRINT A$
b:
COLOR 11: LINE INPUT b$
IF b$ = "#BEEP" OR b$ = "#beep" OR b$ = "Beep" THEN BEEP
IF b$ = "#COLOR" OR b$ = "#color" OR b$ = "#Color" THEN GOSUB Colors
IF b$ = "#COMMAND" OR b$ = "#command" OR b$ = "#Command" THEN CALL commands: GOTO b
IF b$ = "#Play" OR b$ = "#play" OR b$ = "#PLAY" THEN GOSUB SongPlay
IF b$ = "#DATE" OR b$ = "#date" OR b$ = "#Date" THEN GOSUB Date
IF b$ = "#TIME" OR b$ = "#time" OR b$ = "#Time" THEN GOSUB Time
IF b$ = "#ACTION" OR b$ = "#action" OR b$ = "#Action" THEN GOSUB Actions
IF b$ = "#END" OR b$ = "#end" OR b$ = "#End" THEN COLOR 14, 0: CLS : PRINT "Chat has been ended.": PRINT #2, "Chat has been ended. Bye!!": COLOR 0: INPUT enter
IF b$ = "" THEN b$ = "(No response)"
C:
PRINT #2, b$
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
repeatA:
b$ = INKEY$: IF b$ = "" THEN GOTO repeatA:
IF b$ = "1" THEN PRINT #2, MyName$; " slapped you!!!": PRINT "": COLOR 4: PRINT TheirName$; " - Ouch!": GOTO A
IF b$ = "2" THEN PRINT #2, MyName$; " punched you!!!": PRINT "": COLOR 4: PRINT TheirName$; " - Ouch!": GOTO A
IF b$ = "3" THEN PRINT #2, MyName$; " pinched you!!!": PRINT "": COLOR 4: PRINT TheirName$; " - Ouch!": GOTO A
IF b$ = "4" THEN PRINT #2, MyName$; " hugged you!": GOTO A
IF b$ = "5" THEN PRINT #2, MyName$; " kissed you!": GOTO A
GOTO repeatA

SongPlay:
COLOR 14: CLS : PRINT "Please type the song here:"
PRINT "(as you would in BASIC)"
COLOR 11: INPUT Song$
PLAY Song$
PRINT #2, b$
PRINT #2, Song$
GOTO A

Date:
PRINT #2, b$
INPUT #1, curdate$
DATE$ = curdate$
GOTO A

Time:
PRINT #2, b$
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
LINE INPUT b$
PRINT #2, "ColorChange": PRINT #2, A: PRINT #2, b$
GOTO A

errors:
PRINT #2, "ErrorOnMain"
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

SUB SongPlay
END SUB

