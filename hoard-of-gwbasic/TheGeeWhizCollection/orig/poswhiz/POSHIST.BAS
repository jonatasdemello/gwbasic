1000 'POShist 04-05-04
1010 GOTO 1130 'begin
1020 '      SAVE "POShist":COLOR 7,0:LIST-1130
1030 ' ON I GOTO 1020,1030,2220 'rem lines for QB
1040 GOTO 1450 'OpenHist
1050 GOTO 1520 'Q2keys
1060 GOTO 1560 'Print?
1070 GOTO 1670 'Menu
1080 GOTO 1800 'BeginEnd dates
1090 GOTO 2110 'Daily sales
1100 GOTO 2360 'Hourly sales
1110 GOTO 2540 'Monthly sales
1120 GOTO 2790 'Quit
1130 'begin
1140  DEFSTR M-Z:DEFINT C-L:DEFDBL A:COLOR 7,0:CLS:LOCATE ,,1,1,14
1150  I=0:L=0:C=0:E=0:F=0:G=0:K=0:B=0     'locals
1160  KEY OFF:FOR I=1 TO 10:KEY I,"":NEXT         'globals ...
1170  A1=0:A2=0 'Accumulators
1180  Q2=MKI$(0):QB=SPACE$(80) 'Q2keys:QBuffer
1190  GQ=0:KQ=ASC(Q2):BR=0 'GetQ:KQcode:BRead
1200  LS=0:CS=0 'LineScan:ColScan dates
1210  FS=0:ES=0 'FromScan:EndScan
1220  DM=1 'DoMenu
1230  MD="BDHMQ" 'MenuDo
1240  SD=DATE$ ' SysDate
1250  SH="08-0909-1010-1111-1212-0101-0202-0303-0404-0505-0606-0707-08" 'SHours
1260  SF="10-31-00" 'ScanFrom
1270   LSET QB=SD:MID$(QB,7)=MID$(QB,9,4):SE=LEFT$(QB,8) 'ScanEnd
1280  WD="SunMonTueWedThuFriSat" 'WeekDays
1290  GOSUB 1040 'OpenHist and allocate vars
1300  DIM D(4) 'getDate (0-6=SMTWTFS)
1310   D(0)=&H2AB4 ' MOV AH,2A ; get date
1320   D(1)=&H21CD ' INT 21 ; DOS
1330   D(2)=&HA22E ' CS:MOV [0080],AL ; weekday#
1340   D(3)=&H80   ' DTA address (128)
1350   D(4)=&HCB   ' RETF ; far return
1360  DIM H(12),B(12,9) 'Hits,totals
1370  WHILE DM
1380   FS=(VAL(MID$(SF,7))*4000)+(VAL(SF)*32)+VAL(MID$(SF,4))
1390   ES=(VAL(MID$(SE,7))*4000)+(VAL(SE)*32)+VAL(MID$(SE,4))
1400   GOSUB 1070 'Menu
1410   '           BegE,Days,Hour,Mon ,Quit
1420   ON DM GOSUB 1080,1090,1100,1110,1120
1430  WEND
1440 END
1450 'OpenTemp
1460  OPEN "postemp.dat" AS 1:CLOSE:RESET:KILL "postemp.dat"
1470  OPEN "POS.TMP" AS 1 LEN=22:IF LOF(1) THEN 1500 ELSE CLOSE:RESET
1480   SHELL "COPY POS*.DAT POS.TMP" 'concatenate .dat files
1490   OPEN "POS.TMP" AS 1 LEN=22
1500 FIELD 1,20 AS RB 'RcdBfr
1510 RETURN
1520 'Q2keys
1530  LSET Q2=MKD$(0):WHILE CVI(Q2)=0:MID$(Q2,1)=INKEY$:WEND:KQ=ASC(Q2)
1540  IF KQ>90 THEN KQ=KQ-32:MID$(Q2,1)=CHR$(KQ) 'caps
1550 RETURN
1560 'Print?
1570  LOCATE 12,36,1:PRINT "Print (Y/N) <?>";MKI$(7453);
1580 GOSUB 1050 'Q2keys
1590  IF KQ=78 THEN 1660 'No
1600  IF KQ-89 THEN BEEP:GOTO 1580 'Yes
1610  PRINT CHR$(KQ):LSET QB=" "
1620  FOR L=1 TO 25:LSET RB=QB
1630   FOR C=1 TO 20:MID$(RB,C)=CHR$(SCREEN(L,C)):NEXT
1640   IF RB>QB THEN LPRINT RB ELSE L=25
1650  NEXT:FOR I=1 TO 20:LPRINT:NEXT
1660 RETURN
1670 'Menu
1680  CLS:PRINT:PRINT " POShist Vers 1.2 04-05-04":PRINT
1690  PRINT "  Begin/end dates = ";:LS=CSRLIN:CS=POS(0)
1700    PRINT SF;"...";SE
1710  PRINT "  Daily sales"
1720  PRINT "  Hourly sales"
1730  PRINT "  Monthly sales"
1740  PRINT "  Quit this program"
1750  PRINT " <?>";MKI$(7453);
1760 LOCATE ,,1:GOSUB 1050 'Q2keys
1770  K=INSTR(MD,LEFT$(Q2,1)):IF K=0 THEN BEEP:GOTO 1760
1780  PRINT MID$(MD,K,1);:DM=K
1790 RETURN
1800 'BegEnd
1810 GQ=CS+1:LOCATE LS+1,1,0:FOR I=1 TO 10:PRINT SPACE$(80);:NEXT
1820  LOCATE LS+1,4:PRINT "<Esc>...";CHR$(27);"move";CHR$(26);"...";
1830  PRINT CHR$(24);"change";CHR$(25);"...<Ent>";
1840  A1=CVD(SF):A2=CVD(SE) 'for reset if <Esc>
1850 LOCATE LS,CS,1:PRINT SF;"...";SE;
1860 LOCATE LS,GQ:GOSUB 1050:K=ASC(MID$(Q2,2)) 'Q2keys
1870  IF KQ=27 THEN LSET SF=MKD$(A1):LSET SE=MKD$(A2):GOTO 2100
1880  F=0:I=(K=72)-(K=80) 'up/down
1890  WHILE I:K=I
1900   IF GQ>CS+10 THEN F=2:LSET QB=SE ELSE F=1:LSET QB=SF 'end/begin
1910   IF GQ=CS+1 OR GQ=CS+12 THEN I=1 'mm
1920   IF GQ=CS+4 OR GQ=CS+15 THEN I=4 'dd
1930   IF GQ=CS+7 OR GQ=CS+18 THEN I=7 'yy
1940   K=VAL(MID$(QB,I))+K
1950   IF I=1 THEN IF K<1 THEN K=12 ELSE IF K>12 THEN K=1 'mm
1960   IF I=4 THEN IF K<1 THEN K=31 ELSE IF K>31 THEN K=1 'dd
1970   IF I=7 THEN IF K<0 THEN K=10 ELSE IF K>10 THEN K=0 'yy
1980   LSET QB=STR$(K+100)
1990   IF F=1 THEN MID$(SF,I)=MID$(QB,3,2) ELSE MID$(SE,I)=MID$(QB,3,2)
2000   F=1:I=0
2010  WEND
2020  K=(K=75)-(K=77) 'left/right
2030  WHILE K:K=K*3:I=SCREEN(LS,GQ+K)
2040   WHILE I=46:IF K<0 THEN GQ=GQ-1 ELSE GQ=GQ+2
2050    I=SCREEN(LS,GQ+K)
2060   WEND:I=(I>47 AND I<58):IF I THEN GQ=GQ+K ELSE BEEP
2070   F=2:K=0
2080  WEND
2090  ON F GOTO 1850,1860:IF KQ-13 THEN BEEP:GOTO 1860
2100 RETURN
2110 'Daily
2120  F=9:E=0:C=0:FOR I=0 TO 6:H(I)=0:NEXT:L=CSRLIN+1
2130  FOR BR=1 TO (LOF(1)/22)-1:GET 1,BR:LOCATE L,1,0:PRINT BR;
2140   K=ASC(MID$(RB,4))-45 'date line?
2150   WHILE K=0
2160    I=(VAL(MID$(RB,8,2))*4000)+(VAL(RB)*32)+VAL(MID$(RB,5))
2170    K=(I<FS OR I>ES) 'within search range?
2180    WHILE K=0
2190     WHILE E-I:E=I
2200      MID$(RB,10)=MID$(RB,8,2):MID$(RB,8)="20":DATE$=MID$(RB,2,10)
2210      D=VARPTR(D(0))
2220 '    CALL D:GOTO 2240                           'rem for QB
2230      CALL ABSOLUTE (D)
2240      F=PEEK(128) 'DTA=weekday#
2250     WEND:K=1:H(F)=H(F)+1:C=C+1
2260    WEND
2270   WEND:E=I
2280  NEXT:DATE$=SD 'reset system date
2290  CLS:PRINT " Daily on ";DATE$:PRINT " ";SF;"...";SE:I=0
2300  FOR G=1 TO LEN(WD) STEP 3:K=H(I)
2310   PRINT " ";MID$(WD,G,3);:PRINT USING "   #####";K;:I=I+1
2320   B=K/C:PRINT USING "  ###.#%";B*100
2330  NEXT
2340  PRINT " Total";:PRINT USING "######";C:GOSUB 1060 'Print
2350 RETURN
2360 'Hourly
2370  C=0:FOR I=0 TO 12:H(I)=0:NEXT:L=CSRLIN+1
2380  FOR BR=1 TO (LOF(1)/22)-1:GET 1,BR:LOCATE L,1,0:PRINT BR;
2390   K=ASC(MID$(RB,4))-45 'date line?
2400   WHILE K=0
2410    I=(VAL(MID$(RB,8,2))*4000)+(VAL(RB)*32)+VAL(MID$(RB,5))
2420    K=1:IF NOT (I<FS OR I>ES) THEN I=VAL(MID$(RB,12)):H(I)=H(I)+1:C=C+1
2430   WEND
2440  NEXT
2450  CLS:PRINT " Hourly   ";DATE$:PRINT " ";SF;"...";SE
2460  FOR G=1 TO LEN(SH) STEP 5:I=VAL(MID$(SH,G)):K=H(I)
2470   WHILE K
2480    PRINT " ";MID$(SH,G,5);:PRINT USING " #####";K;
2490    B=K/C:PRINT USING "  ###.#%";B*100:K=0
2500   WEND
2510  NEXT
2520  PRINT " Total ";:PRINT USING "#####";C:GOSUB 1060 'Print?
2530 RETURN
2540 'Monthly
2550  A1=0:FOR I=0 TO 12:FOR L=0 TO 9:B(I,L)=0:NEXT:NEXT:L=CSRLIN+1
2560  FOR BR=1 TO (LOF(1)/22)-1:GET 1,BR:LOCATE L,1,0:PRINT BR;
2570   K=ASC(MID$(RB,4))-45 'date line?
2580   WHILE K=0
2590    I=(VAL(MID$(RB,8,2))*4000)+(VAL(RB)*32)+VAL(MID$(RB,5))
2600    WHILE NOT (I<FS OR I>ES)
2610     K=VAL(RB):I=VAL(MID$(RB,8,2))
2620     WHILE ASC(RB)-62:BR=BR+1:GET 1,BR
2630      C=INSTR(RB,"$"):WHILE C:B=VAL(MID$(RB,C+1)):B(K,I)=B(K,I)+B:C=0:WEND
2640      E=INSTR(RB,"="):WHILE E:B=VAL(MID$(RB,E+1)):B(K,I)=B(K,I)-B:E=0:WEND
2650     WEND
2660    WEND:K=1
2670   WEND
2680  NEXT
2690  CLS:PRINT " Monthly  ";DATE$:PRINT " ";SF;"...";SE
2700  FOR E=0 TO 9:FOR G=1 TO 12:B=B(G,E)
2710   WHILE B<>0
2720    LSET RB=STR$(G+100):MID$(RB,1)="  " '..mm
2730    MID$(RB,5)="-0":MID$(RB,7)=HEX$(E)
2740    PRINT LEFT$(RB,10);:PRINT USING " #####.##";B:A1=A1+B:B=0
2750   WEND
2760  NEXT:NEXT
2770  PRINT "  Total ";:PRINT USING "$$######.##";A1:GOSUB 1060 'Print?
2780 RETURN
2790 'Quit
2800  CLOSE:RESET:KILL "pos.tmp":DM=0
2810 RETURN
