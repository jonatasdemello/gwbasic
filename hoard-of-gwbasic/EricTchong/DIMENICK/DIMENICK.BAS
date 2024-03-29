10 ' July 1993 dimenick.bas FREEWARE 2004
20 GOTO 130
30 SAVE "dimenick":LIST-110
40 GOTO 950 ' print coins or �
50 GOTO 1090 ' display digits 1-6
60 GOTO 1190 ' print dime
70 GOTO 1200 ' print target
80 GOTO 1210 ' print penny
90 GOTO 1220 ' print nickel
100 GOTO 1310 ' get key input
110 GOTO 1350 ' print text centered
120 ' Begin
130 DEFSTR M,Q:Q=MKI$(0)
140 KEY OFF:COLOR 14,1,1:CLS
150 ' 1-3
160 A$(1)="  �  ":B$(1)=" ��� ":C$(1)=" ��� "
170 A$(2)="  �  ":B$(2)=" ��� ":C$(2)=" ��� "
180 ' 4-6
190 D$(1)=" � � ":E$(1)=" ��� ":F$(1)=" ��� "
200 D$(2)=" ��� ":E$(2)=" ��� ":F$(2)=" ��� "
210 ' Dime, target, penny, nickel
220 K$(1)="� ���":J$(1)="     ":L$(1)=" ��  ":O$(1)=" ��� "
230 K$(2)="� � �":J$(2)="     ":L$(2)="  �  ":O$(2)=" ��� "
240 K$(3)="� � �":J$(3)="  �  ":L$(3)="  �  ":O$(3)="   � "
250 K$(4)="� ���":J$(4)="     ":L$(4)=" ��� ":O$(4)=" ��� "
260 K$(5)="CENTS":J$(5)="     ":L$(5)="PENNY":O$(5)="CENTS"
270 ' Initialize messages
280 DIM M(14)
290 M(1)="The Dime-and-Nickel Switcheroo"
300 M(2)="From the Book:"
310 M(3)="PERPLEXING PUZZLES and TANTALIZING TEASERS"
320 M(4)="by Martin Gardner"
330 M(5)="GwBasic by Eric F. Tchong"
340 M(6)="At start 1c  1c  10c        Try to get 1c   �   5c"
350 M(7)="         1c   �   5c                   1c  1c  10c"
360 M(8)="By sliding one coin at a time, into a neighboring empty cell,"
370 M(9)="can you make the dime and the nickel change places?"
380 M(10)="You are allowed to move a coin"
390 M(11)="left or right,  up or down, but not diagonally..."
400 M(12)="It can be done in 17 steps."
410 M(13)="Press [Esc] to exit game..."
420 M(14)="<Press any key to start the puzzle...>"
430 ' Info about this puzzle
440 FOR I=1 TO 14
450  GOSUB 110 ' print text centered
460  IF I=4 OR I=5 OR I=7 OR I=9 OR I=12 OR I=13 OR I=14 THEN PRINT
470 NEXT
480 GOSUB 100 ' wait key pressed
490 ' Print the puzzle
500 CLS
510 A(1)=1:A(2)=0:A(3)=5:A(4)=1:A(5)=1:A(6)=10
520 V=5:FOR N=1 TO 3:F=2+9*(N-1):GOSUB 50:NEXT
530 V=2:FOR N=4 TO 6:F=2+9*(N-1)-27:GOSUB 50:NEXT
540 GOSUB 40
550 ' Get players choice
560 LOCATE 4,28:PRINT "Choose?"
570 GOSUB 100
580 IF F=27 THEN 1380
590 IF F=0 THEN 570 ELSE K=VAL(Q):LOCATE 4,35:PRINT K
600 IF K>6 THEN IF A(K)=0 THEN 570
610 IF K<1 THEN 1240
620 ' Here is the logic
630 ON K GOTO 640,670,710,740,770,810
640 IF A(2)=0 THEN SWAP A(K),A(2):GOTO 840
650 IF A(4)=0 THEN SWAP A(K),A(4):GOTO 840
660 T=T-1:GOTO 840
670 IF A(1)=0 THEN SWAP A(K),A(1):GOTO 840
680 IF A(3)=0 THEN SWAP A(K),A(3):GOTO 840
690 IF A(5)=0 THEN SWAP A(K),A(5):GOTO 840
700 T=T-1:GOTO 840
710 IF A(2)=0 THEN SWAP A(K),A(2):GOTO 840
720 IF A(6)=0 THEN SWAP A(K),A(6):GOTO 840
730 T=T-1:GOTO 840
740 IF A(1)=0 THEN SWAP A(K),A(1):GOTO 840
750 IF A(5)=0 THEN SWAP A(K),A(5):GOTO 840
760 T=T-1:GOTO 840
770 IF A(2)=0 THEN SWAP A(K),A(2):GOTO 840
780 IF A(4)=0 THEN SWAP A(K),A(4):GOTO 840
790 IF A(6)=0 THEN SWAP A(K),A(6):GOTO 840
800 T=T-1:GOTO 840
810 IF A(3)=0 THEN SWAP A(K),A(3):GOTO 840
820 IF A(5)=0 THEN SWAP A(K),A(5):GOTO 840
830 T=T-1:GOTO 840
840 GOSUB 40
850 ' Check if puzzle solved
860 T=T+1:LOCATE 15,30:PRINT "Step:";T
870 IF A(1)=1 AND A(2)=1 AND A(3)=10 AND A(4)=1 AND A(5)=0 AND A(6)=5 THEN 890
880 GOTO 560
890 LOCATE 5,28:PRINT "Genius... done in";T;"steps."
900 LOCATE 6,28:PRINT "Do you want to play again? <y/n>"
910 GOSUB 100 ' get key input 
920 IF F=27 OR F=78 OR F=110 THEN 1380 ' 27=Esc  78=N  110=n
930 T=0:GOTO 500
940 ' Print coins or �
950 V=16:FOR N=1 TO 3:F=2+9*(N-1)
960 IF A(N)=10 THEN GOSUB 60
970 IF A(N)=0  THEN GOSUB 70
980 IF A(N)=1  THEN GOSUB 80
990 IF A(N)=5  THEN GOSUB 90
1000 NEXT
1010 ' Select move
1020 V=10:FOR N=4 TO 6:F=2+9*(N-1)-27
1030 IF A(N)=10 THEN GOSUB 60
1040 IF A(N)=0  THEN GOSUB 70
1050 IF A(N)=1  THEN GOSUB 80
1060 IF A(N)=5  THEN GOSUB 90
1070 NEXT:RETURN
1080 ' Displays digits
1090 FOR P=1 TO 2:LOCATE V+P-1,F
1100 ON N GOSUB 1120,1130,1140,1150,1160,1170
1110 NEXT:RETURN
1120 PRINT A$(P):RETURN ' 1
1130 PRINT B$(P):RETURN ' 2
1140 PRINT C$(P):RETURN ' 3
1150 PRINT D$(P):RETURN ' 4
1160 PRINT E$(P):RETURN ' 5
1170 PRINT F$(P):RETURN ' 6
1180 ' Print a dime, penny, � or nickel
1190 FOR P=1 TO 5:LOCATE V+P-1,F:PRINT K$(P):NEXT :RETURN ' Dime
1200 FOR P=1 TO 5:LOCATE V+P-1,F:PRINT J$(P):NEXT :RETURN ' �
1210 FOR P=1 TO 5:LOCATE V+P-1,F:PRINT L$(P):NEXT :RETURN ' Penny
1220 FOR P=1 TO 5:LOCATE V+P-1,F:PRINT O$(P):NEXT :RETURN ' Nickel
1230 ' Player wants to reset
1240 LOCATE 5,28:PRINT "Do you want to reset the puzzle? <y/n>"
1250 GOSUB 100
1260 IF F=27 THEN 1380         ' Esc = exit
1270 IF F=89 OR F=121 THEN 930 ' 89=Y  121=y
1280 LOCATE 5,28:PRINT STRING$(40,32)
1290 GOTO 560
1300 ' Get key pressed
1310 LSET Q=MKI$(0)
1320 WHILE CVI(Q)=0:MID$(Q,1)=INKEY$:WEND
1330 F=ASC(Q):RETURN
1340 ' Print text centered
1350 X=(80-LEN(M(I)))/2:PRINT TAB(X) M(I)
1360 RETURN
1370 ' Exit
1380 KEY 5,"dimenick.bas":KEY 6,CHR$(34)+",a":KEY ON
1390 SCREEN 0,0,0:CLS:END
