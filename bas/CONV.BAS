10 ' COPYRIGHT 1982, RICHARD M. SCHINNELL
20 ' This Program is called CONV.BAS
30 ON ERROR GOTO 660
40 CLS:LOCATE 12,1
50 PRINT"COPYRIGHT 1982, Richard Schinnell Rockville,Maryland 301 949-8848 "
60 PRINT"This program will convert .COM files to a basic program which"
70 PRINT"you then can transmit to someone over the Telephone. They
80 PRINT"can then run the basic program and it will re-create the .COM pgm.
90 PRINT"just like you had it.       E N J O Y   RICH......":PRINT
100 INPUT "Name of the COM or EXE File to convert (<5001 Bytes )?: ";FIL1$
110 PRINT "To call the program with the same name with .BAS ext hit C/R"
120 INPUT "WHAT do you wish to call the basic program ?: ";FIL2$
130 IF LEN(FIL2$)<1 THEN FIL2$=MID$(FIL1$,1,(INSTR(FIL1$,".")-1))+".BAS"
140 RICH$="1000 DATA ":NUMLIN=1010:X=0:GRAND#=0:CNT=1
150 IF FIL1$=FIL2$ THEN CLS:LOCATE 12,15:PRINT "DUPLICATE FILE NAMES ":GOTO 10
160 OPEN FIL1$ FOR INPUT AS #1:CLOSE #1
170 OPEN  FIL1$  AS #1 LEN=1 ' opening the .COM file
180 V= VARPTR(#1) ' looking at the FCB
190 L0=PEEK(V) ' getting the type of file
200 IF L0<>4 THEN 660 ' if file not random then abort
210 L1=PEEK(V+17) + 256 * PEEK(V+18) ' this gets the filesize in bytes
220 LIMIT = L1:IF LIMIT>5000 THEN GOTO 660  ' if it's too big then abort
230 OPEN  FIL2$  FOR OUTPUT AS #2 ' opening up the .bas file this pgm creates
240 GOSUB 440
250 PRINT #2," 99 DATA ";STR$(LIMIT)
260 FIELD #1,1 AS GETS$
270 X =X +1:IF X =< LIMIT THEN GET #1,X ELSE 370
280 RICH1$=STR$(ASC(GETS$))
290 IF CNT <13 THEN RICH$=RICH$+MID$(RICH1$,2,LEN(RICH1$)-1)+",":CNT=CNT+1:GRAND#=GRAND#+ASC(GETS$):GOTO 270
300 GOTO 370
310 LOCATE 20,5:PRINT     "total ASCII count is ";GRAND#
320 PRINT #2,"5000 PRINT ";CHR$(34);"* * ERROR VERIFY DATA * * * ";CHR$(34)
330 PRINT #2,"5010 CLOSE:END"
340 LOCATE 18,1:PRINT SPC(78);:LOCATE 18,1:PRINT RICH$;
350 LOCATE 20,1:PRINT" You have sucessfully created file named ";FIL2$
360 CLOSE:END
370 RICH$=LEFT$(RICH$,(LEN(RICH$)-1))
380 CNT=1:PRINT #2,RICH$:NUMLIN=NUMLIN+1
390 LOCATE 18,1:PRINT SPC(78);:LOCATE 18,1:PRINT RICH$;
400 IF X = LIMIT+1 THEN PRINT #2, RIGHT$(STR$(NUMLIN),4);" DATA ";STR$(GRAND#):GOTO 320
410 LIN$=RIGHT$(STR$(NUMLIN),4)
420 RICH$=LIN$+" DATA "+MID$(RICH1$,2,LEN(RICH1$)-1)+",":GRAND#=GRAND#+ASC(GETS$)
430 GOTO 270
440 PRINT #2,"  1 CLS:PRINT ";CHR$(34);"THIS basic PROGRAM WAS AUTOMATICALLY CREATED BY CONVERT.BAS";CHR$(34)
450 IF INSTR(FIL1$,":")=2 THEN FIL3$=MID$(FIL1$,3,13) ELSE FIL3$=FIL1$
460 PRINT #2,"  2 PRINT";CHR$(34);"Copyright 1982 ,Rich Schinnell Rockville,MD. Not for Sale.";CHR$(34)
470 PRINT #2,"  3 PRINT ";CHR$(34);"This program will automatically generate you a .COM program named ";FIL3$;CHR$(34);":PRINT "
480 PRINT #2,"  4 ON ERROR GOTO 5000"
490 PRINT #2,"  6 INPUT ";CHR$(34);"PLACE the disk to write the file TO in Default Drive (A: Usually) HIT <ENTER> ";CHR$(34);"; SCHINNELL$"
500 PRINT #2,"  9 PRINT:PRINT ";CHR$(34);" Now reading the data statements, wait!";CHR$(34)
510 PRINT #2," 10 RESTORE:READ T:FOR I = 1 TO T:READ N:X#=X#+N:NEXT I"
520 PRINT #2," 20 READ TOT# :IF TOT#<>X# THEN 5000"
530 PRINT#2," 22 CLS:LOCATE 12,5:PRINT ";CHR$(34);"Now writing file NAMED ";FIL1$;" standby please  ASCII COUNT IS ";CHR$(34);";TOT#"
540 PRINT #2," 30 RESTORE"
550 PRINT #2," 40 OPEN ";CHR$(34);"R";CHR$(34);", #1,";CHR$(34);FIL3$;CHR$(34);",1 "
560 PRINT #2," 50 FIELD #1, 1 AS N$
570 PRINT #2," 60 READ N"
580 PRINT #2," 70 FOR I = 1 TO N
590 PRINT #2," 80 READ N:LSET N$=CHR$(N):
600 PRINT #2," 92 PUT #1 :NEXT I:CLOSE"
610 PRINT #2," 94 PRINT ";CHR$(34); FIL3$;" CREATED * *";CHR$(34);":GOTO 5010"
620 CLS:LOCATE 12,5:PRINT "I am now reading file named ";FIL1$
630 LOCATE 14,5:PRINT     "I am now writing file named ";FIL2$
640 LOCATE 16,5:PRINT     "the file size of the input file is ";LIMIT
650 RETURN
660 PRINT " you had an error ";ERR;" in line # ";ERL
670 PRINT "Probably you named a file which does not exist "
680 PRINT "try again Charlie........
690 END
