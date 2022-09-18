10 E=1
20 D$="DISKMAN"
30 CLS
40 COLOR 12
50 PRINT"                                  נננ DiskMen נננ"
60 COLOR 15
70 PRINT
80 PRINT"                         Diskettenverwaltung fr GW-Basic"
90 PRINT
100 COLOR 12
110 PRINT"1 - Eingabe"
120 COLOR 10
130 PRINT"2 - Ausgabe"
140 COLOR 14
150 PRINT"3 - Datei w„hlen [";D$;"]"
160 COLOR 7
170 PRINT"4 - Datei l”schen"
180 COLOR 12
190 PRINT"5 - Daten speichern"
200 COLOR 10
210 PRINT"6 - Daten laden"
220 PRINT
230 COLOR 15
240 PRINT"7 - Ende"
250 A$=INKEY$:IF A$="" THEN GOTO 250
260 IF A$="1" THEN GOTO 340
270 IF A$="2" THEN GOTO 770
280 IF A$="3" THEN GOTO 1290
290 IF A$="4" THEN GOTO 1140
300 IF A$="5" THEN GOTO 670
310 IF A$="6" THEN GOTO 1040
320 IF A$="7" THEN CLS:END
330 GOTO 250
340 REM Eingabe
350 CLS
360 COLOR 12
370 PRINT"                            נננ Eingabe von Datens„tzen נננ"
380 COLOR 15
390 PRINT
400 A=1
410 REM E=a
415 CLS
420 PRINT"ננננננננננננננננננננננננננננננננננננננ"
430 PRINT"Datensatznummer:                ";A
440 PRINT"ננננננננננננננננננננננננננננננננננננננ"
450 INPUT"Diskettenbeschriftung: ",G$(A,1)
460 INPUT"Diskettenformat      : ",G$(A,2)
470 INPUT"Diskettenlabel       : ",G$(A,3)
480 PRINT"ננננננננננננננננננננננננננננננננננננננ"
490 INPUT"Programm 01          : ",G$(A,4)
500 INPUT"Programm 02          : ",G$(A,5)
510 IF G$(A,5)="" THEN F=5:GOTO 580
520 INPUT"Programm 03          : ",G$(A,6)
530 IF G$(A,6)="" THEN F=6:GOTO 580
540 INPUT"Programm 04          : ",G$(A,7)
550 IF G$(A,7)="" THEN F=7:GOTO 580
560 INPUT"Programm 05          : ",G$(A,8)
570 F=8
580 PRINT"ננננננננננננננננננננננננננננננננננננננ"
590 PRINT" קNק„chster      קMקen      קקndern "
600 PRINT"ננננננננננננננננננננננננננננננננננננננ"
610 E=A
620 A$=INKEY$:IF A$="" THEN 620
630 IF A$="n" OR A$="N" THEN A=A+1:CLS:GOTO 410
640 IF A$="m" OR A$="M" THEN GOTO 20
650 IF A$="„" OR A$="" THEN CLS:GOTO 410
660 GOTO 620
670 REM Speichern
680 OPEN "O",#1,D$
690 WRITE #1,E
700 WRITE#1,""
710 FOR X=1 TO E
720 FOR Y=1 TO 8
730 WRITE#1,G$(X,Y)
740 NEXT Y,X
750 CLOSE 1
760 GOTO 20
770 REM Ausgabe
780 C=1
785 CLS
790 PRINT"נננננננננננננננננננננננננננננננננננננננננננננ"
800 PRINT"Datensatznummer:  ";C
810 PRINT"נננננננננננננננננננננננננננננננננננננננננננננ"
820 PRINT"Diskettenbeschriftung: ";G$(C,1)
830 PRINT"Diskettenformat      : ";G$(C,2)
840 PRINT"Diskettenlabel       : ";G$(C,3)
850 PRINT"נננננננננננננננננננננננננננננננננננננננננננננ"
860 PRINT"Programm 01          : ";G$(C,4)
870 PRINT"Programm 02          : ";G$(C,5)
880 PRINT"Programm 03          : ";G$(C,6)
890 PRINT"Programm 04          : ";G$(C,7)
900 PRINT"Programm 05          : ";G$(C,8)
910 PRINT"נננננננננננננננננננננננננננננננננננננננננננננ"
920 PRINT" קWקeiter          קZקurck           קMקen"
930 PRINT"נננננננננננננננננננננננננננננננננננננננננננננ"
940 PRINT
950 IF C=1 THEN PRINT"Ende...7"
960 IF C=E THEN PRINT"Ende...8":PRINT
970 A$=INKEY$:IF A$="" THEN GOTO 970
980 IF C=E THEN GOTO 1000
990 IF A$="w" OR A$="W" THEN C=C+1:GOTO 785
1000 IF C<=1 THEN GOTO 1020
1010 IF A$="z" OR A$="Z" THEN C=C-1:GOTO 785
1020 IF A$="m" OR A$="M" THEN GOTO 30
1030 GOTO 970
1040 REM Laden
1050 CLS
1060 OPEN "I",#1,D$
1070 INPUT#1,E,Z$
1080 FOR X=1 TO E
1090 FOR Y=1 TO 8
1095 IF EOF(1) THEN 1125
1100 INPUT#1,G$(X,Y)
1110 NEXT Y,X
1120 PRINT"loaded"
1125 CLOSE 1
1130 GOTO 30
1140 REM DATEI L™SCHEN
1150 CLS
1160 PRINT"Sind Sie sicher daב sie die Datei ";D$;" l”schen wollen ?"
1170 A$=INKEY$:IF A$="" THEN 1170
1180 IF A$="j" OR A$="J" THEN GOTO 1210
1190 IF A$="n" OR A$="N" THEN GOTO 1260
1200 GOTO 1170
1210 REM KILL
1220 PRINT"Datei wird gel”scht..."
1230 KILL D$
1240 PRINT"Datei gel”scht!"
1250 GOTO 30
1260 REM NOT KILL
1270 PRINT"Datei wird nicht gel”scht!"
1280 GOTO 30
1290 REM Datei w„hlen
1300 CLS
1305 PRINT"Der Dateiname darf nicht ber 8 Stellen VOR dem Punkt und 3 Stellen HINTER dem  Punkt lang sein !!!"
1310 INPUT"Geben Sie den Dateinamen ein:",D$
1320 IF LEN(D$)>12 THEN PRINT"Zu lang...":GOTO 1310
1330 GOTO 30
