10 CLEAR:WIDTH 80:SW=80:CLS:LOCATE 1,17,0:COLOR 0,7:PRINT " * * * * * *   S O F T M A R K   I N C.  * * * * * *":COLOR 7,0
20 LOCATE 3,30:PRINT "FORMAT SETUP SPECIFICATIONS"
30 LOCATE 4,1:PRINT "-------------------------------------------------------------------------------"
40 LOCATE 8,18:PRINT "***************************************************"
50 LOCATE 9,18: PRINT "*                                                 *"
60 LOCATE 10,18:PRINT "*  FORMAT NAME.................                   *"
70 LOCATE 11,18:PRINT "*  START LINE NUMBER...........                   *"
80 LOCATE 12,18:PRINT "*  NUMBER OF LINES TO CLEAR....                   *"
90 LOCATE 13,18:PRINT "*  SOUND ALARM....(Y/N)........                   *"
100 LOCATE 14,18: PRINT "*  SCREEN LENGTH..(40/80)...... 80                *"
110 LOCATE 15,18:PRINT "*                                                 *"
120 LOCATE 16,18:PRINT "***************************************************"
130 LOCATE 10,50:INPUT "",FORMAT$
140 LOCATE 11,50:INPUT "",STARTLINE:IF STARTLINE=999 THEN 130
150 LOCATE 12,50:INPUT "",CLEARLINES:IF CLEARLINES=999 THEN 140
160 LOCATE 13,50:INPUT "",ALARM$:IF ALARM$="999" THEN 150
170 LOCATE 14,50:INPUT "",SWW:IF SWW=999 THEN 160
180 IF SWW><40 THEN SWW=80
190 LCLEAR=STARTLINE+CLEARLINES:IF LCLEAR>24 THEN BEEP:LOCATE 25,1:PRINT "LINES TO CLEAR IS TOO LARGE....RENTER":FOR P=1 TO 5000:NEXT P: GOTO 10
200 OPTION BASE 1
210 DIM C$(23,SW):DIM B$(23,SW)
220 IF I16=1 THEN GOSUB 3220: I16=0
230 SW=SWW:CLS:I50=0:SCREEN 0:WIDTH SW:LOCATE ,,1
240 FLXX=0:FOR XX=1 TO SW:IF MID$(FORMAT$,XX,1)>CHR$(32) THEN FLXX=FLXX+1
250 IF MID$(FORMAT$,XX,1)<CHR$(33) THEN XX=SW
260 NEXT XX:FILENAME$=SPACE$(FLXX+6):MID$(FILENAME$,1,2)="B:":FOR XX=1 TO FLXX:MID$(FILENAME$,XX+2,1)=MID$(FORMAT$,XX,1):NEXT XX:MID$(FILENAME$,FLXX+3,4)=".BAS"
270 INSC=1
280 X=1:Y=1
290 KEY (9) ON: KEY (5) ON: KEY (4) ON
300 ON KEY (9) GOSUB 890: ON KEY (5) GOSUB 920:ON KEY (4) GOSUB 3210
310 IF I17=1 THEN GOSUB 920:I17=0
320 IF I50=0 THEN LOCATE 1,(SW-2):IF INSC<0 THEN COLOR 0,7:PRINT "ENT":COLOR 7,0
330 IF I50=0 THEN LOCATE 1,(SW-2):IF INSC>0 THEN COLOR 7,0:PRINT "ENT"
340 IF I50=1 THEN LOCATE 1,(SW-2):PRINT "ATT"
350 LOCATE Y,X,1: ENT$=INKEY$
360 L$=LEFT$(ENT$,1):R$=RIGHT$(ENT$,1)
370 IF ENT$="" THEN GOTO 350
380 LOCATE ,,0
381 IF FRE(0)<1000 THEN LOCATE 12,1:COLOR 0,7:PRINT " YOU DO NOT HAVE ENOUGH FREE MEMORY TO CONTINUE...PRESS KEY 10 TO CONT......  ":COLOR 7,0:KEY (10) ON:ON KEY (10) GOSUB 1450:GOTO 350
390 IF L$<>CHR$(0) THEN GOTO 560
391 IF (I50=0) AND (R$=CHR$(81)) THEN GOSUB 741:GOTO 350
400 IF (I50=0) AND (R$=CHR$(73)) THEN GOSUB 750:GOTO 350
410 IF R$=CHR$(83) THEN GOSUB 730:GOTO 350
420 IF R$=CHR$(15) THEN X=X-8:IF X<1 THEN Y=Y-1:X=SW:IF Y<1 THEN Y=23
430 IF R$=CHR$(116) THEN X=X+3:IF X>SW THEN Y=Y+1:X=1:IF Y>23 THEN Y=1
440 IF R$=CHR$(77) THEN X=X+1:IF X>SW THEN Y=Y+1:X=1:IF Y>23 THEN Y=1
450 IF R$=CHR$(75) THEN X=X-1:IF X<=0 THEN Y=Y-1:X=SW:IF Y<=0 THEN Y=23
460 IF R$=CHR$(115) THEN X=X-3:IF X<=0 THEN Y=Y-1:X=SW:IF Y<=0 THEN Y=23
470 IF R$=CHR$(72) THEN Y=Y-1:IF Y<=0 THEN Y=23
480 IF R$=CHR$(80) THEN Y=Y+1:IF Y>=24 THEN Y=1
490 IF R$=CHR$(119) THEN X=1
500 IF R$=CHR$(117) THEN X=SW
510 IF R$=CHR$(71) THEN X=1
520 IF R$=CHR$(79) THEN X=SW
530 IF (I50=0) AND (R$=CHR$(82)) THEN INSC=(INSC*(-1)):IF INSC<0 THEN LOCATE 1,SW-2:COLOR 0,7:PRINT "ENT":COLOR 7,0
540 IF (R$=CHR$(82)) AND (INSC>0) THEN LOCATE 1,SW-2:COLOR 7,0:PRINT "ENT"
550 IF L$=CHR$(0) THEN GOTO 290
560 IF (I50=0) AND (INSC<0) THEN GOSUB 810
570 IF (I50=0) AND (L$=CHR$(10)) THEN GOSUB 720:GOTO 290
580 IF L$=CHR$(13) THEN Y=Y+1:X=1:IF Y>23 THEN Y=1
590 IF L$=CHR$(9) THEN X=X+8:IF X>SW THEN Y=Y+1:X=1:IF Y>23 THEN Y=1
600 IF L$=CHR$(9) THEN GOTO 290
610 IF L$=CHR$(8) THEN LOCATE Y,X:PRINT " ":C$(Y,X)="":X=X-1:IF X<=0 THEN X=SW:Y=Y-1:IF Y<=0 THEN Y=23
620 IF L$=CHR$(8) THEN GOTO 290
630 IF L$=CHR$(10) THEN Y=Y+1:X=1:IF Y>23 THEN Y=1
640 IF L$=CHR$(13) THEN GOTO 290
650 IF L$=CHR$(10) THEN GOTO 290
660 IF L$=CHR$(27) THEN CLS:ERASE C$:ERASE B$:X=1:Y=1:GOTO 210
670 LOCATE Y,X,0:PRINT ENT$
680 IF I50<>1 THEN LET C$(Y,X)=ENT$
690 IF I50=1 THEN LET B$(Y,X)=ENT$
700 X=X+1:IF X>SW THEN Y=Y+1:X=1:IF Y>23 THEN Y=1
710 LOCATE Y,X,0:GOTO 290
720 FOR XX=X TO SW:C$(Y,XX)="":LOCATE Y,XX,0:PRINT " ":NEXT XX:RETURN
730 FOR XX=X TO SW-1:C$(Y,XX)=C$(Y,(XX+1)):LOCATE Y,XX,0:PRINT C$(Y,XX+1):LOCATE Y,SW:PRINT " ":C$(Y,SW)=" ":IF (C$(Y,XX+1)="") OR (C$(Y,XX+1)=" ")  THEN LOCATE Y,XX:PRINT " " ':XX=SW
740 NEXT XX:RETURN
741 FOR QQ=1 TO 20
742 WS=SW:IF Y=23 THEN WS=WS-1
743 IF X+QQ>WS THEN :GOTO 746
744 C$(Y,X+QQ)=C$(Y,X):LOCATE Y,X+QQ:PRINT C$(Y,X)
745 NEXT QQ
746 X=(X+QQ)-1:RETURN
750 FOR QQ=1 TO 23:LOCATE QQ,1:PRINT QQ:NEXT QQ:LOCATE 1,2:COLOR 0,7:PRINT " ENTER THE LINE NUMBER RANGE YOU":LOCATE 2,2:PRINT " WISH DATA TO BE COPIED THROUGH.. "
751 LOCATE 2,41:COLOR 7,0:PRINT "FROM LINE....":LOCATE 2,58:PRINT "TO LINE...."
752 LOCATE 2,55:COLOR 7,0:INPUT "",EE:LOCATE 2,70:INPUT "",YY
760 IF YY>23 THEN YY=23
770 WS=SW:IF YY=23 THEN WS=WS-1
780 FOR RR=EE TO YY:FOR QQ=1 TO WS:C$(RR,QQ)=C$(Y,QQ):LOCATE RR,QQ:PRINT C$(Y,QQ):NEXT QQ:NEXT RR
790 FOR WW=1 TO 2: FOR QQ=1 TO WS: LOCATE WW,QQ:PRINT " ": NEXT QQ: NEXT WW
791 FOR WW=1 TO 2:FOR QQ=1 TO WS:LOCATE WW,QQ:PRINT C$(WW,QQ):NEXT QQ:NEXT WW
800 FOR WW=1 TO 4:FOR QQ=1 TO 23:LOCATE QQ,WW:PRINT " ":LOCATE QQ,WW:PRINT " ":NEXT QQ:FOR QQ=1 TO 23:LOCATE QQ,WW:PRINT C$(QQ,WW):LOCATE QQ,WW:PRINT C$(QQ,WW):NEXT QQ:NEXT WW:LOCATE 1,78:PRINT "ENT":RETURN
810 'LL$=C$(Y,X)
820 'FOR XX=X TO SW-1  ':IF C$(Y,XX)="" THEN GOTO 770
830 'RR$=C$(Y,XX+1):C$(Y,(XX+1))=LL$:LOCATE Y,XX+1,0:PRINT LL$:LL$=RR$:NEXT XX
840 FOR QQ=0 TO SW:C$(Y,(SW-QQ))=C$(Y,(SW-(QQ+1))):LOCATE Y,SW-QQ:PRINT C$(Y,(SW-(QQ+1))):IF C$(Y,(SW-(QQ+1)))="" THEN LOCATE Y,SW-QQ:PRINT " "
850 IF (SW-(QQ+1))=X THEN LOCATE Y,X:PRINT ENT$:QQ=SW
860 NEXT QQ:RETURN
870 RETURN
880 CLS:PRINT"SCREEN FORMAT IS BEING GENERATED.....":GOSUB 1180
890 ERASE B$:DIM B$(23,SW):KEY(1) ON: ON KEY (1) GOSUB 880
900 I50=1:X=1:Y=1
910 LOCATE 1,(SW-2):PRINT "ATT":RETURN
920 I50=0:X=1:Y=1
930 CLS:FOR R=1 TO 23: FOR C=1 TO SW:LOCATE R,C,0:PRINT C$(R,C):NEXT C:NEXT R
940 IF I17=1 THEN FOR R=1 TO 23:FOR C=1 TO SW:IF B$(R,C)>CHR$(32) THEN LOCATE R,C:PRINT B$(R,C)
950 IF I7=1 THEN NEXT C:NEXT R
960 LOCATE 1,(SW-2):PRINT "ENT":RETURN
970 A$="000000": INSC=1
980 FOR XXX=1 TO 25 STEP 2
990 IF MID$(ATTRIB$,XXX,2)="HI" THEN MID$(A$,1,1)="1":I46=1
1000 IF MID$(ATTRIB$,XXX,2)="RI" THEN MID$(A$,2,1)="1":I36=1
1010 IF MID$(ATTRIB$,XXX,2)="BK" THEN MID$(A$,3,1)="1"
1020 IF MID$(ATTRIB$,XXX,2)="UN" THEN MID$(A$,4,1)="1":I37=1
1030 IF MID$(ATTRIB$,XXX,2)="" THEN XXX=25
1040 NEXT XXX
1050 IF I32=1 THEN RETURN
1060 IF A$="000000" THEN F=7:B=0
1070 IF A$="100000" THEN F=15:B=0
1080 IF A$="010000" THEN F=0:B=7
1090 IF A$="110000" THEN F=0:B=15
1100 IF A$="001000" THEN F=23:B=0
1110 IF A$="101000" THEN F=31:B=0
1120 IF A$="000100" THEN F=1:B=0
1130 IF A$="100100" THEN F=9:B=0
1140 IF A$="001100" THEN F=17: B=0
1150 IF A$="101100" THEN F=25:B=0
1160 IF A$="011000" THEN F=16:B=7
1170 IF I29=1 THEN RETURN
1180 OPEN FILENAME$ FOR OUTPUT AS #1
1190 WIDTH 80:KEY(2) ON:ON KEY (2) GOSUB 3070
1200 DAT4$=SPACE$(SW):CTR=4000:COUNT=10
1210 PRINT#1,COUNT;"SCREEN 0"":""WIDTH";SW":""SW=";SW
1220 IF (STARTLINE=1)AND(CLEARLINES=23) THEN COUNT=COUNT+10:PRINT#1,COUNT;"CLS":GOTO 1250
1230 COUNT=COUNT+10:PRINT#1,COUNT;"FOR C=";STARTLINE;"TO";LCLEAR
1240 COUNT=COUNT+10:PRINT#1,COUNT;"LOCATE C,1:PRINT ";CHR$(34);DAT4$;CHR$(34);":NEXT C"
1250 IF ALARM$="Y" THEN COUNT=COUNT+10:PRINT#1,COUNT;"BEEP"
1260 FOR R=1 TO 23: FOR C=1 TO SW
1270 IF B$(R,C)<>"" THEN GOSUB 1490
1280 NEXT C:NEXT R
1290 FOR R=1 TO 23: FOR C=1 TO SW
1300 IF B$(R,C)<>"" THEN GOSUB 1550
1310 NEXT C:NEXT R:I100=0
1320 FOR R=1 TO 23:FOR C=1 TO SW
1330 IF B$(R,C)<>"" THEN GOSUB 1630
1340 NEXT C:NEXT R
1350 IF I100><1 THEN 1420
1360 CTR=CTR+10:PRINT#1,CTR;"IF I11=1 THEN GOTO 9999"
1370 CTR=CTR+10:PRINT#1,CTR;"SM.DESCR$="CHR$(34)"010101"CHR$(34);":";"SM.ATTRIB$="CHR$(34)CHR$(34);":";"SM.DATATAB$="CHR$(34)CHR$(34);":";"SM.RANGE$="CHR$(34)CHR$(34)":GOSUB 7000"
1380 CTR=6999:PRINT#1,CTR;"GOTO 9999
1390 CTR=7000:PRINT#1,CTR;"CHAIN MERGE "CHR$(34)"A:EDIT"CHR$(34)",8650,ALL"
1400 IF I100><1 THEN CTR=7000:PRINT#1,CTR;"'"
1410 CTRX=CTR-50:CTR=CTR+10:PRINT#1,CTR;"IF I10=1 THEN GOTO";CTRX
1420 IF I100><1 THEN CTR=7000:PRINT#1,CTR;"'"
1430 CTR=9999:PRINT#1,CTR;"COLOR 7,0:CHAIN BACK$,RLINE,ALL"
1440 CLS:BEEP:PRINT"SCREEN FORMAT SUCCESSFULLY COMPILED !!!!!!!":CLOSE
1450 LOCATE 15,3:COLOR 15,0:PRINT"  DO YOU WISH TO SAVE THE SCREEN ATTRIBUTES FOR FUTURE MODIFICATION? (Y/N)  ":COLOR 7,0
1460 LOCATE 16,35:ANSWER$=INKEY$:IF ANSWER$="" THEN 1460
1470 IF ANSWER$><"Y" THEN GOTO 3170
1480 GOTO 3080
1490 I31=0
1500 IF B$(R,C)="C" THEN I30=1:GOSUB 1680:GOTO 1540
1510 IF B$(R,C)="c" THEN I30=0:GOSUB 1680:GOTO 1540
1520 IF B$(R,C)="E" THEN I31=1:GOSUB 1680:GOTO 1540
1530 IF B$(R,C)="e" THEN I31=1:GOSUB 1680:GOTO 1540
1540 RETURN
1550 I31=0
1560 IF B$(R,C)="O" THEN I30=1: GOSUB 2270:GOTO 1620
1570 IF B$(R,C)="o" THEN I30=0: GOSUB 2270:GOTO 1620
1580 IF B$(R,C)="B" THEN I30=1: GOSUB 2270:GOTO 1620
1590 IF B$(R,C)="b" THEN I30=0: GOSUB 2270:GOTO 1620
1600 IF B$(R,C)="P" THEN I31=1: GOSUB 2270:GOTO 1620
1610 IF B$(R,C)="p" THEN I31=1: GOSUB 2270:GOTO 1620
1620 RETURN
1630 IF B$(R,C)="I" THEN GOSUB 1950
1640 IF B$(R,C)="i" THEN GOSUB 1950
1650 IF B$(R,C)="B" THEN GOSUB 1950
1660 IF B$(R,C)="b" THEN GOSUB 1950
1670 RETURN
1680 Y=R:X=C:DAT4$=SPACE$(SW):I86=0:IF X=SW THEN I85=1:I19=0:GOSUB 1870:I85=0:RETURN
1690 X=X+1:IF X>SW THEN I85=1:GOTO 1710
1700 IF (B$(Y,X)="")OR(B$(Y,X)=" ") THEN MID$(DAT4$,(X-C),1)=C$(Y,X):GOTO 1690
1710 FL=X-C
1720 STROW$=STR$(R):STCOL$=STR$(C+1)
1730 IF (I31=0) AND (I30=1) THEN DAT1$=" COLOR 15,0:LOCATE "
1740 IF (I31=0) AND (I30=0) THEN DAT1$=" COLOR 7,0:LOCATE "
1750 DA4$=SPACE$(FL-1)
1760 FOR Q=1 TO FL-1:MID$(DA4$,Q,1)=MID$(DAT4$,Q,1):NEXT Q
1770 DAT4$=DA4$:COUNT=COUNT + 10
1780 IF I31=0 THEN PRINT#1,COUNT;DAT1$;STROW$","STCOL$":";"PRINT "CHR$(34);DAT4$;CHR$(34):CNTR=CNTR+1
1790 IF (I31=1) AND (I19=0) THEN I49=1:GOSUB 2820:I49=0
1800 IF I31=1 THEN PRINT#1,COUNT;"COLOR "FF$","BB$":";"LOCATE "STROW$","STCOL$":";"PRINT "CHR$(34);DAT4$;CHR$(34)
1810 IF I86=1 THEN RETURN
1820 DAT4$=SPACE$(SW):IF I85=1 THEN GOSUB 1860:I85=0
1830 C=X:IF I84=1 THEN C=C+1
1840 IF (B$(Y,X)><"T") AND (B$(Y,X)><"t") THEN C=X-1
1850 RETURN
1860 I19=1
1870 X=0:Y=Y+1:I89=0:IF Y>23 THEN PRINT CHR$(7):ERRORS$="INVALID WRAP AROUND FIELD":LOCATE 25,1:PRINT ERRORS$:GOTO 3070
1880 IF (I31=0) AND (I30=1) THEN DAT1$=" COLOR 15,0:LOCATE "
1890 IF (I31=0) AND (I30=0) THEN DAT1$=" COLOR 7,0:LOCATE "
1900 X=X+1:IF X>SW THEN I89=1:GOTO 1920:
1910 IF (B$(Y,X)="") OR (B$(Y,X)=" ") THEN MID$(DAT4$,X,1)=C$(Y,X): GOTO 1900
1920 STROW$=STR$(Y):STCOL$="1":FL=X
1930 I86=1:GOSUB 1750:I86=0:IF I89=1 THEN GOTO 1860
1940 C=X:R=Y:I19=0:RETURN
1950 Y=R:X=C:FLL=0:FL=0:I100=1:DAT4$=SPACE$(SW):IF X=80 THEN X=0:Y=Y+1:C=0:R=R+1
1960 FFLL=FL:X=X+1:IF X>SW THEN FLL=FLL+1:X=SW:GOTO 1980
1970 IF B$(Y,X)<CHR$(33) THEN GOTO 1960
1980 IF B$(Y,X)>CHR$(32) THEN I48=1
1990 STROW$=STR$(R):STCOL$=STR$(C+1):FL=((X-C)-1)
2000 IF FLL=1 THEN X=0:Y=Y+1:FLL=2:GOTO 1960
2010 IF FLL>2 THEN BEEP:BEEP:ERRR$="INVALID WRAP AROUND ON INPUT FIELD....STANDBY":LOCATE 25,1:PRINT ERRR$:FOR ERW$=1 TO 2000:NEXT ERW$:CLOSE:I17=1:GOTO 310
2020 COUNT=COUNT + 10:IF FLL>0 THEN STROW$=STR$(Y-1)
2030 IF FLL=2 THEN FL=(FFLL+X):STCL$=STR$(C+1):IF C=>SW THEN STCL$="1"
2040 FL$="  ":FL$=STR$(FL)
2050 FOR PP=1 TO SW:MID$(DAT4$,PP,1)=C$(R,PP):NEXT PP
2060 IF FLL<2 THEN BLNK$=SPACE$(FL):LIN$=STRING$(FL,95)
2070 IF FFLL<0 THEN FFLL=0
2080 IF FLL=2 THEN BLNK$=SPACE$(FFLL):LIN$=STRING$(FFLL,95)
2090 DESCR$=SPACE$(6):MID$(DESCR$,1,2)=MID$(FL$,2,2):MID$(DESCR$,3,2)=MID$(STROW$,2,2):MID$(DESCR$,5,2)=MID$(STCOL$,2,2)
2100 IF I48=1  THEN GOSUB 2660
2110 IF (I36=1) AND (I46=1) THEN PRINT#1,COUNT;"COLOR 0,15:LOCATE "STROW$","STCOL$":";"PRINT "CHR$(34);BLNK$;CHR$(34)
2120 IF (I36=1) AND (I46=0) THEN PRINT#1,COUNT;"COLOR 0,7:LOCATE "STROW$","STCOL$":";"PRINT "CHR$(34);BLNK$;CHR$(34)
2130 IF (I36=0) AND (I37=1) AND (I46=1) THEN PRINT#1,COUNT;"COLOR 0,15:LOCATE "STROW$","STCOL$":";"PRINT "CHR$(34);LIN$;CHR$(34)
2140 IF (I36=0) AND (I37=1) AND (I46=0) THEN PRINT#1,COUNT;COLOR 0,7:LOCATE "STROW$","STCOL$":";"PRINT "CHR$(34);LIN$;CHR$(34)
2150 IF I18=1 THEN 2170
2160 IF FLL>0 THEN COUNT=COUNT+10:STROW$=STR$(Y):STCOL$="1":BLNK$=SPACE$(X-1):LIN$=STRING$((X-1),95):I18=1:GOTO 2110
2170 CTR=CTR+10:IF I48=1 THEN FL$="  ":FL$=STR$(FL):MID$(DESCR$,1,2)=MID$(FL$,2,2)
2180 IF I48><1 THEN GOTO 2260
2190 PRINT#1,CTR;"SM.DESCR$="CHR$(34);DESCR$;CHR$(34)
2200 CTR=CTR+10:PRINT#1,CTR;"SM.ATTRIB$="CHR$(34);ATTRIB$;CHR$(34)
2210 CTR=CTR+10:PRINT#1,CTR;"SM.DATATAB$="CHR$(34);DATATAB$;CHR$(34)
2220 CTR=CTR+10:PRINT#1,CTR;"SM.RANGE$="CHR$(34);RANGE$;CHR$(34)
2230 CTR=CTR+10:PRINT#1,CTR;"GOSUB 7000:"FLNAME$"=SM.FIELD$"
2240 CTRX=CTR-100:IF CTRX<4000 THEN CTRX=4010
2250 CTR=CTR+10:PRINT#1,CTR;"IF I10=1 THEN GOTO";CTRX
2260 C=X:R=Y:IF (B$(Y,X)<>"T") AND (B$(Y,X)><"t") THEN C=X-1
2261 RETURN
2270 Y=R:X=C:DAT4$=SPACE$(SW):I86=0:IF X=SW THEN I85=1:GOSUB 2470:I85=0:RETURN
2280 X=X+1:IF X>SW THEN I85=1:GOTO 2300
2290 IF B$(Y,X)<CHR$(33) THEN MID$(DAT4$,(X-C),1)=C$(Y,X):GOTO 2280
2300 FL=(X-C)-1
2310 STROW$=STR$(R):STCOL$=STR$(C+1)
2320 STR%=R:STC%=C+1
2330 IF (I31=0) AND (I30=1) THEN DAT1$=" COLOR 15,0:LOCATE "
2340 IF (I31=0) AND (I30=0) THEN DAT1$=" COLOR 7,0:LOCATE "
2350 DA4$=SPACE$(FL-1)
2360 FOR Q=1 TO FL-1:MID$(DA4$,Q,1)=MID$(DAT4$,Q,1):NEXT Q
2370 DAT4$=DA4$
2380 COUNT=COUNT +10:GOSUB 2580
2390 IF I31=0 THEN PRINT#1,COUNT;DAT1$;STROW$","STCOL$":";"PRINT "FLNAME$
2400 IF I31=1 THEN I49=1:GOSUB 2820:I49=0
2410 IF I31=1 THEN PRINT#1,COUNT;"COLOR "FF$","BB$":LOCATE "STROW$","STCOL$":PRINT "FLNAME$:I31=0
2420 IF I86=1 THEN RETURN
2430 DAT4$=SPACE$(SW):IF I85=1 THEN GOSUB 2470:I85=0
2440 C=X:IF I84=1 THEN C=C+1
2450 IF (B$(Y,X)><"T") AND (B$(Y,X)><"t") THEN C=X-1
2460 RETURN
2470 X=0:Y=Y+1:I89=0:IF Y>23 THEN ERROR$="INVALID WRAP AROUND FIELD":LOCATE 25,1:BEEP:PRINT ERROR$:GOTO 3070
2480 'IF I31=1 THEN DAT1$="COLOR ":DAT5$=" LOCATE ":DAT6$="PRINT "
2490 'IF (I31=0) AND (I30=1) THEN DAT1$=" COLOR 15,0:LOCATE "
2500 'IF (I31=0) AND (I30=0) THEN DAT1$=" COLOR 7,0:LOCATE "
2510 X=X+1:IF X>80 THEN I89=1
2520 'IF B$(Y,X)<CHR$(33) THEN GOTO 2260
2530 STROW$=STR$(Y):STCOL$="1":FL=X
2540 I86=1:GOSUB 1750:I86=0:IF I89=1 THEN GOTO 2470
2550 C=X:R=Y:RETURN
2560 IF (B$(Y,X)><"T") AND (B$(Y,X)><"t") THEN C=X-1
2570 RETURN
2580 CLS:LOCATE 1,21:COLOR 0,15,0:PRINT " * * *  S O F T M A R K   I N C.  * * *":COLOR 7,0
2590 LOCATE 3,1:COLOR 15,0:PRINT "VARIALBLE OUTPUT FIELD NAME":COLOR 7,0
2600 LOCATE 4,1:PRINT "-------------------------------------------------------------------------------"
2610 LOCATE 6,20:PRINT "FIELD NAME ------------->":LOCATE 6,47:COLOR 0,7:PRINT "             ":COLOR 7,0
2620 LOCATE 10,1:PRINT " <- - - - - - - - - - - - ENTER THE NAME OF THIS FIELD  - - - - - - - - - - -> "
2630 COLOR 15,0:FOR QQ=1 TO SW:LOCATE 12,QQ:PRINT C$(Y,QQ):NEXT QQ:COLOR 7,0
2640 LOCATE 6,48:COLOR 0,7:INPUT "",FLNAME$:COLOR 7,0
2650 RETURN
2660 CLS:LOCATE 1,21:COLOR 0,15:PRINT " * * *  S O F T M A R K   I N C.   * * * "
2670 LOCATE 3.3:COLOR 15,0:PRINT "INPUT FIELD ATTRIBUTES":COLOR 7,0
2680 LOCATE 4,1:PRINT "-------------------------------------------------------------------------------"
2690 LOCATE 19,2:PRINT "<--------------------------- PROCESSING THIS FIELD ------------------------>"
2700 LOCATE 21,1:COLOR 15,0:PRINT DAT4$:COLOR 7,0
2710 SP40$=SPACE$(40):SP80$=SPACE$(80)
2720 LOCATE 5,13:COLOR 15,0:INPUT "FIELD NAME ............ ",FLNAME$:COLOR 7,0
2730 LOCATE 7,13:PRINT "FIELD DESCRIPTION .....":LOCATE 7,36:COLOR 0,7:PRINT "        ":COLOR 7,0:LOCATE 7,37:COLOR 0,7:PRINT DESCR$:COLOR 7,0
2740 LOCATE 9,13:INPUT "ATTRIBUTES ............ ",ATTRIB$
2750 IF ATTRIB$="999" THEN LOCATE 9,36:PRINT "         ":GOTO 2740
2760 LOCATE 11,13:INPUT "DATATABLE CHECK ....... ",DATATAB$
2770 IF DATATAB$="999" THEN LOCATE 11,36:PRINT "       ":GOTO 2740
2780 LOCATE 13,13:INPUT "RANGE CHECKING ........ ",RANGE$
2790 IF RANGE$="999" THEN LOCATE 13,36:PRINT "         ":GOTO 2760
2800 I46=0:I36=0:I37=0:I32=1:GOSUB 970:I32=0
2810 RETURN
2820 AT$="000000":CLS
2830 LOCATE 1,21:COLOR 0,15:PRINT " * * *   S O F T M A R K    I N C.  * * *"
2840 LOCATE 3,1:COLOR 15,0:PRINT "OUTPUT FIELD ATTRIBUTES":COLOR 7,0
2850 LOCATE 4,1:PRINT "-------------------------------------------------------------------------------"
2860 IF I49=0 THEN  LOCATE 6,27:PRINT "FIELD NAME ------------>":LOCATE 6,52:COLOR 0,7:PRINT "             ":COLOR 7,0
2870 LOCATE 8,27:COLOR 15,0:PRINT "----- ATTRIBUTES -----":COLOR 7,0
2880 LOCATE 11,27:PRINT "HIGH INTENSITY ----(X)---->":LOCATE 11,57: 'COLOR 0,7:PRINT " ":COLOR 7,0
2890 LOCATE 13,27:PRINT "REVERSE IMAGE -----(X)---->":LOCATE 13,57: 'COLOR 0,7:PRINT " ":COLOR 7,0
2900 LOCATE 15,27:PRINT "BLINK FIELD -------(X)---->":LOCATE 15,57: 'COLOR 0,7:PRINT " ":COLOR 7,0
2910 LOCATE 17,27:PRINT "UNDERLINE ---------(X)---->":LOCATE 17,57: 'COLOR 0,7:PRINT " ":COLOR 7,0
2920 LOCATE 20,1:PRINT " <- - - - - - - - - - - - ATTRIBUTES ARE FOR THIS FIELD - - - - - - - - - - -> "
2930 COLOR 15,0:FOR QQ=1 TO SW:LOCATE 22,QQ:PRINT C$(Y,QQ):NEXT QQ:COLOR 7,0
2940 IF I49=0 THEN LOCATE 6,53:COLOR 0,7:INPUT "",FLNAME$:COLOR 7,0
2950 LOCATE 11,57:COLOR 15,0:INPUT "",SM.FIELD$:COLOR 7,0:AA=1:GOSUB 3050
2960 IF (SM.FIELD$="999") AND (I49=0) THEN LOCATE 11,57:PRINT SPACE$(5):GOTO 2940
2970 IF (SM.FIELD$="999") AND (I49=1) THEN LOCATE 11,57:PRINT SPACE$(5):GOTO 2950
2980 LOCATE 13,57:COLOR 15,0:INPUT "",SM.FIELD$:COLOR 7,0:AA=2:GOSUB 3050
2990 IF SM.FIELD$="999" THEN LOCATE 13,57:PRINT SPACE$(5):GOTO 2950
3000 LOCATE 15,57:COLOR 15,0:INPUT "",SM.FIELD$:COLOR 7,0:AA=3:GOSUB 3050
3010 IF SM.FIELD$="999" THEN LOCATE 15,57:PRINT SPACE$(5):GOTO 2980
3020 LOCATE 17,57:COLOR 15,0:INPUT "",SM.FIELD$:COLOR 7,0:AA=4:GOSUB 3050
3030 IF SM.FIELD$="999" THEN LOCATE 17,57:PRINT SPACE$(5):GOTO 3000
3040 A$=AT$:I29=1:GOSUB 1060:I29=0:FF$=STR$(F):BB$=STR$(B):RETURN
3050 IF SM.FIELD$="X"  THEN MID$(AT$,AA,1)="1"
3060 COLOR 7,0:RETURN
3070 I17=1:WIDTH=SW:GOTO 310:   'CHAIN MERGE "B:ASDA1",145,ALL,DELETE 10-2340
3080 CLS:PRINT "SCREEN ATTRIBUTES ARE NOW BEING SAVED..... ":PRINT:PRINT
3090 PRINT "INSERT DISKETTE TO HOLD SCREEN ATTRIBUTES IN DRIVE --B"
3100 PRINT "PRESS ANY KEY TO CONTINUE......"
3110 ENT$=INKEY$:IF ENT$="" THEN 3110
3120 LOCATE 18,36:COLOR 0,7:PRINT "   STANDBY...   ":COLOR 7,0
3130 MID$(FILENAME$,FLXX+3,4)=".ATT"
3140 OPEN FILENAME$ FOR OUTPUT AS #1
3150 FOR R=1 TO 23:FOR C=1 TO SW:IF (C$(R,C)>CHR$(31)) OR (B$(R,C)>CHR$(31)) THEN PRINT#1,C$(R,C);",";R;",";C;",";B$(R,C);",";STARTLINE;",";CLEARLINES;",";ALARM$;",";SWW;",";FORMAT$
3160 NEXT C:NEXT R
3170 ERASE C$:ERASE B$
3180 CLOSE
3190 MID$(FILENAME$,FLXX+3,4)=".BAS"
3200 IF I100=1 THEN CHAIN FILENAME$,7000,ALL
3210 CLS:BEEP:BEEP:BEEP:COLOR 15,0:PRINT "PROGRAM HAS FINISHED........":CHAIN "A:ASDARUN"
3220 OPEN FILENAME$ FOR INPUT AS #1
3230 INPUT#1,M$,N$,O$,P$,Q$,R$,S$,T$,U$
3240 R=VAL(N$):C=VAL(O$):STARTLINE=VAL(Q$):CLEARLINES=VAL(R$):ALARM$=S$:SWW=VAL(T$)
3250 IF EOF(1) THEN 3270
3260 C$(R,C)=M$:B$(R,C)=P$:GOTO 3230
3270 CLOSE:LOCATE 24,30:PRINT "PRESS ENTER TO CONTINUE.........":RETURN
