0' REVISING AUTHOR:   	STEPHEN LEOCE
1 '				201 DELAWARE AVENUE
2 '				KINGSTON, NEW YORK  12401
3 '				[914] 338-4593
4 '
5 ' LAST REVISION:		22-DECEMBER-1983
6 '
10  COLOR 10,7:PRINT "*EOF [EOB]; now decide":COLOR 7,0
50 KEY OFF
100 GOSUB 6340
110 REM 
120 CLEAR
130 ON ERROR GOTO 6100
140 DT$ = "07/01/82"
150 VE$ = "  -  V1.10"
160  DIM R$(65),AC(21),K(65),H$(21),RN$(21),KC(65)
170  DIM Z$(21)
180 COMMA$ = "NO"
190 BASENAME$="BSN"
200 HEADER$="HDR"
210 INDEX$="IDX"
220 RPTFMT$="RFT"
230 REM
250 CLS
260 H$(0) = "REC #"
270 B=65
280 DB$ = "BASENAME":F$ = BASENAME$:EX = 1110
290  GOSUB 4770
300  GOTO 2050
310 F$ = HEADER$:EX = 1140
320  GOSUB 4770
330  FOR I = 1 TO NR:H$(I) = R$(I): NEXT I
340 NH = NR:NR = 0:MEM =  FRE (0)
350 IF NH <= 0 THEN 5580
360 B =  INT (MEM / (13 * NH))
370 DIM N$(B,NH),R(B)
380 F$ = INDEX$:EX = 1200
390  GOSUB 4770
400  GOTO 5580
410  REM ***SORT***
420  FOR I = 1 TO NR:R(I) = 0: NEXT I
430  FOR I = 1 TO NR: FOR J = 1 TO NR
440  ON L GOTO 450,470
450  IF N$(I,S) =  > N$(J,S) THEN R(I) = R(I) + 1
460  GOTO 480
470  IF  VAL (N$(I,S)) =  >  VAL (N$(J,S)) THEN R(I) = R(I) + 1
480 L$ = INKEY$:IF LEN(L$) = 0 THEN 500
490 IF ASC(L$) = 27 THEN 110
500  NEXT J: NEXT I
510  COLOR 10,7:PRINT "SORT PHASE 2 : ";:COLOR 7,0
520  FOR I = NR TO 1 STEP  - 1: FOR J = NR TO 1 STEP  - 1
530  IF I <  > J THEN  IF R(I) = R(J) THEN R(J) = R(J) - 1
540 L$ = INKEY$:IF LEN(L$) = 0 THEN 560
550 IF ASC(L$) = 27 THEN 110
560  NEXT J: NEXT I
570  COLOR 10,7:PRINT "SORT FINAL PHASE : ";:COLOR 7,0
580 J = 1
590  IF R(J) = J THEN J = J + 1: GOTO 590
600  IF J >  = NR THEN 670
610  FOR I = 1 TO NH:Z$(I) = N$(R(J),I):N$(R(J),I) = N$(J,I)
620 L$ = INKEY$: IF LEN(L$) = 0 THEN 640
630 IF ASC(L$) = 27 THEN 110
640  N$(J,I) = Z$(I): NEXT I
650 Z = R(R(J)):R(R(J)) = R(J):R(J) = Z
660  GOTO 590
670  PRINT: PRINT "?:_Write '";DB$;"' file sorted by '";H$(S);"' to storage device"
680 INPUT "Reply (Y or N)";L$
690 IF L$ <> "Y" AND L$ <> "y" AND L$ <>"N" AND L$ <> "n" THEN BEEP: GOTO 670
700  IF L$ = "Y" OR L$ = "y" THEN F$ = INDEX$: GOSUB 5010
710  GOTO 5580
720 CLS:MF = 1: GOSUB 4400
730  INPUT "Enter   sort key 'Field #' or (Q, M, or F) ";S$:S =  VAL(S$):EX$ = S$:GOSUB 6290
740  IF S < 1 OR S > NH THEN BEEP: GOTO 730
750  PRINT : COLOR 8,7:PRINT "?:_Sort options:";:COLOR 7,0: PRINT :PRINT
760  PRINT "(";:COLOR 8,7:PRINT "A";:COLOR 7,0:PRINT ")lphabetically"
770  PRINT "(";:COLOR 8,7:PRINT "N";:COLOR 7,0:PRINT ")umerically"
780  PRINT
790  INPUT "Reply (A or N) or (Q, M, or F) ";L$:L=0:EX$=L$:GOSUB 6290
800 IF L$ = "A" OR L$ = "a" THEN L = 1
810 IF L$ = "N" OR L$ = "n" THEN L = 2
820 IF L < 1 OR L > 2 THEN BEEP: GOTO 790
830  PRINT :COLOR 8,7:PRINT "Strike 'ESC' to *CANCEL* Sort";:COLOR 7,0:PRINT: COLOR 10,7:PRINT "SORT PHASE 1 : ";:COLOR 7,0: GOTO 420
840  REM ***CREATE HEADERFILE***
850 NR = 1
860  CLS: PRINT "Strike 'RETURN' for Main Menu"
870  PRINT
880 PRINT "Enter LABEL for 'FIELD #' ";NR;:LINE INPUT": ";R$(NR)
890  IF R$(NR) = "" OR NR > 20 THEN 920
900 NR = NR + 1
910  GOTO 880
920 NR = NR - 1
930 EX = 1605
940  GOSUB 5010: GOTO 330
950  REM ***ENTER RECORDS***
960  CLS
970  PRINT "Currently ";NR;" record(s) in '";DB$;"' file - space for ";:COLOR 8,7:PRINT B-NR;:COLOR 7,0:PRINT " more"
980 IF B - NR < 1 THEN 1100
990 NR = NR + 1
1000  PRINT "Currently entering record  ";NR
1010  PRINT
1020  FOR I = 1 TO NH
1030  PRINT H$(I);":";: GOSUB 5550:N$(NR,I) = I$
1040  NEXT I
1050  PRINT
1060  PRINT "?:_Additional record(s) for current file:"
1070 INPUT "Reply (Y or N) or (Q or F)";L$:EX$ = L$: GOSUB 6310
1080  IF L$ ="Y" OR L$ = "y" THEN CLS:GOTO 970
1090  IF L$ <> "N" AND L$ <> "n" THEN BEEP: GOTO 1060
1100 F$ = INDEX$
1110  GOSUB 5010
1120  GOTO 5580
1130  REM ***SEARCH/CHANGE***
1140 L = 0
1150  CLS
1160  PRINT "Select: ";:COLOR 8,7:PRINT "SEARCH";:COLOR 7,0:PRINT " on any of following fields"
1170  PRINT
1180  GOSUB 4400
1190 PRINT "or options"
1200 PRINT "(";:COLOR 10,7:PRINT "C";:COLOR 7,0:PRINT ")hange data in a field"
1210  PRINT
1220  INPUT "Enter ('FIELD #' or C) or (Q, M, or F)";S$:S =  VAL(S$):EX$ = S$:GOSUB 6290
1230 IF S$ ="C" OR S$ = "c" THEN 1530
1240 IF S = 0 THEN IF S$ <> "0" THEN S = -1
1250  IF S < 0 OR S > NH  THEN BEEP: GOTO 1220
1260 REM
1270  PRINT "Enter data for search key on field '";:COLOR 8,7:PRINT H$(S);:COLOR 7,0:PRINT "' = ";:LINE INPUT " ";Q$
1280 IF LEN(Q$) = 0 THEN BEEP:GOTO 1270
1290 Z$ = " "+Q$
1300  CLS
1310  FOR J = 1 TO NR
1320 N$(J,0) =  STR$(J)
1330 IF S = 0 THEN IF N$(J,0) = Z$ THEN GOSUB 1690
1340 IF S = 0 THEN 1380
1350 FOR I = 1 TO LEN(N$(J,S))
1360 IF MID$(N$(J,S),I,LEN(Q$)) = Q$ THEN GOSUB 1690: GOTO 1380
1370 NEXT I
1380  IF L + NH > 21 THEN  GOSUB 1480
1390  NEXT J
1400 L=0
1410  COLOR 10,7:PRINT "*EOF [EOB]; now decide":COLOR 7,0
1420 PRINT "(";:COLOR 10,7:PRINT "S";:COLOR 7,0:PRINT ")earch additional record(s)"
1430 PRINT "(";:COLOR 10,7:PRINT "C";:COLOR 7,0:PRINT ")hange data in fields"
1440  INPUT "Enter (S or C) or (Q, M, or F)";S$:S =  0:EX$ = S$: GOSUB 6290
1450 IF S$ = "S" OR S$ = "s" THEN 1150
1460 IF S$ = "C" OR S$ = "c" THEN 1530
1470 BEEP: GOTO 1440
1480  IF PF <  > 0 THEN 1520
1490 PRINT "Strike ";:COLOR 8,7:PRINT "RETURN";:COLOR 7,0:PRINT " to continue, or Enter ";:COLOR 8,7:PRINT "(Q, M, or F)";:COLOR 7,0
1500 INPUT L$:EX$ = L$: GOSUB 6290
1510  IF LEN(L$) <  > 0 THEN BEEP: GOTO 1500
1520 L = 0: CLS : RETURN
1530  REM ***CHANGE DATA***
1540 INPUT "Enter record number ('REC #') to modify or (Q, M, or F) ";J$:J = VAL(J$):EX$ = J$:GOSUB 6290
1550 IF J < 1 OR J > NR THEN BEEP:COLOR 26,0:PRINT "Invalid Record ID":COLOR 7,0:GOTO 1540
1560  CLS : GOSUB 1690
1570 INPUT "Select field number ('FIELD #') to modify or (Q, M, or F) ";S$:S = VAL(S$):EX$ = S$: GOSUB 6290
1580 IF S< 1 OR S > NH THEN BEEP: GOTO 1570
1590  PRINT
1600  PRINT "?:_From: ";H$(S);": ";N$(J,S)
1610  PRINT
1620 PRINT "?:_To: ";H$(S);": ";:LINE INPUT " ";N$(J,S)
1630  CLS: GOSUB 1690
1640  PRINT
1650 INPUT "?:_More changes       Enter (Y or N) or (Q, M, or F) ";L$:EX$ = L$: GOSUB 6290
1660 IF L$ = "Y" OR L$ = "y" THEN 1530
1670 IF L$ <> "N" AND L$ <> "n" THEN BEEP: GOTO 1650
1680 F$ = INDEX$: GOSUB 5010 : GOTO 5580
1690 REM ***PRINT A RECORD***
1700 PRINT "  ";H$(0);": ";J
1702 PRINT "RECORD DISPLAY":COLOR 15:PRINT"*IN PROGRESS":COLOR 7
1710 IF PF <> 0 THEN LPRINT "  ";H$(0);": ";J
1720 FOR I = 1 TO NH
1730 IF I = 1 THEN PRINT "FIELD #"
1740 IF PF <> 0 THEN IF I = 1 THEN LPRINT "FIELD #"
1750 PRINT I;"     ";H$(I);": ";N$(J,I)
1760 IF PF <> 0 THEN LPRINT I;"     ";H$(I);": ";N$(J,I)
1770 NEXT I
1780 PRINT
1790 IF PF <> 0 THEN LPRINT
1800 L =L + NH + 2
1810 REM
1820 RETURN
1830 REM ***DELETE RECORDS***
1840 CLS
1850 INPUT " Record Number ('REC #') to DELETE or (Q or F) ";DR$:EX$ = DR$: GOSUB 6310
1860 DR = VAL(DR$)
1870  IF DR < 1 OR DR > NR THEN BEEP:COLOR 26,0:PRINT "Invalid Record Number":COLOR 7,0:GOTO 1850
1880 CLS: FOR I = 1 TO NH
1890  PRINT H$(I);":"; N$(DR,I): NEXT I
1900  PRINT "***?:_CORRECT RECORD TO DELETE:":INPUT "Reply (Y or N)  ";G$
1910  IF G$ = "Y" OR G$ = "y" THEN  1940
1920 IF G$ <> "N" AND G$ <> "n" THEN BEEP: GOTO 1900
1930  GOTO 1830
1940  FOR J = DR TO NR - 1
1950  FOR I = 1 TO NH
1960 N$(J,I) = N$(J + 1,I)
1970  NEXT I
1980  NEXT J
1990  PRINT :NR = NR -1 : PRINT "Record Number ";:COLOR 26,0:PRINT DR;:COLOR 7,0:PRINT " Ready for DELETION "
1991 PRINT "Requested Record(s) **DESTROYED**":PRINT
2000  PRINT "?:_DELETE additional record(s):":INPUT "Reply (Y or N) or (Q or F) ";L$:EX$ = L$: GOSUB 6310
2010  IF L$ = "Y" OR L$ = "y" THEN 1850
2020 IF L$ <> "N" AND L$ <> "n" THEN BEEP: GOTO 2000
2040 F$ = INDEX$: GOSUB 5010: GOTO 5580
2050  REM ***BASENAMEFILE ROUTINES***
2060  CLS
2070 LOCATE 1,25:COLOR 8,7: PRINT "  ******  I B M P C  ******":LOCATE 2,25
2071 PRINT "  ELECTRONIC FILING SYSTEM ":LOCATE 3,25
2072 PRINT DT$;"  VERSION";VE$:COLOR 7,0:LOCATE 4,33
2073 PRINT "FILE MENU ":PRINT:PRINT "Select File by Number:":PRINT
2080 Q=0
2090  FOR J = 1 TO NR:IF J < 10 THEN PRINT " ";J;" - [";R$(J);"]"; ELSE  PRINT J;" - [";R$(J);"]";
2100 Q=Q+1:IF Q<4 THEN PRINT TAB(Q*18);"";ELSE Q=0:PRINT
2110 NEXT J: PRINT
2120 IF Q <> 0 THEN PRINT
2130 PRINT "or OPTIONS"
2140  PRINT "(";:COLOR 8,7:PRINT "C";:COLOR 7,0: PRINT ")reate  new file"
2150  IF J > 1 THEN PRINT "(";:COLOR 8,7:PRINT "D";:COLOR 7,0:PRINT ")elete file"
2160 PRINT "(";:COLOR 8,7:PRINT "Q";:COLOR 7,0:PRINT ")uit"
2170  PRINT
2180  INPUT "INPUT File Number or (C, D, or Q) ";S$:S =  0
2190 IF S$ = "C" OR S$ = "c" THEN S = J:GOTO 2240
2200 IF S$ = "D" OR S$ = "d" THEN IF J > 1 THEN S =J+1:GOTO 2240
2210 IF S$ = "Q" OR S$ = "q" THEN IF J > 1 THEN S = J+2:GOTO 2240
2220 IF S$ = "Q" OR S$ = "q" THEN IF J <= 1 THEN S = J + 1:GOTO 2240
2230 S = VAL(S$):IF S < 1 OR S > J -1 THEN BEEP: GOTO 2060
2240 IF J =< 1 AND S = J+1 THEN 5980
2250 IF S = J+2 THEN 5980
2260  IF S = J + 1 THEN 2450
2270  IF S < 1 OR S > J THEN  BEEP: GOTO 2060
2275 IF S$ = "C" OR S$ = "c" THEN 2290
2280 LOCATE 6,30:COLOR 26,0:PRINT "Loading File.... WAIT";:COLOR 7,0:PRINT " "
2290 DB$ = R$(S)
2300  IF S <  > J THEN 310
2310  PRINT
2320  GOTO 2340
2330  REM
2340  IF J = 0 THEN J = 1
2350 LINE INPUT "LABEL for new file  (Maximum 8 Characters) : ";T$
2360 GOSUB 5990:R$(J)=T$
2370 IF LEN(R$(J)) < 1 OR LEN(R$(J)) > 8 THEN BEEP: GOTO 2350
2380 IF J=1 THEN 2420
2390 FOR T = 1 TO J-1
2400 IF R$(T)=R$(J) THEN BEEP:COLOR 26,0:PRINT "Duplicate File LABEL":COLOR 7,0:GOTO 2350
2410 NEXT T
2420 NR = J: GOSUB 5010
2430 DB$ = R$(J - 1)
2440 GOTO 310
2450  REM ***DELETE A DATA BASE***
2460  PRINT : PRINT "Enter File Number to be ";:COLOR 8,7:PRINT "DELETED";:COLOR 7,0:PRINT " or (Q or F) ";:LINE INPUT "===>  ";S$
2461  S=VAL(S$):EX$=S$:GOSUB 6310
2470  IF S < 1 OR S > J - 1 THEN BEEP: GOTO 2460
2480  CLS:PRINT  "Ready to DELETE   '";:COLOR 8,7:PRINT R$(S);:COLOR 7,0:PRINT "' file":PRINT
2490  PRINT "Once deleted data cannot be recovered"
2500  PRINT "?:_";:COLOR 26,0:PRINT "SURE";:COLOR 7,0:PRINT " DELETE ?":INPUT "Reply (Y or N) ";S$
2510 IF S$ = "N" OR S$ = "n" THEN 2050
2520  IF S$ <  > "Y"AND S$ <> "y"  THEN BEEP: GOTO 2500
2530  CLS:PRINT " ***DELETING '";:COLOR 8,7:PRINT R$(S);:COLOR 7,0:PRINT "' file"
2540 EX = 2750
2550 DB$ = R$(S)
2560 F$ = RPTFMT$
2570  GOSUB 4770
2580 KILL DB$+"."+F$
2590  FOR I = 1 TO NR
2600 KILL DB$+"."+R$(I)
2610  NEXT I
2620 EX = 2840
2630 KILL DB$+"."+INDEX$
2640 EX = 2850
2650 KILL DB$+"."+HEADER$
2660 EX = 2859
2670 DB$ = "BASENAME"
2680 F$ = BASENAME$: GOSUB 4770
2690 EX = 2875
2700  REM
2710 IF NR = 1 THEN KILL "BASENAME"+"."+BASENAME$: GOTO 110
2720  FOR I = S TO NR - 1
2730 R$(I) = R$(I + 1)
2740  NEXT I
2750 NR = NR - 1: GOSUB 5010
2760  GOTO 2050
2770  REM ***REPORT***
2780 T9 = 0
2790 E = 0
2800  FOR I = 0 TO 3 * NH + 2:K(I) = 0:KC(I) = 0: NEXT I
2810  FOR I = 0 TO NH:AC(I) = 0: NEXT I:HC = 0:GT = 0
2820  ON E GOTO 3140
2830  GOTO 4510
2840 INPUT "?:_Number of fields to appear on report or (Q, M, or F) ";RH$:RH =  VAL(RH$):EX$ = RH$: GOSUB 6290
2850 P$ = "Y"
2860  IF RH < 1 OR RH > NH  THEN BEEP: GOTO 2840
2870  IF E = 0 THEN RN$(NN) = "CURRENT"
2880  FOR I = 1 TO RH * 3 STEP 3
2890 CLS:GOSUB 4400
2900 PRINT "Select:";:COLOR 8,7:PRINT "'FIELD #'";:COLOR 7,0
2901 PRINT " for column # ";(I+2)/3;" or (Q, M, or F) ";
2902 INPUT" ";K$:K(I)=VAL(K$):EX$=K$:GOSUB 6290
2910 IF K(I) = 0 THEN IF K$ <> "0" THEN K(I) = -1
2920 IF I = 1 THEN 2950
2930 FOR PX = 1 TO I-3 STEP 3:IF K(I) = K(PX) THEN K(I) = -1
2940 NEXT PX
2950  IF K(I) <0 OR K(I) > NH THEN BEEP: GOTO 2900
2960 KC(I) = (I+2)/3
2970 PRINT "?:_TAB position for ";:COLOR 8,7:PRINT H$(K(I));
2971 COLOR 7,0:PRINT " or (Q, M, or F) ";:INPUT "";K$:K(I + 1)=VAL(K$)
2972 EX$ = K$:GOSUB 6290
2980  IF K(I +1) < 1 OR K(I+ 1) > 132 THEN BEEP:COLOR 26,0:PRINT "Tab must be (1 - 132)":COLOR 7,0:GOTO 2970
2990 IF K(I) = 0 THEN 3030
3000  PRINT "?:_Total on ";:COLOR 8,7:PRINT H$(K(I));:COLOR 7,0:PRINT "      Reply (Y or N) ";: INPUT L$
3010 IF L$ <> "Y" AND L$ <>"y" AND L$ <> "N" AND L$ <> "n" THEN BEEP: GOTO 3000
3020  IF L$ = "Y" OR L$ = "y" THEN K(I + 2) = 1:K(0) = 1:T9=1
3030  NEXT I
3040  IF K(0) < > 1 THEN CLS:GOSUB 4400:GOTO 3140
3050 CLS:GOSUB 4400
3060 PRINT "?:_Apply horizontal column total on ";:COLOR 8,7:PRINT "TOTAL";:COLOR 7,0:PRINT " fields ?"
3070 INPUT "Reply (Y or N) ";A$
3080 IF A$ = "N" OR A$ = "n" THEN A$ = "":GOTO 3120
3090 IF A$<> "Y" AND A$ <> "y" THEN BEEP:GOTO 3060
3100  PRINT "?:_TAB position for ";:COLOR 8,7:PRINT "TOTAL";:COLOR 7,0:PRINT " column or (Q, M, or F) ";:LINE INPUT; A$:EX$ = A$:GOSUB 6290
3110 IF LEN(A$) = 0 THEN A$ = "0"
3120  IF  LEN(A$) = 0 THEN K(0) = 2:T9 = 1: GOTO 3140
3130 K(I + 1) =VAL(A$): IF K(I + 1) < 1 OR K(I + 1) > 132 THEN COLOR 26,0:PRINT "Tab range must be (1 - 132)":COLOR 7,0: BEEP: GOTO 3100
3140 PRINT
3150 PRINT "To select all records press ";:COLOR 8,7:PRINT "'RETURN'";:COLOR 7,0:PRINT " or select record(s) by field number"
3160 INPUT "Strike 'RETURN' or Select ('FIELD #') or (Q, M, or F) ";S$:S=VAL(S$):EX$ = S$ : GOSUB 6290
3170 L$ = "N"
3180 X$="@"
3190  IF LEN(S$) = 0 THEN Q$ = "@": GOTO 3320
3200 IF S < 1 OR S > NH THEN BEEP:GOTO 3160
3210 PRINT "?:_Select record(s) using fields ?":INPUT "Reply (Y or N) ";L$: IF L$="Y" OR L$ = "y"  THEN 3250
3220 IF L$ <>"N" AND L$ <> "n" THEN BEEP: GOTO 3210
3230 X$ = "@"
3240 GOTO 3280
3250 PRINT: INPUT "Enter 2nd Field Number ('FIELD #') or (Q, M, or F) ";X$:X=VAL(X$):EX$ = X$: GOSUB 6290
3260 IF LEN(X$) = 0 THEN X$ = "@": GOTO 3280
3270 IF X < 1 OR X > NH THEN BEEP: GOTO 3250
3280 PRINT: PRINT " '@' will select all records"
3290 PRINT "Select search key on field '";:COLOR 8,7:PRINT H$(S);:COLOR 7,0:PRINT "' = ";: LINE INPUT Q$
3300 IF Q$ <> "@" THEN IF L$ = "Y" OR L$ = "y"  THEN PRINT "Enter search key on field '";
3301 COLOR 8,7:PRINT H$(X);:COLOR 7,0
3302 PRINT " ' = ";:LINE INPUT;X$
3310 Z$=" "+Q$
3320 REM
3330 REM
3340 GOSUB 3990
3350  FOR J = 1 TO NR
3360 N$(J,0) =  STR$(J)
3370  IF Q$ = "@" THEN 3500
3380 IF S = 0 THEN 3430
3390 FOR I = 1 TO LEN(N$(J,S))
3400 IF MID$(N$(J,S),I,LEN(Q$)) = Q$ THEN 3450
3410 NEXT I
3420 GOTO 3510
3430 IF S = 0 THEN IF N$(J,0) = Z$ THEN 3450
3440 GOTO 3510
3450  IF X$ = "@" THEN 3500
3460 FOR I = 1 TO LEN(N$(J,X))
3470 IF  MID$(N$(J,X),I,LEN(X$)) = X$ THEN GOSUB 3660: GOTO 3510
3480 NEXT I
3490 GOTO 3510
3500 GOSUB 3660
3510  IF PF < 1 THEN  IF L > 22 THEN  GOSUB 1480: GOSUB 3990
3520  IF L = 0 THEN  GOSUB 3990
3530  NEXT J
3540  ON T9 GOSUB 3800
3550  REM
3560  ON E GOTO 3610
3570  PRINT : PRINT "?:_LOG report format to ";:COLOR 8,7:PRINT "disk ";:COLOR 7,0 :PRINT " "
3580 INPUT "Reply (Y or N) or (Q, M, or F) ";L$:EX$ = L$:GOSUB 6290
3590 IF L$<>"Y" AND L$ <> "y" AND L$ <> "N" AND L$ <>"n" THEN BEEP: GOTO 3570
3600  IF L$ = "Y" OR L$ = "y" THEN E = 1: GOSUB 4170
3610  PRINT : PRINT "?:_Additional reports using '";:COLOR 8,7:PRINT RN$(NN);:COLOR 7,0:PRINT "' format ?"
3620  INPUT "Reply (Y or N) or (Q, M, or F) ";L$:EX$ = L$: GOSUB 6290
3630 IF L$ <>"Y" AND L$ <> "y" AND L$ <> "N" AND L$ <> "n" THEN BEEP: GOTO 3610
3640  IF L$ = "Y" OR L$ = "y"  THEN E = 1: GOTO 2810
3650  GOTO 5580
3660  FOR I = 1 TO RH
3670  PRINT TAB(K(3*I-1));N$(J,K(3 * I - 2));
3680 IF PF <> 0 THEN  LPRINT TAB(K(3*I-1));N$(J,K(3*I-2));
3690  ON K(3 *I) GOSUB 3770
3700  NEXT I
3710 IF PF <> 0 THEN IF K(0)=1 THEN IF HC<>0 THEN LPRINT TAB(K(3*I-1));HC;
3720 IF K(0) =1 THEN IF HC<>0 THEN PRINT TAB(K(3*I-1));HC;:GT=GT+HC:HC=0
3730 L = L + 1
3740 PRINT
3750 IF PF <> 0 THEN  LPRINT
3760 RETURN
3770 N = 3 * I - 2
3780 V =  VAL(N$(J,K(N))):AC(I) = AC(I) + V:HC = HC + V
3790  RETURN
3800 KS=999:KT = 0: FOR I = 1 TO RH + 1: IF K(3*I-1) > KT THEN KT = K(3*I-1)
3810 IF K(3*I-1) > 0 THEN IF K(3*I-1) < KS THEN KS = K(3*I-1)
3820 NEXT I
3830 PRINT TAB(KS);:FOR I = KS TO KT + 5: PRINT "-";:NEXT I: PRINT
3840  FOR I = 1 TO RH
3850  IF AC(I) = 0 THEN 3870
3860  PRINT TAB((K(3*I-1))-1);AC(I);
3870  NEXT I
3880  IF GT <  > 0 THEN  PRINT TAB(K(3*I-1));GT;
3890 PRINT
3900 IF PF = 0 THEN 3980
3910 LPRINT TAB(KS);:FOR I = KS TO KT + 5:LPRINT "-";:NEXT I:LPRINT
3920 FOR I = 1 TO RH
3930 IF AC(I) = 0 THEN 3950
3940 LPRINT TAB(K(3*I-1));AC(I);
3950 NEXT I
3960 IF GT <> 0 THEN LPRINT TAB(K(3*I-1));GT;
3970 LPRINT
3971 PRINT "...LPRINTER> COMPLETED WITHOUT ERROR(S)"
3980 RETURN
3990  CLS
4000  PRINT RN$(NN);" REPORT FOR ";H$(S);":";Q$;
4010 IF PF <> 0 THEN LPRINT RN$(NN);" REPORT FOR ";H$(S);":";Q$;
4020  IF X$ = "@" THEN 4060
4030  PRINT " AND ";H$(X);":";X$
4040 IF PF <> 0 THEN LPRINT " AND ";H$(X);":";X$
4050 GOTO 4080
4060  PRINT ""
4070 IF PF <> 0 THEN LPRINT ""
4080  FOR I = 1 TO RH
4090  PRINT TAB(K(3*I-1));H$(K(3 * I - 2));
4100 IF PF <> 0 THEN LPRINT TAB(K(3*I-1));H$(K(3*I-2));
4110  NEXT I
4120  IF K(0) = 1 THEN  PRINT TAB(K(3*I-1));"TOTAL";
4130 IF PF<>0 AND K(0) = 1 THEN LPRINT TAB(K(3*I-1));"TOTAL";
4140 PRINT : PRINT
4150 IF PF <> 0 THEN LPRINT:LPRINT
4160 L = 4: RETURN
4170 REM ***SET-UP TO SAVE RPTFMTFILE***
4180 NS = NR
4190 LINE INPUT "?:_LABEL of Report Format (maximum 3 characters) ";T$
4200 GOSUB 5990:RN$(NN)=T$
4210 IF LEN(RN$(NN)) <1 OR LEN(RN$(NN)) >3  THEN BEEP: GOTO 4190
4220 IF NN=1 THEN 4260
4230 FOR T = 1 TO NN-1
4240 IF RN$(T)=RN$(NN) THEN BEEP:COLOR 26,0:PRINT "Duplicate Report Format LABEL":COLOR 7,0:GOTO 4190
4250 NEXT T
4260 F$ = RN$(NN) 
4270 NR = 3 * RH + 2
4280 FOR I = 1 TO NR:R$(I) = STR$(K(I)): NEXT I
4290 R$(I - 2) = STR$(K(0))
4300 GOSUB 5010 :GOSUB 5200
4310 RETURN
4320 REM ***SET-UP TO READ RPTFMTFILE***
4330 F$ = RN$(NN) 
4340 GOSUB 4770
4350 RH = (NR - 2) / 3:FOR I = 1 TO NR:K(I) = VAL(R$(I)):NEXT I
4360 K(0) = VAL(R$(I - 2))
4370 IF K(0) <> 0 THEN T9=1
4380 NR = NS
4390  GOSUB 4400: PRINT : GOTO 3150
4400  REM ***FILE MENU***
4410  PRINT "Select from:": PRINT
4420 IF P$ = "Y" THEN PRINT TAB(2);"TAB";TAB(8);"TOTAL   ";
4430 PRINT "FIELD #"
4440 IF T$ = "Y" THEN 4460
4450  IF MF = 0 THEN PRINT " 0      ";H$(0)
4460  FOR J = 1 TO NH
4470 IF P$ = "Y" THEN GOSUB 6480
4480 PRINT J;"     ";H$(J):NEXT J:PRINT
4490 MF = 0
4500  RETURN
4510  REM ***READ REPORTNAMEFILE & SELECT REPORT***
4520 NN = 0: FOR I = 0 TO 21:RN$(I) = "": NEXT I:NS = NR
4530 F$ = RPTFMT$
4540 EX = 3970
4550  GOSUB 4770
4560  FOR I = 1 TO NR:RN$(I) = R$(I): NEXT I
4570  CLS : PRINT "Select from:": PRINT
4580 PRINT "FORMAT #"
4590  FOR I = 1 TO NR: PRINT I;"       ";R$(I): NEXT I: PRINT
4600 PRINT "or OPTIONS"
4610  PRINT "(";:COLOR 10,7:PRINT "C";:COLOR 7,0:PRINT ")reate new Report Format"
4620  INPUT "Enter Report Format Number ('FORMAT #'or C) or (Q, M, or F) ";S$:S =  0:EX$ = S$
4630 IF S$ = "M" OR S$ = "m" THEN NR = NS
4640 GOSUB 6290
4650 IF S$ = "C" OR S$ = "c" THEN S = I :GOTO 4680
4660 S = VAL(S$)
4670 IF S < 1 OR S > I-1 THEN BEEP: GOTO 4620
4680 CLS
4690 NN = S
4700  IF S <  > I THEN RN$(S) = R$(S):E = 1:NR = NS: GOTO 4320
4710  GOTO 4760
4720  CLS : COLOR 26,0:PRINT "No Report Formats on disk":COLOR 7,0:: PRINT
4730 NN = 1
4740 PRINT "?:_CREATE: ":INPUT "Reply (Y or N) or (Q, M, or F)";L$:EX$ = L$ : GOSUB 6290:IF L$="N" OR L$ = "n" THEN 5580
4750 IF L$ <>"Y" AND L$ <> "y" THEN BEEP: GOTO 4740
4760 T$ = "Y": GOSUB 4400:NR =NS: GOTO 2840
4770  REM ***READ FILES***
4775 FF = 0
4780  IF F$ <  > INDEX$ THEN FF = 1
4790 REM
4800 REM
4801 CLS
4810 IF F$ = BASENAME$ THEN DB$ = "BASENAME"
4811 PRINT "OPENING ";:COLOR 1:PRINT DB$+"."+"["+F$+"]";:COLOR 7:PRINT"....WAIT"
4820 OPEN "I",1,DB$+"."+F$
4821 PRINT "OPENED...."
4830  INPUT #1, NR
4840  FOR J = 1 TO NR
4850  ON FF GOTO 4940
4860 IF J > B THEN CLS:COLOR 26,0:PRINT "FILE TOO LARGE - RECORD ";J;" BYPASSED  ---  CTL-S TO PAUSE CTL-Q TO RESUME":COLOR 7,0
4870  FOR I = 1 TO NH
4880 I$=""
4890 LINE INPUT#1, I$
4900 IF J > B THEN PRINT R$(I);" : "; I$: GOTO 4920
4910 N$(J,I) = I$
4920  NEXT I
4930 GOTO 4950
4940 LINE INPUT#1,R$(J)
4950 IF J > B THEN FOR X = 1 TO 3000:NEXT X: NR = B
4960 NEXT J
4970 REM
4971 PRINT "CLOSING ";DB$+"."+"["+F$+"]";:PRINT"....WAIT"
4980 CLOSE 1
4981 PRINT "CLOSED...."
4990 FF = 0
5000  RETURN
5010  REM ***SAVE FILES***
5015 FF = 0
5020  IF F$ <  > INDEX$ THEN FF = 1
5030 REM
5040 REM
5050 IF F$ = BASENAME$ THEN DB$ = "BASENAME"
5051 PRINT "OPENING ";:COLOR 1:PRINT DB$+"."+"["+F$+"]";:COLOR 7:PRINT"....WAIT"
5060 OPEN "O",1,DB$+"."+F$
5061 PRINT "OPENED...."
5070  PRINT#1, NR
5080  FOR J = 1 TO NR
5090  ON FF GOTO 5140
5100  FOR I = 1 TO NH
5110  PRINT#1, N$(J,I)
5120  NEXT I
5130  GOTO 5150
5140  PRINT#1, R$(J)
5150  NEXT J
5151 PRINT "CLOSING ";DB$+"."+"["+F$+"]";:PRINT"....WAIT"
5160 CLOSE 1
5161 PRINT "CLOSED...."
5170 REM
5180 FF = 0
5190  RETURN
5200  REM ***SAVE REPORTNAMEFILE***
5210 NR = NN
5220 F$ = RPTFMT$
5230  FOR I = 1 TO NR:R$(I) = RN$(I): NEXT I
5240  GOSUB 5010
5250 NR = NS: RETURN
5260  REM ***LIST***
5261 PRINT "DUMPING LIST FILE TO LIST DEVICE [PRN]      ....WAIT"
5262 PRINT "LIST TO PRN:"
5263 COLOR 15:PRINT"*IN PROGRESS":COLOR 7
5270 L = 0
5280  CLS
5290  FOR J = 1 TO NR
5300 IF PF <> 0 THEN LPRINT "  ";H$(0);": ";J
5310  PRINT "  ";H$(0);": ";J:L = L + 1
5320  FOR I = 1 TO NH
5330 IF I = 1 THEN PRINT "FIELD #"
5340 IF I = 1 THEN IF PF <> 0 THEN LPRINT "FIELD #"
5350 IF PF <> 0 THEN LPRINT I;"     "H$(I);": ";N$(J,I)
5360  PRINT I;"     ";H$(I);": ";N$(J,I)
5370 L = L + 1
5380  NEXT I
5390 IF PF <> 0 THEN LPRINT
5400  PRINT :L = L + 1
5410 IF PF < > 0 THEN 5430
5420  IF L + NH > 20 THEN 5470
5430  NEXT J
5440  REM
5450 COLOR 26,0:PRINT "*EOF: PRINT COMPLETED":COLOR 7,0: INPUT "Strike 'RETURN' to continue";L$
5460  GOTO 5580
5470  REM
5480  PRINT "Strike ";:COLOR 8,7:PRINT "'RETURN'";:COLOR 7,0:PRINT " to continue, or (Q, M, or F)";
5490 INPUT L$:EX$ = L$ : GOSUB 6290
5500 IF LEN(L$) = 0 THEN 5530
5510 BEEP
5520  GOTO 5490
5530  CLS :L = 0
5540  GOTO 5430
5550  REM ***INPUT ROUTINES***
5560 I$ = ""
5570 LINE INPUT""; I$: RETURN
5580  REM ***MAIN MENU***
5590 REM
5600  CLS
5610 P$ = "":T$ = ""
5620 COLOR 8,7:LOCATE 1,15:PRINT"       ****** I B M P C ******     "
5625 COLOR 7,0:LOCATE 1,57:PRINT DATE$;"   ";TIME$:COLOR 8,7
5630 LOCATE 2,15:PRINT          "**** ELECTRONIC FILING SYSTEM  ****"
5640 LOCATE 3,15:PRINT          DT$;"       VERSION";VE$;"   "
5650 LOCATE 4,27:PRINT "MAIN MENU":COLOR 7,0
5660  PRINT
5670  PRINT TAB(20);"Current File: ";:COLOR 8,7:PRINT DB$:COLOR 7,0
5680  PRINT TAB(20);"Currently Contains: ";:COLOR 8,7:PRINT NR;:COLOR 7,0:PRINT " Record(s)"
5690 PRINT TAB(20);"Space for ";:COLOR 8,7:PRINT B - NR;:COLOR 7,0:PRINT " Additional Record(s)"
5700 PRINT TAB(20);"Free Space =";FRE(0)
5710  PRINT
5720 IF PF = 0 THEN PRINT TAB(20);"...LPRINTER> INTERVENTION REQUIRED":GOTO 5740
5730  PRINT TAB(20);"...LPRINTER> WAITING FOR WORK     (MODE: 132,8)"
5740  PRINT
5750  PRINT TAB(20);"(F)ile Menu"
5760  PRINT TAB(20);"(C)hange and/or Search Fields"
5770  PRINT TAB(20);"(E)nter Records"
5780  PRINT TAB(20);"(D)elete Records"
5790  PRINT TAB(20);"(R)eport Generation
5800 PRINT TAB(20);"(S)ort - Takes Approximately" INT (.0005 * NR ^ 2 + .04 * NR)"Minutes"
5810  PRINT TAB(20);"(P)rinter ON/OFF
5820  PRINT TAB(20);"(L)ist Records"
5830  PRINT TAB(20);"(Q)uit"
5840  PRINT
5850 PRINT TAB(20);: INPUT "Enter (F, C, E, D, R, S, P, L, or Q) ";S$:S =  0:EX$ = S$ : GOSUB 6310
5860 IF S$ = "C" OR S$ = "c" THEN 1130
5870 IF S$ = "E" OR S$ = "e" THEN 950
5880 IF S$ = "D" OR S$ = "d" THEN 1830
5890 IF S$ = "R" OR S$ = "r" THEN 2770
5900 IF S$ = "S" OR S$ = "s" THEN 720
5910 IF S$ = "P" OR S$ = "p" THEN IF PF = 0 THEN 5950
5920 IF S$ = "P" OR S$ = "p" THEN IF PF <> 0 THEN 5970
5930 IF S$ = "L" OR S$ = "l" THEN 5260
5940 BEEP: GOTO 5580
5950  CLS
5960 PF$ = "5":PF = 5: GOTO 5580 :REM FORCE PRINTER TO 132
5970 PF = 0: GOTO 5580
5980 CLS:COLOR 8,7:LOCATE ,20:PRINT  "Exiting I B M P C  Electronic Filing System":COLOR 7,0:SYSTEM:  END
5990 REM ***VALIDATE FILE NAME ENTRIES***
6000 T=LEN(T$)
6010 IF T<1 THEN 6090
6020 FOR I = 1 TO T
6030 C$=MID$(T$,I,1)
6040 IF C$=>"0" AND C$<="9" THEN 6080
6050 IF C$=>"A" AND C$<="Z" THEN 6080
6060 IF C$=>"a" AND C$<="z" THEN 6080
6070 COLOR 26,0:PRINT "Invalid LABEL - Label may contain   'A-Z'    'a-z'    '0-9' ONLY":COLOR 7,0:T$="":GOTO 6090
6080 NEXT I
6081 PRINT "***VALIDATED***";:COLOR 15:PRINT "      ....USED":COLOR 7
6090 RETURN
6100 REM COMMON ERROR ROUTINE
6110 IF EX = 1110 AND ERR = 53 AND ERL = 4820 THEN EX = 0:RESUME 2330
6120 IF EX = 1140 AND ERR = 53 AND ERL = 4820 THEN EX = 0:RESUME 840
6130 IF EX = 1200 AND ERR = 53 AND ERL = 4820 THEN EX = 0:RESUME 5580
6140 IF EX = 2750 AND ERR = 53 AND ERL = 4820 THEN EX = 0:RESUME 2620
6150 IF EX = 2840 AND ERR = 53 AND ERL = 2630 THEN EX = 0:RESUME 2640
6160 IF EX = 2850 AND ERR = 53 AND ERL = 2650 THEN EX = 0:RESUME 2670
6170 IF EX = 3970 AND ERR = 53 AND ERL = 4820 THEN EX = 0:RESUME 4720
6180 IF ERR <> 7 THEN 6240
6190 FOR I = 1 TO 10:BEEP:NEXT I
6200 COLOR 26,0:PRINT "*** AVAILABLE MEMORY EXCEEDED ***":COLOR 7,0
6210 PRINT "Strike Any Key To Return To File Menu"
6220 XP$=INKEY$:IF XP$ = "" THEN 6220
6230 RESUME 110
6240 COLOR 26,0:PRINT "UNRECOVERABLE ERROR ENCOUNTERED":COLOR 7,0:FOR I = 1 TO 10:BEEP:NEXT I
6250 PRINT:PRINT "EX = ";EX;" ERR = ";ERR;" ERL = ";ERL"
6260 PRINT:PRINT "LAST FILE ACCESSED : ";DB$+"."+F$
6270 ON ERROR GOTO 0
6280 STOP
6290 REM COMMON EXIT ROUTINE
6300 IF EX$ = "M" OR EX$ = "m" THEN 5580
6310 IF EX$ = "Q" OR EX$ = "q" THEN 5980
6320 IF EX$ = "F" OR EX$ = "f" THEN 110
6330 RETURN
6340 REM SCREEN SCROLL
6350 CLS
6440 PRINT "ELECTRONIC FILE SYSTEM"
6441 PRINT: PRINT "BYTES FREE=";FRE(0):PRINT:PRINT "STIKE ANY KEY TO CONTINUE...."
6442 HOLD$ = INKEY$:IF HOLD$="" THEN 6442
6443 PRINT
6444 PRINT "*EXECUTION BEGINS"
6470 RETURN
6480 REM PRINT REPORT DATA
6490 FOR PX = 1 TO RH * 3 STEP 3
6500 IF K(PX) <> J THEN NEXT PX
6510 IF  KC(PX) = 0 THEN PRINT TAB(17);:RETURN
6520 PRINT TAB(2);K(PX+1);TAB(9);
6530 IF K(PX+2) = 1 THEN PRINT "YES     ";ELSE PRINT "NO      ";
6540 RETURN
65399 '** DONE - PRESS ENTER TO RETURN TO MENU **
