0 B$="здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©"
1 CB$="Ё                                                                      Ё"
2 CC$="Ё       CALCUL DE LA DE 50 PAR LA METHODE DES TOTAUX CUMULATIFS        Ё"
3 CD$="Ё                      зддддддддддддддддддд©                           Ё"
4 CE$="Ё                      Ё PAR  DARCHE YOANN ц©                          Ё"
5 CF$="Ё                      юбддддддддддддддддддыЁ                          Ё"
6 CG$="Ё                       юддддддддддддддддддды                          Ё"
7 REM  Ё                                                                      Ё
8 CH$="Ё     PG : 3           Production : Helciziem                          Ё"
9 REM  Ё                                                                      Ё
10 C$="юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды"
11 CLS:KEY OFF:COLOR 13
12 D$="╟╟╟╟":PRINT STRING$(80,176):PRINT STRING$(80,176)
13 PRINT D$;B$;D$
14 PRINT D$;CB$;D$:PRINT D$;CB$;D$:PRINT D$;CB$;D$:PRINT D$;CB$;D$
15 PRINT D$;CC$;D$
16 PRINT D$;CB$;D$:PRINT D$;CB$;D$:PRINT D$;CB$;D$
17 PRINT D$;CD$;D$:PRINT D$;CE$;D$:PRINT D$;CF$;D$:PRINT D$;CG$;D$
18 PRINT D$;CB$;D$:PRINT D$;CB$;D$:PRINT D$;CB$;D$
19 PRINT D$;CH$;D$
20 PRINT D$;CB$;D$:PRINT D$;CB$;D$:PRINT D$;CB$;D$:PRINT D$;C$;D$;
21 LOCATE 25,1:PRINT STRING$(80,176);
22 LOCATE 24,1:PRINT STRING$(80,176);
23 LOCATE 21,23:COLOR 15:PRINT " <ESC> FIN autre touche pour SUITE "
24 A$=INPUT$(1):IF A$=CHR$(27) THEN END
25 COLOR 13:CLS
999 REM
1000 F$="|--------|------------|------------|-----|-----|--------------|------|"
1001 PRINT F$
1003 H$="|        |            |            |     |     |              |      |"
1005 PRINT "|  DOSE  |  Animaux + |  Animaux - | C + | C - | R C+/C- + C+ |  %   |"
1006 PRINT F$
1008 GOSUB 60000
1009 DIM DO(8,ND)
1010 LOCATE 4,1:FOR O=1 TO ND
1015 PRINT H$:NEXT:PRINT F$
1020 LOCATE 4,1:PCOPY 0,1
1030 GOSUB 60400
1060 A$=INKEY$:IF A$=CHR$(27) THEN END
1061 IF A$="" THEN 1060
1062 IF A$="E" OR A$="e" THEN LOCATE 25,1:COLOR 15:PRINT "EDITION: <ESC> FIN <D> pour changer la dose 8 4 6 2 ou ";CHR$(24);" ";CHR$(25);" ";CHR$(26);" ";CHR$(27);" <%> calcule %";:GOSUB 60200:LOCATE 25,1:PRINT SPACE$(80);
1070 IF A$="I" OR A$="i" THEN LOCATE 25,1:PRINT SPACE$(80);:LCOPY:GOTO 1060
1080 IF A$="c" OR A$="C" THEN 2010
1998 COLOR 14:LOCATE 25,1:PRINT " <E>diter <I>mprimer <C>alcule la DE50 <ESC> fin ";
1999 GOTO 1060
2000 REM ****************** CALCULE DE LA DE50 *********************************
2010 PCOPY 0,2:GX=1E+10
2020 IF TEST=0 THEN LOCATE 12,20:COLOR 0,7:BEEP:PRINT "FAITES UN CALCULE DES POURCENTAGES <E> puid <%>":COLOR 13,0:A$=INPUT$(1):PCOPY 2,0:GOTO 1060
2030 FOR I=1 TO ND
2031 IF DO(8,I)>PX AND DO(8,I)<50 THEN PX=DO(8,I):P=I
2032 IF DO(8,I)<GX AND DO(8,I)>50 THEN GX=DO(8,I):G=I
2033 NEXT I
2034 GNBA=DO(2,G)+DO(3,G)
2035 PNBA=DO(2,P)+DO(3,P)
2040 LOCATE 23,10:PRINT "(";PNBA;"+";GNBA;") x":LOCATE 22,24:PRINT "  50 -";PX
2050 LOCATE 23,24:PRINT "дддддддддддддд"
2060 LOCATE 24,24:PRINT GX;"-";PX;
2070 V=(PNBA+GNBA)*(50-PX)/(GX-PX)
2080 LOCATE 23,39:PRINT " = ";V;" ";TDOSE$:PCOPY 0,1:GOTO 1060
59999 STOP:REM *****************************************************************
60000 PCOPY 0,1:LOCATE 11,10:PRINT "зддддддддддддддддддддддддддддддддддддд©"
60010 LOCATE 12,10:PRINT "Ё Nombre de dose :                    Ё"
60020 LOCATE 13,10:PRINT "юддддддддддддддддддддддддддддддддддддды"
60030 X=29:Y=12:V=1:GOSUB 60100
60039 PCOPY 1,0:ND=VAL(G$):G$=""
60040 IF ND>=16 OR ND<=0 THEN BEEP:GOTO 60000 ELSE RETURN
60049 REM **********************************************************************
60050 K=LEN(M$):Q=INT((L-K)/2):M$=STRING$(Q," ")+M$+STRING$(Q," ")
60051 IF (L-K)/2 <> Q THEN M$=M$+" "
60052 RETURN
60099 REM **********************************************************************
60100 A$=INKEY$:IF A$=CHR$(27) THEN RETURN ELSE IF A$="" THEN 60100
60110 IF LEN(A$)>1 THEN 60120 ELSE 60130
60120 IF A$=CHR$(0)+"K" OR A$="4" THEN G$=LEFT$(G$,LEN(G$)-1):GOTO 60100
60125 GOTO 60100
60130 IF A$=CHR$(13) THEN 60150
60140 G$=G$+A$:LOCATE Y,X:PRINT G$;:GOTO 60100
60150 IF V=1 THEN IF VAL(G$)=0 AND G$<>"0" THEN G$="":BEEP:GOTO 60100 ELSE RETURN
60160 RETURN
60199 REM **********************************************************************
60200 LX=2:LY=1:A(1)=2:A(2)=11:A(3)=24:FX=11:FY=4:L=12:M$=STR$(DO(LX,LY)):GOSUB 60050:L$=M$:B(1)=8:B(2)=12:B(3)=12:LOCATE FY,FX:COLOR 15:PRINT M$
60210 A$=INKEY$:IF A$=CHR$(27) THEN LOCATE FY+3,FX:COLOR 13:PRINT L$:RETURN ELSE IF A$="" THEN 60210
60220 IF (A$=CHR$(0)+"H" OR A$="8") AND LY>=2    THEN LY=LY-1
60230 IF (A$=CHR$(0)+"P" OR A$="2") AND LY<=ND-1 THEN LY=LY+1
60240 IF (A$=CHR$(0)+"M" OR A$="6") AND LX<=2    THEN LX=LX+1
60250 IF (A$=CHR$(0)+"K" OR A$="4") AND LX>=2    THEN LX=LX-1
60255 IF A$="≈" OR A$="%" THEN GOSUB 60500:GOTO 60270
60260 IF A$="D" OR A$="d" THEN GOSUB 60410
60270 IF A$=CHR$(13) OR A$=" " THEN 60300
60280 COLOR 13:LOCATE FY+3,FX:PRINT L$:COLOR 15:LOCATE 3+LY,A(LX):L=B(LX):M$=STR$(DO(LX,LY)):GOSUB 60050:PRINT M$:L$=M$:FX=A(LX):FY=LY
60290 PCOPY 0,1:GOTO 60210
60300 PCOPY 0,1:PCOPY 0,2
60310 COLOR 14:LOCATE 10,20:PRINT "зддддддддддддддддддддддддддддддддддддддд©"
60312 LOCATE 11,20:PRINT "Ё ANCIENNE VALEUR :                     Ё"
60314 LOCATE 12,20:PRINT "Ё NOUVELLE VALEUR :                     Ё"
60316 LOCATE 13,20:PRINT "юддддддддддддддддддддддддддддддддддддддды"
60318 COLOR 15:LOCATE 11,40:PRINT DO(LX,LY);
60319 X=41:Y=12:V=1:GOSUB 60100
60320 IF VAL(G$)=DO(LX,LY) THEN G$="":PCOPY 2,0:GOTO 60290
60330 DO(LX,LY)=VAL(G$):G$=""
60340 IF LX=1 THEN GOSUB 60400
60342 IF LX=2 THEN GOSUB 60350:GOSUB 60400
60343 IF LX=3 THEN GOSUB 60370:GOSUB 60400
60344 M$=STR$(DO(LX,LY)):L=B(LX):GOSUB 60050:LOCATE LY+3,A(LX):COLOR 15:PRINT M$:L$=M$:GOTO 60290
60349 REM *********************** C + ******************************************
60350 IO=0:FOR I=1 TO ND
60351 IO=IO+DO(2,I):DO(4,I)=IO:DO(6,I)=IO:DO(7,I)=DO(5,I)+IO:NEXT:RETURN
60369 REM *********************** C - ******************************************
60370 IO=0:FOR I=ND TO 1 STEP -1
60371 IO=IO+DO(3,I):DO(5,I)=IO:DO(7,I)=DO(6,I)+IO:NEXT:RETURN
60399 REM *************** AFFICHE DONNEES **************************************
60400 PCOPY 1,0:COLOR 13:LOCATE 4,1:FOR O=1 TO ND
60401 M$=STR$(DO(1,O)):L=8:GOSUB 60050:LOCATE ,2:PRINT M$;
60402 M$=STR$(DO(2,O)):L=12:GOSUB 60050:LOCATE ,11:PRINT M$;
60403 M$=STR$(DO(3,O)):L=12:GOSUB 60050:LOCATE ,24:PRINT M$;
60404 M$=STR$(DO(4,O)):L=5:GOSUB 60050:LOCATE ,37:PRINT M$;
60405 M$=STR$(DO(5,O)):L=5:GOSUB 60050:LOCATE ,43:PRINT M$;
60406 M$=STR$(DO(6,O))+"/"+STR$(DO(7,O)):L=14:GOSUB 60050:LOCATE ,49:PRINT M$;
60407 M$=STR$(DO(8,O)):L=6:GOSUB 60050:LOCATE ,64:PRINT M$
60408 NEXT:PCOPY 0,1:RETURN
60409 REM ************************** DOSE **************************************
60410 IF TDOSE$="" THEN TDOSE$="DOSE"
60420 PCOPY 0,1
60430 LOCATE 10,11:PRINT "зддддддддддддддддддддддддддддддддддддддд©"
60440 LOCATE 11,11:PRINT "Ё Ancien  titre :                       Ё"
60450 LOCATE 12,11:PRINT "Ё Nouveau titre :                       Ё"
60455 LOCATE 13,11:PRINT "юддддддддддддддддддддддддддддддддддддддды"
60460 LOCATE 11,28:PRINT TDOSE$
60470 LOCATE 12,28:INPUT "",TD$:IF TD$<>"" THEN TDOSE$=TD$
60480 IF LEN(TDOSE$)>8 THEN BEEP:PRINT :PRINT "TROP LONG !!!!":TDOSE$="DOSE":GOTO 60455
60490 PCOPY 1,0:M$=TDOSE$:L=8:GOSUB 60050:COLOR 13:LOCATE 2,2:PRINT M$:PCOPY 0,1:RETURN
60499 REM ***************************** % **************************************
60500 PCOPY 0,1:ER=0:FOR O=1 TO ND
60510 IF DO(7,O)=0 THEN ER=ER+1:DO(8,O)=0:GOTO 60530
60520 DO(8,O)=INT(DO(6,O)/DO(7,O)*1000)/10
60530 NEXT
60531 IF ER>=1 THEN LOCATE 20,15:COLOR 0,7:PRINT ER;" CALCULE(S) IMPOSSIBLE(S) [DIVISION PAR 0] ":COLOR 13,0:A$=INPUT$(1):PCOPY 1,0 ELSE TEST=1
60532 GOSUB 60400:PCOPY 0,1:RETURN
