5 CLS:KEY OFF:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 10-57
10 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
12 '�                 BUSINESS ACCOUNT BALACING PROGRAM                       �
14 '�                                                                         �
16 '�    This program will provide a screen and printer output to reconcile   �
18 '� a business checking or other money account. It will record and print    �
20 '� out payee/payor, check or deposit number, and account number. If you    �
22 '� wish to ignore these input parameters, simply press <ENTER>. Added in-  �
24 '� structions will appear on the initial screen display when the program   �
26 '� is run.  For a less complex reconcilation program not needing payee/    �
28 '� payor, check number, et cetera, see SAVINGS.BAS on this disk.           �
30 '�    This program may be used, in whole or in part, without license or    �
32 '� attribution.   (u)  G I N A C O  -  1983              Ver 5.2/320K      �
34 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLEAR:FOR I=1 TO 10:KEY I,"":NEXT
100 CLS
110 SCREEN 0,0,0
120 WIDTH 80
130 CLEAR
140 DEFSTR S
150 KEY OFF
160 S1$ = CHR$(34)
170 LPRINT CHR$(27) CHR$(64)
180 LPRINT CHR$(27); CHR$(69)
190 CLS
200 LOCATE 5,15
210 PRINT "Q U I C K  BUSINESS CHECKBOOK  R E C O N C I L E R"
220 LOCATE 6,15
230 PRINT STRING$(50,42)
240 A$ = ""
250 B$ = ""
260 C$ = ""
270 B! = 0
280 A! = 0
290 LOCATE 8,15
300 PRINT TAB( 15)"DO NOT USE ANY <+> OR <-> SIGNS."
310 PRINT
320 PRINT TAB( 15)"ENTER ";S1$;"DEP";S1$;" FOR CHECK NUMBER TO RECORD DEPOSIT."
330 PRINT
340 PRINT TAB( 15)"IF YOU WANT A FINAL BALANCE PRINTOUT, <ENTER> "S1$"TOTAL"S1$
350 PRINT TAB( 15)"AT PAYEE OR PAYOR QUERY."
360 PRINT
370 PRINT TAB( 15)"THE MAXIMUM NUMBER LENGTH IS $99,999.00."
380 PRINT
390 PRINT TAB( 15)"USE <ENTER> TO OMIT AN ENTRY. IF YOU DO THIS, THE"
400 PRINT TAB( 15)"FOLLOWING DOLLAR ENTRY WILL BE CONSIDERED A WITHDRAWAL."
410 GOSUB 910
420 U$ = "$###,###.##"
430 CLS
440 LOCATE 5,15
450 COLOR 7,0
460 INPUT "ENTER STARTING BALANCE";A!
470 COLOR 7,0
480 LOCATE 5,40
490 PRINT USING U$;A!
500 LPRINT TAB( 10)"BUSINESS CHECKBOOK BALANCING PROGRAM PRINTOUT"
510 LPRINT " "
520 LPRINT
530 LPRINT TAB( 40)"STARTING BALANCE: "; USING U$;A!
540 LPRINT
550 LPRINT
560 PRINT
570 PRINT TAB( 15)"PAYEE OR PAYOR:  ";
580 LINE INPUT C$
590 IF LEFT$(C$,3) = "TOT" THEN 830
600 PRINT TAB( 15)"CHECK NUMBER: <OR ENTER "S1$"DEP"S1$" >  ";
610 LINE INPUT D$
620 PRINT TAB( 15)"G.L. ACCOUNT #:  ";
630 LINE INPUT AN$
640 PRINT
650 PRINT TAB( 15)"CHECK OR DEPOSIT AMOUNT:  ";
660 LINE INPUT B$
670 B! = VAL(B$)
680 IF B$ = "" THEN B! = 0
690 IF LEFT$(D$,3) = "DEP" THEN B! = B! - 2 * B!
700 A! = A! - B!
710 PRINT
720 PRINT TAB( 60)"BAL: ";
730 PRINT USING U$;A!
740 PRINT
750 LPRINT TAB( 5)"PAYEE OR PAYOR: ";C$
760 LPRINT TAB( 5)"CHECK NUMBER  : ";D$
770 LPRINT TAB( 5)"G.L. ACCOUNT #: ";AN$;
780 LPRINT TAB( 55) USING U$;B!;
790 LPRINT TAB( 70) USING U$;A!
800 LPRINT " "
810 PRINT
820 GOTO 560
830 LPRINT
840 LPRINT TAB( 50)"FINAL BAL: ";
850 LPRINT USING U$;A!
860 PRINT
870 PRINT
880 PRINT TAB( 15)"DO YOU WISH TO RECONCILE ANOTHER ACCOUNT? <Y/N> ";
890 INPUT Z$
900 IF LEFT$(Z$,1) = "Y" THEN 140  ELSE END
910 KEY OFF
920 LOCATE 25,15
930 PRINT "PRESS ";
940 COLOR 0,7
950 PRINT "  ENTER  ";
960 COLOR 7,0
970 PRINT " TO CONTINUE PROGRAM...";
980 COLOR 7,0
990 INPUT X!
1000 RETURN
1010 END
65000 '************************* SAVE ROUTINE *****************************
65100 SAVE "B:BUSCHECK.BAS"
