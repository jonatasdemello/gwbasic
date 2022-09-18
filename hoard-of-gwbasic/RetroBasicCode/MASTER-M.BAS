10 SCREEN 7
50 CLS:PRINT " jeu du ";:COLOR 12:PRINT "MASTER MIND ";:COLOR 13:PRINT " LE CERVEAU"
60 COLOR 12:PRINT :PRINT "Ce programe est proteg‚ par LEPOU .. car il de race violette :";:COLOR 14:PRINT " PRIERE DE NE PAS LE RECOPIER "
65 COLOR 9:PRINT :PRINT "INTERDIT POUR LES SOCIALO..":COLOR 13
70 PRINT :PRINT :PRINT "voulez-vous avoir la regle de jeu O/N "
80 A$=INKEY$:IF A$="" THEN 80 ELSE IF A$="O" OR A$="o" THEN 90 ELSE 1000
90 CLS
100 PRINT:PRINT "  C'est trŠs simples il faut trouver la combinaison que l'ordinateur va choisir.
110 COLOR 12:PRINT "  pour cela vous allez tapez sur les     chiffres qui correspondent … des        couleurs.Puis lordinateur indiquera si  vous avez des couleur bien placer ou    mal placer."
120 PRINT "  Si il repond rien c'est que vous       n'aviez aucune couleur de sa cobinaison "
121 COLOR 14:PRINT "  Il peut y avoir 2 3 ou 4 cases de la   mˆme couleur sans oublier les trouts...":PRINT :PRINT
122 COLOR 10:PRINT "Bonne Chance":PRINT "                       Darche Yoann "
123 PRINT "app sur une touche "
124 A$=INKEY$:IF A$="" THEN 124 ELSE 1000
999 STOP
1000 PALETTE 6,7
1001 CLS:REM    AFFICHAGE DU JEU VIDE .......
1002 '
1008 LOCATE 10,28:COLOR 12:PRINT "Û BIEN PLACE ":LOCATE 11,28:COLOR 11:PRINT "Û MAL PLACE"
1009 LOCATE 5,29:COLOR 13:PRINT "MASTER MIND":LOCATE 6,28:COLOR 12:PRINT "DE DARCHE Y."
1010 LINE (122,17)-(198,182),14,B
1011 FOR I=17 TO 182 STEP 15:LINE (122,I)-(197,I),14:NEXT:PAINT (123,18),9,14
1012 FOR I=122 TO 182 STEP 15:LINE (I,17)-(I,182),14:NEXT:PAINT (183,18),14
1013 LOCATE 1,16:PRINT "1 2 3 4 R":LOCATE 4,12:PRINT "????"
1014 LINE (190,32)-(190,182),14
1015 FOR I=32 TO 182 STEP 7.5:LINE (182,I)-(198,I),14:NEXT
1016 FOR I=1 TO 6:COLOR I:PRINT I:NEXT
1017 COLOR 14:PRINT "pour trous 0 "
1100 '
1101 '   Choix des couleurs … cacher
1102 '   =-=-=-=-=-=-=-=-=-=-=-=-=-=
1103 LOCATE 24,1:PRINT "appuyez sur une touge";
1104 X=5:RANDOMIZE TIMER:X=RND(1)*X:A$=INKEY$:X=RND(X*TIMER):RANDOMIZE X/TIMER:IF A$="" THEN 1104
1105 LOCATE 24,1:PRINT "                     ";
1106 C1=INT(RND(1)*6):RANDOMIZE TIMER*C1
1107 C2=INT(RND(1)*6):RANDOMIZE TIMER*C2
1108 C3=INT(RND(1)*6):RANDOMIZE TIMER*C3
1109 C4=INT(RND(1)*6):RANDOMIZE TIMER*C4
1200 Y=17+5:'      =-=-=-=-=-=-=-=-=-=-=-=-=-=
1201 '             ---------  J E U  ---------
1202 Y=200-Y:'     =-=-=-=-=-=-=-=-=-=-=-=-=-=
1203 IF Y=<28 THEN LOCATE 14,1:PRINT "perdu .......":GOTO 1400
1204 FOR I=1 TO 4
1205 RTTT=0:LOCATE 14,1:PRINT "couleur nø";I
1206 A$=INKEY$:IF A$="" THEN 1205 ELSE A=VAL(A$)
1207 IF A=0 AND A$<>"0" THEN BEEP :GOTO 1205
1208 IF A>=7 THEN BEEP:GOTO 1205 ELSE CJ(I)=A:NEXT
1209 PAINT (127,Y),CJ(1),14:PAINT (147,Y),CJ(2),14:PAINT (164,Y),CJ(3),14:PAINT (179,Y),CJ(4),14:E(1)=C1:E(2)=C2:E(3)=C3:E(4)=C4
1210 IF CJ(1)=C1 AND CJ(2)=C2 AND CJ(3)=C3 AND CJ(4)=C4 THEN LOCATE 14,1:PRINT "GAGNE .........":GOTO 1400
1211 FOR I=1 TO 4
1212 IF CJ(I)=E(I) THEN CJ(I)=42:E(I)=32:GOSUB 1300
1213 NEXT
1214 FOR I=1 TO 4
1215 FOR T=1 TO 4
1216 IF CJ(I)=E(T) THEN CJ(I)=42:E(T)=32:GOSUB 1310
1217 NEXT :NEXT :Y=Y-15:GOTO 1203
1300 ' *************************************************************************
1301 ' *                   Coup bien placer ==> affichage                      *
1302 ' *************************************************************************
1304 RTTT=RTTT+1:IF RTTT >=5 THEN RTTT=1
1305 ON RTTT GOTO 1306,1307,1308,1309
1306 PAINT(171+15,Y-8),12,14:RETURN
1307 PAINT(180+15,Y-8),12,14:RETURN
1308 PAINT(180+15,Y+3),12,14:RETURN
1309 PAINT(171+15,Y+3),12,14:RETURN
1310 ' *************************************************************************
1311 ' *                   Coup mal plac‚  ==> affichage                      *
1312 ' *************************************************************************
1313 RTTT=RTTT+1:IF RTTT >=5 THEN RTTT=1
1314 ON RTTT GOTO 1315,1316,1317,1318
1315 PAINT(171+15,Y-8),11,14:RETURN
1316 PAINT(180+15,Y-8),11,14:RETURN
1317 PAINT(180+15,Y+3),11,14:RETURN
1318 PAINT(171+15,Y+3),11,14:RETURN
1400 LOCATE 4,4:PRINT C1;C2;C3;C4;:PAINT (123,18),C1,14:PAINT (138,18),C2,14:PAINT (153,18),C3,14:PAINT (180,18),C4,14
1401 LOCATE 24,1:PRINT " Voulez vous recomancer ? O/N ....... ";
1402 A$=INKEY$: IF A$="" THEN 1402 ELSE IF A$="O" OR A$="o" THEN 1000 ELSE END
