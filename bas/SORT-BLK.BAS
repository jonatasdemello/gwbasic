100 '   SORT-BLK.BAS   by   Bob Noble, Philadelphia IBM PC Users Club
110 '                       Submitted 8-21-82.
120 '
130 '   This program must be altered for the programmer's specific application.
140 '   The data file to be operated on must be a fixed-field-length, random-
150 '   access type, and the record size must be a multiple of 128 bytes. If
160 '   not specified in the OPEN statement, the default is 128.
170 '
180 '   The file used in this version is called ARTICLES. It has 61 fields tot-
190 '   aling 363 bytes (e.g. the record size is 128*3 = 384). Note that when
200 '   more fields are needed than can fit in a single 256 byte FIELD state-
210 '   ment, dummy variables with parameters <= 256 must be used at the begin-
220 '   ing of each sucessive FIELD statement.
230 '
240 '   The file is blocked so that each group of 16 records contains 13 act-
250 '   ual records followed by an overflow space of 3 null records. The first
260 '   2 bytes of a null record are "@@".
270 '
280 '   The key being sorted is the "Headline" field AF$. The arrays are loaded
290 '   with the first 32 characters of the key field in each actual record,
300 '   nulls are skipped. The sort used is a popular binary one. A new sorted
310 '   and blocked file is created. The original is killed and the new file
320 '   is renamed to the original.
330 '
340 '   This program would be used as part of a system. A data entry program
350 '   would put new records in the proper overflow space via an alphabetic
360 '   search. Every time an overflow space becomes full, the file must be
370 '   sorted and reblocked.
380 '
390 '   Significant improvements in disk space utilization, and time may be
400 '   achieved by creating a separate index file consisting of the first
410 '   32 bytes of each key and a pointer to the record in which it resides.
420 '   Then the data file itself would not have to be blocked or sorted.
430 '
440 '   I am intent on learning all ISAM, and other useful data management
450 '   techniques. I will continue to submit what I develope as long as
460 '   there is an interest. Please contact me with questions or help.
470 '           (215) 329-4205          5431 North 12th Street
480 '                                   Philadelphia, PA 19141
490 '
500 CLEAR: CLS: OPEN "R", 1, "B:ARTICLES", 384
510 FIELD 1, 155 AS AF$, 5 AS BF$, 8 AS CF$, 45 AS DF$, 5 AS LLF$, 11 AS EF$,                1 AS FF$, 1 AS GF$, 1 AS HF$, 1 AS IIF$, 1 AS JF$, 1 AS KF$,                    1 AS LF$, 1 AS MF$, 1 AS NF$, 1 AS OF$, 1 AS PF$, 1 AS CQF$
520 FIELD 1, 241 AS ZZ1$, 1 AS RF$, 1 AS SF$, 1 AS TF$, 1 AS UF$, 1 AS VF$,                  1 AS WF$, 1 AS XF$, 1 AS YF$, 1 AS ZF$, 1 AS AAF$, 1 AS ABF$,                   1 AS ACF$, 1 AS ADF$, 1 AS AEF$, 1 AS CAFF$, 1 AS AGF$, 1 AS AHF$
530 FIELD 1, 129 AS ZZ2$, 129 AS ZZ3$, 1 AS AIF$, 1 AS AJF$, 1 AS AKF$,                      1 AS ALF$, 1 AS AMF$, 1 AS ANF$, 1 AS AOF$, 1 AS APF$, 1 AS AQF$,               1 AS ARF$, 1 AS ASF$, 1 AS ATF$, 1 AS AUF$, 1 AS AVF$, 1 AS AWF$
540 FIELD 1, 137 AS ZZ4$, 136 AS ZZ5$, 1 AS AXF$, 1 AS AYF$, 1 AS AZF$,                      1 AS BAF$, 1 AS BBF$, 1 AS BCF$, 1 AS BDF$, 1 AS BEF$, 1 AS CBFF$,              1 AS BGF$, 75 AS BHF$
550 '
560 PRINT "ARTICLES *** SORT AND BLOCK ROUTINE"
570 PRINT: PRINT "PRESS ANY KEY TO START SORT"
580 Q$ = INKEY$: IF Q$="" THEN 580
590 '
600 '       ***************************************
610 '       ************  Load Arrays  ************
620 '       ***************************************
630 '
640 PRINT: PRINT "AS NUMBERS APPROACH 0, TASKS NEAR END" TAB(66) "TIME"
650 PRINT: PRINT "LOADING ARRAYS FROM ORIGINAL FILE ------------------------>"
660 K = LOF(1)/384: V=K: I%=0: T=0: TIME$="00:00:00"
670 DIM ZZ$(K), R(K)
680 FOR X=1 TO K
690   V=V-1: LOCATE 7,60: PRINT V
700   I%=I%+1: IF I%=K+1 THEN 740 ELSE GET 1,I%
710     IF LEFT$(AF$,2)="@@" THEN 700
720   T=T+1: ZZ$(T) = LEFT$(AF$,32): R(T)=I%
730 NEXT
740 TI1$=TIME$: LOCATE 7,64: PRINT TI1$
750 '
760 '       ***************************************
770 '       ************  Shell Sort  *************
780 '       ***************************************
790 '
800 CLOSE
810 V=0: LOCATE 7,60: PRINT V: PRINT: PRINT "SORT STARTED --------------------------------------------->": M=T: TIME$="00:00:00"
820 M=INT(M/2): LOCATE 9,60: PRINT M: IF M=0 THEN 930 ELSE P=T-M: J=1
830   N=J
840     L=N+M
850     GOSUB 1210 ' *** Determine A1$ and B1$
860       IF ASC(A1$) > ASC(B1$) THEN SWAP ZZ$(N),ZZ$(L): SWAP R(N),R(L):                   N=N-M: IF N>=1 THEN 840
870 J=J+1: IF J>P THEN 820 ELSE 830
880 '
890 '       ****************************************
900 '       *  Create new sorted and blocked file  *
910 '       ****************************************
920 '
930 TI2$=TIME$: LOCATE 9,64: PRINT TI2$
940 LOCATE 11,1: PRINT "SORT ENDED - NOW CREATING NEW SORTED AND BLOCKED FILE ---->"
950 I%=0: D=14: C=T: TIME$="00:00:00": GOSUB 1520 ' *** Open Files
960 FOR Y=1 TO T: C=C-1: LOCATE 11,60: PRINT C
970   I%=I%+1: IF I%=D THEN D=D+16: GOSUB 1680 ' ****** Skip 3 records
980   GET 1,R(Y): GOSUB 1340 ' ************************* LSET variables
990   PUT 2,I%
1000 NEXT Y
1010 TI3$=TIME$: LOCATE 11,64: PRINT TI3$
1020 '
1030 GOSUB 1780 ' ***** Determine Total Time
1040 '
1050 PRINT: PRINT "TOTAL TIME ="; TH; "HOURS"; TM; "MINUTES"; TS; "SECONDS"
1060 '
1070 '       ***************************************
1080 '       ***************  End  *****************
1090 '       ***************************************
1100 '
1110 CLOSE: KILL "B:ARTICLES": NAME "B:ARTICLE" AS "B:ARTICLES"
1120 '
1130 PRINT: PRINT "PROGRAM OVER - PRESS ANY KEY TO RETURN TO MAIN MENU"
1140 Q$=INKEY$: IF Q$="" THEN 1140
1150 RUN "ART-MAIN.BAS"
1160 '
1170 '     *****************************************
1180 '     *  Subroutine to determine A1$ and B1$  *
1190 '     *****************************************
1200 '
1210 H=1: S=1
1220 A1$ = MID$(ZZ$(N),H,1): B1$ = MID$(ZZ$(L),S,1)
1230   IF MID$(ZZ$(N),H,2)="  " THEN A1$="AAAAAAAA"
1240   IF MID$(ZZ$(L),S,2)="  " THEN B1$="AAAAAAAA"
1250   IF ASC(A1$)>64 AND ASC(A1$)<91 THEN 1260 ELSE H=H+1: GOTO 1220
1260   IF ASC(B1$)>64 AND ASC(B1$)<91 THEN 1270 ELSE S=S+1: GOTO 1220
1270   IF ASC(A1$)=ASC(B1$) THEN H=H+1: S=S+1: GOTO 1220
1280 RETURN
1290 '
1300 '      ****************************************
1310 '      ****  Subroutine to LSET variables  ****
1320 '      ****************************************
1330 '
1340 LSET AF$=A$:LSET BF$=B$:LSET CF$=C$:LSET DF$=D$:LSET LLF$=LL$:LSET EF$=E$
1350 LSET FF$=F$:LSET GF$=G$:LSET HF$=H$:LSET IIF$=II$:LSET JF$=J$:LSET KF$=K$
1360 LSET LF$=L$:LSET MF$=M$:LSET NF$=N$:LSET OF$=O$:LSET PF$=P$:LSET CQF$=CQ$
1370 LSET RF$=R$:LSET SF$=S$:LSET TF$=T$:LSET UF$=U$:LSET VF$=V$:LSET WF$=W$
1380 LSET XF$=X$:LSET YF$=Y$:LSET ZF$=Z$:LSET AAF$=AA$:LSET ABF$=AB$
1390 LSET ACF$=AC$:LSET ADF$=AD$:LSET AEF$=AE$:LSET CAFF$=CAF$:LSET AGF$=AG$
1400 LSET AHF$=AH$:LSET AIF$=AI$:LSET AJF$=AJ$:LSET AKF$=AK$:LSET ALF$=AL$
1410 LSET AMF$=AM$:LSET ANF$=AN$:LSET AOF$=AO$:LSET APF$=AP$:LSET AQF$=AQ$
1420 LSET ARF$=AR$:LSET ASF$=AS$:LSET ATF$=AT$:LSET AUF$=AU$:LSET AVF$=AV$
1430 LSET AWF$=AW$:LSET AXF$=AX$:LSET AYF$=AY$:LSET AZF$=AZ$:LSET BAF$=BA$
1440 LSET BBF$=BB$:LSET BCF$=BC$:LSET BDF$=BD$:LSET BEF$=BE$:LSET CBFF$=CBF$
1450 LSET BGF$=BG$:LSET BHF$=BH$
1460 RETURN
1470 '
1480 '       ****************************************
1490 '       ******  Subroutine to open files  ******
1500 '       ****************************************
1510 '
1520 OPEN "R", 1, "B:ARTICLES", 384
1530 FIELD 1, 155 AS A$, 5 AS B$, 8 AS C$, 45 AS D$, 5 AS LL$, 11 AS E$,                      1 AS F$, 1 AS G$, 1 AS H$, 1 AS II$, 1 AS J$, 1 AS K$, 1 AS L$,                 1 AS M$, 1 AS N$, 1 AS O$, 1 AS P$, 1 AS CQ$
1540 FIELD 1, 241 AS ZZ1$, 1 AS R$, 1 AS S$, 1 AS T$, 1 AS U$, 1 AS V$, 1 AS W$,              1 AS X$, 1 AS Y$, 1 AS Z$, 1 AS AA$, 1 AS AB$, 1 AS AC$, 1 AS AD$,              1 AS AE$, 1 AS CAF$, 1 AS AG$, 1 AS AH$
1550 FIELD 1, 129 AS ZZ2$, 129 AS ZZ3$, 1 AS AI$, 1 AS AJ$, 1 AS AK$, 1 AS AL$,               1 AS AM$, 1 AS AN$, 1 AS AO$, 1 AS AP$, 1 AS AQ$, 1 AS AR$,                     1 AS AS$, 1 AS AT$, 1 AS AU$, 1 AS AV$, 1 AS AW$
1560 FIELD 1, 137 AS ZZ4$, 136 AS ZZ5$, 1 AS AX$, 1 AS AY$, 1 AS AZ$, 1 AS BS$,               1 AS BB$, 1 AS BC$, 1 AS BD$, 1 AS BE$, 1 AS CBF$, 1 AS BGF$,                   75 AS BHF$
1570 OPEN "R", 2, "B:ARTICLE", 384
1580 FIELD 2, 155 AS AF$, 5 AS BF$, 8 AS CF$, 45 AS DF$, 5 AS LLF$, 11 AS EF$,                1 AS FF$, 1 AS GF$, 1 AS HF$, 1 AS IIF$, 1 AS JF$, 1 AS KF$,                    1 AS LF$, 1 AS MF$, 1 AS NF$, 1 AS OF$, 1 AS PF$, 1 AS CQF$
1590 FIELD 2, 241 AS ZZ1$, 1 AS RF$, 1 AS SF$, 1 AS TF$, 1 AS UF$, 1 AS VF$,                  1 AS WF$, 1 AS XF$, 1 AS YF$, 1 AS ZF$, 1 AS AAF$, 1 AS ABF$,                   1 AS ACF$, 1 AS ADF$, 1 AS AEF$, 1 AS CAFF$, 1 AS AGF$, 1 AS AHF$
1600 FIELD 2, 129 AS ZZ2$, 129 AS ZZ3$, 1 AS AIF$, 1 AS AJF$, 1 AS AKF$,                      1 AS ALF$, 1 AS AMF$, 1 AS ANF$, 1 AS AOF$, 1 AS APF$, 1 AS AQF$,               1 AS ARF$, 1 AS ASF$, 1 AS ATF$, 1 AS AUF$, 1 AS AVF$, 1 AS AWF$
1610 FIELD 2, 137 AS ZZ4$, 136 AS ZZ5$, 1 AS AXF$, 1 AS AYF$, 1 AS AZF$,                      1 AS BAF$, 1 AS BBF$, 1 AS BCF$, 1 AS BDF$, 1 AS BEF$, 1 AS CBFF$,              1 AS BGF$, 75 AS BHF$
1620 RETURN
1630 '
1640 '          **************************************
1650 '          ***  Subroutine to Skip 3 Records  ***
1660 '          **************************************
1670 '
1680 FIELD 1, 2 AS XYZ$: FIELD 2, 2 AS XYZF$
1690 FOR X=1 TO 3
1700   GET 1,1: XYZ$="@@": LSET XYZF$=XYZ$: PUT 2,I%: I%=I%+1
1710 NEXT X
1720 FIELD 1, 155 AS A$: FIELD 2, 155 AS AF$: RETURN
1730 '
1740 '          ********************************************
1750 '          ***  Subroutine to Determine Total Time  ***
1760 '          ********************************************
1770 '
1780 H1=VAL(LEFT$(TI1$,2)): M1=VAL(MID$(TI1$,4,2)): S1=VAL(RIGHT$(TI1$,2))
1790 H2=VAL(LEFT$(TI2$,2)): M2=VAL(MID$(TI2$,4,2)): S2=VAL(RIGHT$(TI2$,2))
1800 H3=VAL(LEFT$(TI3$,2)): M3=VAL(MID$(TI3$,4,2)): S3=VAL(RIGHT$(TI3$,2))
1810 TSEC = (3600*(H1+H2+H3)) + (60*(M1+M2+M3)) + S1 + S2 + S3
1820 TH=INT(TSEC/3600):TM=INT((TSEC-TH*3600)/60):TS=TSEC-(TH*3600)-(TM*60)
1830 RETURN
