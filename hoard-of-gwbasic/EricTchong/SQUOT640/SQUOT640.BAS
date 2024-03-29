10 ' 1993  squot640.bas - FREEWARE 2004
20 GOTO 100
30 SAVE "squot640":LIST-80
40 GOTO 760 ' set x for horizontal bounce
50 GOTO 790 ' set y for vertical   bounce
60 GOTO 870 ' clear line
70 GOTO 890 ' wait for key
80 GOTO 920 ' calculate centered text
90 ' Begin
100 DEFSTR M,Q:Q=MKI$(0)
110 SP=500:B=555:C=222:K=15:A=0:EC=0  ' locals
120 X=0:Y=0:DX=0:DY=0:P1=B:P2=C:SS=0
130 SCREEN 9:KEY OFF:DIM M(11)
140 M(1)="A KALEIDOSCOPIC  GRAPHICS  GENERATOR"
150 M(2)="in GwBasic"
160 M(3)="by Eric F. Tchong - Aruba"
170 M(4)="Esc = Exit         Enter = New data"
180 M(5)=CHR$(25)+"  = Turtle         "+CHR$(24)+"   = Turbo "
190 M(6)=CHR$(27)+"  = Slower         "+CHR$(26)+"   = Faster"
200 M(7)="c = clear screen   s = single-step"
210 M(8)="r = restart data   x = exit s-step":PRINT
220 M(9) ="Horizontal limit ="
230 M(10)="  Vertical limit ="
240 M(11)="0 for previous limits ..."
250 CLS:COLOR 15,0
260 FOR I=1 TO 11
270  IF I=9  THEN GOSUB 80:PRINT B:GOTO 310
280  IF I=10 THEN GOSUB 80:PRINT C:GOTO 310
290  GOSUB 80
300  IF I=3 OR I=6 OR I=8 THEN PRINT
310 NEXT
320 LOCATE 17,25:INPUT "Horizontal limit 1-640 ";B ' b=x limit
330 IF B>640 THEN GOSUB 60:GOTO 320
340 IF B=0 THEN B=P1 ELSE P1=B
350 LOCATE 18,25:INPUT "Vertical   limit 1-350 ";C ' c=y limit
360 IF C>350 THEN GOSUB 60:GOTO 350
370 IF C=0 THEN C=P2 ELSE P2=C
380 ' Initialize
390 CLS:X=0:Y=0:DX=1:DY=1                ' dx=x step, dy=y step
400 LSET Q=MKI$(0)
410  WHILE CVI(Q)=0
420 ' Generate patterns
430   IF SS=1 THEN GOSUB 70              ' single-step mode
440   FOR EC=1 TO SP:NEXT                ' slow, fast or turbo
450   A=X:A=A+DX                         ' get x, x=x+x step
460   IF A>B THEN GOSUB 40               ' Is x > x limit ?
470   IF A=0 THEN GOSUB 40               ' Is x = 0 ?
480   X=A:A=Y:A=A+DY                     ' save x, get y, y=y+y step
490   IF A>C THEN GOSUB 50               ' Is y > y limit ?
500   IF A=0 THEN GOSUB 50               ' Is y = 0 ?
510   Y=A                                ' save y
520   IF POINT (X,Y)=0 THEN 540 ELSE 560 ' test for pset or preset
530 ' Set pixel on
540   PSET(X,Y):PSET(640-X,Y):PSET(X,350-Y):PSET(640-X,350-Y):GOTO 570
550 ' Set pixel off
560   PRESET(X,Y):PRESET (640-X,Y):PRESET (X,350-Y):PRESET (640-X,350-Y)
570   MID$(Q,1)=INKEY$:IF CVI(Q) THEN 580
580  WEND
590  IF ASC(Q)=13  THEN 250              ' enter to restart with new values
600  IF ASC(Q)=27  THEN 960              ' Esc = exit
610  IF ASC(Q)=32  THEN 710              ' space to display data in use
620  IF ASC(Q)=99  THEN CLS              ' c = clear screen
630  IF ASC(Q)=114 THEN 390              ' r = restart
640  IF ASC(Q)=115 THEN SS=1:GOTO 400    ' s = single step
650  IF ASC(Q)=120 THEN SS=0:GOTO 400    ' x = exit single-step mode
660  IF CVI(Q)=20480 THEN GOSUB 820      ' Turtle  down arrow
670  IF CVI(Q)=19200 THEN GOSUB 840      ' Turbo   up arrow
680  IF CVI(Q)=18432 THEN GOSUB 830      ' Slower  left arrow
690  IF CVI(Q)=19712 THEN GOSUB 850      ' Faster  right arrow
700 GOTO 400
710 CLS:COLOR 15,0
720 LOCATE 17,25:PRINT "Horizontal limit =";B
730 LOCATE 18,25:PRINT "  Vertical limit =";C
740 GOSUB 70:CLS:GOTO 400
750 ' Set x for horizontal bounce
760 COLOR K,0:K=K+1:IF K>15 THEN K=9
770 F=A:A=0:A=A-DX:DX=A:A=F:A=A+DX:A=A+DX:RETURN
780 ' Set y for vertical   bounce
790 COLOR K,0:K=K+1:IF K>15 THEN K=9
800 F=A:A=0:A=A-DY:DY=A:A=F:A=A+DY:RETURN
810 ' Change cursor speed
820 SP=20000:RETURN                            ' Turtle
830 SP=0:RETURN                                ' Turbo
840 SP=SP+100:IF SP=20100 THEN 820 ELSE RETURN ' Slower
850 SP=SP-100:IF SP= -100 THEN 830 ELSE RETURN ' Faster
860 ' Clear line
870 PRINT CHR$(30);:PRINT STRING$(40,32):PRINT CHR$(30);:RETURN
880 ' Wait for key
890 LSET Q=MKI$(0)
900 WHILE CVI(Q)=0:MID$(Q,1)=INKEY$:WEND:RETURN
910 ' Calculate centered text
920 X=(80-LEN(M(I)))/2
930 IF I=9 OR I=10 THEN PRINT TAB(X) M(I);:RETURN
940 PRINT TAB(X) M(I):RETURN
950 ' Exit
960 SCREEN 2:SCREEN 0:KEY 5,"squot640.bas":KEY 6,CHR$(34)+",a"
970 KEY ON:END
980 ' Originally a Z80 machine language program.
990 '  Rewritten for GwBasic by Eric F. Tchong: August 13, 1993
1000 '          Reference: 80 Micro, June 1984 -  pages 83 to 92
