10 KEY OFF
20 CLS
30 VIEW PRINT
40 ON ERROR GOTO 700
50 CHCDE$=""
60 CODE$=""
70 ANF$=""
80 CDE$=""
90 BED$=""
100 COLOR 14
110 LOCATE 1,30:PRINT"CB-Funk Hilfsprogramm"
120 LOCATE 2,40:COLOR 12:PRINT"written by RoboCop INDUSTRIES"
130 LOCATE 4,25:COLOR 10:PRINT"(C)1995-96 by RoboCop INDUSTRIES"
140 VIEW PRINT 6 TO 24
150 COLOR 15
160 LOCATE 7,1:PRINT"Code     : ";:COLOR 14:INPUT "",CODE$
170 IF CODE$="END" OR CODE$="end" THEN COLOR 15:VIEW PRINT:END
180 GOSUB 620
190 ANF$=LEFT$(CODE$,1)
200 LOCATE 7,12:COLOR 14:PRINT CODE$
210 COLOR 15:PRINT"Kategorie: ";
220 COLOR 13:PRINT"Suche ..."
230 LOCATE 8,12
240 COLOR 14
250 IF ANF$="Q" OR ANF$="q" THEN PRINT"Q-Code   ":GOTO 340
260 IF ANF$="S" AND LEN(CODE$)=2 AND ASC(RIGHT$(CODE$,1))>47 AND ASC(RIGHT$(CODE$,1))<58 THEN PRINT"S-Stufe  ":GOTO 340
270 IF ASC(ANF$)>47 AND ASC(ANF$)<58 THEN PRINT"Zahlencode":GOTO 340
280 PRINT"unbekannt":GOTO 340
290 COLOR 15:PRINT"Datendatei erweitern [J/N] ?"
300 A$=INKEY$:IF A$="" THEN 300
310 IF A$="j" OR A$="J" THEN GOTO 530
320 IF A$="n" OR A$="N" THEN GOTO 510
330 GOTO 300
340 COLOR 15:PRINT"Bedeutung: ";
350 COLOR 13:PRINT"Suche ..."
360 OPEN "I",#1,"CBF.DAT"
370 ON ERROR GOTO 390
380 INPUT#1,CDE$,BED$:GOTO 400
390 COLOR 14:LOCATE 9,12:PRINT"unbekannt":CLOSE #1:GOTO 290
400 IF CDE$=CODE$ THEN CLOSE #1:GOTO 420
410 GOTO 380
420 IF LEFT$(BED$,7)="Station" THEN COLOR 14:LOCATE 8,12:PRINT"Rufname / Bezeichnung"
430 ON ERROR GOTO 690:COLOR 14:LOCATE 9,12
440 IF LEN(BED$)>9 THEN GOTO 480
450 FOR Y=LEN(BED$) TO 9
460 BED$=BED$+" "
470 NEXT Y
480 PRINT BED$
490 LOCATE 15,1:COLOR 9:PRINT"Taste dr�cken, wenn bereit"
500 A$=INKEY$:IF A$="" THEN 500
510 VIEW PRINT:CLS
520 RUN
530 '***** Datendatei erweitern
540 OPEN "A",#2,"CBF.DAT"
550 CLS:LOCATE 7,1:COLOR 15:PRINT"Code     : ";CODE$
560 INPUT"Bedeutung: ",BED$
570 PRINT:PRINT"Alles richtig [J/N] ?"
580 A$=INKEY$:IF A$="" THEN 580
590 IF A$="j" OR A$="J" THEN WRITE#2,CODE$,BED$:CLOSE #2:GOTO 510
600 IF A$="n" OR A$="N" THEN GOTO 560
610 GOTO 580
620 '***** kleinbuchst. ----> GRO�BUCHST.
630 FOR X=1 TO LEN(CODE$)
640 BUCHST$=MID$(CODE$,X,1)
650 IF ASC(BUCHST$)>96 AND ASC(BUCHST$)<123 THEN BUCHST$=CHR$(ASC(BUCHST$)-32)
660 CHCDE$=CHCDE$+BUCHST$
670 NEXT X
680 IF LEN(CODE$)=LEN (CHCDE$) THEN 690 ELSE GOTO 700
690 CODE$=CHCDE$:RETURN
700 COLOR 12:PRINT"FEHLER ist aufgetreten! Programmabbruch!":END
