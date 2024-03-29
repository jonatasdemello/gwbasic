1 CLS:KEY OFF
10 REM------------------------------------------------------
20 REM
30 REM                     DUMP.BAS
40 REM      Print contents of the entire b-tree
50 REM
60 REM-------------------------------------------------------
70 GOTO 270
80 REM-----------------------------------------------------
90 REM
100 REM                 read.bas
110 REM    input a b-tree node from disk file #1
120 REM
130 REM-----------------------------------------------------
140 GET 1, P%:LSET REC$=R$
150 FOR INDEX%=1 TO N%
160   CH%=SIZE% *(INDEX%-1)
170   FLAG$=MID$(REC$,CH%+1,1)
180   IF FLAG$="E" THEN FLAG%(INDEX%)=0
190   IF FLAG$="F" THEN FLAG%(INDEX%)=1
200   IF FLAG$="D" THEN FLAG%(INDEX%)=2
210  KEYS$(INDEX%)=MID$(REC$,CH%+2,SIZE%-3)
220  ARC%(INDEX%)=CVI(MID$(REC$,CH%+SIZE%-1,2))
230 NEXT INDEX%
240 ARC%(N%+1)=CVI(MID$(REC$,126,2))
250 RETURN
260 REM
270 REM------------------------------------------------
280 REM
290 REM            QUICK READ-OUT OF B-TREE INDEX FILE
300 REM------------------------------------------------
310 FOR I%=1 TO  5:PRINT:NEXT I%
320 OPEN "I",2, "HEADER.DAT"
330   INPUT #2, FSCREEN$,ROOT%,LNG%,LNF%,AN%,LINS%,N%,SIZE%,INDEX$,MAST$
340 CLOSE 2
350 N0%=N%+1:DIM FLAG%(N0%),KEYS$(N0%),ARC%(N0%)
360 OPEN "R",1, INDEX$
370 FIELD 1,127 AS R$
380 REC$=SPACE$(128):LSET ZERO$="0"
390 K$=SPACE$(SIZE%-3)
400 INPUT"Turn on printer, Strike RETURN :" ;Y$
410 LPRINT"Quick dump of B-tree index file: "
420 LPRINT:LPRINT
430 P%=0
440 FOR I1%=1 TO LNF%
450   P%=P%+1:GOSUB 80          'read a node
460   LPRINT"------------------------------- Node = ",P%,"-----------------"
470   FOR I%=1 TO N%
480     IF FLAG%(I%)=0 THEN C$="Empty"
490     IF FLAG%(I%)=1 THEN C$="Full"
500     IF FLAG%(I%)=2 THEN C$="Deleted"
510     LPRINT "Flag =";C$;
520     LPRINT " Key =";KEYS$(I%);
530     LPRINT " Arc ="; ARC%(I%)
540   NEXT I%
550   LPRINT "Link = ";ARC%(N0%)
560 NEXT I1%
570 CLOSE 1
580 REM-----------------------other stuff-------------------------------
590 LPRINT:LPRINT
600 LPRINT"Root node =",ROOT%
610 LPRINT"Number items indexed =",LNG%
620 LPRINT"Number of nodes(sectors)= ",LNF%
630 LPRINT"Number of fields per input form = ",AN%
640 LPRINT"Number of lines per input form  = ",LINS%
650 LPRINT"Number of items per node(sector)= ",N%
660 LPRINT"Size(chars) of each node item   = ",SIZE%
670 LPRINT"Name of master(data) file       = ",MAST$
680 LPRINT"Name of index file (b-tree)     = ",INDEX$
690 RUN "dbmenu"
700 END
