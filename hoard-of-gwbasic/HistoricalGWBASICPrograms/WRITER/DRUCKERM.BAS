10 COLOR 15,0,0
20 CLS
30 PRINT"                        ******************************"
40 PRINT"                        *                            *"
50 PRINT"                        *       Drucker-Memory       *"
60 PRINT"                        *                            *"
70 PRINT"                        ******************************"
80 PRINT:PRINT
90 PRINT"Dieses Programm bef„higt den Computer Daten auf dem Drucker auszugeben !!!"
100 PRINT"M = Men"
110 PRINT"P = Serieller Port"
120 PRINT"T = DruckerTyp"
130 PRINT"D = Datum drucken"
140 PRINT"U = Uhrzeit drucken"
150 PRINT"E = Ende"
160 PRINT
170 PRINT"Bitte Taste drcken wenn bereit !!! Bereit ???"
180 A$=INKEY$:IF A$="" THEN 180
190 CLS
200 PRINT"       ";X$
210 INPUT"Wort : ",X$
220 IF X$="m" OR X$="M" THEN GOTO 20
230 IF X$="p" OR X$="P" THEN GOTO 360
240 IF X$="t" OR X$="T" THEN GOTO 410
250 IF X$="d" OR X$="D" THEN 480
260 IF X$="u" OR X$="U" THEN 550
270 IF X$="e" OR X$="E" THEN 620
280 LPRINT X$
290 GOTO 190
300 CLS
310 PRINT X$
320 PRINT
330 PRINT"Bitte Taste !!!"
340 A$=INKEY$:IF A$="" THEN 340
350 GOTO 190
360 CLS
370 PRINT"Der Serielle Port ist LPT1 !!!"
380 PRINT:PRINT"Taste !!!"
390 A$=INKEY$:IF A$="" THEN 390
400 GOTO 190
410 CLS
420 PRINT"Der DruckerTyp ist "
430 PRINT"SHARP JX-9500E"
440 PRINT"Laserdrucker !!!"
450 PRINT:PRINT"Bitte Taste drcken !!!"
460 A$=INKEY$:IF A$="" THEN 460
470 GOTO 190
480 CLS
490 PRINT"Datum wird gedruckt heutiges Datum >>> ";DATE$
500 LPRINT "Datum   [MM:DD:YY] >>> ";DATE$
510 PRINT"Ok"
520 PRINT"Bitte Taste !!!"
530 A$=INKEY$:IF A$="" THEN 530
540 GOTO 190
550 CLS
560 PRINT"Uhrzeit wird gedruckt jetzige Uhrzeit >>> ";TIME$
570 LPRINT "Uhrzeit [HH:MM:SS] >>> ";TIME$;" Uhr"
580 PRINT"Ok"
590 PRINT"Bitte Taste !!!"
600 A$=INKEY$:IF A$="" THEN 600
610 GOTO 190
620 CLS
630 COLOR 7:PRINT"Wollen Sie Drucker-Memory wirklich abbrechen [";:COLOR 15:PRINT"Y";:COLOR 7:PRINT"es\";:COLOR 15:PRINT"N";:COLOR 7:PRINT"o] ???"
640 A$=INKEY$:IF A$="y" OR A$="Y" THEN CLS:LOAD"BREAK.NEW"
650 IF A$="n" OR A$="N" THEN GOTO 190
660 GOTO 640
