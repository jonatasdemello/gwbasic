5 CLS:KEY OFF:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 12-57
12 '***************** THIS IS A SIX NESTING BOX DISPLAY ***********************
16 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
18 '�                  FOUR-CORNER COORDINATE BOX ROUTINE                     �
20 '�                                                                         �
22 '�    This is another program showing the techniques for programming a     �
24 '� series of screen boxes.  You may use any of the subroutines alone to    �
25 '� place a box anywhere on the screen. Note that INITIALIZATION statement  �
26 '� establishes the four corner coordinates for the box.  You can easily    �
28 '� put a box where you wish by the simple and FAST insertion of only four  �
30 '� numbers.  The technique for programming the SOFT keys for a particular  �
32 '� qualified response is also demonstrated.  This uses the INKEY$ function �
34 '� to to examine the character returned.  All other returns (except that   �
36 '� from the key which would normally return the CHR$ character specified)  �
38 '� will be rejected by a tone and a return to the orininal prompt.         �
40 '�         ** (c) G I N A C O   1983 **          Ver 5.2/160/320           �
50 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLS:SCREEN 0,0,0:WIDTH 80:CLEAR
100 REM =====  BOX PRINTOUT =====
110 CLS
120 FOR I! = 1 TO 10
130   KEY I!,""
140 NEXT
150 GOSUB 300
160 REM =====  TERMINATION AND KEY CALL =====
170 KEY 6, CHR$(64)
180 KEY 2, CHR$(60)
190 LOCATE 12,25
200 PRINT "<F2> - AGAIN         <F6> - QUIT"
210 LOCATE 13,32
220 PRINT "SIX BOXES IN COLOR"
230 LOCATE 25,40,0
240 IN$ = INKEY$
250 IF IN$ = "" THEN 240
260 IF IN$ = CHR$(60) THEN 110
270 IF IN$ = CHR$(64) THEN CLS  : END
280 SOUND 400,4
290 GOTO 240
300 REM ======  INITIALIZATION: CORNER COORDINATES =====
310 TLC$ = CHR$(201)
320 TRC$ = CHR$(187)
330 HL$ = CHR$(205)
340 BLC$ = CHR$(200)
350 BRC$ = CHR$(188)
360 VL$ = CHR$(186)
370 FOR I! = 1 TO 10
380   KEY I!,""
390 NEXT
400 REM ====== PRINT BOX 1 =====
410 WW! = 76
420 TL! = 1
430 LL! = 24
440 LC! = 2
450 COLOR 2,0
460 LOCATE TL!,LC!,0
470 PRINT TLC$; STRING$(WW!,HL$);TRC$;
480 FOR I! = (TL! + 1) TO (LL! - 1)
490   LOCATE I!,LC!,0
500   PRINT VL$;
510   LOCATE I!, (LC! + WW! + 1),0
520   PRINT VL$;
530 NEXT
540 LOCATE LL!,LC!,0
550 PRINT BLC$; STRING$(WW!,HL$);BRC$;
560 REM ====== PRINT BOX 2 =====
570 WW! = 68
580 TL! = 3
590 LL! = 22
600 LC! = 6
610 COLOR 3,0
620 LOCATE TL!,LC!,0
630 PRINT TLC$; STRING$(WW!,HL$);TRC$;
640 FOR I! = (TL! + 1) TO (LL! - 1)
650   LOCATE I!,LC!,0
660   PRINT VL$;
670   LOCATE I!, (LC! + WW! + 1),0
680   PRINT VL$;
690 NEXT
700 LOCATE LL!,LC!,0
710 PRINT BLC$; STRING$(WW!,HL$);BRC$;
720 REM ====== PRINT BOX 3 =====
730 WW! = 60
740 TL! = 5
750 LL! = 20
760 LC! = 10
770 COLOR 4,0
780 LOCATE TL!,LC!,0
790 PRINT TLC$; STRING$(WW!,HL$);TRC$;
800 FOR I! = (TL! + 1) TO (LL! - 1)
810   LOCATE I!,LC!,0
820   PRINT VL$;
830   LOCATE I!, (LC! + WW! + 1),0
840   PRINT VL$;
850 NEXT
860 LOCATE LL!,LC!,0
870 PRINT BLC$; STRING$(WW!,HL$);BRC$;
880 REM ====== PRINT BOX 4 =====
890 WW! = 52
900 TL! = 7
910 LL! = 18
920 LC! = 14
930 COLOR 5,0
940 LOCATE TL!,LC!,0
950 PRINT TLC$; STRING$(WW!,HL$);TRC$;
960 FOR I! = (TL! + 1) TO (LL! - 1)
970   LOCATE I!,LC!,0
980   PRINT VL$;
990   LOCATE I!, (LC! + WW! + 1),0
1000   PRINT VL$;
1010 NEXT
1020 LOCATE LL!,LC!,0
1030 PRINT BLC$; STRING$(WW!,HL$);BRC$;
1040 REM ====== PRINT BOX 5 =====
1050 WW! = 44
1060 TL! = 9
1070 LL! = 16
1080 LC! = 18
1090 COLOR 6,0
1100 LOCATE TL!,LC!,0
1110 PRINT TLC$; STRING$(WW!,HL$);TRC$;
1120 FOR I! = (TL! + 1) TO (LL! - 1)
1130   LOCATE I!,LC!,0
1140   PRINT VL$;
1150   LOCATE I!, (LC! + WW! + 1),0
1160   PRINT VL$;
1170 NEXT
1180 LOCATE LL!,LC!,0
1190 PRINT BLC$; STRING$(WW!,HL$);BRC$;
1200 REM ====== PRINT BOX 6 =====
1210 WW! = 36
1220 TL! = 11
1230 LL! = 14
1240 LC! = 22
1250 COLOR 7,0
1260 LOCATE TL!,LC!,0
1270 PRINT TLC$; STRING$(WW!,HL$);TRC$;
1280 FOR I! = (TL! + 1) TO (LL! - 1)
1290   LOCATE I!,LC!,0
1300   PRINT VL$;
1310   LOCATE I!, (LC! + WW! + 1),0
1320   PRINT VL$;
1330 NEXT
1340 LOCATE LL!,LC!,0
1350 PRINT BLC$; STRING$(WW!,HL$);BRC$;
1360 COLOR 7,0
1370 RETURN
65000 REM ===== SAVE ROUTINE =====
65100 SAVE"B:SIXBOXES.BAS"
