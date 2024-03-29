10 ' digfungw.bas - FreeWare 2005 by Eric Tchong
20 GOTO 110 ' begin
30 SAVE "digfungw.bas",A:LIST-90
40 GOTO 430  ' recursive sub
50 GOTO 560  ' check for 26
60 GOTO 790  ' setup screen
70 GOTO 860  ' check level
80 GOTO 910  ' print@ to locate
90 GOTO 990  ' wait for key
100 GOTO 1020 ' centered text
110 AN=26:COLOR 15,0:DEFSTR M,Q:Q=MKI$(0)            ' locals
120 L=0:F2$="##":F3$="###":C=0:AC=0:TC=0:J=0:X$="   ":X=0:Y=0
130 DIM I(12),A(220,12),B(12),SP(12),M(17):KEY OFF:CLS
140 M(1)="This program searches 3 sets of 4 numbers"
150 M(2)="that will add to 26 and will show this at"
160 M(3)="the end of it's search in a square map...":PRINT
170 M(4)="Press to start..."
180 M(5) ="           浜様様様様曜様様様様様�"
190 M(6) ="           �          �          �"
200 M(7)=M(6):M(15)=M(6):M(16)=M(6)
210 M(8) ="浜様様様様洋様様様様様陵様様様様洋様様様様様�"
220 M(9) ="�          �          �          �          �"
230 M(10)=M(9):M(12)=M(9):M(13)=M(9)
240 M(11)="麺様様様様洋様様様様様陵様様様様洋様様様様様�"
250 M(14)="藩様様様様洋様様様様様陵様様様様洋様様様様様�"
260 M(17)="           藩様様様様擁様様様様様�"
270 FOR I=1 TO 4
280  GOSUB 100:IF I=3 THEN PRINT
290 NEXT:GOSUB 90
300 I(0)=0:CLS
310 GOSUB 60:GOSUB 40 ' setup screen - call recursive sub
320 CLS:PRINT "The 12 digit answers are:":PRINT
330 FOR J=1 TO TC
340  L=J
350  IF L>220 THEN L=L-220:GOTO 390
360  PRINT J;":  ";
370  FOR L=1 TO 12:PRINT A(J,L);:B(L)=A(J,L):NEXT
380  PRINT:PRINT
390 NEXT
400 PRINT TC;" Answers"
410 GOSUB 90:CLS:SW=1:GOSUB 60:COLOR 7,0:END
420 ' recursive sub
430 L=L+1:LOCATE 1,9:PRINT USING F3$;L
440 I(L)=0
450 I(L)=I(L)+1
460 GOSUB 50:F=SP(L):GOSUB 80:PRINT " ";:PRINT USING F2$;I(L)
470 IF I(L)>12 THEN 730
480 ' test to see if digit is already used
490 C=0
500 FOR J=0 TO (L-1)
510  IF I(L)=I(J) THEN C=C+1
520 NEXT
530 IF C>0 THEN 720
540 GOTO 650
550 ' test to see how "26" is formed
560 ON L GOTO 640,640,640,570,640,640,580,590,640,610,640,620
570 X=I(1) +I(2)+I(3) +I(4) -AN:GOSUB 70:GOTO 640
580 X=I(2) +I(3)+I(6) +I(7) -AN:GOSUB 70:GOTO 640
590 X=I(5) +I(6)+I(7) +I(8) -AN:GOSUB 70
600 X=I(1) +I(4)+I(5) +I(8) -AN:GOSUB 70:GOTO 640
610 X=I(9) +I(2)+I(6) +I(10)-AN:GOSUB 70:GOTO 640
620 X=I(11)+I(3)+I(7) +I(12)-AN:GOSUB 70
630 X=I(9)+I(10)+I(11)+I(12)-AN:GOSUB 70
640 RETURN
650 IF L=12 THEN 680
660 GOSUB 40:GOTO 720
670 ' new answer found
680 AC=AC+1:TC=TC+1:LOCATE 1,16:PRINT TC
690 IF AC>220 THEN AC=1
700 LOCATE 2,8:PRINT " ";:PRINT USING F3$;AC
710 FOR II=1 TO 12:A(AC,II)=I(II):NEXT
720 IF I(L)<12 THEN 450
730 I(L)=0
740 F=SP(L):GOSUB 80:PRINT " ";:PRINT USING F2$;I(L)
750 L=L-1 ' back out of the recursion
760 LOCATE 1,9:PRINT USING F3$;L
770 RETURN
780 ' setup screen
790 FOR I=3 TO 15:LOCATE I,13:PRINT M(I+2):NEXT
800 IF SW=1 THEN 940
810 FOR I=1 TO 12:READ SP(I):NEXT
820 FOR I=1 TO 12:READ X$:F=(SP(I)-67):GOSUB 80:PRINT X$:NEXT
830 LOCATE 1,1:PRINT "Level":LOCATE 2,1:PRINT "Answers    "
840 RETURN
850 ' check level
860 IF X=0 THEN 890
870 IF X>0 THEN I(L)=13:GOTO 890
880 X=-X:IF I(L)>X THEN I(L)=13 ELSE I(L)=I(L)+X
890 RETURN
900 ' print@ to locate
910 V=INT(F/64)+1:Z=(V-1)*64:Z=(F-Z)+1:LOCATE V,Z:RETURN
920 DATA 283,475,667,859,294,486,678,870,464,497,656,689
930 DATA A1,B2,B3,A4,A5,B6,B7,A8,C9,C10,C11,C12
940 RESTORE 920
950 FOR I=1 TO 12:READ SP(I):NEXT
960 FOR I=1 TO 12:READ X$:F=(SP(I)-67):GOSUB 80:PRINT X$;"  ";B(I):NEXT
970 GOSUB 90:RETURN
980 ' wait for key
990 LSET Q=MKI$(0)
1000 WHILE CVI(Q)=0:MID$(Q,1)=INKEY$:WEND:RETURN
1010 ' centered text
1020 T=(80-LEN(M(I)))/2:PRINT TAB(T) M(I):RETURN
