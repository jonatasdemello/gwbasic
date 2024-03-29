5 CLS:KEY OFF:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 10-57
12 '********************* LPT1 AND LPT2 TOGGLE PROGRAM ************************
16 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
18 '�         PROGRAM TO DIRECT OUTPUT LPT1: OR LPT2: (PARALLEL)              �
20 '�                                                                         �
22 '�     When you purchase an expansion board for the IBM with a second      �
24 '� parallel port (LPT2:), the accompanying documentation usually states    �
26 '� that you can "address" the port with appropriate software; however,     �
28 '� the software is hard to find.  This program will toggle the computer    �
30 '� output between LPT1: and LPT2:. You can use the routine in an AUTOEXEC  �
32 '� program with a word-processor.  If you use it in this fashion, return   �
34 '� to SYSTEM before calling up a .COM or .EXE word processor file. You     �
36 '� may "REM" or DELETE all of the PRINT lines from 220 on to eliminate the �
38 '� statements which report the state of the appropriate address ports.     �
40 '� Run BLUEBERY.BAS or LABELPRO.BAS for an example of this routine being   �
42 '� worked into an application program.  This program may be used in whole  �
44 '� or in part without attribution or license.                              �
46 '�                 (c) G I N A C O  -- 1968            Ver 5.2/320/160     �
50 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLS:SCREEN 0,0,0:WIDTH 80:KEY OFF:FOR I=1 TO 10:KEY I,"":NEXT:CLEAR
110 DEF SEG = &H40
120 PRINT PEEK(&H8), PEEK(&H9), PEEK(&HA), PEEK(&HB)
130 PRINT "&H8";" ="; PEEK(&H8),"&H9";" ="; PEEK(&H9),"&HA";" ="; PEEK(&HA),"&HB";" ="; PEEK(&HB)
140 A! = PEEK(&H8)
150 B! = PEEK(&H9)
160 C! = PEEK(&HA)
170 D! = PEEK(&HB)
180 POKE &H8,C!
190 POKE &H9,D!
200 POKE &HA,A!
210 POKE &HB,B!
220 PRINT PEEK(&H8), PEEK(&H9), PEEK(&HA), PEEK(&HB)
230 PRINT "&H8";" ="; PEEK(&H8),"&H9";" ="; PEEK(&H9),"&HA";" ="; PEEK(&HA),"&HB";" ="; PEEK(&HB)
240 IF PEEK(&H9) = 3 THEN LPT$ = "1" ELSE LPT$ = "2"
250 PRINT:PRINT "PRIMARY PRINTER =LPT";LPT$ + ":"
260 PRINT:PRINT;CHR$(34);"R U N";CHR$(34);" again to change primary printer."
270 :REM PRINT"A";A,"B";B,"C";C,"D";D
280 FOR I! = 1 TO 1000
290 NEXT
300 PRINT:PRINT"Change LINE 180 to ";CHR$(34);"SYSTEM";CHR$(34);" when used in an AUTOEXEC.BAT program."
310 END
65000 '***********************  SAVE ROUTINE  *******************************
65100 SAVE"B:LPT12SET.BAS"
