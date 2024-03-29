10 'Program to display dot matrix characters from ROM patterns.
20 'Will Fastie --19 Nov 81. Typed in 6 Feb 82 from Creative Computing
30 ' VOL.8 NO. 3 (MARCH 82) BY R. HILL
40 'Modified to write over whole screen 2/13/82, by R. Hill.
50 DEFINT A-Z
90 GOSUB 1300
100 DEF SEG=&HF000
110 BASEADR=&HFA6E
120 BYTESPERCHAR=8
130 KEY OFF
200 CLS
201 X=1:Y=1
210 CHAR$=INKEY$: IF CHAR$="" THEN 210
220 CODE=ASC(CHAR$)
230 IF CODE >= 128 THEN BEEP: GOTO 200
240 ADR = BASEADR+(CODE*BYTESPERCHAR)
260 DOTCHAR=CODE
265 'Change "DOTSIZE" to get different width characters.
270 DOTSIZE=1
280 DOT$=STRING$(DOTSIZE,DOTCHAR)
285 GOSUB 1000
290 Y=Y+8*DOTSIZE
295 IF Y<SCREENWIDTH GOTO 210
300 IF X=17 GOTO 320
305 X=X+8
310 Y=1
315 GOTO 210
320 Y=1:CHAR$=INKEY$:IF CHAR$="" THEN 320
325 PRINT"":PRINT"":PRINT"":PRINT"":PRINT"":PRINT"":PRINT"":PRINT"":PRINT""
330 GOTO 220
1000 FOR ROW=1 TO 8
1010   ROWVAL=PEEK(ADR+(ROW-1))
1020   FOR COL=1 TO 8
1030     COLMASK=2^(7-(COL-1))
1040     IF (ROWVAL AND COLMASK) <> 0 THEN GOSUB 1200
1050   NEXT COL
1060 NEXT ROW
1080 RETURN
1200 'Locate to bit position and display giant pixel!
1210 LOCATE X+(ROW-1),Y+(COL-1)*DOTSIZE
1220 PRINT LEFT$(DOT$,DOTSIZE);
1230 RETURN
1300 'Initialize display
1310 SCREENWIDTH=80
1320 RETURN
