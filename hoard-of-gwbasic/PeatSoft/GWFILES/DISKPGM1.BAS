5 ' *DISKPGM1.BAS     PROGRAM TO PRINT WHAT IS ON THE DISK AND GIVE IT A TITLE
10 CLS
20 PRINT "(C) Copyright, Richard Schinnell,Rockville, MD. 20853 (301) 949-8848
30 PRINT "THIS PROGRAM WILL CHECK AN ASCII FILE ON DISK FOR LINES/BYTES AND
40 PRINT"(PROGRAM REQUIRES BASICA) AND THE TIME IT WILL TAKE TO DOWNLOAD IT.
50 PRINT"PLACE YOUR PRINTER ON LINE AND PUT IT TO THE TOP OF A PAGE PLEASE.
60 PRINT:LOCATE 10,1,1:COLOR 28,0:
70 LOCATE 10,1,1:COLOR 28,0:PRINT" WHAT NAME DO YOU WANT TO PRINT ON THE PRINTER AS THE"
80 PRINT" NAME OF THE DISK ? ":LOCATE 15,15:COLOR 7,0:INPUT X$:IF LEN(X$)>50 THEN PRINT" LENGTH IS GREATER THAN 50 PLEASE RE INPUT DISK NAME >>>>> ":GOTO 70
90 TITLE$=X$
100 COLOR 28,0:PRINT" WHICH DISK DRIVE DO YOU WANT TO CHECK> A OR B :":COLOR 7,0
110 RICH$=INKEY$:IF LEN(RICH$)<>1 THEN 110
120 IF LEFT$(RICH$,1)="A" OR LEFT$(RICH$,1) ="B" THEN DRIV$=LEFT$(RICH$,1)+":" ELSE 100
130 ON ERROR GOTO 660
140 LPRINT"  FILE SORTING AND PRINTING PROGRAM BY RICH SCHINNELL":LPRINT
150 FALSE=0:TRUE=NOT FALSE:DEFINT A-Z:L=0:CLS:CODE=43:DIM F$(75)
160 FILES DRIV$+"*.*"
170 CLINE1 = CSRLIN
180 D=0
190 LOCATE 1,1,1
200 FOR I = 1 TO CLINE1
210 FOR B = 1 TO 66 STEP 13
220 D=D+1
230 FOR N = 0 TO 11
240 T = SCREEN(I,(B+N)):F$(D)=F$(D)+CHR$(T)
250 NEXT N
260 IF LEFT$(F$(D),1)=" " THEN D=D-1 :GOTO 300
270 F$(D)= DRIV$+F$(D)
280 NEXT B
290 NEXT I
300 LOCATE 15,1:COLOR 26,0:PRINT "ALPHABETIZING THE FILE NAMES ":COLOR 7,0
310 ' THIS ALPHABETIZES THE ARRAY
320 FOR X=1 TO D-1:FOR Y=X+1 TO D:IF F$(Y)<F$(X) THEN SWAP F$(X),F$(Y)
330 NEXT Y:NEXT X
340 CLS:LOCATE 12,25:COLOR 28,0:PRINT " WORKING FILES ":COLOR 7,0:LPRINT "This program prints the files on disk and then"
350 LPRINT"prints the lines/bytes/minutes/seconds to transfer"
360 LPRINT"the files at 300 baud. The words PROBABLY NOT IN "
370 LPRINT"ASCII  is an indication of control characters in your file.
380 LPRINT:LPRINT" (C) COPYRIGHT,1982, RICHARD SCHINNELL,ROCKVILLE,MD"
390 LPRINT
400 LPRINT" TITLE>>> ";TITLE$
410 LPRINT
420 LPRINT" AS OF ";TIME$;" ON ";DATE$
430 LPRINT       " FILESPEC           LINES   BYTES  MIN SEC "
440 LPRINT       "------------------   ----   -----   -- --   COMMENTS!!!!!"
450 FOR P = 1 TO D
460 CNT=0:L#=0:M=0:S=0:COMENT$=""
470 OPEN F$(P) FOR INPUT AS #1
475 CLS:LOCATE 12,25:COLOR 28,0:PRINT " WORKING FILE ";F$(P):COLOR 7,0
480 IF EOF(1) THEN 500
490 LINE INPUT #1,A$:L#=L#+LEN(A$):CNT=CNT+1:GOTO 480
500 CLOSE:OPEN F$(P) FOR INPUT AS #1
510 IF EOF(1) THEN 530
520 LINE INPUT #1,A$:A$=LEFT$(A$,80)
530 CLOSE
540 FOR I=1 TO LEN(A$):IF ASC(MID$(A$,I,1))<17 OR ASC(MID$(A$,I,1))>126 THEN F$(P)="**"+MID$(F$(P),3,12):NEXT I
550 IF LEFT$(F$(P),2)= "**" THEN CNT=0:L#=0:M=0:S=0:COMENT$="PROBABLY NOT IN ASCII":F$(P) = DRIV$+MID$(F$(P),3,12):GOTO 580
560 T=INT(L#/22.5):M=INT(T/60):S=T-M*60
570 IF S<1 THEN S=1
580 F$(P) = "  "+MID$(F$(P),3,12)
590 LPRINT USING "\             \     ####    #####  ##  ##  \                   \";F$(P);CNT;L#;M;S;COMENT$
595 TOT#=TOT#+L#
600 NEXT P
610 LPRINT:LPRINT
620 LPRINT P-1;" FILES DISK TITLE>> ";TITLE$:LPRINT " TOTAL OF ";TOT#;" ASCII BYTES "
630 LPRINT:LPRINT
640 CLS:PRINT "YOU ARE BACK IN BASIC NOW "
650 END
660 PRINT "ERROR ";ERR;" HAS OCCURED IN LINE # ";ERL
670 IF ERR>23 AND ERR<27 THEN PRINT " PLACE YOUR PRINTER ON LINE PLEASE:
680 END
"ERROR ";ERR;" HAS OCCURED IN LINE # ";ERL
670 IF ERR>23 AND ERR<27 THEN PRINT " PLACE YOUR PRIN