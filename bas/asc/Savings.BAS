5 CLS:KEY OFF:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 10-57
10 '***************** SAVINGS/CHECKING BALANCE PROGRAM  ***********************
16 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
18 '�                 SAVINGS OR PERSONAL CHECK RECONCILER                    �
20 '�                                                                         �
22 '�    This is a simple progam to provide a screem display and printout of  �
24 '� a savings or personal checking account. Sometimes the hand-held calcu-  �
26 '� lator just does not do the job.  Check numbers, account numbers, or a   �
28 '� payee/payor is not entered. Simply enter "W or D" for withdrawal and/or �
30 '� deposit.  Enter " END " for a final balance. If you wish a more compre- �
32 '� hensive printout showing payee/payor, check number and account number,  �
34 '� see BUSCHECK.BAS on this disk.  This program will "timeout" if printer  �
35 '� is not on-line.  To eliminate printer output, delete LPRINT lines.      �
36 '�    This program may be used in whole or in part without attribution or  �
37 '� license.      (c) G I N A C O  -- 1983                Ver 5.2/320       �
50 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLS:KEY OFF:FOR I=1 TO 10:KEY I,"":NEXT
100 SCREEN 0,0,0: WIDTH 80: CLEAR
110 KEY OFF
120 S1$ = CHR$(34)
130 LPRINT CHR$(27); CHR$(69)
140 CLS
160 LOCATE 5,15
170 PRINT "Q U I C K  SAVINGS ACCOUNT  R E C O N C I L E R"
180 LOCATE 6,15
190 PRINT STRING$(47,42)
200 A$ = ""
210 B$ = ""
220 C$ = ""
230 B! = 0
240 A! = 0
250 LOCATE 8,15
260 PRINT "A SAVINGS ACCOUNT RECONCILING ROUTINE."
270 LOCATE 10,15
280 PRINT "ENTER WITHDRAWAL OR DEPOSIT AS A POSITIVE NUMBER."
290 PRINT TAB( 15)"DO NOT USE <+> OR <-> SIGNS."
300 PRINT
310 PRINT TAB( 15)"IF YOU WANT A FINAL TOTAL, <ENTER> ";S1$;"END";S1$;" AT W/D QUERY."
320 PRINT
330 PRINT TAB( 15)"THE MAXIMUM NUMBER LENGTH IS $99,999.00."
340 GOSUB 780
350 U$ = "$###,###.##"
360 CLS
370 LOCATE 5,15
380 COLOR 7!
390 INPUT "ENTER BALANCE: ";A!
400 LOCATE 5,40
410 PRINT USING U$;A!
420 LPRINT TAB( 10)"SIMPLE CHECK-ADDING PROGRAM FOR CHECKBOOKS"
430 LPRINT " "
440 LPRINT
450 LPRINT TAB( 40);"STARTING BALANCE: ";USING U$;A!
460 LPRINT
470 LPRINT
480 PRINT
490 PRINT TAB( 15)"W  OR  D:  ";
495 AN$=INKEY$:IF AN$="" THEN 495
496 WD = 0:IF (AN$="W" OR AN$="w") THEN WD=1:GOTO 520
497 IF (AN$="D" OR AN$="d") THEN WD=2:GOTO 520
500 IF ( LEFT$(AN$,1) = "E" OR LEFT$(AN$,1) = "e") THEN 690
510 SOUND 400,4:GOTO 495
520 PRINT
530 PRINT TAB( 15)"$$$.$$ AMOUNT:  ";
540 LINE INPUT B$
550 B! = VAL(B$)
560 IF B$ = "" THEN B! = 0
570 IF WD=2 THEN B! = B! - 2 * B!
580 A! = A! - B!
590 PRINT
600 PRINT TAB( 60)"BAL: ";
610 PRINT USING U$;A!
620 PRINT
630 LPRINT TAB( 5)"W  OR  D ";AN$;
640 LPRINT TAB( 55) USING U$;B!;
650 LPRINT TAB( 70) USING U$;A!
660 LPRINT " "
670 PRINT
680 GOTO 480
690 LPRINT
700 LPRINT TAB( 50)"FINAL BAL: ";
710 LPRINT USING U$;A!
720 CLS
730 LOCATE 15,25
740 PRINT "FINAL BAL: ";
750 PRINT USING U$;A!
760 GOSUB 780
770 GOTO 140
780 LOCATE 22,15
790 PRINT "PRESS ";
800 COLOR 0,7
810 PRINT "  ENTER  ";
820 COLOR 7,0
830 PRINT " TO CONTINUE PROGRAM...";
840 PRINT " ";
850 INPUT X!
860 RETURN
64900 END
65000 '************************* SAVE ROUTINE ********************************
65100 SAVE"B:SAVINGS.BAS"
