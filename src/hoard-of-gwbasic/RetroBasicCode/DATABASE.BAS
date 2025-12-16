10 REM *************************************************************************
20 REM **         Programme de stockage de produits + tri + recherche         **
30 REM **                Achev┌ le 21/08/1989    NЬ4   Ver 1.1                **
40 REM **                  De DARCHE Yoann   Tel 69-39-51-26                  **
50 REM *************************************************************************
60 GOSUB 4460
70 SCREEN 2:SCREEN 0:CLS:CLEAR:KEY OFF
80 KEY 10,CHR$(219)+CHR$(13)
90 ON ERROR GOTO 4180
100 COLOR 13
110 R$="":F$="":U$="":PRINT "UNITE UTILISEE : (A-B-C) "
120 A$=INKEY$:IF A$="" THEN 120
130 IF A$="a" OR A$="A" THEN U$="A:"
140 IF A$=CHR$(27) THEN 560
150 IF A$="b" OR A$="B" THEN U$="B:"
160 IF A$="c" OR A$="C" THEN U$="C:":GOTO 190
170 IF U$="" THEN COLOR 30:BEEP:PRINT A$;" n'est pas une unit┌e ... ":COLOR 13:GOTO 110
180 GOTO 240
190 PRINT:PRINT
200 COLOR 2:INPUT "Quelle repertoire (sans les /) ";R$
210 IF LEN(R$)>8 THEN BEEP:COLOR 30:PRINT "trop long ....":GOTO 200
220 IF R$="" THEN 240
230 U$=U$+"/"+R$+"/"
240 COLOR 4:INPUT "Nom du fichier ",F$
250 U$=U$+F$
260 PRINT:PRINT
270 COLOR 10:PRINT "Nom d'acces = ";U$
280 COLOR 14:PRINT " Oui ou Non"
290 A$=INKEY$:IF A$="" THEN 290
300 IF A$="n" OR A$="N" THEN 70
310 IF A$="o" OR A$="O" THEN 330
320 BEEP:GOTO 290
330 OPEN "I",#1,U$
340 COLOR 15:IF EOF(1) THEN PRINT "NOUVEAU FICHIER ...." ELSE 370
350 CLOSE:COLOR 11
360 FOR U=1 TO 1000:NEXT
370 CLOSE:DIM N!(500),N$(500),C$(500),C!(500),T$(500),D!(500),P!(500),E$(500),L$(500),D$(500),R(50)
380 H=0:CLS:REM ====================================== debut PROGRAMME ============
390 OPEN "I",#1,U$
400 IF EOF(1) THEN 450
410 H=H+1
420 INPUT #1,N$,N$(H),C$(H),C$,T$(H),D$,P$,E$(H),L$(H),D$(H)
430 N!(H)=VAL(N$):C!(H)=VAL(C$):D!(H)=VAL(D$):P!(H)=VAL(P$)
440 GOTO 400
450 CLOSE
460 PRINT "Il y a";H;"produits enregistr┌s ":A$=INPUT$(1)
470 COLOR 11,0:CLS
480 LOCATE 11,9:PRINT "здддддддддддддддддддддддддддддддддддддддддддддддддддддддд©"
490 LOCATE 12,9:PRINT "Ё ";:COLOR 14,6:PRINT "-1- Listing -2- Modifications -3- recherches -ESC- Fin";:COLOR 11,0:PRINT " цдд©"
500 LOCATE 13,9:PRINT "юддбддддддддддддддддддддддддддддддддддддддддддддддддддддды  Ё"
510 LOCATE 14,12:PRINT "юдддддддддддддддддддддддддддддддддддддддддддддддддддддддды"
520 A$=INKEY$:IF A$="" THEN 520
530 IF A$="1" OR A$="&" THEN 590
540 IF A$="2" OR A$="`" OR A$="┌" THEN 1990
550 IF A$=CHR$(39) OR A$="3" THEN 3350
560 IF A$=CHR$(27) THEN CLS:CLEAR:PRINT :PRINT "SALUT ....... Programme de DARCHE Yoann 1989 ...... ":END
570 GOTO 520
580 END:REM ******************************************** Listing **************
590 CLS
600 COLOR 4:LOCATE 1,35:PRINT "з"+STRING$(14,196)+"©"
610 LOCATE 2,33:PRINT "зда"+STRING$(12,196)+"© Ё"
620 LOCATE 3,33:PRINT "Ё ";:COLOR 11,1:PRINT "LES LISTINGS";:COLOR 4,0:PRINT " цды"
630 LOCATE 4,33:PRINT "ю";STRING$(14,196);"ы"
640 COLOR 9:LOCATE 9,31:PRINT "з";STRING$(16,196);"©":FOR I=1 TO 5:LOCATE ,31:PRINT "Ё";:LOCATE ,48:PRINT "Ё":NEXT :LOCATE ,31:PRINT "ю";STRING$(16,196);"ы"
650 COLOR 13:LOCATE 10,33:PRINT "-1- TOUT "
660 LOCATE 12,33:PRINT "-2- INTERVAL"
670 LOCATE 14,33:PRINT "-3- CONDITION"
680 LOCATE 25,1:COLOR 14,6:PRINT " <ESC> pour retour au menu principal            MENU DES LISTINGS               ";:COLOR 10,0:LOCATE 10
690 A$=INKEY$:IF A$="" THEN 690
700 IF A$="1" OR A$="&" THEN 760
710 IF A$="2" OR A$="┌" THEN 970
720 IF A$="3"           THEN 1320
730 IF A$=CHR$(27) GOTO 470
740 BEEP:GOTO 690
750 REM .......................................................................
760 COLOR 10:GOSUB 1920
770 IF H<=20 THEN 780 ELSE 840
780 FOR I=1 TO H:LOCATE 3+I,1:PRINT "Ё       Ё    Ё   Ё       Ё        Ё       Ё      Ё Ё   Ё       Ё         Ё";
790 LOCATE I+3,2:PRINT N!(I):LOCATE I+3,11:PRINT N$(I):LOCATE I+3,15:PRINT C$(I)
800 LOCATE I+3,19:PRINT C!(I):LOCATE I+3,27:PRINT T$(I):LOCATE I+3,37:PRINT D!(I):LOCATE I+3,51:FE=I:GOSUB 1950:PRINT P$
810 FE=I:GOSUB 4190:LOCATE I+3,44:PRINT VA:LOCATE I+3,54:PRINT E$(I):LOCATE I+3,57:PRINT L$(I):LOCATE I+3,65:PRINT D$(I):NEXT
820 LOCATE I+3,1:PRINT "юдддддддаддддадддадддддддаддддддддадддддддаддддддададддадддддддаддддддддды"
830 A$=INPUT$(1):GOTO 590
840 LM=INT(H/21)+1:Z=0:LOCATE 25,1:COLOR 14,6:PRINT " MENU des LISTINGS : TOUT         <ESC> FIN   ";+CHR$(24)+" "+CHR$(25)+"                               ";:COLOR 10,0
850 FOR I=1+(20*Z) TO 20+(20*Z):W=I-(Z*20)
860 LOCATE W+3,1:PRINT "Ё       Ё    Ё   Ё       Ё        Ё       Ё      Ё Ё   Ё       Ё         Ё";
870 LOCATE W+3,2:PRINT N!(I):LOCATE W+3,11:PRINT N$(I):LOCATE W+3,15:PRINT C$(I)
880 LOCATE W+3,19:PRINT C!(I):LOCATE W+3,27:PRINT T$(I):LOCATE W+3,37:PRINT D!(I):LOCATE W+3,51:FE=I:GOSUB 1950:PRINT P$
890 FE=I:GOSUB 4190:LOCATE W+3,44:PRINT VA:LOCATE W+3,54:PRINT E$(I):LOCATE W+3,57:PRINT L$(I):LOCATE W+3,65:PRINT D$(I):NEXT
900 LOCATE W+4,1:PRINT "юдддддддаддддадддадддддддаддддддддадддддддаддддддададддадддддддаддддддддды";:LOCATE 1,1
910 A$=INKEY$:IF A$="" THEN 910
920 IF A$=CHR$(27) GOTO 590
930 IF A$="2" OR A$="`" OR A$=CHR$(0)+"P" THEN Z=Z-1:IF Z<0 THEN Z=LM-1:GOTO 850 ELSE 850
940 IF A$="8" OR A$="~" OR A$=CHR$(0)+"H" THEN Z=Z+1:IF Z>LM-1 THEN Z=0:GOTO 850 ELSE 850
950 BEEP:GOTO 910
960 REM ............................................... interval ..............
970 COLOR 3:CLS:INPUT " Depart (1 pour debut 0 pour retour  ) ",DE
980 IF DE=0 THEN 590
990 INPUT " FIN ( 1 pour fin  0 pour retour ) ",AR
1000 IF AR=0 THEN 590
1010 IF DE=1 AND AR=1 THEN BEEP:PRINT "vous ┬tes illogique il y a l'option 1 du menu LISTING pour obtenir tout la liste":A$=INPUT$(1):GOTO 760
1020 IF DE=AR THEN 1810
1030 IF DE<0 OR AR<0 THEN BEEP :PRINT"chiffre n┌gatif ... ":A$=INPUT$(1):GOTO 970
1040 IF DE>=N!(H) THEN I=H:GOTO 1850
1050 IF AR>=N!(H) THEN AR=1
1060 IF DE<=N!(1) THEN DE=1
1070 IF DE=1 THEN 1120
1080 IF DE=AR AND DE=1 THEN 1010
1090 FOR I=1 TO H
1100 IF DE<=N!(I) THEN DE=I:GOTO 1120
1110 NEXT I
1120 IF AR=1 THEN AR=H:GOTO 1160
1130 FOR I=1 TO H
1140 IF AR<=N!(I) THEN AR=I:GOTO 1160
1150 NEXT I
1160 GOSUB 1920
1170 T=AR-DE+1:DE=DE-1
1180 LM=INT(T/21)+1:Z=0:LOCATE 25,1:COLOR 14,6:PRINT " MENU des LISTINGS : INTERVAL ... <ESC> FIN   ";+CHR$(24)+" "+CHR$(25)+"                               ";:COLOR 12,0
1190 FOR I=1+(20*Z) TO 20+(20*Z):W=I-(Z*20)
1200 LOCATE W+3,1:PRINT "Ё       Ё    Ё   Ё       Ё        Ё       Ё      Ё Ё   Ё       Ё         Ё";
1210 LOCATE W+3,2:PRINT N!(I+DE):LOCATE W+3,11:PRINT N$(I+DE):LOCATE W+3,15:PRINT C$(I+DE)
1220 LOCATE W+3,19:PRINT C!(I+DE):LOCATE W+3,27:PRINT T$(I+DE):LOCATE W+3,37:PRINT D!(I+DE):LOCATE W+3,51:FE=I+DE:GOSUB 1950:PRINT P$
1230 FE=I+DE:GOSUB 4190:LOCATE W+3,44:PRINT VA:LOCATE W+3,54:PRINT E$(I+DE):LOCATE W+3,57:PRINT L$(I+DE):LOCATE W+3,65:PRINT D$(I+DE)
1240 IF I>=T THEN 1250 ELSE NEXT I
1250 LOCATE W+4,1:PRINT "юдддддддаддддадддадддддддаддддддддадддддддаддддддададддадддддддаддддддддды";:LOCATE 1,1
1260 A$=INKEY$:IF A$="" THEN 1260
1270 IF A$=CHR$(27) GOTO 590
1280 IF A$="2" OR A$="`" OR A$=CHR$(0)+"P" THEN CLS:GOSUB 1920:GOSUB 1970 :Z=Z-1:IF Z<0 THEN Z=LM-1:GOTO 1190 ELSE 1190
1290 IF A$="8" OR A$="~" OR A$=CHR$(0)+"H" THEN CLS:GOSUB 1920:GOSUB 1970:Z=Z+1:IF Z>LM-1 THEN Z=0:GOTO 850 ELSE 850
1300 BEEP:GOTO 1260
1310 REM .......................................................................
1320 CLS:LOCATE 25,1:COLOR 14,6:PRINT " <*>     pour retour                           LISTING A CONDITIONS ....       ";:COLOR 13,0:LOCATE 5,1
1330 INPUT "INITIAL DE LOT .. ",C$
1340 IF C$="$" OR C$="*" THEN 590
1350 INPUT "DOSE ............ ",D$
1360 IF D$="$" OR D$="*" THEN 590 ELSE D!=VAL(D$)
1370 INPUT "% ............... ",P$
1380 IF P$="$" OR P$="*" THEN 590 ELSE P!=VAL(P$)
1390 INPUT " 1 protec 2 actif ",H$
1400 IF H$="$" OR H$="*" THEN 590
1410 IF H$="1" THEN U=-1 ELSE U=1
1420 IF H$="" THEN U=0
1430 INPUT "ANIMAL R/S/G .... ",E$
1440 IF E$="*" OR E$="$" THEN 590
1450 INPUT "DATE MINIMAL .... ",DM$
1460 IF DM$="*" OR DM$="$" THEN 590
1470 D1=VAL(DM$)
1480 INPUT "DATE MAXIMAL .... ",DM$
1490 IF DM$="*" OR DM$="$" THEN 590
1500 D2=VAL(DM$)
1510 CLS:PRINT "PATIENTEZ ............"
1520 IF P$="" THEN P!=-1
1530 IF P!=0 THEN P!=.001
1540 R(1)=0:O=0:FOR I=1 TO H
1550 IF C$<>"" THEN IF C$<>C$(I) THEN GOTO 1660
1560 IF D!<>0  THEN IF D!<>D!(I) THEN 1660
1570 IF P!<>-1 THEN IF P!<>ABS(P!(I)) THEN 1660
1580 IF U <> 0 THEN 1590 ELSE 1610
1590    IF U=1  THEN IF P!(I)<0 THEN 1660
1600    IF U=-1 THEN IF P!(I)>0 THEN 1660
1610 IF E$<>"" THEN IF E$<>E$(I) THEN 1660
1620 IF D1<>0 THEN 1650
1630 DA$=MID$(D$(I),3,2):D0=VAL(DA$)
1640 IF D0<D1 AND D0>D2 THEN 1660
1650 O=O+1:R(O)=I
1660 NEXT I:IF R(1)=0 THEN PRINT "desol┌ aucun produit ne correspond ...":A$=INPUT$(1):GOTO 590
1670 COLOR 12:GOSUB 1920
1680 LM=INT(O/21)+1:Z=0:LOCATE 25,1:COLOR 14,6:PRINT " MENU des LISTINGS : CONDITION    <ESC> FIN   ";+CHR$(24)+" "+CHR$(25)+"                               ";:COLOR 12,0
1690 FOR I=1+(20*Z) TO 20+(20*Z):W=I-(Z*20):M=R(I)
1700 LOCATE W+3,1:PRINT "Ё       Ё    Ё   Ё       Ё        Ё       Ё      Ё Ё   Ё       Ё         Ё";
1710 LOCATE W+3,2:PRINT N!(M):LOCATE W+3,11:PRINT N$(M):LOCATE W+3,15:PRINT C$(M)
1720 LOCATE W+3,19:PRINT C!(M):LOCATE W+3,27:PRINT T$(M):LOCATE W+3,37:PRINT D!(M):LOCATE W+3,51:FE=M:GOSUB 1950:PRINT P$
1730 FE=M:GOSUB 4190:LOCATE W+3,44:PRINT VA:LOCATE W+3,54:PRINT E$(M):LOCATE W+3,57:PRINT L$(M):LOCATE W+3,65:PRINT D$(M)
1740 IF I>=O THEN 1750 ELSE NEXT I
1750 LOCATE W+4,1:PRINT "юдддддддаддддадддадддддддаддддддддадддддддаддддддададддадддддддаддддддддды";:LOCATE 1,1
1760 A$=INKEY$:IF A$="" THEN 1760
1770 IF A$=CHR$(27) GOTO 590
1780 IF A$="2" OR A$="`" OR A$=CHR$(0)+"P" THEN CLS:GOSUB 1920:GOSUB 1970 :Z=Z-1:IF Z<0 THEN Z=LM-1:GOTO 1690 ELSE 1690
1790 IF A$="8" OR A$="~" OR A$=CHR$(0)+"H" THEN CLS:GOSUB 1920:GOSUB 1970:Z=Z+1:IF Z>LM-1 THEN Z=0:GOTO 1690 ELSE 1690
1800 BEEP:GOTO 1760
1810 FOR I=1 TO H
1820 IF N!(I)=AR THEN 1850
1830 NEXT I
1840 BEEP:PRINT "AUCUN NUMERO ENREGITRE CORESPOND ....":A$=INPUT$(1):GOTO 590
1850 CLS:GOSUB 1920
1860 LOCATE 4,1:PRINT "Ё       Ё    Ё   Ё       Ё        Ё       Ё      Ё Ё   Ё       Ё         Ё";
1870 LOCATE 4,2:PRINT N!(I):LOCATE 4,11:PRINT N$(I):LOCATE 4,15:PRINT C$(I)
1880 LOCATE 4,19:PRINT C!(I):LOCATE 4,27:PRINT T$(I):LOCATE 4,37:PRINT D!(I):LOCATE 4,51:FE=I:GOSUB 1950:PRINT P$
1890 FE=I:GOSUB 4190:LOCATE 4,44:PRINT VA:LOCATE 4,54:PRINT E$(I):LOCATE 4,57:PRINT L$(I):LOCATE 4,65:PRINT D$(I)
1900 LOCATE 5,1:PRINT "юдддддддаддддадддадддддддаддддддддадддддддаддддддададддадддддддаддддддддды"
1910 A$=INPUT$(1):GOTO 590
1920 COLOR 12,0:CLS:PRINT "здддддддбддддбдддбдддддддбддддддддбдддддддбддддддбдбдддбдддддддбддддддддд©"
1930 PRINT "ЁNumero Ё    ЁLOTЁNЬ LOT Ё  TEST  Ё DOSE  Ё  %   Ё ЁANIЁNЬ TESTЁ  DATE   Ё"
1940 PRINT "цдддддддеддддедддедддддддеддддддддедддддддеддддддедедддедддддддеддддддддд╢":RETURN
1950 IF P!(FE)<0 THEN P$="P" ELSE P$="A"
1960 FE=0:RETURN
1970 LOCATE 25,1:COLOR 14,6:PRINT " MENU des LISTINGS : INTERVAL ... <ESC> FIN   ";+CHR$(24)+" "+CHR$(25)+"                               ";:COLOR 12,0:RETURN
1980 END:REM ******************************************** Modification ********
1990 CLS:COLOR 13
2000 LOCATE 1,24:PRINT "з"+STRING$(34,196)+"©"
2010 LOCATE 2,24:PRINT "Ё Menu de MODIFICATION des donn┌es Ё"
2020 LOCATE 3,24:PRINT "ю"+STRING$(34,196)+"ы"
2030 COLOR 9:LOCATE 9,31:PRINT "з";STRING$(16,196);"©":FOR I=1 TO 5:LOCATE ,31:PRINT "Ё";:LOCATE ,48:PRINT "Ё":NEXT :LOCATE ,31:PRINT "ю";STRING$(16,196);"ы"
2040 COLOR 10:LOCATE 10,33:PRINT "-1- CORRECTION"
2050 LOCATE 12,33:PRINT "-2- EFFACE"
2060 LOCATE 14,33:PRINT "-3- AJOUTE"
2070 LOCATE 25,1:COLOR 14,6:PRINT " <ESC> pour retour au menu principal            MENU DE MODIFICATIONS           ";:COLOR 10,0:LOCATE 10
2080 A$=INKEY$:IF A$="" THEN 2080
2090 IF A$=CHR$(27) GOTO 470
2100 IF A$="1" OR A$="&" THEN 2150
2110 IF A$="2" OR A$="┌" THEN 2660
2120 IF A$="3"           THEN 2990
2130 BEEP:GOTO 2080
2140 REM ................................ correction ..........................
2150 COLOR 10,0:CLS
2160 LOCATE 25,1:COLOR 14,6:PRINT " Menu MODIFICATION : Correction                <F10> pour abondont              ";
2170 LOCATE 2,1:COLOR 10,0
2180 INPUT "NЬ du produit .......",V$
2190 IF V$=CHR$(219) THEN 1990
2200 INPUT "Suffixe du produit ..",W$
2210 IF W$=CHR$(219) THEN 1990
2220 CLS:LOCATE 12,10:PRINT "         ----- PATIENTEZ ----- "
2230 R=0:T=0:FOR I=1 TO H
2240 IF N!(I)=VAL(V$) AND N$(I)=W$ THEN R=I
2250 IF N!(I)=VAL(V$)              THEN T=T+1:R(T)=I
2260 NEXT:CLS
2270 IF R=0 THEN PRINT "Je n'est pas trouv┌ ..."
2280 IF R<>0 THEN 2350
2290 IF T=0 THEN PRINT "Mais rien du tout .... "
2300 IF T<>0 THEN 2310 ELSE A$=INPUT$(1):GOTO 1990
2310 FOR I=1 TO T:PRINT "-";I;N!(R(I));N$(R(I));" ";C$(R(I));C!(R(I));" ";L$(R(I));" ";D$(R(I)):NEXT I
2320 INPUT "> (0 pour fin) quel est votre choix pour la modification >> ",CH
2330 IF CH>T THEN BEEP ELSE IF CH=0 THEN 1990
2340 CH=R(CH):GOTO 2360
2350 PRINT N!(R);N$(R);" ";C$(R);C!(R);" ";L$(R);" ";D$(R):PRINT "EST BIEN CECI Oui ou Non":A$=INPUT$(1):IF A$="n" OR A$="N" THEN 1990 ELSE CH=R
2360 CLS:LOCATE 25,1:COLOR 14,6:PRINT " Menu de MODIFICATIONS : Correction                  <ESC> pour abandon         ";
2370 LOCATE 2,1:COLOR 2,0
2380 PRINT  "-1 : NЬ du PRODUIT.......";N!(CH)
2390 PRINT  "-2 : Suffixe du produit.. ";N$(CH)
2400 PRINT  "-3 : INITIALES LOT....... ";C$(CH)
2410 PRINT  "-4 : NЬ de lot...........";C!(CH)
2420 PRINT  "-5 : TEST................ ";T$(CH)
2430 PRINT  "-6 : Dose................";D!(CH)
2440 FE=CH:GOSUB 4190:PRINT  "-7 : %...................";VA
2450 PRINT  "-8 : ACTIF ou PROTECTEUR. ";:IF P!(CH)<0 THEN PRINT "P" ELSE PRINT "A"
2460 PRINT  "-9 : Annimal (S-R-G)..... ";E$(CH)
2470 PRINT  "-0 : NЬ de l'essai....... ";L$(CH)
2480 PRINT  "-A : DATE................ ";D$(CH)
2490 PRINT :PRINT " Votre rubrique ┘ modifier ... "
2500 A$=INKEY$:IF A$="" THEN 2500
2510 IF A$="a" OR A$="A" THEN INPUT "Nouvelle DATE : ",D$(CH):GOTO 2360
2520 IF A$=CHR$(27) THEN GOTO 1990 ELSE IF A$=CHR$(13) THEN GOSUB 4250:GOTO 1990
2530 ON VAL(A$)+1 GOSUB 2540,2550,2560,2570,2580,2590,2600,2610,2620,2630:GOTO 2360
2540 INPUT "NЬ de l'essai.... ",L$(CH):RETURN
2550 INPUT "NЬ du PRODUIT.... ",N!(CH):RETURN
2560 INPUT "Nouveau suffixe.. ",N$(CH):RETURN
2570 INPUT "Initial lot ..... ",C$(CH):RETURN
2580 INPUT "NЬ de lot........ ",C!(CH):RETURN
2590 INPUT "TEST............. ",T$(CH):RETURN
2600 INPUT "DOSE............. ",D!(CH):RETURN
2610 INPUT "%................ ",VA:FE=CH:GOSUB 4210:RETURN
2620 P!(CH)=-P!(CH):RETURN
2630 PRINT "Animal........... ":A$=INPUT$(1):IF A$="r" OR A$="R" THEN E$(CH)="R":RETURN ELSE IF A$="s" OR A$="S" THEN E$(CH)="S":RETURN ELSE E$(CH)="G":RETURN
2640 PRINT  "-9 : NЬ de l'essai.......";T$(CH)
2650 REM ................................ effacer .............................
2660 CLS:COLOR 14,6:LOCATE 25,1:PRINT " MODIFICATIONS : EFFACER DES DONNEES             <F10> = ABANDON et RETOUR      "
2670 COLOR 13,0:LOCATE 2
2680 INPUT "Numero du produit ..... ",V$
2690 IF V$=CHR$(219) THEN 1990 ELSE CI!=VAL(V$)
2700 INPUT "Suffixe du produit .... ",V$
2710 IF V$=CHR$(219) THEN 1990
2720 CLS
2730 LOCATE 12,10:COLOR 30:PRINT " ---------- PATIENTEZ -----------"
2740 COLOR 13
2750 R=0:FOR I=1 TO H
2760 IF N!(I)=CI! AND N$(I)=V$ THEN R=I:I=H
2770 NEXT I
2780 IF R<>0 THEN 2820
2790 T=0:FOR I=1 TO H
2800 IF N!(I)=CI! THEN T=T+1:R(T)=I
2810 NEXT I
2820 CLS
2830 COLOR 13,0:LOCATE 2
2840 IF R=0 THEN PRINT "Je n'ai pas trouv┌ mais voici des ressenblants.."
2850 IF R<>0 THEN PRINT "J'ai trouv┌ : Est bien celui-ci O/N ":PRINT :PRINT N!(R);N$(R);" ";C$(R);C!(R);" ";T$(R);" ";L$(R);" ";D$(R)
2860 IF T<>0 THEN 2880
2870 GOTO 2890
2880 FOR I=1 TO T:PRINT I;" ";N!(R(I));N$(R(I));" ";C$(R(I));C!(R(I));" ";T$(R(I));" ";L$(R(I));" ";D$(R(I)):NEXT I:PRINT:INPUT " ==> lequel (0) pour rien ",C
2890 IF T<>0 AND C=0 THEN 1990
2900 IF R<>0 THEN C$=INPUT$(1)
2910 IF R<>0 AND (C$="n" OR C$="N") THEN 1990
2920 IF R<>0 AND (C$="o" OR C$="O") THEN CI=R:GOTO 2950
2930 IF T<>0 AND C<>0 THEN CI=R(ABS(C)):GOTO 2950
2940 GOTO 1990
2950 FOR I=CI TO H
2960 N!(I)=N!(I+1):N$(I)=N$(I+1):C$(I)=C$(I+1):C!(I)=C!(I+1):T$(I)=T$(I+1):D!(I)=D!(I+1):P!(I)=P!(I+1):E$(I)=E$(I+1):L$(I)=L$(I+1):D$(I)=D$(I+1)
2970 NEXT :H=H-1:GOSUB 4390 :GOTO 1990
2980 REM ................................ ajouter ..............................
2990 CLS:COLOR 14,6:LOCATE 25,1:PRINT " MODIFICATIONS : AJOUTER DES DONNEES             <F10> = ABANDON et RETOUR      "
3000 COLOR 10,0
3010 P=H
3020 H=H+1:LOCATE 5,2:PRINT SPACE$(70);:LOCATE ,2:INPUT "Numero du PRODUIT .. ",V$
3030 IF V$=CHR$(219) THEN H=P:GOTO 1990 ELSE N!(H)=VAL(V$)
3040 LOCATE 6,2:PRINT SPACE$(70);:LOCATE ,2:INPUT "suffixe du PRODUIT . ",V$
3050 IF V$=CHR$(219) THEN H=P:GOTO 1990 ELSE N$(H)=V$
3060 LOCATE 7,2:PRINT SPACE$(70);:LOCATE ,2:INPUT "initiales du PRODUIT ",V$
3070 IF V$=CHR$(219) THEN H=P:GOTO 1990 ELSE C$(H)=V$
3080 LOCATE 8,2:PRINT SPACE$(70);:LOCATE ,2:INPUT "NЬ de LOT .......... ",V$
3090 IF V$=CHR$(219) THEN H=P:GOTO 1990 ELSE C!(H)=VAL(V$)
3100 LOCATE 9,2:PRINT SPACE$(70);:LOCATE ,2:INPUT "TEST ............... ",V$
3110 IF V$=CHR$(219) THEN H=P:GOTO 1990 ELSE T$(H)=V$
3120 LOCATE 10,2:PRINT SPACE$(70);:LOCATE ,2:INPUT "Dose ............... ",V$
3130 IF V$=CHR$(219) THEN H=P:GOTO 1990 ELSE D!(H)=VAL(V$)
3140 LOCATE 11,2:PRINT SPACE$(70);:LOCATE ,2:INPUT "% .................. ",V$
3150 IF V$=CHR$(219) THEN H=P:GOTO 1990 ELSE FE=H:VA=VAL(V$):GOSUB 4210
3160 LOCATE 12,2:PRINT "(A)ctif (P)rotection ":A$=INPUT$(1)
3170 IF A$=CHR$(219) THEN H=P:GOTO 1990
3180 IF A$="p" OR A$="P" THEN P!(H)=-P!(H):LOCATE 12,23:PRINT "P" ELSE LOCATE 12,23:PRINT "A"
3190 LOCATE 13,2:PRINT "(R)at (S)ouris (G).":A$=INPUT$(1)
3200 IF A$=CHR$(219) THEN H=P:GOTO 1990
3210 IF A$="r" OR A$="R" THEN E$(H)="R"
3220 IF A$="s" OR A$="S" THEN E$(H)="S" ELSE IF E$(H)="" THEN E$(H)="G"
3230 LOCATE 13,23:PRINT E$(H)
3240 LOCATE 14,2:PRINT SPACE$(70);:LOCATE ,2:INPUT "NЬ  de l'ESSAI.......",V$
3250 IF V$=CHR$(219) THEN H=P:GOTO 1990 ELSE L$(H)=V$
3260 LOCATE 15,2:PRINT SPACE$(70);:LOCATE ,2:INPUT "DATE ................",V$
3270 IF V$=CHR$(219) THEN H=P:GOTO 1990 ELSE D$(H)=V$
3280 LOCATE 17,10 :BEEP:PRINT " ENCORE O/N ...":A$=INPUT$(1)
3290 IF A$="o" OR A$="O" OR A$=CHR$(13) THEN 3020
3300 IF A$="n" OR A$="N" THEN 3320
3310 GOTO 3280
3320 GOSUB 4250
3330 GOTO 1990
3340 END:REM ******************************************** Recherches **********
3350 COLOR 12,0:CLS
3360 LOCATE 1,29:PRINT "з"+STRING$(19,196)+"©"
3370 LOCATE 2,29:PRINT "Ё ";:COLOR 11,1:PRINT "MENU DE RECHERCHE";:COLOR 12,0:PRINT " "+CHR$(195)+CHR$(196)+CHR$(191)
3380 LOCATE 3,29:PRINT "юдб"+STRING$(17,196)+"ы Ё"
3390 LOCATE 4,31:PRINT "ю"+STRING$(19,196)+"ы"
3400 LOCATE 25,1:COLOR 14,6:PRINT "MENU RECHERCHE             <F10> pour QUITER                                    ";:LOCATE 5,1:COLOR 10,0
3410 PRINT
3420 INPUT "INITIAL DU LOT ... ",C$
3430 IF C$=CHR$(219) THEN 470
3440 INPUT "DOSE  ............ ",D$
3450 IF D$=CHR$(219) THEN 470
3460 M$=D$:GOSUB 4040:D1=V1:D2=V2
3470 INPUT "% ................ ",P$
3480 IF P$=CHR$(219) THEN 470
3490 M$=P$:GOSUB 4040:P1=V1:P2=V2
3500 PRINT "<P>ROT  <A>CTIF .. ";
3510 A$=INPUT$(1):IF A$=CHR$(219) THEN 470
3520 IF A$<>"p" AND A$<>"a" AND A$<>"P" AND A$<>"a" AND A$<>" " THEN BEEP:GOTO 3510
3530 IF A$="P" OR A$="p" THEN U=-1 ELSE IF A$<>" " THEN U=1 ELSE U=0
3540 PRINT A$
3550 PRINT "Animal ........... ";
3560 A$=INPUT$(1):IF A$=CHR$(219) THEN 470
3570 IF A$<>"R" AND A$<>" " AND A$<>"r" AND A$<>"G" AND A$<>"g" AND A$<>"s" AND A$<>"S" THEN BEEP:GOTO 3560
3580 IF A$="R" OR A$="r" THEN E$="R"
3590 IF A$="S" OR A$="s" THEN E$="S"
3600 IF A$="G" OR A$="g" THEN E$="G"
3610 IF A$=" " THEN E$=""
3620 IF E$<>"" THEN PRINT E$ ELSE PRINT "TOUS"
3630 INPUT "MOIS MINI ........ ",DT$
3640 IF DT$=CHR$(219) THEN 470
3650 DM=VAL(DT$)
3660 INPUT "MOIS MAXI ........ ",DT$
3670 IF DT$=CHR$(219) THEN 470
3680 DB=VAL(DT$)
3690 CLS:PRINT :PRINT  ".................... PATIENTEZ ................................................."
3700 R(1)=0:O=0:FOR I=1 TO H
3710 IF C$<>"" THEN IF C$<>C$(I) THEN 3880
3720 IF D1=-1 AND D2=-1 THEN 3750
3730 IF D1<>-1 THEN IF D!<D1 THEN 3880
3740 IF D2<>-1 THEN IF D!>D2 THEN 3880
3750 IF P1=-1 AND P2=-1 THEN 3800
3760 IF P1=0 THEN P1=.001
3770 IF P1<>-1 THEN IF ABS(P!(I))<P1 THEN 3880
3780 IF P2=0 THEN P2=.001
3790 IF P2<>-1 THEN IF ABS(P!(I))>P2 THEN 3880
3800 IF U=0 THEN 3830
3810 IF U=1 THEN IF P!(I)<0 THEN 3880
3820 IF U=-1 THEN IF P!(I)>0 THEN 3880
3830 IF E$<>"" THEN IF E$<>E$(I) THEN 3880
3840 DA$=MID$(D$(I),3,2):D0=VAL(DA$)
3850 IF DM<>0 THEN IF D0<DM THEN 3880
3860 IF DB<>0 THEN IF D0>DB THEN 3880
3870 O=O+1:R(O)=I
3880 NEXT I:IF R(1)=0 THEN PRINT "Desol┌ aucun produit ne correpond ...":A$=INPUT$(1):GOTO 470
3890 COLOR 12
3900 GOSUB 1920
3910 LM=INT(O/21)+1:Z=0:LOCATE 25,1:COLOR 14,6:PRINT " MENU des RECHERCHES A CONDITION    <ESC> FIN   ";+CHR$(24)+" "+CHR$(25)+"                             ";:COLOR 12,0
3920 FOR I=1+(20*Z) TO 20+(20*Z):W=I-(Z*20):M=R(I)
3930 LOCATE W+3,1:PRINT "Ё       Ё    Ё   Ё       Ё        Ё       Ё      Ё Ё   Ё       Ё         Ё";
3940 LOCATE W+3,2:PRINT N!(M):LOCATE W+3,11:PRINT N$(M):LOCATE W+3,15:PRINT C$(M)
3950 LOCATE W+3,19:PRINT C!(M):LOCATE W+3,27:PRINT T$(M):LOCATE W+3,37:PRINT D!(M):LOCATE W+3,51:FE=M:GOSUB 1950:PRINT P$
3960 FE=M:GOSUB 4190:LOCATE W+3,44:PRINT VA:LOCATE W+3,54:PRINT E$(M):LOCATE W+3,57:PRINT L$(M):LOCATE W+3,65:PRINT D$(M)
3970 IF I>=O THEN 3980 ELSE NEXT I
3980 LOCATE W+4,1:PRINT "юдддддддаддддадддадддддддаддддддддадддддддаддддддададддадддддддаддддддддды";:LOCATE 1,1
3990 A$=INKEY$:IF A$="" THEN 3990
4000 IF A$=CHR$(27) GOTO 470
4010 IF A$="2" OR A$="`" OR A$=CHR$(0)+"P" THEN CLS:GOSUB 1920:GOSUB 1970 :Z=Z-1:IF Z<0 THEN Z=LM-1:GOTO 3920 ELSE 3920
4020 IF A$="8" OR A$="~" OR A$=CHR$(0)+"H" THEN CLS:GOSUB 1920:GOSUB 1970:Z=Z+1:IF Z>LM-1 THEN Z=0:GOTO 3920 ELSE 3920
4030 BEEP:GOTO 3990
4040 LM=LEN(M$)
4050 FOR I=1 TO LM
4060 VM$=MID$(M$,I,1):IF VM$="-" THEN 4090
4070 V1$=V1$+VM$
4080 NEXT I
4090 V1=VAL(V1$)
4100 FOR U=I+1 TO LM
4110 V2$=V2$+MID$(M$,U,1):NEXT U
4120 V2=VAL(V2$):IF V1=0 THEN V1=-1
4130 IF V2=0 THEN V2=-1
4140 IF V2=V1 AND V1=-1 THEN 4160
4150 IF V2<V1 AND V2<>-1 THEN BEEP:PRINT "VALEUR MAXIMAL INFERIEUR A LA VALEUR MINIMAL !!! JE VAIS LES MODIFIER..":V=V1:V1=V2:V2=V:V=0
4160 RETURN
4170 END
4180 CLOSE:OPEN "O",#1,U$:CLOSE:RESUME
4190 IF ABS(P!(FE))=.001 THEN FE=0:VA=0:RETURN
4200 VA=ABS(P!(FE)):FE=0:RETURN
4210 IF VA=0 THEN VA=.001
4220 IF P!(VA)<0 THEN K=-1 ELSE K=1
4230 P!(FE)=K*VA:K=0:FE=0:RETURN
4240 REM -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= SOUS PROG DE TRIAGE =-=-=-=-=-=-=
4250 FOR I=1 TO H
4260 FOR J=I+1 TO H
4270 IF N!(I)<N!(J) THEN 4360 ELSE 4280
4280 SWAP N!(I),N!(J):SWAP L$(I),L$(J)
4290 SWAP N$(I),N$(J):SWAP D$(I),D$(J)
4300 SWAP C$(I),C$(J)
4310 SWAP C!(I),C!(J)
4320 SWAP T$(I),T$(J)
4330 SWAP D!(I),D!(J)
4340 SWAP P!(I),P!(J)
4350 SWAP E$(I),E$(J)
4360 NEXT J:PRINT N!(I)
4370 NEXT I
4380 REM ==================================== SOUS PROG POUR SAUVER ===========
4390 OPEN "O",#1,U$
4400 FOR I=1 TO H
4410 PRINT #1,N!(I);",";N$(I);",";C$(I);",";C!(I);",";T$(I);",";D!(I);",";P!(I);",";E$(I);",";L$(I);",";D$(I)
4420 NEXT I:CLOSE
4430 RETURN
4440 GOTO 4650
4450 PRINT "  Ё     Ё Ё     Ё    Ё    Ё     Ё ╨     ╨ ╨     ╨       ╨ ╨       "
4460 CLS:SCREEN 2:SCREEN 0
4470 COLOR 10:PRINT :PRINT "                 Yoann DARCHE vous pr┌sente"
4480 COLOR 14,4
4490 LOCATE 6,5:PRINT "ш"+STRING$(67,223)+"ш"
4500 LOCATE 14,5:PRINT "ш"+STRING$(67,220)+"ш"
4510 FOR I=7 TO 13
4520 LOCATE I,5:PRINT "ш ";SPC(65);" ш":NEXT
4530 COLOR 13,1
4540 LOCATE 7,7:PRINT  " здддд©   зддд©  зддбдд©  зддд©  имммм╩   иммм╩  иммммм╩ иммммм╩ "
4550 LOCATE 8,7:PRINT  " Ё    ю© зы   ю©    Ё    зы   ю© ╨    х╩ и╪   х╩ ╨       ╨       "
4560 LOCATE 9,7:PRINT  " Ё     Ё Ё     Ё    Ё    Ё     Ё ╨    и╪ ╨     ╨ ╨       ╨       "
4570 LOCATE 10,7:PRINT  " Ё     Ё цддддд╢    Ё    цддддд╢ лмммм╧  лммммм╧ хммммм╩ лммм╣   "
4580 LOCATE 11,7:PRINT  " Ё     Ё Ё     Ё    Ё    Ё     Ё ╨    х╩ ╨     ╨       ╨ ╨       "
4590 LOCATE 12,7:PRINT  " Ё    зы Ё     Ё    Ё    Ё     Ё ╨    и╪ ╨     ╨       ╨ ╨       "
4600 LOCATE 13,7:PRINT  " юдддды  а     а    а    а     а хмммм╪  п     п хммммм╪ хммммм╪ "
4610 COLOR 10,0
4620 LOCATE 20,15:PRINT "VERSION 1.1  (12/08/1989)"
4630 LOCATE 21,17:PRINT "    APPUYER SUR ESPACE ":COLOR 15
4640 A$="                                                                           CE PROGRAMME A ETE ECRIT ET PROGRAMME PAR YOANN DARCHE . TEL : 69.39.51.26 . ADRESSE 71 Avenue d'Orl┌ans 91800 BRUNOY ............................................... "
4650 FOR I=1 TO LEN(A$)
4660 IF INKEY$=" " THEN RETURN
4670 E$=MID$(A$,I,80):LOCATE 23,1:PRINT E$;
4680 NEXT :GOTO 4650
