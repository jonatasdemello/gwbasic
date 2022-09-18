10 '****************************************************************************
20 '**            Programme tir‚ de PCompatible nø39 p 56 et 57               **
30 '**                       FONTES.BAS                                       **
40 '**                                                                        **
50 '**    Appel GW au choix : BASIC /M:&HE000 ou BASIC (plantage assur‚)      **
60 '****************************************************************************
70 SCREEN 2:KEY OFF:CLS:LOCATE 12,32:PRINT "Patientez...";
80 GOSUB 920   ' Pour initialisation des routines et des fontes
90 GOSUB 690   ' Pour d‚monstration.
100 '---------------------------------------------------------------------------
110                                END
120 '---------------------------------------------------------------------------
130 '---------------------------------------------------------------------------
140 '|                 CHANGER DE FONTE. SUB FONTE(FONTE$)                     |
150 '---------------------------------------------------------------------------
160 DATA   85 ,  139 ,  236 ,   30 ,    6 ,   87 ,   86 ,  184 ,    0
170 DATA    0 ,  142 ,  192 ,  191 ,  124 ,    0 ,  197 ,  118 ,    6
180 DATA  139 ,    4 ,   38 ,  137 ,    5 ,  131 ,  199 ,    2 ,  140
190 DATA  216 ,   38 ,  137 ,    5 ,   94 ,   95 ,    7 ,   31 ,   93
200 DATA  202 ,    4 ,    0
210 '
220 ' Nombre d'octets : 39
230 ' push bp / mov bp, sp / push ds / push es / push di / push si
240 ' mov ax,0 / mov es, ax / mov di, 7CH / lds si, [bp+6] / mov ax, [si]
250 ' mov [es:di], ax / add di, 2 / mov ax, ds / mov [es:di], ax
260 ' pop si / pop di / pop es / pop ds / pop bp / ret 4 (202, 4, 0)
270 ' ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
280 ' ||  Attend en entr‚e deux variables :                                   ::
290 ' :: CALL(S) GETGRAFTABL (SEGMENT%, ADRESSE%)                             ||
300 ' ||   qui re‡oivent l'adresse complŠte de la table des caractŠres        ||
310 ' ||   graphiques                                                         ||
320 ' ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
330 DATA   85 , 139 , 236 ,  30 ,   6 ,  87 ,  86 , 196 , 126
340 DATA    6 , 184 ,   0 ,   0 , 142 , 216 , 190 , 124 ,   0
350 DATA  165 , 196 , 126 ,  10 , 165 ,  94 ,  95 ,   7 ,  31
360 DATA   93 , 202 ,   8 ,   0
370 '
380 ' Nombre d'octets : 31
390 'push bp / mov bp, sp / push ds / push es / les di, [bp+06H] / mov ax,0
400 'mov ds, ax / mov si, 7CH / movsw / les di, [bp+0AH] / movsw / pop es
410 'pop ds / pop bp / RET 8 ( 202, 8, 0).
420 '|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
430 '||   Attend en entr‚e deux variables :                                   ||
440 '||        CALL(S) PUTGRAFTABL (SEGMENT%, ADRESSE%)                       ||
450 '||  qui d‚finissent la nouvelle adresse de la table des caractŠres       ||
460 '||  graphiques.                                                          ||
470 '|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
480 DATA  85 , 139 , 236 ,  30 ,   6 , 197 , 118 ,   6 , 184
490 DATA   0 ,   0 , 142 , 192 , 191 , 124 ,   0 , 165 , 197
500 DATA 118 ,  10 , 165 ,   7 ,  31 ,  93 , 202 ,   8 ,   0
510 '
520 ' Nombre d'octets : 27
530 ' push bp / mov bp, sp / push ds / push es / lds si, [bp+06H]
540 ' mov ax,0 / mov es, ax / mov di , 7CH / movsw / lds si, [bp+0AH]
550 ' movsw / pop es / pop ds / pop bp / RET 8 (202 , 8 , 0 )
560 '---------------------------------------------------------------------------
570 '                         ROUTINE D'AFFICHAGE
580 '---------------------------------------------------------------------------
590    LOCATE LIGNE%,COLONNE% : PRINT A$
600 RETURN
610 '
620    LOCATE LIGNE%,COLONNE%
630   FOR I%=1 TO LEN(A$)
640       A%=ASC(MID$(A$,I%,1))+96 : PRINT CHR$(A%);
650   NEXT I%
660 RETURN
670 '---------------------------------------------------------------------------
680 '
690 '                   PROGRAMME PRINCIPAL DE FONTE.BAS
700 '
710 '---------------------------------------------------------------------------
720 FOR I%=128 TO 250 : SORTIE$=SORTIE$+CHR$(I%)+CHR$(128) :NEXT
730 '
740 LOCATE 12,12
750 PRINT "Les trois fontes sont disponibles. Frappez une touche ."
760 WHILE INKEY$="" : WEND : LINE (0,0)-(639,199),1,B
770 '
780 CALLS FONTE(GRAF96%)
790   A$=SORTIE$ : LIGNE%=4 : COLONNE%=1 : GOSUB 590
800   A$="Ecriture avec GRAF96":LIGNE%=8 : COLONNE%=30 : GOSUB 620
810 CALLS FONTE(GRAS%)
820   A$=SORTIE$: LIGNE%=10 : COLONNE%=1 : GOSUB 590
830   A$="Ecriture avec fonte grasse" : LIGNE%=14:COLONNE%=30: GOSUB 620
840 CALLS FONTE(GRIS%)
850   A$=SORTIE$ : LIGNE%=16 : COLONNE%=1 : GOSUB 590
860   A$="Ecriture avec fonte gris‚e" : LIGNE% = 20 :COLONNE%=30 : GOSUB 620
870 '
880 CALLS PUTGRAFTABL(ANCIENSGRAF%, ANCIENAGRAF%)    'pour restitution.
890 '
900 RETURN
910 '---------------------------------------------------------------------------
920 '                INITIALISATION DES ROUTINES ASSEMBLEUR.
930 '---------------------------------------------------------------------------
940 '
950 BON=9231 : RESTORE
960 FOR I=1 TO 97 : READ X : VERIF =VERIF+X : NEXT
970 IF VERIF<>BON THEN PRINT " Erreur de saisie dans les DATA ": END
980 '
990 'POKage des routines :
1000 GETGRAFTABL=&HE000                : RESTORE 330
1010   FOR I=0 TO 30 : READ X : POKE GETGRAFTABL+I, X : NEXT
1020 PUTGRAFTABL=GETGRAFTABL+35        : RESTORE 480
1030   FOR I=0 TO 26 : READ X : POKE PUTGRAFTABL+I, X : NEXT
1040 FONTE=PUTGRAFTABL+30              : RESTORE 160
1050   FOR I=0 TO 38 : READ X : POKE FONTE+I, X :NEXT
1060 PRINT ".";
1070 '
1080 ' pokage des fontes :
1090 '
1100 CALLS GETGRAFTABL (ANCIENSGRAF%, ANCIENAGRAF%)    ' Pour sauvegarde
1110 SGRAFTABL = ANCIENSGRAF% : GRAFTABL=ANCIENAGRAF%
1120 '
1130 GRAF=FONTE+40
1140   FOR CAR%=0 TO 127
1150     FOR OCTET%=0 TO 7
1160       DECAL=(CAR%*8)+OCTET%
1170       DEF SEG=SGRAFTABL : VALEUR=(PEEK(GRAFTABL+DECAL))
1180       DEF SEG           : POKE GRAF+DECAL, VALEUR
1190     NEXT
1200   NEXT
1210 PRINT ".";
1220 '--------------------------------------------------------------------------
1230 '              REMPLIR LES TABLEAUX GRAF96%() ET SUIVANTS
1240 '    Cr‚ation d'un tableau de base pour les caractŠres reproduisant
1250 '    l'alphabet et repoussant les caractŠres accentu‚s en queue. Il
1260 '    sert de base … la cr‚ation des autres fontes.
1270 '--------------------------------------------------------------------------
1280 GRAF96=GRAF+1025
1290    FOR I%=0 TO 30
1300      FOR OCTET%=0 TO 7
1310        VALEUR%=PEEK(GRAF+(I%*8)+OCTET%)
1320        POKE GRAF96+((I%+96)*8)+OCTET%, VALEUR%
1330      NEXT
1340    NEXT
1350    FOR OCTET%=0 TO 7 : POKE GRAF96+(31+96)*8+OCTET%,0 : NEXT
1360    CARSEG%=&HF000 : CARAD%=&HFA6E+(32*8)
1370    FOR I%=0 TO 95
1380      FOR OCTET%=0 TO 7
1390        DEF SEG=CARSEG% : VALEUR%=(PEEK(CARAD%+(I%*8)+OCTET%))
1400        DEF SEG : POKE GRAF96+(I%*8)+OCTET%, VALEUR%
1410      NEXT
1420    NEXT
1430    PRINT ".";
1440 '
1450 'fonte gras :
1460 GRAS = GRAF96+1025
1470 FOR I%=0 TO 1023
1480   V%=PEEK(GRAF96+I%) : V%=V% XOR &HFF : V%=V% OR (V%/2)
1490   VALEUR%=V% XOR &HFF
1500   POKE GRAS+I%, VALEUR%
1510 NEXT
1520 PRINT ".";
1530 '
1540 'fonte gris‚e :
1550 GRIS=GRAS+1025
1560 FOR I%=0 TO 1023
1570     V%=PEEK(GRAF96+I%): VALEUR%=V% AND &H55    ' (=1010101)
1580     POKE GRIS+I%, ABS(VALEUR%)
1590 NEXT
1600 PRINT ".";
1610 '
1620 GRAF%=GRAF : GRAF96%=GRAF96 : GRAS%=GRAS : GRIS%=GRIS
1630 '
1640 RETURN
2000 REM ***********************************************************************
2010 REM **   Taper par DARCHE Yoann le 09/06/1990  Sur Commodore PC1         **
2020 REM **         & Quellesques modifications  sign‚es DARCHE Yoann         **
2030 REM ***********************************************************************
