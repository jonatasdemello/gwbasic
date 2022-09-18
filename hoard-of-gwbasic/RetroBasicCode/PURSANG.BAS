0 SCREEN 2:SCREEN 0,0,0
1 KEY OFF:G$="      "
2 P$="здбддXдддбддY1ддбддZ1ддбддY2ддбддZ2ддбддY3ддбддZ3ддбддY4ддбддZ4ддбддY5ддбддZ5дд©"
3 P1$="юдаддXдддаддY1ддаддZ1ддаддY2ддаддZ2ддаддY3ддаддZ3ддаддY4ддаддZ4ддаддY5ддаддZ5дды"
6 OPTION BASE 1:DIM V(11,12),V$(11,12):MY=1:MX=1:X=1:Y=1
10 CLS:COLOR 0,7:LOCATE 1,32:PRINT "PURSANG"
11 COLOR 7,0:PRINT :PRINT
12 PRINT "                      Une CREATION de DARCHE YOANN"
13 LOCATE 23,1:PRINT "   Utilisez le pav┌ num┌rique pour se d┌placer .
14 LOCATE 24,1:PRINT " Puis appuyer sur <ESP> ou <ENTER> une fois la cellule choisie ";
15 LOCATE 6,33:PRINT "Edition "
16 PRINT
17 LOCATE ,15:PRINT "ш   ш шшшшш ш      шшш  ш шшшшш ш шшшшш ш   ш"
18 LOCATE ,15:PRINT "ш   ш ш     ш     ш   ш ш     ш ш ш     шш шш"
19 LOCATE ,15:PRINT "ш   ш ш     ш     ш     ш    шш ш ш     ш ш ш"
20 LOCATE ,15:PRINT "шшшшш шшш   ш     ш     ш   шш  ш шшш   ш   ш"
21 LOCATE ,15:PRINT "ш   ш ш     ш     ш     ш  шш   ш ш     ш   ш"
22 LOCATE ,15:PRINT "ш   ш ш     ш     ш   ш ш шш    ш ш     ш   ш"
23 LOCATE ,15:PRINT "ш   ш шшшшш шшшшш  шшш  ш шшшшш ш шшшшш ш   ш"
29 A$=INPUT$(1):GOSUB 6000:CLS
30 PRINT P$
50 FOR I=1 TO 11
51 PRINT "Ё"+CHR$(64+I)+"Ё      Ё      Ё      Ё      Ё      Ё      Ё      Ё      Ё      Ё      Ё      Ё";
52 PRINT "цдеддддддеддддддеддддддеддддддеддддддеддддддеддддддеддддддеддддддеддддддедддддд╢";
53 NEXT
54 PRINT "ЁLЁ      Ё      Ё      Ё      Ё      Ё      Ё      Ё      Ё      Ё      Ё      Ё";
55 LOCATE 25,1:PRINT P1$;
56 FOR I=1 TO 12
57 GHJ=V(1,I):LOCATE 2*I,4:PRINT GHJ;:NEXT
69 PCOPY 0,1
70 REM  PROGRAME ...........................
80 A$=INKEY$:IF A$="" THEN 80
110 IF A$="4" THEN  X=X-1:IF X<=0 THEN X=1:BEEP
120 IF A$="6" THEN  X=X+1:IF X>=11 THEN X=10:BEEP
130 IF A$="2" THEN Y=Y+1:IF Y>=13 THEN BEEP:Y=12
140 IF A$="8" THEN Y=Y-1:IF Y<=0 THEN BEEP:Y=1
141 IF A$=" " OR A$=CHR$(13) THEN 4000
142 IF A$=CHR$(27) THEN COLOR 7,0:CLS:END
150 N$=RIGHT$(STR$(V(X+1,Y)),LEN(STR$(V(X+1,Y)))-1)
151 RSET G$=N$
155 COLOR 7,0:LOCATE 2*MY,4+7*MX:PRINT M$;:LOCATE 2*Y,4+7*X:COLOR 0,7:PRINT G$;:M$=G$:MY=Y:MX=X
156 IF N$="" THEN N$="0     "
157 GOTO 80
4000 PCOPY 0,1:COLOR 7,0
4010 IF Y>=3 THEN MLK=1 ELSE MLK=0
4020 LOCATE 10,10:PRINT "з";STRING$(58,196);"©"
4030 LOCATE 11,10:PRINT "Ё";STRING$(58,32);"Ё"
4040 LOCATE 12,10:PRINT "Ё";STRING$(58,32);"Ё"
4050 LOCATE 13,10:PRINT "ю";STRING$(58,196);"ы"
4060 IF X/2=INT(X/2) THEN MKL=1 ELSE MKL=2
4070 LOCATE 11,11:PRINT "ANCIENNE VALEUR:";V$(X+1,Y)
4080 IF MLK=1 THEN LOCATE 12,11:INPUT "NOUVELLE VALEUR:",M$
4090 IF MLK=0 THEN LOCATE 12,11:INPUT "MINUTE :";M:LOCATE 12,11:INPUT "SECONDE :";S:IF M>=61 OR S>=61 THEN BEEP:GOTO 4090
5000 IF MLK=1 THEN V$(X+1,Y)=M$
5001 IF MLK=0 THEN V$(X+1,Y)=STR$(M)+"'"+STR$(S)+"''"
5002 IF MLK=0 THEN M=M*60+S ELSE M=VAL(M$)
5003 M=M/V(1,Y)*100
5005 KM=INT(M):IF KM=M THEN 5007
5006 JLM$=STR$(KM):L=LEN(JLM$):JL$=LEFT$(STR$(M),L+3):M=VAL(JL$)
5007 V(X+1,Y)=M
5008 PCOPY 1,0
5009 GOTO 150
6000 CLS:FOR I=1 TO 12
6005 PRINT CHR$(64+I);"= "
6010 IF I<=2 THEN INPUT "minutes :",M:INPUT "secondes :",S:M=S+M*60  ELSE INPUT "VALEUR :",M
6020 V(1,I)=M:NEXT :RETURN
