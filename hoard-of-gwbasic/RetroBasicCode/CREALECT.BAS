0 KEY OFF:COLOR 2,0,0:CLS
10 COLOR 13
20 LOCATE 19
30 A$="  шшшш  шшшш   шшшшш   шшшш   ш       шшшшш   шшшш  шшшшш   "
40 B$=" ш      ш   ш  ш      ш    ш  ш       ш      ш        ш "
50 C$=" ш      шшшш   шшшш   шшшшшш  ш       шшшш   ш        ш"
60 D$=" ш      ш   ш  ш      ш    ш  ш       ш      ш        ш"
70 E$="  шшшш  ш   ш  шшшшш  ш    ш  шшшшшш  шшшшш   шшшш    ш"
80 PRINT "       ";A$
90 PRINT "       ";B$
100 PRINT "       ";C$
110 PRINT "       ";D$
120 PRINT "       ";E$:LOCATE 25,1:COLOR 1:PRINT " Ecrit et realis┌ par DARCHE Yoann  tel: 69.39.51.26 "
130 FOR I=1 TO 18:PRINT :PLAY "p5":NEXT
140 CLEAR:COLOR 13:CLS
150 LOCATE 10:PRINT "   F1= AIDE  CTRL-A = SAUVE  CTRL-R = RAPELLE
160 KEY 1,"ш":Y2=14:X2=14:XX=1:X=13:Y=13
170 COLOR 30:LOCATE 25:PRINT "  Appuyez sur la bar espace ":A$=INPUT$(1)
180 CLS:COLOR 2:C1$=CHR$(24):C2$=CHR$(25):C3$=CHR$(26):C4$=CHR$(27):E$=CHR$(18)
190 I3$=CHR$(202):I4$=CHR$(204):IX$=CHR$(206):OPTION BASE 1:DIM P$(23,23,3)
200 PRINT " зббббббббббббббббббббббб© зббббббббббббббббббббббб© зббббббббббббббббббббббб©"
210 FOR I=1 TO 22:PRINT " ц                       ╢ ц                       ╢ ц                       ╢":NEXT
220 LOCATE 24,1:PRINT " ц                       ╢ ц                       ╢ ц                       ╢";
230 LOCATE 25,1:PRINT " юаааааааааааааааааааааааы юаааааааааааааааааааааааы юаааааааааааааааааааааааы ";
240 LOCATE 1,1:IF PP=1 THEN PP=0:RETURN ELSE COLOR 4
250 A$=INKEY$:IF A$="" THEN 250
260 IF A$=CHR$(219) THEN 970
270 IF A$=CHR$(1) THEN 640 ELSE IF A$=CHR$(26) THEN 800
280 IF A$=CHR$(18) THEN 710
290 IF A$=CHR$(0)+"H" THEN Y=Y-1:GOTO 510
300 IF A$=CHR$(0)+"P" THEN Y=Y+1:GOTO 510
310 IF A$=CHR$(0)+"M" THEN X=X+1:GOTO 510
320 IF A$=CHR$(0)+"K" THEN X=X-1:GOTO 510
330 IF A$="_" THEN K$="м":GOTO 630
340 IF ASC(A$)=31 THEN K$="╨":GOTO 630
350 IF A$="D" THEN K$="и":GOTO 630
360 IF ASC(A$)=4 THEN K$="╪":GOTO 630
370 IF A$="G" THEN K$="╩":GOTO 630
380 IF ASC(A$)=7 THEN K$="х":GOTO 630
390 IF A$="U" THEN K$=C1$:GOTO 630
400 IF A$=CHR$(0)+CHR$(22) THEN K$=C2$:GOTO 630
410 IF A$=CHR$(21) THEN K$=C3$:GOTO 630
420 IF A$="u" THEN K$=C4$:GOTO 630
430 IF A$="T" THEN K$="к":GOTO 630
440 IF A$=CHR$(0)+CHR$(20) THEN K$="╧":GOTO 630
450 IF ASC(A$)=20 THEN K$="й":GOTO 630
460 IF A$="t" THEN K$="л":GOTO 630
470 IF A$="+" THEN K$="н":GOTO 630
480 IF A$="E" THEN K$=E$ :GOTO 1230
490 IF A$=" " THEN K$=" ":GOTO 1250
500 GOTO 250
510 IF Y<=0 THEN Y=Y+1
520 IF Y>=24 THEN Y=Y-1
530 IF X<=0 AND XX=1 THEN XX=3:X=23
540 IF X>=24 AND XX=3 THEN XX=1:X=1
550 IF X>=24 AND XX<3 THEN XX=XX+1:X=1
560 IF X<=0 AND XX>1 THEN XX=XX-1:X=23
570 Y1=Y+1
580 IF XX=1 THEN X1=X+2
590 IF XX=2 THEN X1=X+28
600 IF XX=3 THEN X1=X+54
610 LOCATE Y2,X2:PRINT CHR$(V);:V=SCREEN (Y1,X1):LOCATE Y1,X1:PRINT "ш";:Y2=Y1:X2=X1
620 GOTO 250
630 V=ASC(K$):P$(X,Y,XX)=K$:GOTO 510
640 CLS:INPUT "Nom du fichier 8 caract┼res ";FI$:IF LEN(FI$)>=9 THEN 640 ELSE FI$=FI$+".lab"
650 OPEN "O",#1,FI$
660 FOR A=1 TO 3:FOR B=1 TO 23:FOR C=1 TO 22
670 PRINT #1,P$(C,B,A);",";:PRINT P$(C,B,A);",";
680 NEXT C:PRINT #1,P$(23,B,A):PRINT P$(23,B,A):NEXT B:PRINT:NEXT A
690 CLOSE:PRINT "Voulez - Vous RETOURNEZ ┘ l'┌dition O/N ":A$=INPUT$(1)
700 IF A$="O" OR A$="o" THEN 850
710 CLS:COLOR 14:LOCATE 12:PRINT "  ETES-VOUS SUR DE RAPPELER UN FICHIER O/N":A$=INPUT$(1)
720 IF A$="N" OR A$="n" THEN 850
730 IF A$="O" OR A$="o" THEN 740 ELSE BEEP:GOTO 710
740 CLS:COLOR 13:FILES "*.LAB"
750 INPUT "Nom de votre fichier : ",FI$:IF LEN(FI$)>=9 THEN 710 ELSE FI$=FI$+".lab"
760 OPEN "i",#1,FI$
770 FOR A=1 TO 3:FOR B=1 TO 23
780 INPUT#1,P$(1,B,A),P$(2,B,A),P$(3,B,A),P$(4,B,A),P$(5,B,A),P$(6,B,A),P$(7,B,A),P$(8,B,A),P$(9,B,A),P$(10,B,A),P$(11,B,A),P$(12,B,A),P$(13,B,A),P$(14,B,A),P$(15,B,A),P$(16,B,A),P$(17,B,A),P$(18,B,A),P$(19,B,A),P$(20,B,A),P$(21,B,A),P$(22,B,A),P$(23,B,A)
790 NEXT B:NEXT A:CLOSE:GOTO 850
800 CLS:LOCATE 12,1:COLOR 14:PRINT " ETES-SURE DE VOULOIRE EFFACER LES TABLEAUX  O/N":A$=INPUT$(1)
810 IF A$="N" OR A$="n" THEN 850
820 IF A$="O" OR A$="o" THEN 830 ELSE BEEP:GOTO 800
830 ERASE P$:DIM P$(23,23,3)
840 COLOR 2,0:CLS:PP=1:GOSUB 200:COLOR 4:GOTO 250
850 COLOR 2,0:CLS:PP=1:GOSUB 200:COLOR 4
860 FOR I=1 TO 23:FOR N=1 TO 23
870 LOCATE I+1,N+2:PRINT P$(N,I,1);
880 NEXT N:NEXT I
890 FOR I=1 TO 23:FOR N=1 TO 23
900 LOCATE I+1,N+28:PRINT P$(N,I,2);
910 NEXT N:NEXT I
920 FOR I=1 TO 23:FOR N=1 TO 23
930 LOCATE I+1,N+54:PRINT P$(N,I,3);
940 NEXT N:NEXT I
950 GOTO 250
960 REM                  PAGE D'AIDE   (F1)
970 CLS
980 COLOR 13,1:CLS:PRINT "              PAGE-AIDE "
990 PRINT :PRINT " INDEX DES DIFERANTES TOUCHES ,LEUR CARACTERE,ET LA SIGNIFICATION "
1000 PRINT " =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
1010 PRINT "здддддддддбдддддддбддддддддддддддддддд©"
1020 PRINT "Ё touche  Ё  car. Ё    SINIFICATION:  Ё"
1030 PRINT "цдддддддддедддддддеддддддддддддддддддд╢"
1040 PRINT "Ё   _     Ё   м   Ё    COULOIR        Ё"
1050 PRINT "Ё CTRL-_  Ё   ╨   Ё      IDEM         Ё   CTRL-R = RAPELLE
1060 PRINT "Ё   D     Ё   и   Ё    Virage DROIT   Ё   CTRL-A = SAUVE
1070 PRINT "Ё CTRL-D  Ё   ╪   Ё      IDEM         Ё   CTRL-Z = EFFACE TOUT LES
1080 PRINT "Ё   G     Ё   ╩   Ё    Virage GAUCHE  Ё      3  PLANTS EN MEMOIR
1090 PRINT "Ё CTRL-G  Ё   х   Ё      IDEM         Ё"
1100 PRINT "Ё   U     Ё   ";C1$;"   Ё    Cul de Sac     Ё   ETAGE :
1110 PRINT "Ё ALT-U   Ё   ";C2$;"   Ё      IDEM         Ё здд© здд© здд©
1120 PRINT "Ё CTRL-U  Ё   ";C3$;"   Ё      IDEM         Ё Ё1 Ё Ё2 Ё Ё3 Ё
1130 PRINT "Ё SHIFT-U Ё   ";C4$;"   Ё      IDEM         Ё юдды юдды юдды
1140 PRINT "Ё   T     Ё   к   Ё Intersection en T Ё    CHAQUE ETAGE COMPREND
1150 PRINT "Ё ALT-T   Ё   ╧   Ё      IDEM         Ё        23 SUR 23 CARACTERES
1160 PRINT "Ё CTRL-T  Ё   й   Ё      IDEM         Ё
1170 PRINT "Ё SHIFT-T Ё   л   Ё      IDEM         Ё     N.B. METTEZ VOUS SUR
1180 PRINT "Ё   +     Ё   н   Ё Intersection en X Ё          CAPS LOOK
1190 PRINT "Ё   E     Ё   ";E$;"   Ё Escalier          Ё"
1200 PRINT "юдддддддддадддддддаддддддддддддддддддды APPUYER SUR UNE TOUCHE POUR EDITION  ";
1210 LOCATE 1,1
1220 A$=INKEY$:IF A$="" THEN 1220 ELSE GOTO 850
1230 LOCATE Y+1,X+2:PRINT K$;:LOCATE Y+1,X+28:PRINT K$;:LOCATE Y+1,X+54:PRINT K$;
1240 V=ASC(K$):P$(X,Y,1)=K$:P$(X,Y,2)=K$:P$(X,Y,3)=K$:GOTO 250
1250 IF V<>18 THEN K$=" ":GOTO 630
1260 LOCATE Y+1,X+2:PRINT K$;:LOCATE Y+1,X+28:PRINT K$;:LOCATE Y+1,X+54:PRINT K$;
1270 V=ASC(K$):P$(X,Y,1)=K$:P$(X,Y,2)=K$:P$(X,Y,3)=K$:GOTO 250
