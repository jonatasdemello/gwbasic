10 ' ballboxp.bas - July 8, 2003 - FREEWARE 2004
20 GOTO 60 ' Init first
30 SAVE "ballbox1":LIST-40
40 GOTO 870 ' wait for key
50 ' Init first
60 SCREEN 1:RANDOMIZE TIMER:KEY OFF
70 DEFINT C-L:DEFSNG B:DEFSTR M,Q:Q=MKI$(0)
80 C=0:D=0:E=0:F=0:G=0:J=0:L=0:DX=0:DY=0:EP=20000
90 DIM B(5):L=50
100 CIRCLE (4,100),1:PAINT (4,100)
110 GET (2,98)-(6,102),B:CLS
120 DIM M(10)
130 M(1)="BALL EATING UNIVERSE 2004"
140 M(2)="GwBasic by Eric Tchong"
150 M(3)="Try to catch the ball"
160 M(4)="in an endless loop, so that"
170 M(5)="the ball will not destroy"
180 M(6)="our precious universe."
190 M(7)="This will be your lucky day..."
200 M(8)="S = Slower  <Key> = Again"
210 M(9)="F = Faster  <Esc> = Exits"
220 M(10)="Hit a key to continue"
230 ' Info screen
240 FOR I=1 TO 10
250  X=(40-LEN(M(I)))/2:PRINT TAB(X) M(I)
260  IF I=2 OR I=6 THEN PRINT
270  IF I=7 OR I=9 THEN PRINT:PRINT
280 NEXT
290 GOSUB 40:CLS ' wait for key
300 ' Draw horizontal & vertical border lines
310 LINE(0,0)-STEP(319,199),1,B
320 ' Draw a slide
330 FOR I=50 TO 235
340  PSET(I,82):PSET(I,106)
350 NEXT
360 ' Build 8 rectangles
370 FOR I=1 TO 8
380  C=L/1.6
390  D=INT(RND*(320-L-4))+4      ' random horizontal size
400  E=D+INT(RND*L)+1
410  F=INT(RND*(200-C-4))+4      ' random vertical size
420  G=F+INT(RND*C)+1
430  FOR J=D TO E
440   IF POINT(J,F)=1 THEN J=E+9
450   IF POINT(J,G)=1 THEN J=E+9
460  NEXT :IF J>E+1 THEN 390
470  FOR J=F TO G
480   IF POINT(D,J)=1 THEN J=G+9
490   IF POINT(E,J)=1 THEN J=G+9
500  NEXT :IF J>E+1 THEN 390
510  FOR J=D TO E                ' draw horizontal bars of rectangle
520   PSET(J,F)                  ' upper
530   PSET(J,G)                  ' lower
540  NEXT 
550  FOR J=F TO G                ' draw vertical bars of rectangle
560   PSET(D,J)                  ' left bar
570   PSET(E,J)                  ' right bar
580  NEXT 
590 NEXT
600 ' Punch holes in the rectangles
610 LOCATE 6,10 : PRINT "                              "
620 LOCATE 16,10: PRINT "                              "
640 ' Put ball somewhere
650 X=INT(RND*(319))+1
660 Y=INT(RND*(193))+1
670 DX=1:DY=1
680 IF POINT(X,Y)=1 THEN 650
690 ' Action starts here
700 LSET Q=MKI$(0)
710  WHILE CVI(Q)=0
720   PUT (X,Y),B,PSET
730   IF POINT (X,Y+DY+4) OR POINT (X,Y+DY) THEN DY=-DY
740   IF POINT (X+DX+4,Y) OR POINT (X+DX,Y) THEN DX=-DX
750   X=X+DX:Y=Y+DY
760   FOR C=1 TO EP:NEXT ' delay
770   MID$(Q,1)=INKEY$:IF CVI(Q) THEN 780
780 WEND
790 K=ASC(Q)
800 IF K=115 OR K= 83 THEN EP=EP+500:IF EP=20500 THEN EP=20000:GOTO 700 ELSE 700
810 IF K=102 OR K= 70 THEN EP=EP-500:IF EP=-500  THEN EP=0:GOTO 700 ELSE 700
820 IF K=27 THEN 900
830 ' Increase size of the rectangles
840 CLS:L=L+10:IF L=350 THEN L=10
850 GOTO 310
860 ' Wait for key pressed
870 LSET Q=MKI$(0)
880 WHILE CVI(Q)=0:MID$(Q,1)=INKEY$:WEND:RETURN
890 ' exit
900 KEY 5,"ballbox1.bas":KEY 6,CHR$(34)+",a"
910 SCREEN 2:SCREEN 0:KEY ON:CLS:END
