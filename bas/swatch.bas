100 SCREEN 9:COLOR 7,0:CLS
110 P=0
120 FOR PLOOP=1 TO 4
130   CLS
140   FOR C=0 TO 15
150     LINE(0,C*14)-(605,(C*14)+13),C,BF
160     PALETTE C,C+P
170     S$=STR$(P+C):IF LEN(S$)<3 THEN S$=" "+S$
180     S$=S$+" "
190     LOCATE C+1,1:PRINT S$;
200   NEXT C
210 LOCATE 21,5:PRINT "        HIT ESCAPE TO EXIT OR ANY OTHER KEY FOR NEXT 16 COLORS"
220   IN$=INKEY$:IF IN$="" THEN 220
230   IF IN$=CHR$(27) THEN END
240   P=P+16
250 NEXT PLOOP
260 GOTO 110

