10 KEY OFF
20 COLOR 15,0,0
30 IF TIM$="" THEN TIM$=TIME$
40 REM *** Anzeigeroutine ***
50 CLS
60 LOCATE 2,23:PRINT"��"
70 LOCATE 4,23:PRINT"��"
80 LOCATE 2,56:PRINT"��"
90 LOCATE 4,56:PRINT"��"
100 Z=VAL(LEFT$(TIME$,1))
110 X=1
120 GOSUB 290
130 Z=VAL(MID$(TIME$,2,1))
140 X=9
150 GOSUB 290
160 Z=VAL(MID$(TIME$,4,1))
170 X=33
180 GOSUB 290
190 Z=VAL(MID$(TIME$,5,1))
200 X=41
210 GOSUB 290
220 Z=VAL(MID$(TIME$,7,1))
230 X=66
240 GOSUB 290
250 Z=VAL(RIGHT$(TIME$,1))
260 X=74
270 GOSUB 290
280 GOTO 100
290 REM *** Anzeigeroutine ***
300 INK$=INKEY$:IF INK$=CHR$(27) THEN SYSTEM
310 IF Z=0 THEN GOSUB 420
320 IF Z=1 THEN GOSUB 490
330 IF Z=2 THEN GOSUB 560
340 IF Z=3 THEN GOSUB 630
350 IF Z=4 THEN GOSUB 700
360 IF Z=5 THEN GOSUB 770
370 IF Z=6 THEN GOSUB 840
380 IF Z=7 THEN GOSUB 910
390 IF Z=8 THEN GOSUB 980
400 IF Z=9 THEN GOSUB 1050
410 RETURN
420 REM NULL - 0
430 LOCATE 1,X:PRINT"������"
440 LOCATE 2,X:PRINT"��  ��"
450 LOCATE 3,X:PRINT"��  ��"
460 LOCATE 4,X:PRINT"��  ��"
470 LOCATE 5,X:PRINT"������"
480 RETURN
490 REM EINS - 1
500 LOCATE 1,X:PRINT"    ��"
510 LOCATE 2,X:PRINT"    ��"
520 LOCATE 3,X:PRINT"    ��"
530 LOCATE 4,X:PRINT"    ��"
540 LOCATE 5,X:PRINT"    ��"
550 RETURN
560 REM ZWEI - 2
570 LOCATE 1,X:PRINT"������"
580 LOCATE 2,X:PRINT"    ��"
590 LOCATE 3,X:PRINT"������"
600 LOCATE 4,X:PRINT"��    "
610 LOCATE 5,X:PRINT"������"
620 RETURN
630 REM DREI - 3
640 LOCATE 1,X:PRINT"������"
650 LOCATE 2,X:PRINT"    ��"
660 LOCATE 3,X:PRINT"  ����"
670 LOCATE 4,X:PRINT"    ��"
680 LOCATE 5,X:PRINT"������"
690 RETURN
700 REM VIER - 4
710 LOCATE 1,X:PRINT"��  ��"
720 LOCATE 2,X:PRINT"��  ��"
730 LOCATE 3,X:PRINT"������"
740 LOCATE 4,X:PRINT"    ��"
750 LOCATE 5,X:PRINT"    ��"
760 RETURN
770 REM F�NF - 5
780 LOCATE 1,X:PRINT"������"
790 LOCATE 2,X:PRINT"��    "
800 LOCATE 3,X:PRINT"������"
810 LOCATE 4,X:PRINT"    ��"
820 LOCATE 5,X:PRINT"������"
830 RETURN
840 REM SECHS - 6
850 LOCATE 1,X:PRINT"��    "
860 LOCATE 2,X:PRINT"��    "
870 LOCATE 3,X:PRINT"������"
880 LOCATE 4,X:PRINT"��  ��"
890 LOCATE 5,X:PRINT"������"
900 RETURN
910 REM SIEBEN - 7
920 LOCATE 1,X:PRINT"������"
930 LOCATE 2,X:PRINT"��  ��"
940 LOCATE 3,X:PRINT"    ��"
950 LOCATE 4,X:PRINT"    ��"
960 LOCATE 5,X:PRINT"    ��"
970 RETURN
980 REM ACHT - 8
990 LOCATE 1,X:PRINT"������"
1000 LOCATE 2,X:PRINT"��  ��"
1010 LOCATE 3,X:PRINT"������"
1020 LOCATE 4,X:PRINT"��  ��"
1030 LOCATE 5,X:PRINT"������"
1040 RETURN
1050 REM NEUN - 9
1060 LOCATE 1,X:PRINT"������"
1070 LOCATE 2,X:PRINT"��  ��"
1080 LOCATE 3,X:PRINT"������"
1090 LOCATE 4,X:PRINT"    ��"
1100 LOCATE 5,X:PRINT"    ��"
1110 RETURN
