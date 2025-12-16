0  SCREEN 2:SCREEN 0:COLOR 3
10 KEY OFF:CLS
20 INPUT "CODE de A (en decimal) ",A
25 IF A<=0 THEN BEEP:GOTO 20
26 A=A-1
30 CLS:PRINT "VOTRE PHRASE (255 caractŠres maximum = 3 lignes)
40 COLOR 14,14:LOCATE 5:PRINT ">                                                                              "
50 PRINT "                                                                               "
60 PRINT "                                                                               "
70 PRINT " ":COLOR 14:LOCATE 5,2:INPUT "",B$
80 T=1:FOR I=1 TO LEN(B$)
90 K$=MID$(B$,I,1)
100 IF K$=" " THEN GOSUB 1000:GOTO 190
110 IF K$="." THEN GOSUB 1100:GOTO 190
120 N=ASC(K$)
130 IF N<=64 OR (N=>91 AND N<=96) OR N=>123 THEN BEEP:CLS:LOCATE 12,1:COLOR 30:PRINT "ERREUR DANS LE TEXT :";:COLOR 14:PRINT K$;:COLOR 30:PRINT "N'EST PAS UNE LETTRE DE L'APHABET":COLOR 2:PRINT "cls":END
140 IF N>=97 THEN N=N-32
150 N=N-64+A
160 WHILE N:R$=RIGHT$(STR$(N-INT(N/2)*2),1)+R$:N=INT(N/2):WEND
170 IF LEN(MB$(T))+LEN(R$)+1>254 THEN T=T+1
180 MB$(T)=MB$(T)+R$+"-":R$=""
190 NEXT:COLOR 13,0:CLS:PRINT :PRINT
200 FOR U=1 TO T:PRINT MB$(U);:NEXT
210 PRINT :PRINT "voulez-vous une trace ecrite o/n":A$=INPUT$(1)
220 IF A$="n" OR A$="N" THEN END
230 IF A$="o" OR A$="O" THEN 250
240 BEEP:GOTO 210
250 LPRINT B$:FOR I=1 TO T:LPRINT MB$(I);:NEXT
1000 MB$(T)=LEFT$(MB$(T),LEN(MB$(T))-1)+" ":RETURN
1100 MB$(T)=LEFT$(MB$(T),LEN(MB$(T))-1)+".":RETURN
