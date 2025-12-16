20 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
30 REM ::             PROGRAMME ECRIT EN (GW)BASIC(A)  POUR IBM             ::
40 REM ::   imagine,compose,et r‚alise par DARCHE YOANN ...........         ::
50 REM ::                   =-=-=-=-=-=-=-=-=-=-=-=-=                       ::
60 REM ::                Le LABYRINTHE INFERNAL VERSION 1.2                 ::
70 REM ::                   =-=-=-=-=-=-=-=-=-=-=-=-=                       ::
80 REM ::           Commenc‚ le : 6/06/1990    fini le : ../../19..         ::
90 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
100 DEFINT X,Y,I,J,B,A
110 DIM P$(10,10),AF$(10,10)
120 X=2:Y=3:XM=1:YM=Y:Y2=YM:X2=XM
130 SCREEN 1
150 GOSUB 340
155 '
160 XM=X2:YM=Y2:D$=P$(X,Y):B=VAL(D$):GOSUB 3000
185 '
190 IF B=17 THEN 5000
200 IF B=16 THEN B=12
210 IF B=12 OR B=13 OR B=14 OR B=15 THEN IM = 8:FLAG=1:GOTO 230 ELSE FLAG=0
230 ON IM GOSUB 4010,4090,4160,4220,4290,4370,4450,4530
235 '
240 T$=INPUT$(1):IF T$=CHR$(27) THEN END
260 IF T$="2" THEN SWAP X,X2:SWAP Y,Y2:GOTO 160
270 IF FLAG=1 THEN 300
280 X2=X:Y2=Y
285 'ÍÊÍ¼
290 GOTO 2010 '================= calcule des d‚placement ====================
295 '
300 LOCATE 25,1:PRINT "Non ! Seulement ";MES$;" <ESC> ";:BEEP:GOTO 240
310 GOTO 160
330 REM LECTURE ET AFFICHAGE DU LABYRINTHE
340 RESTORE
350 FOR  J=1 TO 9
360 FOR  I=1 TO 9
370 READ A$
380 P$(I,J)=A$
570 NEXT I
580 NEXT J
590 RETURN
2000 REM ====================== Calcule de d‚placement ======================
2001 ' ::::::::::::::::::::::::: T$="8" ( Tout droit ) ::::::::::::::::::::::
2010 IF T$<>"8" THEN GOTO 2090
2020 IF (X>XM) AND ( B=7 OR B=8 OR B=9)          THEN X=X+1:GOTO 160
2030 IF (X<XM) AND ( B=1 OR B=7 OR B=8 OR B=9)   THEN X=X-1:GOTO 160
2040 IF (Y>YM) AND ( B=7 OR B=10 OR B=11 OR B=2)        THEN Y=Y+1:GOTO 160
2050 IF (Y>YM) AND ( B=2 )                       THEN Y=Y+1:GOTO 160
2060 IF (Y<YM) AND ( B=2 OR B=7 OR B=10 OR B=11) THEN Y=Y-1:GOTO 160
2070 IF (X>XM) AND ( B=1 )                       THEN X=X+1:GOTO 160
2080 GOTO 300
2089 ' ::::::::::::::::::::::::: T$="6" ( A droite ) ::::::::::::::::::::::::
2090 IF T$<>"6" THEN GOTO 2190
2100 IF (X=XM) AND ( B=3 OR B=8 )                THEN X=X+1:GOTO 160
2110 IF (Y<YM) AND ( B=7 OR B=10)                THEN X=X+1:GOTO 160
2120 IF (X=XM) AND ( B=5 OR B=9 )                THEN X=X-1:GOTO 160
2130 IF (Y>YM) AND ( B=7 OR B=11)                THEN X=X-1:GOTO 160
2140 IF (X>XM) AND ( B=6 OR B=7 OR B=8 )         THEN Y=Y+1:GOTO 160
2150 IF (Y=YM) AND ( B=11 )                      THEN Y=Y+1:GOTO 160
2160 IF (X<XM) AND ( B=4 OR B=7 OR B=9 )         THEN Y=Y-1:GOTO 160
2170 IF (Y=YM) AND ( B=10 )                      THEN Y=Y-1:GOTO 160
2180 GOTO 300
2189 ' ::::::::::::::::::::::::: T$="4" ( A gauche ) ::::::::::::::::::::::::
2190 IF T$<>"4" THEN GOTO 300
2200 IF (X=XM) AND ( B=4 OR B=9 )                THEN X=X+1:GOTO 160
2210 IF (Y>YM) AND ( B=7 OR B=10)                THEN X=X+1:GOTO 160
2220 IF (X=XM) AND ( B=6 OR B=8 )                THEN X=X-1:GOTO 160
2230 IF (Y<YM) AND ( B=7 OR B=11)                THEN X=X-1:GOTO 160
2240 IF (X<XM) AND ( B=3 OR B=7 OR B=8)          THEN Y=Y+1:GOTO 160
2250 IF (X>XM) AND ( B=5 OR B=7 OR B=9)          THEN Y=Y-1:GOTO 160
2260 IF (Y=YM) AND ( B=11 )                      THEN Y=Y-1:GOTO 160
2270 IF (Y=YM) AND ( B=10 )                      THEN Y=Y+1:GOTO 160
2280 GOTO 300
2999 REM :::::::::::::::::::::::::::::::::::::::: Calcule image ::::::::::::::::
3000 IF B=1 OR B=2                                            THEN IM=1:RETURN
3010 IF X=XM AND (B=3 OR B=5) OR X<XM AND B=4 OR X>XM AND B=6 THEN IM=2:RETURN
3020 IF X=XM AND (B=4 OR B=6) OR X<XM AND B=3 OR X>XM AND B=5 THEN IM=3:RETURN
3030 IF B=7                                                   THEN IM=7:RETURN
3040 IF (X>XM AND B=8) OR (X<XM AND B=9) OR (Y<YM AND B=10)   THEN IM=5:RETURN
3045 IF (Y>YM AND B=11)                                       THEN IM=5:RETURN
3050 IF (X>XM AND B=9) OR (X<XM AND B=8) OR (Y<YM AND B=11)   THEN IM=6:RETURN
3055 IF (Y>YM AND B=10)                                       THEN IM=6:RETURN
3060 IF (X=XM AND (B=8 OR B=9)) OR (Y=YM AND (B=10 OR B=11))  THEN IM=4:RETURN
3070 RETURN
4000 REM |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
4010 CLS:LOCATE 1,1:PRINT " C'EST UNE SIMPLE ALLEE ":MES$=" (8) ou (2) "
4020 LINE  (110,70)-(10,10),1
4030 LINE -(310,190),1,B
4040 LINE -(210,130),1
4050 LINE  (310,10)-(210,70),1
4060 LINE -(110,130),1,B
4070 LINE -(10,190),1
4080 RETURN
4081 REM =======================================================================
4090 CLS:LOCATE 1,1:PRINT "  C'est un virage droit ";:MES$=" (6) ou (2) "
4100 LINE (10,10)-(310,190),1,B
4110 LINE (110,70)-(250,130),2,BF
4120 LINE (310,10)-(250,46),1:LINE -(250,154),1:LINE -(310,190),1
4130 LINE (10,10)-(110,70),1
4140 LINE (110,130)-(10,190),1
4150 RETURN
4151 REM =======================================================================
4160 CLS:LOCATE 1,1:PRINT "  C'est un virage Gauche ";:MES$=" (4) ou (2) "
4170 LINE (10,10)-(310,190),1,B
4180 LINE (70,70)-(210,130),2,BF
4190 LINE -(310,190),1:LINE (210,70)-(310,10),1
4200 LINE (10,190)-(70,154),1:LINE -(70,46),1:LINE -(10,10),1
4210 RETURN
4211 REM =======================================================================
4220 CLS:LOCATE 1,1:PRINT "   c'est un T  ";:MES$=" (4) (2) (6) "
4230 LINE (10,10)-(310,190),1,B
4240 LINE -(230,150),1:LINE -(230,50),1:LINE -(310,10),1
4250 LINE (10,10)-(90,50),1
4260 LINE -(90,150),1:LINE -(10,190),1
4270 LINE (90,140)-(230,60),2,BF
4280 RETURN
4281 REM =======================================================================
4290 CLS:LOCATE 1,1:PRINT "vous pouvez aller tout droit ou a droite";:MES$=" (8) (6) (2) "
4300 LINE (10,10)-(310,190),1,B
4310 LINE -(280,172),1:LINE -(280,28),1: LINE -(310,10),1
4320 LINE (10,10)-(110,70),1:LINE -(210,130),1,B: LINE -(250,154),1
4330 LINE -(250,46),1:LINE -(210,70),1
4340 LINE (110,130)-(10,190),1
4350 LINE (250,46)-(280,154),2,BF
4360 RETURN
4361 REM =======================================================================
4370 CLS:LOCATE 1,1:PRINT "vous pouvez aller tout droit ou a gauche";:MES$=" (8) (4) (2) "
4380 LINE (310,190)-(10,10),1,B
4390 LINE -(40,28),1:LINE -(40,172),1:LINE -(10,190),1
4400 LINE (310,190)-(210,130),1:LINE -(110,70),1,B
4410 LINE -(70,46),1:LINE -(70,154),1:LINE -(110,130),1
4420 LINE (40,46)-(70,154),2,BF
4430 LINE (210,70)-(310,10),1
4440 RETURN
4441 REM =======================================================================
4450 CLS:LOCATE 1,1:PRINT "C'est une intersection + ";:MES$=" (2) (8) (4) (6) "
4460 LINE (10,10)-(310,190),1,B:LINE (110,70)-(210,130),1,B
4470 LINE (40,46)-(70,154),2,BF:LINE (250,46)-(280,154),2,BF
4480 LINE (310,10)-(280,28),1:LINE -(280,172),1:LINE -(310,190),1
4490 LINE (10,10)-(40,28),1:LINE -(40,172),1:LINE -(10,190),1
4500 LINE (110,70)-(70,46),1:LINE (70,154)-(110,130),1
4510 LINE (210,70)-(250,46),1:LINE (250,154)-(210,130),1
4520 RETURN
4521 REM =======================================================================
4530 CLS:LOCATE 1,1:PRINT " C'EST UN CUL DE SAC ":MES$=" (2) "
4540 LINE  (110,70)-(10,10),1
4550 LINE -(310,190),1,B
4560 LINE -(210,130),1
4570 LINE  (310,10)-(210,70),1
4580 LINE -(110,130),2,BF
4590 LINE -(10,190),1
4600 RETURN
4601 REM |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
5000 CLS:LOCATE 12,1:PRINT " Vous avez reussit ....."
5010 LOCATE 21,5:PRINT "Encore O/N"
5015 FOR I=1 TO 10:A$=INKEY$:NEXT I
5016 A$=INPUT$(1)
5020 IF A$="o" OR A$="O" THEN 120
5030 SCREEN 2:SCREEN 0:END
6000 DATA  17, 1, 1, 1, 1, 1, 1, 1, 6
6010 DATA   3, 1, 8, 1, 1,12,15, 6, 2
6020 DATA  10,16, 4, 1, 6, 3, 6, 2, 2
6030 DATA  10, 6, 3,12, 2, 2, 2, 2, 2
6040 DATA   2, 2, 2, 3, 5, 2, 2,10, 5
6050 DATA   2, 2, 2, 2,15, 5, 2, 4, 6
6060 DATA   2, 2, 2, 4, 1, 1,11, 3, 5
6070 DATA   2,14, 4, 1, 1, 1, 7, 5,13
6080 DATA   4, 1, 1, 1, 1, 1, 9, 1, 5
6090 DATA -1
