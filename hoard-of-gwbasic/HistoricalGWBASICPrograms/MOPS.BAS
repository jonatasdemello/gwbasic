10 CLS:PRINT TAB(12);"## MOPS ##":B$="Fehler !"
20 PRINT TAB(4);"frei nach Carl Reinhard 1850"
30 PRINT:DIM A(8),B(8),C$(8),D$(2),E$(2),F$(2)
40 D$(0)="der": D$(1)="das": D$(2)="die"
50 E$(0)="dem": E$(1)="dem": E$(2)="der"
60 F$(0)="den": F$(1)="das": F$(2)="die"
70 FOR I=0 TO 8
80 INPUT"Wort mit Artikel : ",A$
90 IF MID$(A$,4,1)<>" " THEN PRINT B$:GOTO 80
100 IF LEFT$(A$,3)="der" THEN A(I)=0:GOTO 140
110 IF LEFT$(A$,3)="das" THEN A(I)=1:GOTO 140
120 IF LEFT$(A$,3)="die" THEN A(I)=2:GOTO 140
130 PRINT B$:GOTO 80
140 C$(I)=MID$(A$,4)
150 NEXT:CLS
160 CLS
170 FOR I=0 TO 8
180 X=INT(8*RND(1)+.5)
190 C=0:IF I=0 THEN B(I)=X
200 FOR J=0 TO I-1
210 IF B(J)=X THEN C=1:J=I
220 NEXT:IF C=1 GOTO 180
230 B(I)=X
240 NEXT
250 PRINT"Wenn ";D$(A(B(0)));C$(B(0));" mit ";E$(A(B(1)));C$(B(1))
260 PRINT" Åber ";F$(A(B(2)));C$(B(2));" springt"
270 PRINT"und ";D$(A(B(3)));C$(B(3));" in ";E$(A(B(4)));C$(B(4))
280 PRINT"  ";F$(A(B(5)));C$(B(5));" verschlingt"
290 PRINT"dann ";D$(A(B(6)));C$(B(6));" aus ";E$(A(B(7)));C$(B(7))
300 PRINT"  als ";C$(B(8));" erklingt"
310 PRINT:PRINT
320 INPUT"[ENTER]",A:GOTO 160
