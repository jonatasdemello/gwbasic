10   KEY 5,"LIST 3000-5000"+CHR$(13)
20 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
30 REM ::             PROGRAMME ECRIT EN (GW)BASIC(A)  POUR IBM             ::
40 REM ::   imagine,compose,et r‚alise par DARCHE YOANN ...........         ::
50 REM ::                   =-=-=-=-=-=-=-=-=-=-=-=-=                       ::
60 REM ::                Le LABYRINTHE INFERNAL VERSION 1.1                 ::
70 REM ::                   =-=-=-=-=-=-=-=-=-=-=-=-=                       ::
80 REM ::           Commenc‚ le : 3/06/1990    fini le : 04/06/1990         ::
90 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
100 DEFINT X,Y,I,J,B,A
110 DIM P$(10,10),AF$(10,10)
120 X=2:Y=3:XM=1:YM=Y
130 SCREEN 2:SCREEN 0:COLOR 1,0
140 CLS
150 GOSUB 340:CLS:SCREEN 1
160 D$=P$(X,Y):B=VAL(D$)
170 'COLOR 1,0:LOCATE YM+2,XM:PRINT AF$(XM,YM);
180 'COLOR 14,0:LOCATE Y+2,X:PRINT AF$(X,Y);
190 IF B=17 THEN 5000
200 IF B=16 THEN X=XM:Y=YM :B=12
210 IF B=12 OR B=13 OR B=14 OR B=15 THEN IM = 8:FLAG=1:GOTO 230 ELSE FLAG=0
220 ON B GOSUB 2010,2040,2070,2100,2130,2160,2190,2250,2290,2330,2370
230 ON IM GOSUB 4010,4090,4160,4220,4290,4370,4450,4530
240 T$=INPUT$(1):IF T$=CHR$(27) THEN END
250 XN=XM:YN=YM
260 IF T$="2" THEN SWAP X,XM:SWAP Y,YM:GOTO 160
270 IF FLAG=1 THEN 300
280 XM=X:YM=Y
290 ON B GOSUB 3030,3070,3110,3150,3190,3230,3270,3410,3490,3570,3650
300 IF (XM=X AND YM=Y) THEN XM=XN:YM=YN:LOCATE 25,1:PRINT "Non ! Seulement ";MES$;" <ESC> ";:BEEP:GOTO 240
310 GOTO 160
320 END
330 REM LECTURE ET AFFICHAGE DU LABYRINTHE
340 RESTORE
350 FOR  J=1 TO 9
360 FOR  I=1 TO 9
370 READ A$
380 P$(I,J)=A$
390 IF A$="1" THEN AFF%=205
400 IF A$="2" THEN AFF%=186
410 IF A$="3" THEN AFF%=201
420 IF A$="4" THEN AFF%=200
430 IF A$="5" THEN AFF%=188
440 IF A$="6" THEN AFF%=187
450 IF A$="7" THEN AFF%=206
460 IF A$="16" THEN AFF%=69
470 IF A$="17" THEN AFF%=83
480 IF A$="12" THEN AFF%=26
490 IF A$="13" THEN AFF%=24
500 IF A$="14" THEN AFF%=25
510 IF A$="15" THEN AFF%=27
520 IF A$="8" THEN AFF%=203
530 IF A$="9" THEN AFF%=202
540 IF A$="10" THEN AFF%=204
550 IF A$="11" THEN AFF%=185
560 LOCATE J+2,I:PRINT CHR$(AFF%);:AF$(I,J)=CHR$(AFF%)
570 NEXT I
580 NEXT J
590 RETURN
2000 REM |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
2010 IF X < XM THEN A=1 ELSE A=2
2020 IM=1:RETURN
2030 REM =======================================================================
2040 IF Y < YM THEN A=1 ELSE A=2
2050 IM=1:RETURN
2060 REM |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
2070 IF X < XM THEN A=1:IM = 3 ELSE A=2:IM=2
2080 RETURN
2090 REM =======================================================================
2100 IF X < XM THEN A=1:IM = 2 ELSE A=2:IM=3
2110 RETURN
2120 REM =======================================================================
2130 IF X > XM THEN A=1:IM = 3 ELSE A=2:IM=2
2140 RETURN
2150 REM =======================================================================
2160 IF X > XM THEN A=1:IM = 2 ELSE A=2:IM=3
2170 RETURN
2180 REM |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
2190 IM=7
2200 IF Y=YM AND X>XM THEN A=1:RETURN
2210 IF Y=YM AND X<XM THEN A=2:RETURN
2220 IF X=XM AND Y>YM THEN A=3:RETURN
2230 A=4:RETURN
2240 REM |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
2250 IF X > XM THEN A=1:IM=5:RETURN
2260 IF X < XM THEN A=2:IM=6:RETURN
2270 A=3:IM=4:RETURN
2280 REM =======================================================================
2290 IF X > XM THEN A=1:IM=6:RETURN
2300 IF X < XM THEN A=2:IM=5:RETURN
2310 A=3:IM=4:RETURN
2320 REM =======================================================================
2330 IF Y > YM THEN A=1:IM=6:RETURN
2340 IF Y < YM THEN A=2:IM=5:RETURN
2350 A=3:IM=4:RETURN
2360 REM =======================================================================
2370 IF Y > YM THEN A=1:IM=5:RETURN
2380 IF Y < YM THEN A=2:IM=6:RETURN
2390 A=3:IM=4:RETURN
3000 REM |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
3010 REM ************ CALCULE DES DEPLACEMENTS  ********************************
3020 REM ======================== B=1 : Ä  =====================================
3030 IF A=1 AND T$="8" THEN X=X-1:RETURN
3040 IF A=2 AND T$="8" THEN X=X+1:RETURN
3050 RETURN
3060 REM ======================== B=2 : ³ ======================================
3070 IF T$="8" AND A=1 THEN Y=Y-1:RETURN
3080 IF T$="8" AND A=2 THEN Y=Y+1:RETURN
3090 RETURN
3100 REM ========================== B=3 : Ú ====================================
3110 IF T$="4" AND A=1 THEN Y=Y+1:RETURN
3120 IF T$="6" AND A=2 THEN X=X+1:RETURN
3130 RETURN
3140 REM ========================== B=4 : À ====================================
3150 IF T$="6" AND A=1 THEN Y=Y-1:RETURN
3160 IF T$="4" AND A=2 THEN X=X+1:RETURN
3170 RETURN
3180 REM ========================== B=5 : Ù ====================================
3190 IF T$="4" AND A=1 THEN Y=Y-1:RETURN
3200 IF T$="6" AND A=2 THEN X=X-1:RETURN
3210 RETURN
3220 REM ========================== B=6 : ¿ ====================================
3230 IF T$="6" AND A=1 THEN Y=Y+1:RETURN
3240 IF T$="4" AND A=2 THEN X=X-1:RETURN
3250 RETURN
3260 REM ========================== B=7 : Å ====================================
3270 IF T$="8" AND A=1 THEN X=X+1:RETURN
3280 IF T$="4" AND A=1 THEN Y=Y-1:RETURN
3290 IF T$="6" AND A=1 THEN Y=Y+1:RETURN
3300 IF T$="8" AND A=2 THEN X=X-1:RETURN
3310 IF T$="4" AND A=2 THEN Y=Y+1:RETURN
3320 IF T$="6" AND A=2 THEN Y=Y-1:RETURN
3330 IF T$="8" AND A=3 THEN Y=Y+1:RETURN
3340 IF T$="4" AND A=3 THEN X=X+1:RETURN
3350 IF T$="6" AND A=3 THEN X=X-1:RETURN
3360 IF T$="8" AND A=4 THEN Y=Y-1:RETURN
3370 IF T$="4" AND A=4 THEN X=X-1:RETURN
3380 IF T$="6" AND A=4 THEN X=X+1:RETURN
3390 RETURN
3400 REM ========================== B=8 : Â ====================================
3410 IF A=1 AND T$="6" THEN Y=Y+1:RETURN
3420 IF A=1 AND T$="8" THEN X=X+1:RETURN
3430 IF A=2 AND T$="4" THEN Y=Y+1:RETURN
3440 IF A=2 AND T$="8" THEN X=X-1:RETURN
3450 IF A=3 AND T$="4" THEN X=X-1:RETURN
3460 IF A=3 AND T$="6" THEN X=X+1:RETURN
3470 RETURN
3480 REM ========================== B=9 : Á ====================================
3490 IF A=1 AND T$="4" THEN Y=Y-1:RETURN
3500 IF A=1 AND T$="8" THEN X=X+1:RETURN
3510 IF A=2 AND T$="6" THEN Y=Y-1:RETURN
3520 IF A=2 AND T$="8" THEN X=X-1:RETURN
3530 IF A=3 AND T$="4" THEN X=X+1:RETURN
3540 IF A=3 AND T$="6" THEN X=X-1:RETURN
3550 RETURN
3560 REM ========================== B=10: Ã ====================================
3570 IF A=1 AND T$="4" THEN X=X+1:RETURN
3580 IF A=1 AND T$="8" THEN Y=Y+1:RETURN
3590 IF A=2 AND T$="6" THEN X=X+1:RETURN
3600 IF A=2 AND T$="8" THEN Y=Y-1:RETURN
3610 IF A=3 AND T$="4" THEN Y=Y+1:RETURN
3620 IF A=3 AND T$="6" THEN Y=Y-1:RETURN
3630 RETURN
3640 REM ========================== B=11: ´ ====================================
3650 IF A=1 AND T$="6" THEN X=X-1:RETURN
3660 IF A=1 AND T$="8" THEN Y=Y+1:RETURN
3670 IF A=2 AND T$="4" THEN X=X-1:RETURN
3680 IF A=2 AND T$="8" THEN Y=Y-1:RETURN
3690 IF A=3 AND T$="4" THEN Y=Y-1:RETURN
3700 IF A=3 AND T$="6" THEN Y=Y+1:RETURN
3710 RETURN
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
