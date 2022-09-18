10 LOCATE ,,1,0,7
20  CLS
30 DFGH=1
40 DIM N2$(1000),N$(1000),P$(1000),AD$(1000),CO$(1000),C1$(1000),TEL$(1000)
50 KEY OFF
60 DIM N1$(1000),P1$(1000),AD1$(1000),CO1$(1000),C11$(1000),TEL1$(1000)
70 PO$=CHR$(179):AZ$=CHR$(195):AY$=CHR$(180):AW$=CHR$(197):AK$=CHR$(196)
80 OPEN "qte.adr" FOR INPUT AS #1
90 IF EOF(1) THEN CLOSE :GOTO 130
100 PM=PM+1
110 INPUT #1,N$(PM),P$(PM),AD$(PM),CO$(PM),C1$(PM),TEL$(PM)
120 GOTO 90
130 II=1:IJ=1:IF PM=0 THEN PRINT "il n'y a aucune adresse de ce fichier ":GOTO 240
140 COLOR 1: PRINT PO$;"Nom         ";:COLOR 2:PRINT PO$;"Prenom      ";:COLOR 3:PRINT PO$;"adresse +";:COLOR 4:PRINT " code postal                    ";:COLOR 5:PRINT PO$;"T‚l‚phone"
150 COLOR 1:PRINT AZ$;:FOR I=2 TO 13:PRINT AK$;:NEXT :COLOR 2:PRINT AW$;:FOR I=15 TO 26:PRINT AK$;:NEXT:COLOR 3:PRINT AW$;:FOR I=28 TO 68 :PRINT AK$;:NEXT:COLOR 5:PRINT AW$;:FOR I=70 TO 80:PRINT AK$;:NEXT
160 IF IJ > 19 THEN 200
170 COLOR 1:PRINT PO$;N$(II);:COLOR 2:LOCATE ,14:PRINT PO$;P$(II);:COLOR 3:LOCATE ,27:PRINT PO$;AD$(II);" ";:COLOR 4:PRINT CO$(II);" ";C1$(II);:COLOR 5:LOCATE ,69:PRINT PO$;TEL$(II)
180 IF II = PM THEN 250
190 IJ=IJ+1:II=II+1:GOTO 160
200 DFGH=DFGH+1:LOCATE 21:COLOR 30:PRINT "Attention !!! ":COLOR 3:PRINT "si vous appuyez sur une touche nous passons au ";DFGH;" ‚me tableaux "
210 IF DFGH >2 THEN KLM=1:COLOR 5:PRINT " R pour retour en arriŠre "
220 A$=INKEY$:IF A$="" THEN 220
230 IF KLM=1 AND A$="r" OR A$="R" THEN II=II-19:DFGH = DFGH - 2:KLM=0:IJ=1:CLS:GOTO 140
240 CLS:II=II-1:IJ=1 :GOTO 140
250 COLOR 14:PRINT "voulez-vous 1 retour au premier tableau,2 pour sortir ,3 effacer des noms etc..,4 enregitrer de nom etc... ,5 pour faire une recherche d'un Nom ,6 pour listing   7 pour TRIE ALPHABETIQUE  8 pour ENTETE DE FEUILLE "
260 A$=INKEY$:IF A$="" THEN  260
270 IF A$="1" THEN CLS:GOTO 130
280 IF A$="2" THEN SYSTEM
290 IF A$="3" THEN 350
300 IF A$="4" THEN 610
310 IF A$="5" THEN 770
320 IF A$="6" THEN 2120
330 IF A$="7" GOTO 2170
331 IF A$="8" GOTO 4000
340 BEEP:GOTO 260
350 CLS:COLOR 5:LOCATE 5,5:PRINT "pour detruire l'adresse  il faut  inscrire Le Nom et  le  Prenom  comme il sont  inscrits sur la disquette "
360 LOCATE 10,20:COLOR 14:PRINT "NOM    :";:COLOR 3:INPUT "",N1$
370 LOCATE 12,20:COLOR 14:PRINT "PRENOM :";:COLOR 1:INPUT "",P1$
380 IF N1$="" THEN AZ=1:GOTO 400
390 IF P1$="" THEN AZ=2:GOTO 400
400 FOR I=1 TO PM
410 IF AZ=1 AND N$(I)=N1$ THEN 480
420 IF AZ=2 AND P$(I)=P1$ THEN 480
430 IF N1$=N$(I) AND P$(I)=P1$ THEN 480
440 NEXT :PRINT "d‚sol‚ je n'ai pas trouvez A pour abondonner R pour recommancer "
445 A$=INKEY$:IF A$="" THEN 445
450 IF A$="a" OR A$="A" THEN RUN
460 IF A$="r" OR A$="R" THEN 350
470 BEEP:GOTO 445
480 COLOR 2:PRINT "Celle que j'ai trouv‚ c'est :"
490 PRINT N$(I);" ";P$(I);" ";AD$(I);" ";CO$(I);" ";C1$(I);" . Tel :";TEL$(I)
500 COLOR 14:PRINT " Est-ce celle-ci O/N "
510 A$=INKEY$:IF A$="" THEN 510
520 IF A$="n" OR A$="N" THEN PRINT "Dommage !!!":GOTO 440
530 FOR MM=I+1 TO PM
540 N$(MM-1)=N$(MM):P$(MM-1)=P$(MM):AD$(MM-1)=AD$(MM):CO$(MM-1)=CO$(MM):C1$(MM-1)=C1$(MM):TEL$(MM-1)=TEL$(MM):C1$(MM)="":N$(MM)="":P$(MM)="":AD$(MM)="":CO$(MM)="":TEL$(MM)=""
550 NEXT
560 OPEN "QTE.ADR" FOR OUTPUT AS #1
570 FOR I=1 TO PM-1
580 PRINT #1,N$(I);",";P$(I);",";AD$(I);",";CO$(I);",";C1$(I);",";TEL$(I)
590 NEXT :CLOSE
600 PRINT "  A pour abondon R pour recommancer":GOTO 445
610 REM
620 SE=PM :CLS
630 SE=SE+1
640 COLOR 5,1:PRINT "N O M :             ":LOCATE 1,8:INPUT "",N$(SE):PRINT "P R E N O M :             ":LOCATE 2,14:INPUT "",P$(SE)
650 INPUT "Adresse + Nø :",AD$(SE)
660 INPUT "Code Postal : ",CO$(SE):INPUT " Ville  : ",C1$(SE)
670 LINE INPUT "Nø de t‚l‚phone : ",TEL$(SE)
680 PRINT "fin O/N "
690 A$=INKEY$:IF A$="" THEN 690
700 IF A$="O" OR A$="o" THEN COLOR 1,0:CLS:GOTO 720
710 COLOR 1,0:CLS :GOTO 630
720 OPEN "QTE.ADR" FOR OUTPUT AS #1
730 FOR I=1 TO SE
740 PRINT #1,N$(I);",";P$(I);",";AD$(I);",";CO$(I);",";C1$(I);",";TEL$(I)
750 NEXT :CLOSE
760 RUN
770 CLS:PRINT "Cette partie consite a rechercher un nom,un prenom,un code postale,un Nø de        t‚l‚phone "
780 COLOR 1:PRINT "-1- pour recherche d'un nom "
790 COLOR 2:PRINT "-2- pour recherche d'un prenom "
800 COLOR 3:PRINT "-3- pour recherche d'un code postal"
810 COLOR 4:PRINT "-4- pour recherche d'un Nø de t‚l‚phonne"
820 COLOR 5:PRINT "-5- pour recherche des code potal commen‡ant par le deux m‚me nø "
830 PRINT "faites votre choix"
840 A$=INKEY$:IF A$="" THEN 840
850 IF A$="5" THEN 1890
860 IF A$="1" THEN 910
870 IF A$="2" THEN 1200
880 IF A$="3" THEN 1430
890 IF A$="4" THEN 1660
900 BEEP:GOTO 830
910 CLS:PRINT "       R E C H E R C H E    D E    N O M  ":BVC=1
920 LOCATE 10,20:COLOR 14:PRINT " N O M : ";:COLOR 3:INPUT "",N1$
930 P=1:FPM=0
940 FOR I=1 TO PM
950 IF N$(I)=N1$ THEN 970
960 NEXT :IF FPM=1 THEN FPM=0:GOTO 1000 ELSE PRINT "d‚sol‚ je n'ai rien trouv‚ ":GOTO 1110
970 IF FPM=0 THEN FPM=1
980 N1$(P)=N$(I):P1$(P)=P$(I):AD1$(P)=AD$(I):CO1$(P)=CO$(I):C11$(P)=C1$(I):TEL1$(P)=TEL$(I)
990 P=P+1:GOTO 960
1000 PRINT "Ce que j'ai trouv‚ :"
1010 FOR I=1 TO P-1
1020 PRINT N1$(I);" ";P1$(I);" ";AD1$(I);" ";CO1$(I);" ";C11$(I);" .Tel ";TEL1$(I)
1030 NEXT
1040 PRINT "Voulez-vous une trace ‚crite O/N "
1050 A$=INKEY$:IF A$="" THEN 1050
1060 IF A$="o" OR A$="O" THEN 1080
1070 GOTO 1110
1080 FOR I=1 TO P-1
1090 LPRINT CHR$(27);CHR$(29);"                   ";CHR$(15);N1$(I);" ";P1$(I):LPRINT
1091 LPRINT CHR$(14);"                  ";AD1$(I)
1092 LPRINT "                  ";CO1$(I);" ";C11$(I)
1093 LPRINT "                  ";"Tel : ";TEL1$(I):LPRINT:LPRINT
1100 NEXT
1110 PRINT "voulez-vous recommencer (1),allez au menu `recherche' (2),ou lire les adresses     n'importe quelle touche "
1120 A$=INKEY$:IF A$="" THEN 1120
1130 IF A$="1" AND BVC=1 THEN BVC=0:GOTO 910
1140 IF A$="1" AND BVC=2 THEN BVC=0:GOTO 1200
1150 IF A$="1" AND BVC=3 THEN BVC=0:GOTO 1430
1160 IF A$="1" AND BVC=4 THEN BVC=0:GOTO 1660
1170 IF A$="1" AND BVC=5 THEN BVC=0:GOTO 1890
1180 IF A$="2" THEN 770
1190 RUN
1200 CLS:PRINT "    R e c h e r c h e   d e   P R E N O M ":BVC=2
1210 LOCATE 10,20:COLOR 14:PRINT "P R E N O M : ";:COLOR 3:INPUT "",P1$
1220 P=1:FPM=0
1230 FOR I=1 TO PM
1240 IF P$(I)=P1$ THEN 1280
1250 NEXT
1260 IF FPM=1 THEN FPM=0:GOTO 1310
1270 PRINT "desol‚ je n'ai rien trouv‚....":GOTO 1110
1280 IF FPM=0 THEN FPM=1
1290 N1$(P)=N$(I):P1$(P)=P$(I):AD1$(P)=AD$(I):CO1$(P)=CO$(I):C11$(P)=C1$(I):TEL1$(P)=TEL$(I)
1300 P=P+1:GOTO 1250
1310 PRINT "Ce que j'ai trouv‚ :"
1320 FOR I=1 TO P-1
1330 PRINT N1$(I);" ";P1$(I);" ";AD1$(I);" ";CO1$(I);" ";C11$(I);" .Tel ";TEL1$(I)
1340 NEXT
1350 PRINT "Voulez-vous une trace ‚crite O/N "
1360 A$=INKEY$:IF A$="" THEN 1360
1370 IF A$="o" OR A$="O" THEN 1390
1380 GOTO 1110
1390 FOR I=1 TO P-1
1400 LPRINT CHR$(27);CHR$(29);"                   ";CHR$(15);N1$(I);" ";P1$(I):LPRINT
1401 LPRINT CHR$(14);"                  ";AD1$(I)
1402 LPRINT "                  ";CO1$(I);" ";C11$(I)
1403 LPRINT "                  ";"Tel : ";TEL1$(I):LPRINT:LPRINT
1410 NEXT
1420 GOTO 1110
1430 CLS:PRINT "    R E C H E R C H E   D U   C O D E   P O S T A L  " :BVC=3
1440 LOCATE 10,20:COLOR 14:PRINT "C O D E   P O S T A L  : ";:COLOR 3:INPUT "",CO1$
1450 P=1:FPM=0
1460 FOR I=1 TO PM
1470 IF CO$(I)=CO1$ THEN 1510
1480 NEXT
1490 IF FPM=1 THEN FPM=0:GOTO 1540
1500 PRINT "desol‚ je n'ai rien trouv‚....":GOTO 1110
1510 IF FPM=0 THEN FPM=1
1520 N1$(P)=N$(I):P1$(P)=P$(I):AD1$(P)=AD$(I):CO1$(P)=CO$(I):C11$(P)=C1$(I):TEL1$(P)=TEL$(I)
1530 P=P+1:GOTO 1480
1540 PRINT "Ce que j'ai trouv‚ :"
1550 FOR I=1 TO P-1
1560 PRINT N1$(I);" ";P1$(I);" ";AD1$(I);" ";CO1$(I);" ";C11$(I);" .Tel ";TEL1$(I)
1570 NEXT
1580 PRINT "Voulez-vous une trace ‚crite O/N "
1590 A$=INKEY$:IF A$="" THEN 1590
1600 IF A$="o" OR A$="O" THEN 1620
1610 GOTO 1110
1620 FOR I=1 TO P-1
1630 LPRINT CHR$(27);CHR$(29);"                   ";CHR$(15);N1$(I);" ";P1$(I):LPRINT
1631 LPRINT CHR$(14);"                  ";AD1$(I)
1632 LPRINT "                  ";CO1$(I);" ";C11$(I)
1633 LPRINT "                  ";"Tel : ";TEL1$(I):LPRINT:LPRINT
1640 NEXT
1650 GOTO 1110
1660 CLS:PRINT "    R E C H E R C H E   D U   N ø   D E   T E L E P H O N" :BVC=4
1670 LOCATE 10,20:COLOR 14:PRINT "N ø   D E   T E L E P H O N : ";:COLOR 3:INPUT "",TEL1$
1680 P=1:FPM=0
1690 FOR I=1 TO PM
1700 IF TEL$(I)=TEL1$ THEN 1740
1710 NEXT
1720 IF FPM=1 THEN FPM=0:GOTO 1770
1730 PRINT "d‚sol‚ je n'ai rien trouv‚....":GOTO 1110
1740 IF FPM=0 THEN FPM=1
1750 N1$(P)=N$(I):P1$(P)=P$(I):AD1$(P)=AD$(I):CO1$(P)=CO$(I):C11$(P)=C1$(I):TEL1$(P)=TEL$(I)
1760 P=P+1:GOTO 1710
1770 PRINT "Ce que j'ai trouv‚ :"
1780 FOR I=1 TO P-1
1790 PRINT N1$(I);" ";P1$(I);" ";AD1$(I);" ";CO1$(I);" ";C11$(I);" .Tel ";TEL1$(I)
1800 NEXT
1810 PRINT "Voulez-vous une trace ‚crite O/N "
1820 A$=INKEY$:IF A$="" THEN 1820
1830 IF A$="o" OR A$="O" THEN 1850
1840 GOTO 1110
1850 FOR I=1 TO P-1
1860 LPRINT CHR$(27);CHR$(29);"                   ";CHR$(15);N1$(I);" ";P1$(I):LPRINT
1861 LPRINT CHR$(14);"                  ";AD1$(I)
1862 LPRINT "                  ";CO1$(I);" ";C11$(I)
1863 LPRINT "                  ";"Tel : ";TEL1$(I):LPRINT:LPRINT
1870 NEXT
1880 GOTO 1110
1890 CLS:PRINT "    R E C H E R C H E   D U   N ø   D E   C O D E   P O S T A L" :BVC=5
1900 LOCATE 10,20:COLOR 14:PRINT "N ø   D U   C O D E   P O S T A L : ";:COLOR 3:INPUT "",CO2$
1910 P=1:FPM=0
1920 FOR I=1 TO PM
1930 IF LEFT$ (CO$(I),2)= CO2$ THEN 1970
1940 NEXT
1950 IF FPM=1 THEN FPM=0:GOTO 2000
1960 PRINT "d‚sol‚ je n'ai rien trouv‚....":GOTO 1110
1970 IF FPM=0 THEN FPM=1
1980 N1$(P)=N$(I):P1$(P)=P$(I):AD1$(P)=AD$(I):CO1$(P)=CO$(I):C11$(P)=C1$(I):TEL1$(P)=TEL$(I)
1990 P=P+1:GOTO 1940
2000 PRINT "Ce que j'ai trouv‚ :"
2010 FOR I=1 TO P-1
2020 PRINT N1$(I);" ";P1$(I);" ";AD1$(I);" ";CO1$(I);" ";C11$(I);" .Tel ";TEL1$(I)
2030 NEXT
2040 PRINT "Voulez-vous une trace ‚crite O/N "
2050 A$=INKEY$:IF A$="" THEN 2050
2060 IF A$="o" OR A$="O" THEN 2080
2070 GOTO 1110
2080 FOR I=1 TO P-1
2090 LPRINT CHR$(27);CHR$(29);"                   ";CHR$(15);N1$(I);" ";P1$(I):LPRINT
2091 LPRINT CHR$(14);"                  ";AD1$(I)
2092 LPRINT "                  ";CO1$(I);" ";C11$(I)
2093 LPRINT "                  ";"Tel : ";TEL1$(I):LPRINT:LPRINT
2100 NEXT
2110 GOTO 1110
2120 FOR A=1 TO PM
2130 LPRINT N$(A);:LPRINT CHR$(27);CHR$(16);CHR$(0);CHR$(73);P$(A);
2140 LPRINT CHR$(27);CHR$(16);CHR$(0);CHR$(151);AD$(A);" ";CO$(A);" ";C1$(A);"  . Tel :";TEL$(A)
2150 REM LPRINT CHR$(27);CHR$(16);CHR$(0);CHR$(300);TEL$(A)
2160 NEXT :RUN
2170 CLS :PRINT "                          T R I   A L P H A B E T I Q U E "
2180 PRINT "CONVERSIONS EN CARACTERE MAJUSCULE ............................:"
2190 FOR I=1 TO PM
2200 N1$(I)=N$(I):P1$(I)=P$(I):AD1$(I)=AD$(I):CO1$(I)=CO$(I):C11$(I)=C1$(I):TEL1$(I)=TEL$(I)
2210 NEXT
2220 FOR I=1 TO PM :FOR Y=1 TO LEN(N1$(I))
2230 REM FOR Y=1 TO LEN (N1$(I))
2240 A$=LEFT$(N1$(I),Y):AP$=RIGHT$(A$,1):A$=""
2250 IF AP$="" THEN PRINT I:GOTO 2520
2260 IF AP$="‚" THEN AP$="E"
2270 IF AP$="Š" THEN AP$="E"
2280 IF AP$="ˆ" THEN AP$="E"
2290 IF AP$="‰" THEN AP$="E"
2300 IF AP$="‡" THEN AP$="C"
2310 IF AP$="…" THEN AP$="A"
2320 IF AP$="ƒ" THEN AP$="A"
2330 IF AP$="„" THEN AP$="A"
2340 IF AP$="—" THEN AP$="U"
2350 IF AP$="" THEN AP$="U"
2360 IF AP$="˜" THEN AP$="Y"
2370 IF AP$="Œ" THEN AP$="I"
2380 IF AP$="‹" THEN AP$="I"
2390 IF AP$="“" THEN AP$="O"
2400 IF AP$="”" THEN AP$="O"
2410 IF AP$="™" THEN AP$="O"
2420 IF AP$="š" THEN AP$="U"
2430 IF AP$="Ž" THEN AP$="A"
2440 IF AP$="–" THEN AP$="U"
2450 AP = ASC(AP$)
2460 IF AP >= 97  AND AP <= 122 THEN AP=AP-32:AP$=CHR$(AP)
2470 IF AP >= 91  AND AP <= 96 THEN AP$=""
2480 IF AP >= 123 AND AP <= 128 OR AP >= 155 THEN AP$=""
2490 IF AP >= 32  AND AP <= 64 THEN AP$=""
2500 N2$(I)=N2$(I)+AP$
2510 NEXT Y:PRINT I,N2$(I),N1$(I):NEXT I
2520 GOTO 2560:REM FOR I=1 TO PM
2530 P=P+1:IF P=15 THEN P=1:COLOR P ELSE COLOR P
2540 PRINT I,N2$(I),N1$(I):NEXT
2550 PRINT "TRI ALPHABETIQUE ...............................................:"
2560 CLS:PRINT  "--------------------------- TRI ----------------------------"
2570 FOR X=1 TO PM-1
2580 X1=ASC(LEFT$(N2$(X),1))
2590 FOR Y=X+1 TO PM
2600 Y1=ASC(LEFT$ (N2$(Y),1))
2610 LOCATE 11,1:PRINT "                                                                                "
2620 LOCATE 11,1:PRINT X:LOCATE 11,5:PRINT N1$(X)
2621 REM  II
2630 LOCATE 11,42:PRINT N1$(Y)
2640 REM comparaison 1 lettre
2650 IF X1 > Y1 THEN X$ = N1$(X):N1$(X) = N1$(Y):N1$(Y) = X$:X$ = N2$(X):N2$(X)=N2$(Y):N2$(Y)=X$:X1 = ASC ( LEFT$ ( N2$(X),1)):GOTO 2800
2660  IF X1 <Y1 THEN 2800
2670 REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
2680 REM         coparaison de lettre suivante
2690 REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
2700 LX=LEN (N2$(X)):LY=LEN (C$(Y))
2710 K=2
2720 IF K>LX THEN 2800
2730 IF K > LY THEN X$=N1$(X):N1$(X)=N1$(Y):N1$(Y)=X$:X$= N2$(X):N2$(X)=N2$(Y):N2$(Y)=X$:X1=ASC(LEFT$(N2$(X),1)):GOTO 2800
2740 X2=ASC(MID$(N2$(X),K,1))
2750 Y2=ASC(MID$(N2$(Y),K,1))
2760 IF X2>Y2 THEN X$=N1$(X):N1$(X)=N1$(Y):N1$(Y)=X$:X$=N2$(X):N2$(X)=N2$(Y):N2$(Y)=X$:X1=ASC(LEFT$(C$(X),1)):GOTO 2800
2770 REM
2780 IF X2 < Y2 THEN 2800
2790 K=K+1:GOTO "???"
2800 NEXT Y
2810 NEXT X
2815 PRINT "finie pour le tri..................................."
2816 PRINT " je tri les adresses les prenoms,les codes postaux ... patientez ..."
2817 FOR I= 1 TO PM
2820 N2$(I)=N1$(I):NEXT I
2830 FOR I=1 TO PM
2840 FOR S=1 TO PM
2850 IF N$(S)=N2$(I) THEN 2860 ELSE NEXT S
2860 N1$(I)=N$(S):P1$(I)=P$(S):AD1$(I)=AD$(S):CO1$(I)=CO$(S):C11$(I)=C1$(S):TEL1$(I)=TEL$(S)
2870 NEXT I
2880 PRINT "fin de rassemblement ... "
2890 FOR I=1 TO PM
2900 N$(I)=N1$(I):P$(I)=P1$(I):AD$(I)=AD1$(I):CO$(I)=CO1$(I):C1$(I)=C11$(I):TEL$(I)=TEL1$(I)
2910 NEXT I
2920 OPEN "QTE.ADR" FOR OUTPUT AS #1
2930 FOR I=1 TO PM
2940 PRINT #1,N$(I);",";P$(I);",";AD$(I);",";CO$(I);",";C1$(I);",";TEL$(I)
2950 NEXT :CLOSE:RUN
4000 REM        E N T E T E  DE  F E U I L L E   ( I M P R I M A N T E )
4010 LPRINT CHR$(27);CHR$(14);CHR$(27);CHR$(31);"        D I V U L G U E S":LPRINT "        -----------------";:LPRINT CHR$(27);CHR$(15);CHR$(27);CHR$(20);" Tel : 69 39 51 26 "
4020 RUN
