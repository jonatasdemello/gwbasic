1  REM-------------------------------------------------------
2 REM
3 REM                    backup.BAS
4 REM      copy b-tree index file and master data file
5 REM         remove deleted items in the database
6 REM--------------------------------------------------------
7 CLS:KEY OFF
10 GOTO 1100          'branch to main program
20 REM ----------------SUROUTINES---------------------
30 REM
100 REM--------------------------------------------------
105 REM
110 REM                    READ.BAS
115 REM    INPUT A B-TREE NODE FROM DISK FILE #1
120 REM---------------------------------------------------
130 GET 1,P%:LSET REC$=R$
131 FOR INDEX%=1 TO N%
132    CH%=SIZE% *(INDEX%-1)
133    FLAG$=MID$(REC$,CH%+1,1)
134    IF FLAG$="E" THEN FLAG%(INDEX%)=0
135    IF FLAG$="F" THEN FLAG%(INDEX%)=1
136    IF FLAG$="D" THEN FLAG%(INDEX%)=2
137    KEYS$(INDEX%)=MID$(REC$,CH%+2,SIZE%-3)
138    ARC%(INDEX%)=CVI(MID$(REC$,CH%+SIZE%-1,2))
139  NEXT INDEX%
140 ARC%(N%+1)=CVI(MID$(REC$,126,2))
145 RETURN
150 REM-----------------------------------------------------
155 REM
160 REM                     WRITE.BAS
165 REM     OUTPUT A B-TREE NODE TO FILE #1
170 REM
175 REM-----------------------------------------------------
180 FOR INDEX%=1 TO N%
181   CH%=SIZE% *(INDEX%-1)
182   ON FLAG%(INDEX%)+1 GOTO 183,184,185
183    FLAG$="E":GOTO 186
184    FLAG$="F":GOTO 186
185    FLAG$="D"
186   MID$(REC$,CH%+1,1)=FLAG$
187   MID$(REC$,CH%+2,SIZE%-3)=KEYS$(INDEX%)
188   MID$(REC$,CH%+SIZE%-1,2)=MKI$(ARC%(INDEX%))
189 NEXT INDEX%
190 MID$(REC$,126,2)=MKI$(ARC%(N%+1))
195 LSET NR$=REC$:PUT G%,LNF%
199 RETURN
250 REM--------------------------------------
251 REM
252 REM               restore a b-tree node
253 REM--------------------------------------
260 FOR INDEX%=1 TO N%+1
262  FLAG%(INDEX%)=SFLAG%(INDEX%)
264  KEYS$(INDEX%)=SKEYS$(INDEX%)
266  ARC%(INDEX%)=SARC%(INDEX%)
268 NEXT INDEX%
270 RETURN
500 REM---------------------------------------------
501 REM
502 REM    search b-tree for left-most item, only
503 REM---------------------------------------------
510 PRINT:D$="Found": P0%=ROOT%
515 GOSUB 100          'read a node
520 IF ARC%(1)=0 THEN 525 ELSE 535
525   PRINT:LINE INPUT "File is empty. Strike RETURN ";Y$
530  PRINT:D$="Not found":RETURN
535 IF ARC%(1)<0 THEN 540 ELSE 545
540   ITEM%=1 :RETURN
545 P0%=ARC%(1)
550 GOTO 515
700 REM------------------------------------------
701 REM     read next sequential node
702 REM------------------------------------------
710 D$="":P0%=LINK%
720 IF P0%=0 THEN 725 ELSE 740
725   PRINT:D$="Done":RETURN
740 GOSUB 100:ITEM%=1:RETURN
750 REM----------------------------------------
751 REM   fill new index file node
752 REM-----------------------------------------
755 FOR NI%=NI% TO N%
760  SKEYS$(NI%)=ZERO$
765  SFLAG%(NI%)=0
770  SARC%(NI%)=0
775 NEXT NI%
780 IF D$="Done" THEN SARC%(N%+1)=0 ELSE SARC%(N%+1)=LNF%+1
795 RETURN
1000 REM------------------------------
1001 REM  finish up
1002 REM------------------------------
1005 REM
1015 CLOSE 1,2
1020 OPEN "O",2,"HEADER.DAT"
1025 PRINT #2,FSCREEN$;",";ROOT%;NPTR%-1;LNF%-1;AN%;LINS%;N%;SIZE%;
1030 PRINT #2,INDEX$;MAST$
1035 CLOSE 2
1040 RETURN
1100 REM--------------------------------------
1101 REM    COPY AND GARBAGE COLLECT
1102 REM--------------------------------------
1110 OPEN "I",2,"HEADER.DAT"
1115  INPUT #2,FSCREEN$,ROOT%,LNG%,LNF%,AN%,LINS%,N%,SIZE%,INDEX$,MAST$
1120 CLOSE 2
1125 N0%=N%+1:DIM FLAG%(N0%),KEYS$(N0%),ARC%(N0%)
1130          DIM SFLAG%(N0%),SKEYS$(N0%),SARC%(N0%)
1135 OPEN "R",1,INDEX$
1140 FIELD 1, 127 AS R$
1145 REC$=SPACE$(127):ZERO$=SPACE$(SIZE%-3):LSET ZERO$="0"
1150 OPEN "R",2,MAST$
1155   FIELD 2,127 AS MR$
1200 REM--------------------------------------------
1201 REM
1202 REM      NOW THAT THE FILES ARE OPEN, ETC.
1203 REM      CREATE BACKUP COPIES...
1204 REM--------------------------------------------
1270 LINE INPUT"Enter name of backup data file : ";NW$
1275 LINE INPUT"        Correct (Y/N) ?";Y$
1280 IF Y$<>"Y" AND Y$<>"y" THEN 1270
1290 LINE INPUT"Enter name of backup index file : ";OUTDEX$
1300 LINE INPUT"        Correct (Y/N) ?";Y$
1310 IF Y$<>"Y" AND Y$<>"y" THEN 1290
1320 PRINT"Busy working..."
1330 OPEN "R",3,OUTDEX$
1340 FIELD 3,127 AS NR$
1350 G%=3
1360 OPEN "R",4,NW$
1370  FIELD 4,127 AS RR$
1380 GOSUB 500
1390 IF D$="Not Found" THEN 1395 ELSE 1400
1395   CLOSE 1,2,3,4 :RUN "dbmenu"
1400 REM-----------------copy from old master to new--------------------
1470 NPTR%=1:LNF%=1:ITEM%=1
1480 REM ----------loop-------------------
1490  FOR NI%=1 TO N%-1
1492  IF ITEM%=N% THEN GOSUB 700
1496  IF D$="Done" THEN 1760
1500  MPTR%=-ARC%(ITEM%)
1505  IF MPTR%=0 THEN 1506 ELSE 1510
1506    ITEM%=ITEM%+1
1507    GOTO 1492
1510  IF FLAG%(ITEM%)=2 THEN 1506
1550  GET 2,MPTR%
1560  LSET RR$=MR$
1570  PUT 4,NPTR%
1580 REM----copy index info-------
1590  SKEYS$(NI%)=KEYS$(ITEM%)
1600  SFLAG%(NI%)=1
1610  SARC%(NI%)=-NPTR%
1630 REM-----update new master pointer
1650    NPTR%=NPTR%+1
1700 REM -----update old index info----------
1720    ITEM%=ITEM%+1
1750 NEXT NI%
1751 PRINT"Calm down, I'm still working on it..."
1755 IF (KEYS$(ITEM%)=ZERO$) AND (LINK%=0) THEN 1756 ELSE 1760
1756  D$="Done":SARC%(N%+1)=0
1760 GOSUB 750:GOSUB 250:GOSUB 150
1770 LNF%=LNF%+1
1780  IF D$="Done" THEN 1850 ELSE 1490
1850 REM------------------------------------------
1851 REM   close  files and redefine header file
1852 REM------------------------------------------
1880 CLOSE 1,2,3,4
1890 INDEX$=OUTDEX$
1900 MAST$=NW$
1910 PRINT"Data file re-organized. Now for the index file..."
1930 REM--------------do b-tree tier by tier--------------------
1950 P0%=1:ROOT%=LNF%
1960 OPEN "R",1,OUTDEX$
1965 G%=1:FIELD,1127 AS NR$
1980 REM---------------------find last key and move it up-----------------
2000 KOUNT%=1:D$=""
2010 FOR ITEM%=1 TO N%-1
2020  GOSUB 100:SFAG%(ITEM%)=1
2030  I%=0
2031   I%=I%+1
2032   SKEYS$(ITEM%)=KEYS$(N%-I%)
2033   IF KEYS$(N%-I%)=ZERO$ THEN 2031
2060  SARC%(ITEM%)=P0%
2070  P0%=LINK%
2080  IF P0%=0 THEN 2100
2090 NEXT ITEM%
2100 REM---------finish off node-------------------
2105 PRINT"You are being so patient..."
2130 IF P0%=0 THEN 2140 ELSE 2250
2140  D$="Done":NI%=ITEM%+1:GOSUB 750
2150  GOSUB 250:GOSUB 150
2155  P0%=ROOT%:ROOT%=LNG%+1:LNF%=ROOT%
2160 GOTO 2330
2200 REM---------------more still to come---------------------------
2250   KOUNT%=KOUNT%+1
2255   NI%=N%
2260   GOSUB 750:GOSUB 250:GOSUB 150
2270   LNF%=LNF%+1:GOTO 2010
2330 IF KOUNT%=1 THEN 2340 ELSE 2000
2340 PRINT"Done at last."
2390 ROOT%=ROOT%-1:GOSUB 1000
2400 RUN "dbmenu"
2500 END
