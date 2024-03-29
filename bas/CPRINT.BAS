10 REM    CITOH 8510 (NEC 2083) PRINTER OPTION PROGRAM
20 REM    BY CHARLES VELLA, PH.D. (BASED ON THE
30 REM    IBM PRINTER OPTION PROGRAM
40 REM    BY LINDA AND SID BROUDY)
50 CLS:KEY OFF
60 PRINT TAB(20) "CITOH 8510 PRINTER OPTION MENU"
70 PRINT:PRINT "Choose from the following options:"
80 PRINT
90 PRINT "0) End program":PRINT
100 PRINT "1) Proportional characters"
110 PRINT "2) Pica  characters (10 cpi) (default)"
120 PRINT "3) Elite characters (12 cpi)"
130 PRINT "4) Compressed characters (17 cpi)":PRINT
140 PRINT "5) Regular mode (default)"
150 PRINT "6) Double-strike (bold print) mode":PRINT
160 PRINT "7) Normal line spacing (1/6 inch line) (default)"
170 PRINT "8) Compressed line spacing (1/8 inch line)":PRINT
180 PRINT "9) Start underlining"
190 PRINT "10) End underlining":PRINT
200 PRINT "11) Double width mode"
210 PRINT "12) Double width mode off":PRINT
220 INPUT "Which option do you wish";ANS
230 IF ANS<0 OR ANS>12 THEN BEEP:GOTO 220
240 IF ANS=0 THEN 390
250 ON ANS GOSUB 290,300,310,320,330,340,350,360,370,380,390,400
260 PRINT "Done..."
270 FOR DELAY=1 TO 500 :NEXT
280 GOTO 50
290 LPRINT CHR$(27);"P";:RETURN  'set Proportional characters
300 LPRINT CHR$(27);"N";:RETURN  'set Pica characters
310 LPRINT CHR$(27);"E";:RETURN  'set Elite characters
320 LPRINT CHR$(27);"Q";:RETURN  'set Compressed characters
330 LPRINT CHR$(27)+CHR$(34);:RETURN 'Bold print mode off
340 LPRINT CHR$(27);"!";:RETURN 'Bold print mode on
350 LPRINT CHR$(27);"A";:RETURN 'Normal line spacing
360 LPRINT CHR$(27);"B";:RETURN 'Compressed line spacing
370 LPRINT CHR$(27);"X";:RETURN 'Underline On
380 LPRINT CHR$(27);"Y";:RETURN 'Underline Off
390 LPRINT CHR$(14);:RETURN     'Double width on
400 LPRINT CHR$(15);:RETURN     'Double width off
410 END
