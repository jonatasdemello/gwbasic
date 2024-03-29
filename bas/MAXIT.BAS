1000 '   MAXIT  FROM PET
1010 '   ADAPTED TO IPM PC BY PATRICK LEABO
1020 '   3-20-82              TUCSON ARIZONA
1030 '
1090 SCREEN 0:COLOR 7,0:WIDTH 40:KEY OFF
1100 DEFINT A-Z:DATA 49,51,53,54,56,58,60,61
1110 RANDOMIZE VAL(RIGHT$(TIME$,2))
1120 FOR N= 0 TO 7:READ NT(N):NEXT
1140 DIM BD(7,7),AV(64)
1150 CLS:LOCATE 3,11:PRINT "THE GAME OF MAXIT"
1160 PRINT "DO YOU WANT INSTRUCTIONS ? ";:GOSUB 3000:PRINT
1170 IF KS$= "Y" OR KS$="y" THEN GOSUB 2210
1180 PRINT :PRINT "1 OR 2 PLAYERS ?";:GOSUB 3000
1190 PRINT KS$:NP= VAL (KS$):PRINT 
1200 IF NP= 1 THEN 1240
1210 IF NP< > 2 THEN 1180
1220 INPUT "WHAT IS YOUR NAME #1";P1$:P1$=LEFT$(P1$,7):BEEP:PRINT
1230 PRINT :INPUT "WHAT IS YOUR NAME #2";P2$:P2$=LEFT$(P2$,7):BEEP:PRINT :GOTO 1250
1240 P2$= "IBM PC":INPUT "WHAT IS YOUR NAME ";P1$:BEEP:PRINT:P1$=LEFT$(P1$,7)
1250 CLS:LOCATE 2,16:PRINT "M A X I T":GOSUB 2360
1260 RANDOMIZE VAL(RIGHT$(TIME$,2)):MD= 1
1270 FOR K= 1 TO 64:AV(K)= K:NEXT 
1280 FOR K= 64 TO 1 STEP - 1:READ PC
1290 P1= 1+ INT (K* RND (1))
1300 J= AV(P1)- 1
1310 IF P1< K THEN FOR I= P1 TO K- 1:AV(I)= AV(I+ 1):NEXT
1320 I= INT (J/ 8):J= J- 8* I
1330 BD(I,J)= PC:GOSUB 1540:NT= J:GOSUB 1980
1340 NEXT K:RESTORE 1350:NT= 7:GOSUB 1980:GOSUB 1980:GOSUB 1980
1350 DATA 15,10,9,9,8,8,7,7,7,6,6,6
1360 DATA 5,5,5,5,4,4,4,4,3,3,3,3,3
1370 DATA 2,2,2,2,2,2,1,1,1,1,1
1380 DATA 0,0,0,0,0,0,-1,-1,-1,-1,-1
1390 DATA -2,-2,-2,-2,-3,-3,-3
1400 DATA -4,-4,-4,-5,-5,-6,-6
1410 DATA -7,-9,100
1420 S1= 0:S2= 0:GOSUB 2000
1430 REM  PLAYER 1
1440 PL= 1:GOSUB 1630:IF FL= 0 THEN 1470
1450 REM  PLAYER 2
1460 PL= 2:GOSUB 1630:IF FL< > 0 THEN 1430
1470 LOCATE 22,1:PRINT STRING$(39," ");:LOCATE 22,1:ON 2+ SGN (S2- S1)GOSUB 1510,1520,1530
1480 POKE 106,0:LOCATE 23,1:PRINT STRING$(39," ");:LOCATE 23,1:PRINT "DO YOU WANT TO PLAY AGAIN ?";:C$="":WHILE C$="":C$=INKEY$:WEND:PRINT C$
1490 IF "Y"= C$ OR "y"=C$ THEN 1250
1500 CHAIN "MENU",1000
1505 END
1510 PRINT P1$;" WON BY ";STR$ (S1- S2);" POINTS":PRINT :RETURN
1520 PRINT "IT'S A TIE !!                   ":RETURN
1530 PRINT P2$;" WON BY ";STR$ (S2- S1);" POINTS ":PRINT :RETURN
1540 REM  DRAW BOARD POSITION I,J IN MODE MD (1=RED,2=BLACK)
1550 PC= BD(I,J)
1560 LOCATE I* 2+ 5,J*4+5
1570 IF MD= 2 THEN COLOR 0,7:GOTO 1590
1580 COLOR 7,0
1590 IF PC= 100 THEN PRINT "**":C1= I:C2= J:GOTO 1620
1600 IF PC= - 100 THEN PRINT "  ":GOTO 1620
1610 PRINT RIGHT$ ("  "+ STR$ (PC),2)
1620 COLOR 7,0:RETURN
1630 IF PL= 2 THEN 1670
1640 FL= 600:FOR J= 0 TO 7:FL= FL+ BD(C1,J):NEXT 
1650 IF FL= 0 THEN RETURN 
1660 NM$= P1$:DX= 1:DY= 0:GOSUB 1700:RETURN 
1670 FL= 600:FOR I= 0 TO 7:FL= FL+ BD(I,C2):NEXT 
1680 IF FL= 0 THEN RETURN 
1690 NM$= P2$:DX= 0:DY= 1:GOSUB 1700:RETURN 
1700 Y= C1:X= C2:FX= 1
1705 IF PL = 2 THEN COLOR 0,7
1710 IF NP= 2 OR PL= 1 THEN 1730
1720 PRINT :GOSUB 1970:PRINT NM$;"'S TURN.         ":GOSUB 2060:GOTO 1880
1730 GOSUB 1970:ON FX GOTO 1740,1750
1740 PRINT :GOSUB 1970:PRINT NM$;", YOUR TURN.     ":PRINT :GOTO 1760
1750 PRINT "                    ":PRINT
1760 PLAY "L64T200N70"
1770 C$=INKEY$:IF C$="" THEN 1770 ELSE KS=ASC(C$)
1775 IF C$=CHR$(27) THEN 1500
1780 IF C$< > " "THEN 1860
1790 OX= X:OY= Y
1800 Y= Y+ DY:IF Y> 7 THEN Y= 0
1810 X= X+ DX:IF X> 7 THEN X= 0
1820 PT= BD(Y,X):IF ABS (PT)= 100 THEN 1800
1830 MD= 1:I= OY:J= OX:GOSUB 1540
1840 MD= 2:I= Y:J= X:GOSUB 1540
1850 GOTO 1770
1860 IF C$< > CHR$ (13)THEN 1770
1870 IF ABS (BD(Y,X))= 100 THEN 1770
1880 REM SCORE IT
1890 '
1900 IF NP=1 AND PL =2 THEN MD= 2:I= Y :J= X:GOSUB 1540:FOR DL = 1 TO 1500:NEXT
1905 GOSUB 1990:MD= 1:I= C1:J= C2:BD(I,J)= - 100:GOSUB 1540
1910 I= Y:J= X:PT= BD(I,J):BD(I,J)= 100:GOSUB 1540
1920 IF PL= 1 THEN S1= S1+ PT
1930 IF PL= 2 THEN S2= S2+ PT
1940 GOSUB 1970
1950 LOCATE 22,25:PRINT "LAST TAKEN:";PT;" ";
1960 GOSUB 2000:RETURN 
1970 LOCATE 22,1:RETURN
1980 PLAY "MNMFL64N=NT(NT);":RETURN
1990 FOR N=49 TO 70 :PLAY "MBT255MLO3L64N=N;":NEXT:RETURN
2000 GOSUB 1970
2010 LOCATE 21,1:ME$=P1$+"'S SCORE="+STR$ (S1)+"  "+P2$+"'S SCORE="+STR$ (S2)+"       ":ME$=LEFT$(ME$,40):PRINT ME$:RETURN
2020 REM  SCREEN INSTRUCTIONS
2050 RETURN
2059 '      COMPUTER PLAYER ALGORITHM
2060 MT= - 100:GG= - 1:FOR A1= 0 TO 7:PC= BD(A1,C2):IF ABS (PC)= 100 THEN 2200
2070 MX= - 100:FOR A2= 0 TO 7
2080 IF A2< > C2 THEN PK= BD(A1,A2):IF PK< > - 100 AND PK> MX THEN MX= PK:SV= A
2090 NEXT A2
2100 IF MX< > - 100 THEN 2120
2110 IF PC> MT THEN MT= PC:GG= A1:GOTO 2200
2120 IF GG< 0 THEN GG= A1
2130 FOR A2= 0 TO 7:PQ= BD(A2,SV):IF PQ= - 100 OR A2= A1 THEN 2190
2140 MY= - 100:FOR A3= 0 TO 7:PW= BD(A2,A3):IF A3= SV THEN 2160
2150 IF ABS (PW)< > 100 AND PW> MY THEN MY= PW
2160 NEXT A3
2170 IF MY= - 100 THEN MY= 0
2180 DT= PC- MX+ PQ- MY:IF DT> MT THEN MT= DT:GG= A1
2190 NEXT A2
2200 NEXT A1:Y= GG:RETURN 
2210 LOCATE 1,16:PRINT "M A X I T":PRINT
2220 PRINT "THE OBJECT OF MAXIT IS TO GET AS MANY"
2230 PRINT "POINTS AS POSSIBLE. TWO PLAYERS CAN"
2240 PRINT "PLAY AGAINST EACH OTHER, OR ONE AGAINST"
2250 PRINT "THE COMPUTER.":PRINT :PRINT
2260 PRINT "YOU GET POINTS BY MOVING A MARKER "
2270 PRINT "            **"
2280 PRINT "TO A SPACE WITH A NUMBER IN IT. THE"
2290 PRINT "FIRST PLAYER ALWAYS MOVES HORIZONTALLY"
2300 PRINT "AND THE SECOND MOVES VERTICALLY.  YOU"
2310 PRINT "INDICATE THE PLACE YOU WANT TO MOVE TO"
2320 PRINT "BY USING THE SPACE BAR TO POSITION"
2330 PRINT "YOURSELF, AND THEN PUSH RETURN TO TAKE"
2340 PRINT "THAT PIECE.":RETURN 
2350 PLOT 8:END 
2360 REM  OTHER OTHELLO BOARD
2370 '
2380 TOP$="�������������������������������͸"
2382 MD1$="�   �   �   �   �   �   �   �   �"
2384 MD2$="�������������������������������͵"
2386 BOT$="�������������������������������;"
2390 LOCATE 4,4:PRINT TOP$
2400 FOR Y=5 TO 17 STEP 2:LOCATE Y,4:PRINT MD1$:LOCATE Y+1,4:PRINT MD2$:NEXT
2410 LOCATE 19,4:PRINT MD1$:LOCATE 20,4:PRINT BOT$
2440 GOSUB 2020
2450 RETURN 
3000 KS$="":WHILE KS$="":KS$=INKEY$:WEND:KS=ASC(KS$):RETURN
