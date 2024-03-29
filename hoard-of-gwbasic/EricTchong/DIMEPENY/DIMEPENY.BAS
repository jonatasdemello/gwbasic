10 ' July 1993 dimepeny.bas FREEWARE 2004
20 GOTO 120
30 SAVE "dimepeny":LIST-100
40 GOTO 860 ' select move
50 GOTO 920 ' display digits 1-5
60 GOTO 1010 ' print dime
70 GOTO 1020 ' print empty place
80 GOTO 1030 ' print penny
90 GOTO 1120 ' get key input
100 GOTO 1160 ' print text centered
110 ' Begin
120 DEFSTR M,Q:Q=MKI$(0)
130 KEY OFF:COLOR 14,1,1:CLS
140 A$(1)=" ��  ":B$(1)=" ��� ":C$(1)=" ��� ":D$(1)=" � � ":E$(1)=" ��� "
150 A$(2)="  �  ":B$(2)=" ��� ":C$(2)=" ��� ":D$(2)=" ��� ":E$(2)=" ��� "
160 A$(3)=" ��� ":B$(3)=" ��� ":C$(3)=" ��� ":D$(3)="   � ":E$(3)=" ��� "
170 ' Dime, target, penny
180 K$(1)="� ���":J$(1)="     ":L$(1)=" ��  "
190 K$(2)="� � �":J$(2)="     ":L$(2)="  �  "
200 K$(3)="� � �":J$(3)="  �  ":L$(3)="  �  "
210 K$(4)="� ���":J$(4)="     ":L$(4)=" ��� "
220 K$(5)="CENTS":J$(5)="     ":L$(5)="PENNY"
230 ' Initialize messages
240 DIM M(11)
250 M(1)="The Dime-and-Penny Switcheroo"
260 M(2)="From the Book:"
270 M(3)="PERPLEXING PUZZLES and TANTALIZING TEASERS"
280 M(4)="by Martin Gardner"
290 M(5)="GwBasic by Eric F. Tchong"
300 M(6)="Start with 2 dimes and 2 pennies:       10c 10c �  1c  1c"
310 M(7)="Switch the 4 coins in exactly 8 moves:  1c  1c  � 10c 10c"
320 M(8)="1. You can slide any coin into an empty space next to it."
330 M(9)="2. You can jump  any coin over the coin next to it, like "
340 M(10)="a jump in checkers, provided you land on an empty space."
350 M(11)="<Press any key to start the puzzle...>"
360 ' Info about this puzzle
370 FOR I=1 TO 11
380  GOSUB 100
390  IF I=4 OR I=5 OR I=7 OR I=8 OR I=10 THEN PRINT
400 NEXT
410 GOSUB 90 ' wait key pressed
420 ' Print the puzzle
430 CLS
440 R=5:A(1)=10:A(2)=10:A(3)= 0:A(4)=1:A(5)=1
450 V=10:FOR N=1 TO R:F=2+9*(N-1):GOSUB 50:NEXT
460 GOSUB 40
470 ' Get players choice
480 LOCATE 5,1:PRINT "Choose? "
490 GOSUB 90
500 IF F=27 THEN 1190
510 IF F=0 THEN 490 ELSE K=VAL(Q):LOCATE 5,8:PRINT K
520 IF K>5 THEN IF A(K)=0 THEN 490
530 IF K<1 THEN 1050
540 ' Here is the logic
550 ON K GOTO 560,590,630,680,720
560 IF A(2)=0 THEN SWAP A(K),A(2):GOTO 750
570 IF A(3)=0 THEN SWAP A(K),A(3):GOTO 750
580 T=T-1:GOTO 750
590 IF A(1)=0 THEN SWAP A(K),A(1):GOTO 750
600 IF A(3)=0 THEN SWAP A(K),A(3):GOTO 750
610 IF A(4)=0 THEN SWAP A(K),A(4):GOTO 750
620 T=T-1:GOTO 750
630 IF A(1)=0 THEN SWAP A(K),A(1):GOTO 750
640 IF A(2)=0 THEN SWAP A(K),A(2):GOTO 750
650 IF A(4)=0 THEN SWAP A(K),A(4):GOTO 750
660 IF A(5)=0 THEN SWAP A(K),A(5):GOTO 750
670 T=T-1:GOTO 750
680 IF A(3)=0 THEN SWAP A(K),A(3):GOTO 750
690 IF A(5)=0 THEN SWAP A(K),A(5):GOTO 750
700 IF A(2)=0 THEN SWAP A(K),A(2):GOTO 750
710 T=T-1:GOTO 750
720 IF A(4)=0 THEN SWAP A(K),A(4):GOTO 750
730 IF A(3)=0 THEN SWAP A(K),A(3):GOTO 750
740 T=T-1:GOTO 750
750 GOSUB 40
760 ' Check if puzzle solved
770 T=T+1:LOCATE 5,61:PRINT "Step:";T
780 IF A(1)=1 AND A(2)=1 AND A(3)=0 AND A(4)=10 AND A(5)=10 THEN 800
790 GOTO 480
800 LOCATE 6,1:PRINT "Magnificent... done in";T;"steps."
810 LOCATE 7,1:PRINT "Once again? <y/n>"
820 GOSUB 90
830 IF F=27 OR F=78 OR F=110 THEN 1190  ' 78=N  110=n
840 T=0:GOTO 430
850 ' Select move
860 V=15:FOR N=1 TO R:F=2+9*(N-1)
870 IF A(N)=10 THEN GOSUB 60 ' dime
880 IF A(N)=0  THEN GOSUB 70 ' target
890 IF A(N)=1  THEN GOSUB 80 ' penny
900 NEXT:RETURN
910 ' Displays digits
920 FOR P=1 TO 3:LOCATE V+P-1,F
930 ON N GOSUB 950,960,970,980,990
940 NEXT:RETURN
950 PRINT A$(P):RETURN ' 1
960 PRINT B$(P):RETURN ' 2
970 PRINT C$(P):RETURN ' 3
980 PRINT D$(P):RETURN ' 4
990 PRINT E$(P):RETURN ' 5
1000 ' Print a dime, penny or �
1010 FOR P=1 TO 5:LOCATE V+P-1,F:PRINT K$(P):NEXT:RETURN ' Dime
1020 FOR P=1 TO 5:LOCATE V+P-1,F:PRINT J$(P):NEXT:RETURN ' �
1030 FOR P=1 TO 5:LOCATE V+P-1,F:PRINT L$(P):NEXT:RETURN ' Penny
1040 ' Player wants to reset
1050 LOCATE 6,1:PRINT "Do you want to reset the puzzle? <y/n>"
1060 GOSUB 1120
1070 IF F=27 THEN 1190
1080 IF F=89 OR F=121 THEN 840 ' 89=Y  121=y
1090 LOCATE 6,1:PRINT STRING$(40,32)
1100 GOTO 480
1110 ' Get key pressed
1120 LSET Q=MKI$(0)
1130 WHILE CVI(Q)=0:MID$(Q,1)=INKEY$:WEND
1140 F=ASC(Q):RETURN
1150 ' Print text centered
1160 X=(80-LEN(M(I)))/2:PRINT TAB(X) M(I)
1170 RETURN
1180 ' Exit
1190 KEY 5,"dimepeny.bas":KEY 6,CHR$(34)+",a":KEY ON
1200 SCREEN 0,0,0:CLS:END
