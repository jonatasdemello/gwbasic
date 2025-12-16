10 CLS
20 REM
30 REM
40 '
50 '
60 '
70 '
80 '
90 '
100 '
110 '
120 '
130 PRINT"Welche Umrechnung w］schen Sie ???"
140 '
150 PRINT
160 PRINT"[ 1 ] Celsius in Fahrenheit"
170 PRINT
180 PRINT TAB(14) "oder"
190 PRINT
200 PRINT"[ 2 ] Fahrenheit in Celsius"
210 PRINT:PRINT
220 PRINT"Nur 1 oder 2 Tippen !!!"
230 A$=INKEY$
240 IF A$="1" OR A$="!" THEN 300
250 IF A$="2" THEN 700
260 GOTO 230
270 '
280 '
290 '
300 '
310 '
320 '
330 '
340 '
350 '
360 CLS
370 PRINT:PRINT:PRINT
380 PRINT"Nach dem schreiben der Zahl unbedingt [ENTER] dr…ken !!!"
390 '
400 '
410 '
420 PRINT:PRINT
430 INPUT"Grade in Celsius : ",C
440 LET F=32+9/5*C
450 PRINT
460 PRINT C;" Grad Celsius"
470 PRINT"           =    "
480 PRINT F;" Grad Fahrenheit"
490 PRINT:PRINT
500 PRINT TAB(10)"Bitte Taste dr…ken !!!"
510 A$=INKEY$:IF A$="" THEN 510
520 GOTO 1000
700 '
710 '
720 '
730 '
740 '
750 '
760 CLS
770 PRINT:PRINT:PRINT
780 PRINT"Nach dem schreiben der Zahl unbedingt [ENTER] dr…ken !!!"
790 '
800 '
810 '
820 PRINT:PRINT
830 INPUT"Grade in Fahrenheit : ",F
840 LET C=5/9*(F-32)
850 PRINT
860 PRINT F;" Grad Fahrenheit"
870 PRINT"            ="
880 PRINT C;" Grad Celsius"
890 PRINT:PRINT
900 PRINT TAB(10)"Bitte Taste dr…ken !!!"
910 A$=INKEY$:IF A$="" THEN 910
920 GOTO 1000
1000 '
1010 '
1020 '
1030 '
1040 '
1050 CLS
1060 PRINT:PRINT
1070 LOCATE 1,1:PRINT"Weitere Umrechnungen [Y/N] >>>"
1080 '
1090 A$=INKEY$
1100 IF A$="y" OR A$="Y" THEN 1200
1110 IF A$="n" OR A$="N" THEN 1300
1120 GOTO 1090
1200 LOCATE 1,1:PRINT"Weitere Umrechnungen [Y/N] >>> Yes"
1210 FOR Z=0 TO 9999:NEXT Z
1220 RUN
1300 LOCATE 1,1:PRINT"Weitere Umrechnungen [Y/N] >>> No"
1310 FOR Z=0 TO 9999:NEXT Z
1320 CLS
1330 END
