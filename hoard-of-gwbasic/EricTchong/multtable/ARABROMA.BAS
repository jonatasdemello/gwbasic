10 ' arabroma.bas - FreeWare 2005
20 GOTO 70 ' begin
30 SAVE "arabroma.bas",A:LIST-70
40 GOTO 290 ' arabic to roman
50 GOTO 450 ' roman to arabic
60 GOTO 750 ' center text
70 DIM T(7,7),L(7),F(13),FC$(13):DEFSTR M,Q:Q=MKI$(0)
80 M(1)="ROMAN NUMERALS idea from GEORGE STEWART"
90 M(2)="GW-BASIC by Eric Tchong"
100 M(3)="SELECT:    "
110 M(4)=" <1> Arabic to Roman"
120 M(5)=" <2> Roman to Arabic"
130 M(6)=" <3> Quit           "
140 M(7)="Enter 1, 2, or 3"
150 FOR TR=1 TO 7:FOR TC=1 TO 7:READ T(TR,TC):NEXT:NEXT
160 FOR TC=1 TO 7:READ L(TC) :NEXT
170 FOR N=1 TO 13:READ F(N)  :NEXT
180 FOR N=1 TO 13:READ FC$(N):NEXT:C$="MDCLXVI"
190 CLS
200 FOR I=1 TO 7
210  GOSUB 60:IF I=2 OR I=6 THEN PRINT
220 NEXT
230 LOCATE 9,49:INPUT CH
240 IF CH<1 OR CH>3 THEN 230
250 IF CH=3 THEN CLS:END ELSE CLS
260 ON CH GOSUB 40,50
270 GOTO 190
280 ' arabic to roman
290 N$="":PRINT
300 PRINT "Your Arabic number ? ";
310 PRINT "<Enter for menu>"
320 INPUT N$:IF N$="" THEN RETURN
330 N=VAL(N$):R=N:IF N>250000! THEN 290
340 IF N<=0 OR N<>INT(N) THEN 410
350 R$="":FL=1
360 NT=N-F(FL):IF NT<0 THEN 380
370 R$=R$+FC$(FL):N=NT:GOTO 360
380 FL=FL+1:IF FL<=13 THEN 360
390 PRINT "  ";R$
400 GOTO 290
410 PRINT "Can't convert that value."
420 PRINT "Enter a positive whole number."
430 GOTO 290
440 ' roman to arabic
450 N$="":PRINT:PRINT "Your Roman number ? <Enter for menu>"
460 INPUT N$:IF N$="" THEN RETURN
470 TL=0:F=0:PL=4:PC=1:OC=1:D=1:RC=0
480 F$=MID$(N$,D,1):CC=INSTR(1,C$,F$):IF CC=0 THEN 650
490 CL=L(CC)
500 IF CC<>PC THEN RC=1
510 IF CC=PC  THEN RC=RC+1
520 IF RC>3 AND CC<>1 THEN 680
530 IF F=1 AND CL>=PL THEN 700
540 V=T(PC,CC):IF V=0 THEN 700
550 TL=TL+V
560 IF CC>=PC THEN 590
570 IF L(OC)<=PL THEN 700
580 F=1:CL=L(PC):GOTO 600
590 F=0
600 PL=CL:OC=PC:PC=CC:D=D+1
610 IF D>LEN(N$) THEN 630
620 GOTO 480
630 PRINT " ";TL:GOTO 450
640 ' invalid character
650 PRINT "Invalid character found: '";F$; "'"
660 PRINT "Use only (M,D,C,L,X,V,I)":GOTO 450
670 ' too many
680 PRINT "Too many "; F$; "'s in a row. Limit is 3.":GOTO 450
690 ' invalid character sequence
700 PRINT "Invalid character sequence:"
710 PRINT N$:IF D=1 THEN 730
720 FOR SA=1 TO D-1:PRINT " ";:NEXT
730 PRINT "^":GOTO 450
740 ' centered text
750 X=(80-LEN(M(I)))/2:PRINT TAB(X) M(I):RETURN
760 ' data
770 DATA 1000, 500, 100, 50, 10, 5, 1
780 DATA  0,   0,   100, 50, 10, 5, 1
790 DATA  800, 300, 100, 50, 10, 5, 1
800 DATA  0,   0,   0,   0,  10, 5, 1
810 DATA  0,   0,   80,  30, 10, 5, 1
820 DATA  0,   0,   0,   0,  0,  0, 1
830 DATA  0,   0,   0,   0,  8,  3, 1
840 DATA 4, 3, 3, 2, 2, 1, 1
850 DATA 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1
860 DATA M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I
