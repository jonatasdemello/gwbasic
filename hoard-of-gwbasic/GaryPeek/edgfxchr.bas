100 REM **********************************************************************
110 REM FILE NAME  - EDGFXCHR.BAS
120 REM
130 REM WRITTEN BY - GARY PEEK                         COPYRIGHT (c) 1990
140 REM              3201 HIGHGATE
150 REM              ST. CHARLES, MO.  63301
160 REM              314 946-5272
170 REM
180 REM LAST UPDATE - 02/08/90
190 REM
200 REM DESCRIPTION - EDIT GRAPHICS CHARACTERS THAT MAKE BOXES
210 REM               ^X-EXIT, ^W-WRITE FILE OF 2000 ASCII VALUES
220 REM               ^R-READ FILE, ^A-TOGGLE GRAPHICS CHARACTERS
230 REM
240 REM **********************************************************************
250 REM
260 KEY OFF:FOR A=1 TO 10:KEY A,"":NEXT
270 CLS:COLOR 0,7:PRINT " GRAPHICS EDITOR ":COLOR 7,0:PRINT
280 PRINT "control X - exit"
290 PRINT "control R - read file GFX.DAT"
300 PRINT "control W - write files GFX.DAT and GFX.TXT (LF&CR after each 80 characters)"
310 PRINT "control A - switch from alphanumeric characters to graphics characters"
320 PRINT "            (add 128 to ASCII code)"
330 PRINT "function keys F1-F40 - graphics characters ASCII 1-40"
340 PRINT "                       (some are control characters, EOF, etc.)"
350 PRINT:PRINT "hit any key to continue"
360 IN$=INKEY$:IF IN$="" THEN 360
370 REM
380 CLS:ROW=1:COL=1:OLDROW=1:OLDCOL=1:OLDCHAR=32:CURS=219
390 REM ----- display cursor and look for key hit -----
400 T$=STR$(TIMER):I=INSTR(T$,"."):TT=VAL(MID$(T$,I+1,1))
410 IF TT MOD 2=0 THEN LOCATE ROW,COL:PRINT CHR$(CURS);
420 IF TT MOD 2=1 THEN LOCATE ROW,COL:PRINT CHR$(OLDCHAR);
430 IN$=INKEY$:IF IN$="" THEN 400
440 LEFTASC=ASC(LEFT$(IN$,1)):RIGHTASC=ASC(RIGHT$(IN$,1))
450 REM ----- control character keys -----
460 IF LEFTASC=24 THEN END
470 IF LEFTASC=1 AND GFXFLAG THEN GFXFLAG=0:BEEP:GOTO 400
480 IF LEFTASC=1 AND NOT GFXFLAG THEN GFXFLAG=-1:BEEP:GOTO 400
490 IF LEFTASC=18 THEN BEEP:GOSUB 1310:GOTO 400:REM READ
500 IF LEFTASC=23 THEN BEEP:GOSUB 1430:GOTO 400:REM WRITE
510 REM ----- cursor control keys -----
520 IF LEFTASC=0 AND RIGHTASC=75 THEN GOSUB 770:GOTO 400:REM LEFT
530 IF LEFTASC=0 AND RIGHTASC=77 THEN GOSUB 820:GOTO 400:REM RIGHT
540 IF LEFTASC=0 AND RIGHTASC=72 THEN GOSUB 870:GOTO 400:REM UP
550 IF LEFTASC=0 AND RIGHTASC=80 THEN GOSUB 910:GOTO 400:REM DOWN
560 REM ----- function keys F1-F40 -----
570 IF LEFTASC=0 AND RIGHTASC>=59 AND RIGHTASC<=68 THEN CHAR=RIGHTASC-58:GOTO 730
580 IF LEFTASC=0 AND RIGHTASC>=84 AND RIGHTASC<=113 THEN CHAR=RIGHTASC-73:GOTO 730
590 REM -----
600 IF LEFTASC<>RIGHTASC THEN 650
610 REM ----- regular characters in graphics mode or not -----
620 IF LEFTASC>=0 AND LEFTASC<=127 AND GFXFLAG THEN CHAR=LEFTASC+128:GOTO 730
630 IF LEFTASC>=0 AND LEFTASC<=127 AND NOT GFXFLAG THEN CHAR=LEFTASC:GOTO 730
640 REM ----- alt keys in table -----
650 RESTORE 1020
660 FOR LOOKUP=1 TO 25
670   READ KEYCODE
680   IF LEFTASC=0 AND RIGHTASC=KEYCODE THEN READ CHAR:GOTO 730
690   READ DUMMY
700 NEXT LOOKUP
710 REM ----- all others -----
720 CHAR=LEFTASC
730 LOCATE ROW,COL:PRINT CHR$(CHAR);
740 OLDCHAR=CHAR:GOSUB 820
750 GOTO 400
760 REM ----- LEFT ----
770 GOSUB 950:COL=COL-1
780 IF COL<1 AND ROW>1 THEN COL=80:ROW=ROW-1
790 IF ROW=1 AND COL=0 THEN COL=1
800 GOSUB 970:RETURN
810 REM ----- RIGHT ---
820 GOSUB 950:COL=COL+1
830 IF COL>80 AND ROW<25 THEN COL=1:ROW=ROW+1
840 IF ROW=25 AND COL=81 THEN COL=80
850 GOSUB 970:RETURN
860 REM ----- UP ------
870 GOSUB 950:ROW=ROW-1
880 IF ROW<1 THEN ROW=1
890 GOSUB 970:RETURN
900 REM ----- DOWN ----
910 GOSUB 950:ROW=ROW+1
920 IF ROW>25 THEN ROW=25
930 GOSUB 970:RETURN
940 REM ------------------------
950 OLDROW=ROW:OLDCOL=COL:RETURN
960 REM -------------------
970 SAVCHAR=SCREEN(ROW,COL)
980 LOCATE OLDROW,OLDCOL:PRINT CHR$(OLDCHAR);
990 OLDCHAR=SAVCHAR:RETURN
1000 REM
1010 REM ----- table for single line boxes
1020 DATA 120,196
1030 DATA 121,179
1040 DATA 16,218
1050 DATA 17,194
1060 DATA 18,191
1070 DATA 30,195
1080 DATA 31,197
1090 DATA 32,180
1100 DATA 44,192
1110 DATA 45,193
1120 DATA 46,217
1130 REM ----- table for double line boxes
1140 DATA 123,205
1150 DATA 124,186
1160 DATA 19,201
1170 DATA 20,203
1180 DATA 21,187
1190 DATA 33,204
1200 DATA 34,206
1210 DATA 35,185
1220 DATA 47,200
1230 DATA 48,202
1240 DATA 49,188
1250 REM ----- table for solid boxes
1260 DATA 22,223
1270 DATA 36,219
1280 DATA 50,220
1290 REM
1300 REM ----- READ GFX.DAT -----
1310 OPEN "GFX.DAT" FOR INPUT AS 1
1320 FOR R=1 TO 25
1330   FOR C=1 TO 80
1340     CH$=INPUT$(1,#1)
1350     LOCATE R,C
1360     PRINT CH$;
1370   NEXT C
1380 NEXT R
1390 CLOSE #1
1400 OLDCHAR=SCREEN(ROW,COL)
1410 BEEP:RETURN
1420 REM ----- WRITE GFX.DAT -----
1430 LOCATE ROW,COL:PRINT CHR$(OLDCHAR);
1440 REM -----
1450 OPEN "GFX.DAT" FOR OUTPUT AS 1
1460 FOR R=1 TO 25
1470   FOR C=1 TO 80
1480     CH=SCREEN(R,C)
1490     PRINT #1,CHR$(CH);
1500   NEXT C
1510 NEXT R
1520 CLOSE #1
1530 REM ----- 
1540 OPEN "GFX.TXT" FOR OUTPUT AS 1
1550 FOR R=1 TO 25
1560   FOR C=1 TO 80
1570     CH=SCREEN(R,C)
1580     PRINT #1,CHR$(CH);
1590   NEXT C
1600   PRINT #1,""
1610 NEXT R
1620 CLOSE #1
1630 REM -----
1640 BEEP:RETURN

