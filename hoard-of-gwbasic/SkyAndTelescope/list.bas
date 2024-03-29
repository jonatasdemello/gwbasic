10 REM   INDEX-PRINTING PROGRAM
20 OPEN "R",1,"NGC2000.DAT",24
22 OPEN "R",2,"INDEX.DAT",2
24 FIELD 1,5 AS N$,1 AS T$,2 AS H$,3 AS M$,3 AS D$,2 AS M1$,4 AS S$
26 FIELD 2,2 AS I$
30 WIDTH "LPT1:",132
40 LPRINT CHR$(15);SPC(25);"OBJECT";SPC(4);"R.A.";SPC(12);"DEC";SPC(14);"ATLAS 2000";SPC(5);"URANOMETRIA"
50 LPRINT
60 FOR I=1 TO 50
70 GET #2,I: J=CVI(I$): GET#1,J
80 K$=LEFT$(M$,2)+"."+RIGHT$(M$,1)
90 H=VAL(H$):M=VAL(K$):D=VAL(D$)
100 H=H+M/60:M1=VAL(M1$):D=D+M1/60
110 IF D$="-" THEN D=-D
200 IF ABS(D)>18.5 THEN 280
250 S=9+INT(H/3+1/1.2)
260 IF S=9 THEN S=17
270 GOTO 340
280 IF ABS(D)>=52 THEN 320
290 S=4+INT(H/4)
300 IF D<0 THEN S=S+14
310 GOTO 340
320 S=1+INT(H/8)
330 IF D<0 THEN S=S+23
340 IF ABS(D)>=5.5 THEN 390
350 U=215+INT(H*1.875+.5)
360 IF U=260 THEN U=215
370 V$="Vol I,II"
380 GOTO 780
390 IF D>0 THEN V$="Vol I"
400 IF D<0 THEN V$="Vol II"
410 IF ABS(D)>=50 THEN 610
420 IF ABS(D)>=28 THEN 520
430 IF ABS(D)>=17 THEN 480
440 U=170+INT(H*1.875+.5)
450 IF U=215 THEN U=170
460 IF D<0 THEN U=U+90
470 GOTO 780
480 U=125+INT(H*1.875+.5)
490 IF U=170 THEN U=125
500 IF D<0 THEN U=U+180
510 GOTO 780
520 IF ABS(D)>=39 THEN 570
530 U=89+INT(H*1.5+.5)
540 IF U=125 THEN U=89
550 IF D<0 THEN U=U+261
560 GOTO 780
570 U=59+INT(H/.8+.5)
580 IF U=89 THEN U=59
590 IF D<0 THEN U=U+327
600 GOTO 780
610 IF ABS(D)>=72.5 THEN 710
620 IF ABS(D)>= 61 THEN 670
630 U=35+INT(H+.5)
640 IF U=59 THEN U=35
650 IF D<0 THEN U=U+381
660 GOTO 780
670 U=15+INT(H/1.2+.5)
680 IF U=35 THEN U=15
690 IF D<0 THEN U=U+425
700 GOTO 780
710 IF ABS(D)>= 84.5 THEN 760
720 U=3+INT(H/2+1/2.4)
730 IF U=15 THEN U=3
740 IF D<0 THEN U=U+457
750 GOTO 780
760 U=1+INT(H/12)
770 IF D<0 THEN U=474-U
780 LPRINT SPC(25);N$;SPC(4);H$;"hrs ";K$;"min. ";SPC(2);D$;"deg ";M1$;"min. ";SPC(3);"CHART";S;TAB(84);"CHART";U;V$
790 K=K+1: IF K<25 THEN 850
810 LPRINT
820 LPRINT CHR$(15);SPC(25);"OBJECT";SPC(4);"R.A.";SPC(12);"DEC";SPC(14);"ATLAS 2000";SPC(5);"URANOMETRIA"
830 K=0: LPRINT
850 NEXT I
860 WIDTH "LPT1:",80
870 LPRINT CHR$(18): END
900 '
910 '   Written by Tim Hunter, MD, this program for IBM PC and compatible
920 '   machines prints an index that tells which charts in Sky Atlas 2000.0
930 '   and Uranometria 2000.0 show various NGC and IC objects.  To work, it
940 '   assumes you have the machine-readable version of NGC 2000.0 (available
950 '   separately from Sky Publishing Corp.) in the same directory.  For 
960 '   more about the program, see Sky & Telescope, August 1991, p. 182.
