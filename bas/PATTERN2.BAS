10 ' Program: PATTERNS.BAS (Keyboard Kaleidoscope)
20 ' Contributed to PC-SIG on 5 November, 1983
30 ' Written by John Walkenbach
40 '            1425 NW Highland
50 '            Corvallis, OR 97330
60 '
70 KEY OFF
80 CLS:LOCATE 4,20:PRINT"K E Y B O A R D   K A L E I D O S C O P E"
90 LOCATE 24,1:PRINT "Instructions? (y/n) ";
100 A$=INKEY$:IF LEN(A$)=0 THEN 90
110 IF A$="y" OR A$="Y" THEN GOSUB 540
120 LOCATE ,,1,10,13
130 R=1:C=1:CCC=219
140 KEY OFF 'Activate function keys
150 FOR I=10 TO 14:KEY(I) ON:NEXT:KEY (1) ON:KEY (2) ON
160 ON KEY(10) GOSUB 490
170 ON KEY(11) GOSUB 250
180 ON KEY(12) GOSUB 280
190 ON KEY(13) GOSUB 310
200 ON KEY (14) GOSUB 340
210 ON KEY(1) GOSUB 670
220 ON KEY(2) GOSUB 480
230 CLS:GOSUB 680
240 GOTO 240 'Wait for interrupt
250 IF R-1=0 THEN BEEP:RETURN
260 R=R-1:LOCATE R,C:PRINT CHR$(CCC);
270 GOSUB 370:RETURN
280 IF C-1=0 THEN BEEP:RETURN
290 C=C-1:LOCATE R,C:PRINT CHR$(CCC);
300 GOSUB 370:RETURN
310 IF C+1=21 THEN BEEP:RETURN
320 C=C+1:LOCATE R,C:PRINT CHR$(CCC);
330 GOSUB 370:RETURN
340 IF R+1=13 THEN BEEP:RETURN
350 R=R+1:LOCATE R,C:PRINT CHR$(CCC);
360 GOSUB 370:RETURN
370 LOCATE R,C
380 LOCATE R,41-C:PRINT CHR$(CCC);
390 LOCATE R,C+40:PRINT CHR$(CCC);
400 LOCATE R,81-C:PRINT CHR$(CCC);
410 LOCATE 25-R,C:PRINT CHR$(CCC);
420 LOCATE 25-R,41-C:PRINT CHR$(CCC);
430 LOCATE 25-R,C+40:PRINT CHR$(CCC);
440 IF R=1 AND C=1 THEN 460 'To eliminate scrolling from char at bottom right
450 LOCATE 25-R,81-C:PRINT CHR$(CCC);
460 LOCATE R,C
470 RETURN
480 CLS:RUN 130
490 IF CCC=219 THEN CCC=176:GOSUB 680:RETURN
500 IF CCC=176 THEN CCC=177:GOSUB 680:RETURN
510 IF CCC=177 THEN CCC=178:GOSUB 680:RETURN
520 IF CCC=178 THEN CCC=32:GOSUB 680:RETURN
530 IF CCC=32 THEN CCC=219:GOSUB 680:RETURN
540 'print instructions, if needed
550 LOCATE 6,30:PRINT"I N S T R U C T I O N S"
560 LOCATE 10,1:PRINT"This program allows you to draw interesting kaleidoscopic patterns on the
570 PRINT "screen using the four cursor control keys and Function Key 10.
580 PRINT:PRINT"The screen is divided into eight `views.'  Pay attention to the upper
590 PRINT"left corner of the screen (12 rows by 20 columns); that's what you control.
600 PRINT:PRINT"Function Key 10 changes the color of the tracing. The current color is shown in
610 PRINT"    the bottom left corner of the screen (b is blank).
620 PRINT"Function Key 1 stops the program and returns you to BASIC.
630 PRINT"Function Key 2 clears the screen and starts over.
640 PRINT:PRINT"When you hear a beep, it means you can't go further in that direction."
650 LOCATE 24,1:INPUT"Hit <ENTER> to begin. ",ENT$
660 RETURN
670 LOCATE ,,1,12,13:CLS:END
680 LOCATE 25,1
690 IF CCC=32 THEN PRINT"b";:LOCATE R,C:RETURN
700 PRINT CHR$(CCC);:LOCATE R,C:RETURN
