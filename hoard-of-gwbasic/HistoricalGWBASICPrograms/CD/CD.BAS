10 MAX=75
20 PAUSE=0
30 KEY OFF
40 COLOR 12
50 DIM CD$(MAX)
60 DIM NAM$(MAX)
70 DIM INTP$(MAX)
80 DIM ART$(MAX)
90 DIM TR$(MAX)
100 DIM CART$(MAX)
110 DIM SONG$(MAX,30)
120 GOTO 180
130 LOCATE X,20:PRINT SPACE$(60)
140 LOCATE X,20:COLOR 15
150 RETURN
160 FOR Z=0 TO PAUSE:NEXT
170 RETURN
180 CLS
190 PRINT"CD-Player CSVread Utility"
200 PRINT
210 COLOR 10
220 PRINT"maximale Anzahl an CDs: ";MAX
230 PRINT
240 A=1
250 COLOR 14
260 PRINT USING"Lese aus CD.CSV... [###]";A
270 COLOR 11,1
280 IF A>1 THEN GOTO 300
290 OPEN "I",#1,"CD.CSV"
300 LOCATE 8,1:PRINT"CD-Referenz      :"
310 LOCATE 9,1:PRINT"CD-Titel         :"
320 LOCATE 10,1:PRINT"Interpret        :"
330 LOCATE 11,1:PRINT"Musikart         :"
340 LOCATE 12,1:PRINT"Custom Play      :"
350 LOCATE 13,1:PRINT"CD-Art           :"
360 LOCATE 14,1:PRINT"mom. Song        :"
370 COLOR 13,0
380 LOCATE 6,1:PRINT"CD-Nummer             ":GOSUB 160
390 IF A>MAX THEN GOTO 720
400 INPUT#1,CD$(A):IF CD$(A)="EOF" THEN GOTO 750
410 X=8:GOSUB 130:PRINT CD$(A):COLOR 13
420 LOCATE 6,1:PRINT"CD-Titel              ":GOSUB 160
430 INPUT#1,NAM$(A)
440 X=9:GOSUB 130:PRINT NAM$(A):COLOR 13
450 LOCATE 6,1:PRINT"Interpret / Hersteller":GOSUB 160
460 INPUT#1,INTP$(A)
470 X=10:GOSUB 130:PRINT INTP$(A):COLOR 13
480 LOCATE 6,1:PRINT"Musikart              ":GOSUB 160
490 INPUT#1,ART$(A)
500 X=11:GOSUB 130:PRINT ART$(A):COLOR 13
510 LOCATE 6,1:PRINT"CustomPlay-Reihenfolge":GOSUB 160
520 INPUT#1,TR$(A)
530 X=12:GOSUB 130:PRINT TR$(A):COLOR 13
540 LOCATE 6,1:PRINT"CD-Art                ":GOSUB 160
550 INPUT#1,CART$(A)
560 X=13:GOSUB 130:PRINT CART$(A):COLOR 13
570 B=1
580 LOCATE 6,1:PRINT USING"Song ##               ";B:GOSUB 160
590 INPUT#1,SONG$(A,B)
600 IF SONG$(A,B)="" THEN NOSONG=NOSONG+1
610 IF NOSONG>1 THEN NOSONG=0:GOTO 660
620 X=14:GOSUB 130:PRINT SONG$(A,B):COLOR 13
630 B=B+1
640 IF B>=31 THEN GOTO 700
650 GOTO 580
660 FOR Y=B+1 TO 30
670 INPUT#1,NUL
680 NEXT Y
690 GOTO 700
700 A=A+1
710 LOCATE 5,1:GOTO 250
720 COLOR 12
730 LOCATE 6,1:PRINT"Variabel ENDE erreicht, vergr”áern Sie den Wert!"
740 GOTO 760
750 COLOR 12:LOCATE 6,1:PRINT"EOF - End of File                     "
760 LOCATE 5,1
770 COLOR 14:PRINT USING"Lese aus CD.CSV... [###]";A-1
780 FOR Z=7 TO 14
790 LOCATE Z,1:PRINT SPACE$(80)
800 NEXT Z
810 MAXCD=A-1
820 LOCATE 8,1:COLOR 15:PRINT"Alle CDs eingelesen!!!"
830 PRINT
840 PRINT"Fertig!"
850 FOR Z=0 TO 50000!:NEXT
860 GOTO 1000
1000 CLS
1010 COLOR 12
1020 PRINT"CSV Memory Viewer"
1030 COLOR 10
1040 PRINT USING"maximale Anzahl an CDs : ###";MAX
1050 PRINT "CDs geladen            : 1-"MAXCD
1060 PRINT
1070 COLOR 11:PRINT"Geben Sie eine Nummer ein:"
1080 COLOR 15:INPUT">>>",NUMB
1090 IF NUMB>0 AND NUMB<MAXCD+1 THEN GOTO 1110
1100 COLOR 12:PRINT"FEHLER!":LOCATE 5,1:GOTO 1070
1110 PRINT"              "
1120 PRINT"Suche CD..."
1130 A=1
1140 COLOR 14
1150 LOCATE 9,1:PRINT NAM$(A)
1160 FOR Z=0 TO 2500:NEXT
1170 IF A=NUMB THEN GOTO 1200
1180 A=A+1
1190 GOTO 1150
1200 COLOR 10:PRINT"Gefunden."
1210 FOR Z=0 TO 1000:NEXT
1220 CLS
1230 NUM=NUMB
1240 COLOR 11,1
1250 PRINT USING"CD-Referenz      : \                       \ Custom Play : \                 \";CD$(NUM);TR$(NUM)
1260 PRINT USING"CD-Titel         : \                          \ Musikart : \                 \";NAM$(NUM);ART$(NUM)
1270 PRINT USING"Interpret        : \                            \ CD-Art : \                 \";INTP$(NUM);CART$(NUM)
1280 PRINT
1290 PRINT USING"Song 01: \                           \ Song 16: \                            \";SONG$(NUM,1);SONG$(NUM,16)
1300 PRINT USING"Song 02: \                           \ Song 17: \                            \";SONG$(NUM,2);SONG$(NUM,17)
1310 PRINT USING"Song 03: \                           \ Song 18: \                            \";SONG$(NUM,3);SONG$(NUM,18)
1320 PRINT USING"Song 04: \                           \ Song 19: \                            \";SONG$(NUM,4);SONG$(NUM,19)
1330 PRINT USING"Song 05: \                           \ Song 20: \                            \";SONG$(NUM,5);SONG$(NUM,20)
1340 PRINT USING"Song 06: \                           \ Song 21: \                            \";SONG$(NUM,6);SONG$(NUM,21)
1350 PRINT USING"Song 07: \                           \ Song 22: \                            \";SONG$(NUM,7);SONG$(NUM,22)
1360 PRINT USING"Song 08: \                           \ Song 23: \                            \";SONG$(NUM,8);SONG$(NUM,23)
1370 PRINT USING"Song 09: \                           \ Song 24: \                            \";SONG$(NUM,9);SONG$(NUM,24)
1380 PRINT USING"Song 10: \                           \ Song 25: \                            \";SONG$(NUM,10);SONG$(NUM,25)
1390 PRINT USING"Song 11: \                           \ Song 26: \                            \";SONG$(NUM,11);SONG$(NUM,26)
1400 PRINT USING"Song 12: \                           \ Song 27: \                            \";SONG$(NUM,12);SONG$(NUM,27)
1410 PRINT USING"Song 13: \                           \ Song 28: \                            \";SONG$(NUM,13);SONG$(NUM,28)
1420 PRINT USING"Song 14: \                           \ Song 29: \                            \";SONG$(NUM,14);SONG$(NUM,29)
1430 PRINT USING"Song 15: \                           \ Song 30: \                            \";SONG$(NUM,15);SONG$(NUM,30)
1440 COLOR 15
1450 LOCATE 25,1
1460 COLOR 12
1470 PRINT"+ - 1 CD weiter / - - 1 CD zurck";:COLOR 10:PRINT USING"                                      CD [###]";NUM;
1480 LOCATE 1,1
1490 A$=INKEY$:IF A$="" THEN 1490
1500 IF A$="+" THEN GOTO 1530
1510 IF A$="-" THEN GOTO 1570
1520 GOTO 1490
1530 IF NUM+1>MAXCD THEN GOTO 1490
1540 NUM=NUM+1
1550 GOSUB 1610
1560 LOCATE 1,1:GOTO 1240
1570 IF NUM-1<1 THEN GOTO 1490
1580 NUM=NUM-1
1590 GOSUB 1610
1600 LOCATE 1,1:GOTO 1240
1610 REM Unterroutine
1620 COLOR 14
1630 LOCATE 24,1
1640 A=1
1650 PRINT USING"\                                                   \";NAM$(A);
1660 FOR Z=0 TO 1000:NEXT
1670 IF A=NUM THEN 1700
1680 A=A+1
1690 LOCATE 24,1:GOTO 1650
1700 COLOR 12:LOCATE 24,70:PRINT"Gefunden.";
1710 LOCATE 24,1:PRINT SPACE$(78);
1720 RETURN
