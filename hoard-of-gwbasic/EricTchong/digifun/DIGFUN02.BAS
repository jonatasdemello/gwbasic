10 ' digfun02.bas - 9 digits of fun
20 GOTO 40 ' begin
30 SAVE"digfun02.bas",A:LIST-40
40 CLS:DIM I(9),A(20,9):L=0:I(0)=0
50 PRINT "This program will search for a nine-digit number"
60 PRINT "using the digits 1-9, using each digit only once.":PRINT
70 PRINT "The 9 digit number must be divisible by 9"
80 PRINT "The first 8 digits must be divisible by 8"
90 PRINT "The first 7 digits must be divisible by 7"
100 PRINT "The first 6 digits must be divisible by 6"
110 PRINT "The first 5 digits must be divisible by 5"
120 PRINT "The first 4 digits must be divisible by 4"
130 PRINT "The first 3 digits must be divisible by 3"
140 PRINT "The first 2 digits must be divisible by 2":PRINT:PRINT
150 PRINT "Type a number if you want to see levels printed."
160 PRINT "<Enter> will skip levels print. ";
170 INPUT CH:IF CH<>0 THEN SW=1 ELSE SW=0
180 PRINT
190 PRINT "Type a number to let the program search the number."
200 PRINT "Press <Enter> for YOU to solve this brain teaser. ";
210 INPUT CH:IF CH=0 THEN CLS:END
220 GOSUB 320:PRINT
230 PRINT "The 9 digit number is:"
240 FOR J=1 TO AC
250  FOR L=1 TO 9
260   PRINT A(J,L);
270  NEXT
280  PRINT
290 NEXT:PRINT
300 END
310 ' recursive sub
320 L=L+1:IF SW THEN PRINT:PRINT "Level ";L
330 I(L)=0
340 I(L)=I(L)+1
350 ' test to see if digit is already used
360 C=0:IF SW THEN 370 ELSE 380
370 FOR J=1 TO L:PRINT I(J);:NEXT:PRINT
380 FOR J=0 TO (L-1)
390  IF I(L)=I(J) THEN C=C+1
400 NEXT
410 IF C>0 THEN 560
420 ' test to see if properly divisible
430 R=0
440 FOR J=1 TO L
450  R=(R*10)+I(J)
460  R=R-L:IF R>0 THEN 460
470  IF R<0 THEN R=R+L
480 NEXT
490 IF R>.5 THEN 560
500 ' X is now ready to go down 1 more level
510 IF L=9 THEN 540
520 GOSUB 320:GOTO 560
530 ' new answer found
540 AC=AC+1:PRINT:PRINT "AC =";AC
550 FOR II=1 TO 9:A(AC,II)=I(II):PRINT A(AC,II);:NEXT:PRINT
560 IF I(L)<9 THEN 340
570  ' back out of the recursion
580 L=L-1:IF SW THEN PRINT:PRINT "Level ";L
590 RETURN
