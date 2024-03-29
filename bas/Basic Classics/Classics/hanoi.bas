10 :REM'    ====  THE TOWERS OF HANOI  ====
20 :REM'                  BY
30 :REM'            MICHAEL BYRNE
40 CLEAR 93
50 CLS:GOSUB 1430:GOSUB 1510:MAX=10
60 DIM N(3),P1(MAX),P2(MAX),P3(MAX),SK(10*MAX)
70 SC=1:AL=2:DN=3:CT=0:P1(0)=99:P2(0)=99:P3(0)=99
80 NM=0:J=0:I=0:SP=0:B=0:CLS
90 INPUT"HOW MANY DISCS WOULD YOU LIKE";CT
100 IF CT>MAX PRINT"THAT WILL TAKE SOME TIME AND FIRST YOU WILL
HAVE TO  CHANGE LINE 50":END
110 IF CT<=0 PRINT"SORRY, THAT'S NOT POSSIBLE":GOTO 90
120 IF CT<=3 PRINT"YOU HAVE NO SENSE OF ADVENTURE - BUT I SUPPOSE
YOU HAVE TO START SOMEWHERE"
130 N(1)=CT:N(2)=0:N(3)=0
140 IF AN$="YES" OR AN$="NO" THEN PRINT"TYPE 'A' IF YOU WANT ME TO DO ALL THE WORK (I.E. AUTOMATIC 
OPERATION)  OTHERWISE TYPE 'M' FOR MANUAL OPERATION":PRINT"WHICH WOULD YOU LIKE ";
150 INPUT"AUTOMATIC OR MANUAL (A OR M)";MODE$
160 IF MODE$<>"A" GOTO 280
170 INPUT"HOW FAST (0 IS FASTEST, 10 IS SLOWEST)";S
180 CLS:GOSUB1160
190 GOSUB540:SP=4
200 SK(SP-3)=CT:SK(SP-2)=SC:SKK(SP-1)=DN:SK(SP)=AL
210 B=SP:SP=SP+4
220 SK(SP-3)=SK(B-3):SK(SP-2)=SK(B-2):SK(SP-1)=SK(B-1):SK(SP)=SK(B)
230 IF CT<>1 THEN GOTO 260
240 SP=SP+2:SK(SP-1)=1:SK(SP)=3:GOSUB 590
250 GOTO270
260 GOSUB 820
270 PRINT@832,"";:GOTO510
280 CLS:GOSUB 1160:S=0
290 GOSUB 540
300 PRINT@832,"                                         ";
310 PRINT@832,"FROM PEG";:INPUT F
320 PRINT@860,"TO PEG";:INPUT T
330 IF F<1 OR T<1 OR F>3 OR T>3 PRINT"NO SUCH PEG":GOTO 300
340 IF F=T PRINT"NOT ALLOWED":GOTO 300
350 IF N(F)<=0PRINT"THERE ARE NO DISCS ON PEG ";F:GOTO300
360 I=N(F):J=N(T)
370 ON F GOTO 380,410,430
380 T1=P1(I)
390 IF T=2 THEN T2=P2(J)::ELSE T2=P3(J)
400 GOTO 440
410 T1=P2(I):IF T=1 THEN T2=P1(J)::ELSE T2=P3(J)
420 GOTO 440
430 T1=P3(I):IF T=2 THEN T2=P2(J)::ELSE T2=P1(J)
440 IF T1>T2 PRINT"NOT ALLOWED":GOTO300
450 SP=SP+2:SK(SP-1)=F:SK(SP)=T
460 GOSUB 590
470 IF N(1)=0 AND N(2)=0 AND N(3)=CT THEN GOTO 480::ELSE GOTO 300
480 M=2^CT-1:PRINT@832,"                                           ":PRINT@832,"";
490 IF NM=M THENPRINT"CONGRATULATIONS! YOU DID IT" :ELSE IF NM-M<=M*0.15 THENPRINT"NOT BAD AT ALL"
500 PRINT"YOU TRANSFERRED ALL THE DISCS IN ";NM;" MOVES
510 PRINT"CARE FOR ANOTHER GAME (YES OR NO)";
520 INPUT AN$
530 IF AN$="N" OR AN$="NO"THEN CLS:END :ELSE GOTO80
540 J=CT
550 FOR I=1 TO CT
560 P1(I)=J:J=J-1:NEXT I
570 RETURN
580 :REM'=============  SHIFT DISCS
590 NM=NM+1:SE=SK(SP-1):DE=SK(SP)
600 FOR I=1 TO 30*S:NEXT I
610 I=N(SE):Y=33-(I*2)
620 IF SE<>1 THEN 640
630 TD=P1(I):X=20:GOTO 670
640 IF SE<>2 THEN 660
650 TD=P2(I):X=52:GOTO 670
660 TD=P3(I):X=84
670 P=2:SIZE=TD
680 GOSUB 1340
690 I=N(DE)+1:Y=33-(I*2)
700 IF DE<>1 THEN 720
710 P1(I)=TD:X=20:GOTO 750
720 IF DE<>2 THEN 740
730 P2(I)=TD:X=52:GOTO 750
740 P3(I)=TD:X=84
750 P=1
760 GOSUB 1340
770 N(SE)=N(SE)-1
780 N(DE)=N(DE)+1
790 SP=SP-2
800 PRINT@23,"MOVE ";NM
810 RETURN
820 :REM'=============  HANOI(RECURSIVE PROCEDURE)
830 IF SK(SP-3)>2 THEN GOTO 840 :ELSE GOTO 1010
840 B=SP:SP=SP+4
850 SK(SP-3)=SK(B-3)-1
860 SK(SP-2)=SK(B-2)
870 SK(SP-1)=SK(B)
880 SK(SP)=SK(B-1)
890 GOSUB 820
900 B=SP:SP=SP+2
910 SK(SP-1)=SK(B-2)
920 SK(SP)=SK(B-1)
930 GOSUB 590
940 B=SP:SP=SP+4
950 SK(SP-3)=SK(B-3)-1
960 SK(SP-2)=SK(B)
970 SK(SP-1)=SK(B-1)
980 SK(SP)=SK(B-2)
990 GOSUB 820
1000 GOTO 1130
1010 B=SP:SP=SP+2
1020 SK(SP-1)=SK(B-2)
1030 SK(SP)=SK(B)
1040 GOSUB 590
1050 B=SP:SP=SP+2
1060 SK(SP-1)=SK(B-2)
1070 SK(SP)=SK(B-1)
1080 GOSUB 590
1090 B=SP:SP=SP+2
1100 SK(SP-1)=SK(B)
1110 SK(SP)=SK(B-1)
1120 GOSUB 590
1130 SP=SP-4
1140 RETURN
1150 :REM'=============  DRAWPEGS
1160 CLS::REM' PROC DRAWPEGS
1170 PRINT@256,"";:A$=CHR$(191)
1180 FOR I=1 TO 7
1190 PRINT"          ";A$;"               ";A$;"               ";A$
1200 NEXT I
1210 PRINT"     ";
1220 FOR I=1 TO 44:PRINT A$;:NEXT I
1230 PRINT:PRINT"          1               2               3"
1240 Y=31:X=20
1250 FOR I=CT TO 1 STEP -1
1260    FOR J=1 TO I
1270            SET(X-J,Y)
1280            SET(X+J+2,Y)
1290    NEXT J
1300    Y=Y-2
1310 NEXT I
1320 RETURN
1330 :REM'=============  SWITCH PROCEDURE
1340 IF P=2 THEN 1390
1350 FOR J=1 TO SIZE
1360    SET(X-J,Y):SET(X+J+2,Y)
1370 NEXT J
1380 GOTO 1420
1390 FOR J=1 TO SIZE
1400    RESET(X-J,Y):RESET(X+J+2,Y)
1410 NEXT J
1420 RETURN
1430 D$=STRING$(63,"*")
1440 PRINT@256,D$
1450 PRINT D$:PRINT
1460 PRINT@463,"T H E    T O W E R S"
1470 PRINT@542,"O F    H A N O I":PRINT
1480 PRINT D$
1490 PRINT D$
1500 RETURN
1510 FORI=1 TO 1000:NEXT I
1520 PRINT@896,"DO YOU WANT INSTRUCTIONS (YES OR NO)";:INPUT AN$
1530 IF AN$<>"Y" AND AN$<>"YES" THEN RETURN
1540 CLS
1550 PRINT@23,"INSTRUCTIONS"
1560 PRINT@87,"------------":PRINT
1570 PRINT"    THERE ARE THREE PEGS.  ON ONE OF THESE IS ARRANGED,
1580 PRINT"IN ORDER OF DECREASING SIZE, A NUMBER OF DISCS.":PRINT
1590 PRINT"    THE OBJECT IS TO MOVE ALL THE DISCS FROM THE LEFTMOST"
1600 PRINT"PEG (1) TO THE RIGHTMOST PEG (3), SUBJECT TO THE FOLLOWING"
1610 PRINT"CONSTRAINTS :-":PRINT
1620 PRINT"    1. ONLY ONE DISC MAY BE MOVED AT A TIME"
1630 PRINT"    2. A DISC MAY NOT BE PLACED ON TOP OF A DISC WHICH"
1640 PRINT"IS SMALLER"
1650 GOSUB 2000
1660 PRINT@23,"PLAYING HANOI"
1670 PRINT@87,"-------------":PRINT
1680 PRINT"    THERE ARE TWO MODES OF PLAY.  THESE ARE <A>UTOMATIC"
1690 PRINT"AND <M>ANUAL AND YOU WILL BE ASKED TO SELECT ONE.":PRINT
1700 PRINT"AUTOMATIC OPERATION"
1710 PRINT"    THE COMPUTER WILL ASK YOU HOW MANY DISCS YOU WOULD LIKE"
1720 PRINT"MOVED AND HOW FAST YOU WOULD LIKE THEM MOVED.  IT WILL"
1730 PRINT"THEN PROCEED TO TRANSFER THE DISCS FROM PEG 1 TO PEG 3"
1740 PRINT"USING PEG 2 AS AN INTERMEDIATE."
1750 GOSUB 2000
1760 PRINT@23,"PLAYING HANOI"
1770 PRINT@87,"-------------":PRINT
1780 PRINT"MANUAL OPERATION"
1790 PRINT"    HERE YOU WILL BE ASKED HOW MANY DISCS YOU WOULD LIKE"
1800 PRINT"TO MOVE.  THEN YOU WILL BE PROMPTED TO TYPE THE NUMBER OF"
1810 PRINT"THE PEG THE DISC IS TO BE TAKEN OFF AND THE NUMBER OF THE"
1820 PRINT"PEG THE DISC IS TO BE PLACED ON.  WHEN YOU HAVE SUCCESSFULLY"
1830 PRINT"TRANSFERRED ALL DISCS YOU WILL BE TOLD HOW MANY MOVES"
1840 PRINT"IT TOOK."
1850 GOSUB2000
1860 PRINT@23,"SUGGESTION"
1870 PRINT@87,"----------":PRINT
1880 PRINT"    IF YOU ARE UNSURE OF THE GAME TRY AUTOMATIC OPERATION"
1890 PRINT"WITH ABOUT FOUR DISCS AND LOW SPEED (E.G. 10).  THEN SIT"
1900 PRINT"BACK AND LET THE COMPUTER DO ALL THE WORK - AFTER ALL THAT"
1910 PRINT"IS WHAT IT IS THERE FOR.":PRINT
1920 PRINT"    FOR A GIVEN NUMBER OF DISCS, N, THE SMALLEST NUMBER OF"
1930 PRINT"MOVES REQUIRED IS GIVEN BY :-"
1940 PRINT"               M = 2[N-1
1950 PRINT"SO FOR 3 DISCS THAT'S 7 MOVES, 4 DISCS 15 MOVES UP TO"
1960 PRINT"THE MAXIMUM OF 10 DISCS WHICH REQUUIRES 1023 MOVES.":PRINT
1970 PRINT"    HAVE FUN!"
1980 GOSUB 2000
1990 RETURN
2000 PRINT@960,"PRESS <NEWLINE> WHEN READY";
2010 INPUT D$:CLS
2020 RETURN
