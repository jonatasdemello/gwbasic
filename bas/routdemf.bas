100 REM **********************************************************************
110 REM
120 REM FILENAME     ROUTDEMF.BAS
130 REM WRITTEN BY   GARY PEEK
140 REM LAST UPDATE  02/10/93
150 REM
160 REM DESCRIPTION  DEMONSTRATES THE FUNCTIONS OF THE SUBROUTINES
170 REM              THAT ALLOW YOU TO DISPLAY AND SELECT FILES.
180 REM **********************************************************************
190 KEY OFF:FOR A=1 TO 10:KEY A,"":NEXT A
200 BOX=3:GOSUB 8000:REM select display and colors 
210 REM --------------------------------
220 REM display and select files
230 BOX=3:SHADOW=1
240 MSG$="select from a tall list of .BAS files"
250 EXT$="BAS":REM extension of files to select from
260 GOSUB 20000
270 REM -----
280 BOX=1
290 MSG$="select from a wide list of files with the extension BAS"
300 EXT$="BAS":REM extension of files to select from
310 GOSUB 21000
320 LOCATE ,,1:COLOR 7,0:CLS:END
7830 REM *********************************************************************
7835 REM ------------------- DISPLAY AND SELECT COLORS -----------------------
7840 REM
7845 REM This routine will let you select 4 sets of colors to be used in some
7850 REM of the other routines for text, data, field, and shadow areas. If
7855 REM these color variables are not specified with this routine or are
7860 REM not specified elsewhere, the routines that use color will default
7865 REM to WHITE on BLACK for text, HIGH-INTENSITY WHITE on BLACK for data,
7870 REM BLACK on WHITE for fields, and GREY on BLACK for shadows. This will
7875 REM insure that the screen will display something that can be seen.
7880 REM
7885 REM TEXTFORE and TEXTBACK are text foreground and background colors
7890 REM These are the normal display colors
7895 REM DATAFORE and DATABACK are data foreground and background colors
7900 REM These are for data or other special things to highlight
7905 REM FIELDFORE and FIELDBACK are field foreground and background colors
7910 REM These are for fields used in editing or selecting data 
7915 REM SHADOWFORE and SHADOWBACK are shadow foreground and background colors
7920 REM These are for the optional box and shadow colors
7925 REM
7930 REM enter with -
7935 REM    TEXTFORE, TEXTBACK, DATAFORE, DATABACK,
7940 REM    FIELDFORE, FIELDBACK, SHADOWFORE, SHADOWBACK -
7945 REM    colors optionally specified for COLOR statements
7950 REM optional-
7955 REM    BOX=0,1,2,3 - type of outline around screen and example menu/box
7960 REM    0 = no box, 1 = 1 line box, 2 = 2 line box, 3 = solid box
7965 REM    (BOX should be set the same as the other routines that use BOX
7970 REM    in order to best see what the colors will look like.)
7975 REM exit with -
7980 REM    TEXTFORE, TEXTBACK, DATAFORE, DATABACK,
7985 REM    FIELDFORE, FIELDBACK, SHADOWFORE, SHADOWBACK -
7990 REM    BOX=0 (to maintain BOX as optional)
7995 REM
8000 IF TEXTFORE=0 AND TEXTBACK=0 THEN TEXTFORE=7                    :REM 8000
8005 IF DATAFORE=0 AND DATABACK=0 THEN DATAFORE=15
8010 IF FIELDFORE=0 AND FIELDBACK=0 THEN FIELDBACK=7
8015 IF SHADOWFORE=0 AND SHADOWBACK=0 THEN SHADOWFORE=8
8020 DIM COLOUR$(15):RESTORE 8585:REM POINT TO COLOR STRINGS
8025 FOR A%=0 TO 15:READ A$:COLOUR$(A%)=A$:NEXT A%
8030 COLORSET=0:DIM COLOURSET(30,8):RESTORE 8600:REM POINT TO COLOR SETS
8035 FOR A%=0 TO 24:FOR B%=1 TO 8:READ C%:COLOURSET(A%,B%)=C%:NEXT B%:NEXT A%
8040 REM -----
8045 KEY OFF:FOR A%=1 TO 10:KEY A%,"":NEXT A%
8050 LOCATE ,,0:COLOR TEXTFORE,TEXTBACK:CLS
8055 IF BOX=0 THEN TP=0:BT=0:LS=0:RS=0:MS=0:MM=0:UL=0:LL=0:UR=0:LR=0:DN=0:RT=0
8060 IF BOX=1 THEN TP=196:BT=196:LS=195:RS=180:MS=179:MM=196:UL=218:LL=192:UR=191:LR=217:DN=194:RT=195
8065 IF BOX=2 THEN TP=205:BT=205:LS=204:RS=185:MS=186:MM=205:UL=201:LL=200:UR=187:LR=188:DN=203:RT=204
8070 IF BOX=3 THEN TP=223:BT=220:LS=219:RS=219:MS=219:MM=220:UL=219:LL=219:UR=219:LR=219
8075 ROW=1:LOCATE ROW,2:PRINT STRING$(78,CHR$(TP));
8080 ROW=25:LOCATE ROW,2:PRINT STRING$(78,CHR$(BT));
8085 COL=1:FOR ROW%=2 TO 24:LOCATE ROW%,COL:PRINT CHR$(MS);:NEXT ROW%
8090 COL=80:FOR ROW%=2 TO 24:LOCATE ROW%,COL:PRINT CHR$(MS);:NEXT ROW%
8095 LOCATE 1,1:PRINT CHR$(UL);:LOCATE 1,80:PRINT CHR$(UR);
8100 LOCATE 25,1:PRINT CHR$(LL);:LOCATE 25,80:PRINT CHR$(LR);
8105 REM -----
8110 MSG$=" CHANGE DISPLAY COLORS "
8115 ROW=4:COL=41-INT((LEN(MSG$)/2)):LOCATE ROW,COL:PRINT MSG$;
8120 LOCATE 22,3
8125 PRINT "F1=Text Color, F2=Text Background, F3=Highlite Color, F4=Highlite Background";
8130 LOCATE 23,3
8135 PRINT " F5=Field Color, F6=Field Background, F7=Shadow Color, F8=Shadow Background ";
8140 LOCATE 24,3
8145 PRINT "              F9=Preset Color Combinations, F10 or Enter=Exit               ";
8150 REM -----
8155 MAXITEM=4:MAXLEN=20
8160 ROW=11-INT((MAXITEM/2))
8165 COL=39-INT((MAXLEN/2))
8170 LOCATE ROW,COL:COLOR TEXTFORE,TEXTBACK
8175 PRINT CHR$(UL)+STRING$(MAXLEN+2,TP)+CHR$(UR);
8180 LOCATE ROW+1,COL:PRINT CHR$(MS)+" ";
8185 COLOR DATAFORE,DATABACK:PRINT "HIGHLITE/DATA colors";
8190 COLOR TEXTFORE,TEXTBACK:PRINT " "+CHR$(MS);
8195 LOCATE ROW+2,COL:COLOR TEXTFORE,TEXTBACK
8200 PRINT CHR$(LS)+STRING$(MAXLEN+2,MM)+CHR$(RS);
8205 LOCATE ROW+3,COL
8210 PRINT CHR$(MS)+" NORMAL TEXT colors   "+CHR$(MS);
8215 LOCATE ROW+4,COL
8220 PRINT CHR$(MS)+" NORMAL TEXT colors   "+CHR$(MS);
8225 LOCATE ROW+5,COL
8230 PRINT CHR$(MS)+" NORMAL TEXT colors   "+CHR$(MS);
8235 LOCATE ROW+6,COL:PRINT CHR$(MS)+" ";
8240 COLOR FIELDFORE,FIELDBACK:PRINT "FIELD/EDITING colors";
8245 COLOR TEXTFORE,TEXTBACK:PRINT " "+CHR$(MS);
8250 LOCATE ROW+7,COL
8255 PRINT CHR$(LL)+STRING$(MAXLEN+2,BT)+CHR$(LR);
8260 IF BOX=0 THEN 8350
8265 COLOR SHADOWFORE,SHADOWBACK
8270 LOCATE ROW+9,COL+8:PRINT " SHADOW colors ";:
8275 IF BOX=1 OR BOX=2 THEN 8310
8280 LOCATE ROW+8,COL+1:PRINT STRING$(MAXLEN+4,CHR$(TP));
8285 FOR DROW%=ROW+7 TO ROW+1 STEP -1
8290   LOCATE DROW%,COL+MAXLEN+4:PRINT CHR$(MS);
8295 NEXT DROW%
8300 LOCATE ROW,COL+MAXLEN+4:PRINT CHR$(BT);
8305 GOTO 8350
8310 LOCATE ROW+7,COL+2:PRINT CHR$(DN);:LOCATE ROW+8,COL+2:PRINT CHR$(LL);
8315 LOCATE ROW+8,COL+3:PRINT STRING$(MAXLEN+2,CHR$(BT));
8320 LOCATE ROW+8,COL+MAXLEN+5:PRINT CHR$(LR);
8325 FOR DROW%=ROW+6 TO ROW+1 STEP -1
8330   LOCATE DROW%+1,COL+MAXLEN+5:PRINT CHR$(MS);
8335 NEXT DROW%
8340 LOCATE ROW+1,COL+MAXLEN+3:PRINT CHR$(RT);CHR$(TP);CHR$(UR);
8345 REM -----
8350 IN$=INKEY$:IF IN$="" THEN 8350
8355 IF IN$=CHR$(0)+CHR$(59) THEN 8460
8360 IF IN$=CHR$(0)+CHR$(60) THEN 8475
8365 IF IN$=CHR$(0)+CHR$(61) THEN 8490
8370 IF IN$=CHR$(0)+CHR$(62) THEN 8505
8375 IF IN$=CHR$(0)+CHR$(63) THEN 8520
8380 IF IN$=CHR$(0)+CHR$(64) THEN 8535
8385 IF IN$=CHR$(0)+CHR$(65) THEN 8550
8390 IF IN$=CHR$(0)+CHR$(66) THEN 8565
8395 IF IN$=CHR$(0)+CHR$(67) THEN 8425
8400 IF IN$=CHR$(0)+CHR$(68) OR IN$=CHR$(13) THEN 8410
8405 BEEP:GOTO 8350
8410 COLOR TEXTFORE,TEXTBACK:BOX=0
8415 ERASE COLOUR$:ERASE COLOURSET:RETURN
8420 REM -----
8425 CSET=CSET+1:IF CSET>24 THEN CSET=0
8430 TEXTFORE=COLOURSET(CSET,1):TEXTBACK=COLOURSET(CSET,2)
8435 DATAFORE=COLOURSET(CSET,3):DATABACK=COLOURSET(CSET,4)
8440 FIELDFORE=COLOURSET(CSET,5):FIELDBACK=COLOURSET(CSET,6)
8445 SHADOWFORE=COLOURSET(CSET,7):SHADOWBACK=COLOURSET(CSET,8)
8450 IF BOX=1 OR BOX=2 THEN SHADOWFORE=TEXTFORE:SHADOWBACK=TEXTBACK
8455 GOTO 8050
8460 TEXTFORE=TEXTFORE+1:IF TEXTFORE>15 THEN TEXTFORE=0
8465 IF TEXTFORE=TEXTBACK THEN 8460
8470 GOTO 8050
8475 TEXTBACK=TEXTBACK+1:IF TEXTBACK>7 THEN TEXTBACK=0
8480 IF TEXTFORE=TEXTBACK THEN 8475
8485 GOTO 8050
8490 DATAFORE=DATAFORE+1:IF DATAFORE>15 THEN DATAFORE=0
8495 IF DATAFORE=DATABACK THEN 8490
8500 GOTO 8155
8505 DATABACK=DATABACK+1:IF DATABACK>7 THEN DATABACK=0
8510 IF DATAFORE=DATABACK THEN 8505
8515 GOTO 8155
8520 FIELDFORE=FIELDFORE+1:IF FIELDFORE>15 THEN FIELDFORE=0
8525 IF FIELDFORE=FIELDBACK THEN 8520
8530 GOTO 8155
8535 FIELDBACK=FIELDBACK+1:IF FIELDBACK>7 THEN FIELDBACK=0
8540 IF FIELDFORE=FIELDBACK THEN 8535
8545 GOTO 8155
8550 SHADOWFORE=SHADOWFORE+1:IF SHADOWFORE>15 THEN SHADOWFORE=0
8555 IF SHADOWFORE=SHADOWBACK THEN 8550
8560 GOTO 8155
8565 SHADOWBACK=SHADOWBACK+1:IF SHADOWBACK>7 THEN SHADOWBACK=0
8570 IF SHADOWFORE=SHADOWBACK THEN 8565
8575 GOTO 8155
8580 REM ------
8585 DATA "BLACK","BLUE","GREEN","CYAN","RED","MAGENTA","BROWN","WHITE"
8590 DATA "GREY","LIGHT BLUE","LIGHT GREEN","LIGHT CYAN","LIGHT RED"
8595 DATA "LIGHT MAGENTA","YELLOW","HIGH-INTENSITY WHITE"
8600 DATA 7,0,15,0,0,7,8,0
8605 DATA 7,1,15,1,15,4,0,1 
8610 DATA 10,1,11,1,15,2,0,1 
8615 DATA 11,1,14,1,15,4,0,1 
8620 DATA 12,1,11,1,15,0,0,1 
8625 DATA 15,1,12,1,15,5,5,1 
8630 DATA 0,3,15,3,15,0,8,3
8635 DATA 1,3,15,3,15,0,0,3 
8640 DATA 1,3,15,4,15,1,0,3
8645 DATA 10,3,14,5,14,5,5,3 
8650 DATA 14,3,1,3,14,0,0,3 
8655 DATA 15,3,0,3,14,0,0,3 
8660 DATA 0,4,14,4,15,4,14,4 
8665 DATA 15,4,14,4,14,0,14,4
8670 DATA 15,5,15,0,11,1,1,5 
8675 DATA 15,5,15,1,14,0,13,5 
8680 DATA 0,2,11,2,15,4,4,2 
8685 DATA 0,2,11,2,15,0,15,2 
8690 DATA 0,6,14,6,15,0,14,6 
8695 DATA 7,0,8,0,0,3,8,0 
8700 DATA 8,0,12,0,7,4,4,0 
8705 DATA 10,0,11,0,1,3,2,0 
8710 DATA 11,0,12,0,1,3,1,0 
8715 DATA 14,0,14,6,15,6,6,0 
8720 DATA 14,0,5,0,1,3,5,0 
8725 REM
19880 REM ********************************************************************
19885 REM ------------ SELECT A FILE WITH A SPECIFIED EXTENSION --------------
19890 REM Move among names with arrow and page keys and select file with ENTER
19895 REM key, or exit with ESCAPE key. Message is displayed on on row 1. 
19900 REM
19905 REM enter with -
19910 REM    MSG$="message", to display
19915 REM    EXT$="ext", extension of files desired
19920 REM optional-
19925 REM    TEXTFORE, TEXTBACK, DATAFORE, DATABACK
19930 REM    FIELDFORE, FIELDBACK, SHADOWFORE, SHADOWBACK 
19935 REM    colors optionally specified for COLOR statements
19940 REM    BOX=0,1,2,3 - type of box around message and field
19945 REM    0 = no box, 1 = 1 line box, 2 = 2 line box, 3 = solid box
19950 REM optional-
19955 REM    SHADOW=0,1 - type of shadow to include with box
19960 REM    0 = no shadow, 1 = shadow
19965 REM exit with -
19970 REM    FILE$="filename", the filename selected without the extension
19975 REM    ESCAPE TRUE (=-1) if ESCAPE key hit
19980 REM    NUMFILES=number of files found with the specified extension
19985 REM    BOX=0, SHADOW=0 (to maintain as optional)
19990 REM    DOSERROR$="NONE" or "DISK" if an error occurs
19995 REM
20000 IF TEXTFORE=0 AND TEXTBACK=0 THEN TEXTFORE=7                  :REM 20000
20005 IF DATAFORE=0 AND DATABACK=0 THEN DATAFORE=15
20010 IF FIELDFORE=0 AND FIELDBACK=0 THEN FIELDBACK=7
20015 IF SHADOWFORE=0 AND SHADOWBACK=0 THEN SHADOWFORE=8
20020 LOCATE ,,0:COLOR TEXTFORE,TEXTBACK:CLS
20025 SHEL$="DIR *."+EXT$+" | SORT > FILES.TMP":SHELL SHEL$
20030 ON ERROR GOTO 20080
20035 OPEN "FILES.TMP" FOR INPUT AS 1
20040 IF LOF(1)=0 THEN CLOSE #1:GOTO 20050
20045 GOTO 20100
20050 PRINT:PRINT "SORT utility not in DOS path"
20055 SHEL$="DIR *."+EXT$+" > FILES.TMP":SHELL SHEL$
20060 ON ERROR GOTO 20080
20065 OPEN "FILES.TMP" FOR INPUT AS 1
20070 IF LOF(1)=0 THEN CLOSE #1:GOTO 20085
20075 GOTO 20100
20080 RESUME 20085
20085 DOSERROR$="DISK":NUMFILES=0:FILE$=""
20090 ON ERROR GOTO 0:COLOR TEXTFORE,TEXTBACK:RETURN
20095 REM -----
20100 ON ERROR GOTO 0
20105 DOSERROR$="NONE"
20110 DIM FILENAME$(1000):NUMFILES=0
20115 IF EOF(1) THEN 20160
20120 INPUT #1,FILE$
20125 IF MID$(FILE$,9,1)<>" " OR LEFT$(FILE$,1)="." THEN 20115
20130 IF VAL(MID$(FILE$,14,8))=0 THEN 20115
20135 FILENAME$(NUMFILES+1)=LEFT$(FILE$,8)
20140 NUMFILES=NUMFILES+1
20145 IF NUMFILES>1000 THEN 20160
20150 GOTO 20115
20155 REM -----
20160 CLOSE 1:KILL "FILES.TMP"
20165 IF NUMFILES=0 THEN FILE$="":GOTO 20645
20170 ON ERROR GOTO 0
20175 COL=35
20180 REM ----- OUTLINE THE AREA
20185 COLOR TEXTFORE,TEXTBACK:CLS
20190 IF BOX=0 THEN 20340
20195 IF BOX=1 THEN TP=196:BT=196:MS=179:UL=218:LL=192:UR=191:LR=217:DN=194:RT=195
20200 IF BOX=2 THEN TP=205:BT=205:MS=186:UL=201:LL=200:UR=187:LR=188:DN=203:RT=204
20205 IF BOX=3 THEN TP=223:BT=220:MS=219:UL=219:LL=219:UR=219:LR=219
20210 ROW=3:LOCATE ROW,1+COL:PRINT STRING$(10,CHR$(TP));
20215 ROW=23:LOCATE ROW,1+COL:PRINT STRING$(10,CHR$(BT));
20220 DCOL=COL:FOR ROW%=4 TO 22:LOCATE ROW%,DCOL:PRINT CHR$(MS);:NEXT ROW%
20225 DCOL=COL+11:FOR ROW%=4 TO 22:LOCATE ROW%,DCOL:PRINT CHR$(MS);:NEXT ROW%
20230 LOCATE 3,COL:PRINT CHR$(UL);:LOCATE 3,COL+11:PRINT CHR$(UR);
20235 LOCATE 23,COL:PRINT CHR$(LL);:LOCATE 23,COL+11:PRINT CHR$(LR);
20240 IF SHADOW=0 THEN 20340
20245 ROW=4:L=8:COLOR SHADOWFORE,SHADOWBACK
20250 IF BOX<>1 AND BOX<>2 THEN 20315
20255 LOCATE ROW+19,COL+2:PRINT CHR$(DN);:LOCATE ROW+20,COL+2:PRINT CHR$(LL);
20260 LOCATE ROW+20,COL+3:PRINT STRING$(L+2,CHR$(BT));
20265 LOCATE ROW+20,COL+L+5:PRINT CHR$(LR);
20270 FOR DROW%=ROW+19 TO ROW+1 STEP -1
20275   LOCATE DROW%,COL+L+5:PRINT CHR$(MS);
20280 NEXT DROW%
20285 LOCATE ROW,COL+L+3:PRINT CHR$(RT);CHR$(TP);CHR$(UR);
20290 COLOR TEXTFORE,TEXTBACK
20295 FOR DROW%=ROW+1 TO ROW+19
20300   LOCATE DROW%,COL+L+4:PRINT " ";
20305 NEXT DROW%
20310 GOTO 20340
20315 LOCATE ROW+20,COL+1:PRINT STRING$(L+4,CHR$(TP));
20320 FOR DROW%=ROW+19 TO ROW STEP -1
20325   LOCATE DROW%,COL+L+4:PRINT CHR$(MS);
20330 NEXT DROW%
20335 LOCATE ROW-1,COL+L+4:PRINT CHR$(BT);
20340 REM
20345 REM ----- DISPLAY MESSAGE
20350 ROW=1:MCOL=41-INT((LEN(MSG$)/2))
20355 COLOR TEXTFORE,TEXTBACK:LOCATE ROW,MCOL:PRINT MSG$;
20360 ROW=25:MSG$="Use "+CHR$(24)+" and "+CHR$(25)+" to Move, "
20365 MSG$=MSG$+"PgUp and PgDn for More Files, ENTER to Select"
20370 MCOL=41-INT((LEN(MSG$)/2))
20375 LOCATE ROW,MCOL:PRINT MSG$;
20380 REM -----
20385 CURROW=1:OLDROW=CURROW
20390 MAXROW=19:IF NUMFILES<19 THEN MAXROW=NUMFILES
20395 SRTROW=1
20400 REM ----- DISPLAY FILE NAMES
20405 COLOR DATAFORE,DATABACK
20410 FOR DROW%=1 TO MAXROW
20415   LOCATE DROW%+3,COL+2
20420   PRINT FILENAME$(DROW%-1+SRTROW);
20425 NEXT DROW%
20430 REM ----- MOVE THROUGH FILE NAMES AND SELECT ONE
20435 ESCAPE=0:LOCATE ,,0
20440 LOCATE CURROW+3,COL+2
20445 COLOR FIELDFORE,FIELDBACK
20450 PRINT FILENAME$(CURROW-1+SRTROW);
20455 COLOR DATAFORE,DATABACK
20460 LOCATE CURROW+3,COL+2
20465 IN$=INKEY$:IF IN$="" THEN 20465
20470 IF IN$=CHR$(13) THEN 20625
20475 IF IN$=CHR$(27) THEN ESCAPE=-1:FILE$="":GOTO 20645
20480 IF IN$=CHR$(0)+CHR$(72) THEN 20510:REM UP
20485 IF IN$=CHR$(0)+CHR$(80) THEN 20525:REM DOWN
20490 IF IN$=CHR$(0)+CHR$(73) THEN 20540:REM PAGE UP
20495 IF IN$=CHR$(0)+CHR$(81) THEN 20555:REM PAGE DOWN
20500 GOTO 20575
20505 REM -----
20510 IF CURROW>1 THEN OLDROW=CURROW:CURROW=CURROW-1:GOTO 20585
20515 IF SRTROW>1 THEN SRTROW=SRTROW-1:GOTO 20405
20520 GOTO 20575
20525 IF CURROW<MAXROW THEN OLDROW=CURROW:CURROW=CURROW+1:GOTO 20585
20530 IF NUMFILES>MAXROW AND SRTROW<NUMFILES-19 THEN SRTROW=SRTROW+1:GOTO 20405
20535 GOTO 20575
20540 IF SRTROW>18 THEN SRTROW=SRTROW-18:GOTO 20405
20545 IF SRTROW<>1 THEN SRTROW=1:GOTO 20405
20550 GOTO 20575
20555 IF SRTROW+18<NUMFILES-19 THEN SRTROW=SRTROW+18:GOTO 20405
20560 IF SRTROW<NUMFILES-19 THEN SRTROW=NUMFILES-19:GOTO 20405
20565 GOTO 20575
20570 REM ----- BEEP ON ERROR WOULD GO HERE
20575 BEEP:GOTO 20465
20580 REM ----- HIGHLIGHT NEW FILE
20585 LOCATE OLDROW+3,COL+2
20590 COLOR DATAFORE,DATABACK
20595 PRINT FILENAME$(OLDROW-1+SRTROW);
20600 LOCATE CURROW+3,COL+2
20605 COLOR FIELDFORE,FIELDBACK
20610 PRINT FILENAME$(CURROW-1+SRTROW);
20615 GOTO 20465
20620 REM ----- FILE WAS SELECTED
20625 FILE$=FILENAME$(CURROW-1+SRTROW)
20630 REM ----- REMOVE TRAILING SPACES
20635 IF RIGHT$(FILE$,1)=" " THEN FILE$=LEFT$(FILE$,LEN(FILE$)-1):GOTO 20635
20640 REM -----
20645 ERASE FILENAME$
20650 COLOR TEXTFORE,TEXTBACK:BOX=0:SHADOW=0:RETURN
20655 REM
20900 REM ********************************************************************
20905 REM --------- SELECT FROM FILE NAMES OF A SPECIFIED EXTENSION ----------
20910 REM Move among names with arrow keys and select file with ENTER key, or
20915 REM exit with ESCAPE key. Message on row 2, files begin on row 4. Number
20920 REM of files is limited to 133. DOS must have COMMAND.COM in path.
20925 REM
20930 REM enter with -
20935 REM    MSG$="message", to display
20940 REM    EXT$="ext", extension of files desired
20945 REM optional-
20950 REM    TEXTFORE,TEXTBACK,DATAFORE,DATABACK,FIELDFORE,FIELDBACK - 
20955 REM    colors optionally specified for COLOR statements
20960 REM    BOX=0,1,2,3 - type of box around message and field
20965 REM    0 = no box, 1 = 1 line box, 2 = 2 line box, 3 = solid box
20970 REM exit with -
20975 REM    FILE$="filename", the filename without extension
20980 REM    ESCAPE TRUE (=-1) if ESCAPE key hit
20985 REM    NUMFILES=number of files found of the specified extension
20990 REM    BOX=0 (to maintain BOX as optional for other routines)
20995 REM
21000 DIM FILENAME1$(256,7)                                        :REM 21000
21005 SHEL$="DIR *."+EXT$+" > FILES.TMP"
21010 LOCATE ,,0:COLOR TEXTFORE,TEXTBACK:CLS
21015 SHELL SHEL$:REM DOS MUST HAVE COMMAND.COM IN THE PATH
21020 OPEN "FILES.TMP" FOR INPUT AS 1
21025 NUMFILES=0:FROW=1:FCOL=1:MAXROW=1:MAXCOL=1
21030 IF EOF(1) THEN 21100
21035 INPUT #1,FILE$
21040 EXTPOS=INSTR(FILE$," "+EXT$)-1
21045 IF EXTPOS<1 OR LEN(FILE$)=0 THEN 21095
21050 FILE$=LEFT$(FILE$,EXTPOS)
21055 SPCPOS=INSTR(FILE$," ")-1
21060 IF SPCPOS<1 OR LEN(FILE$)=0 THEN 21070
21065 FILE$=LEFT$(FILE$,SPCPOS)
21070 FILENAME1$(FROW,FCOL)=FILE$
21075 NUMFILES=NUMFILES+1
21080 FCOL=FCOL+1
21085 IF FCOL=8 THEN FCOL=1:FROW=FROW+1               :REM NUMBER OF COLUMNS+1
21090 IF FCOL>MAXCOL THEN MAXCOL=FCOL
21095 GOTO 21030
21100 MAXROW=FROW:IF MAXROW=1 THEN MAXCOL=MAXCOL-1
21105 CLOSE 1:KILL "FILES.TMP"
21110 IF NUMFILES=0 THEN FILE$="":GOTO 21445
21115 REM -----
21120 IF TEXTFORE=0 AND TEXTBACK=0 THEN TEXTFORE=7
21125 IF DATAFORE=0 AND DATABACK=0 THEN DATAFORE=15
21130 IF FIELDFORE=0 AND FIELDBACK=0 THEN FIELDBACK=7
21135 IF SHADOWFORE=0 AND SHADOWBACK=0 THEN SHADOWFORE=8
21140 REM ----- OUTLINE THE AREA
21145 KEY OFF:FOR A%=1 TO 10:KEY A%,"":NEXT A%
21150 LOCATE ,,0:COLOR TEXTFORE,TEXTBACK:CLS
21155 IF BOX=0 THEN 21205
21160 IF BOX=1 THEN TP=196:BT=196:MS=179:UL=218:LL=192:UR=191:LR=217
21165 IF BOX=2 THEN TP=205:BT=205:MS=186:UL=201:LL=200:UR=187:LR=188
21170 IF BOX=3 THEN TP=223:BT=220:MS=219:UL=219:LL=219:UR=219:LR=219
21175 ROW=1:LOCATE ROW,2:PRINT STRING$(78,CHR$(TP));
21180 ROW=25:LOCATE ROW,2:PRINT STRING$(78,CHR$(BT));
21185 COL=1:FOR ROW%=2 TO 24:LOCATE ROW%,COL:PRINT CHR$(MS);:NEXT ROW%
21190 COL=80:FOR ROW%=2 TO 24:LOCATE ROW%,COL:PRINT CHR$(MS);:NEXT ROW%
21195 LOCATE 1,1:PRINT CHR$(UL);:LOCATE 1,80:PRINT CHR$(UR);
21200 LOCATE 25,1:PRINT CHR$(LL);:LOCATE 25,80:PRINT CHR$(LR);
21205 BOX=0
21210 REM ----- DISPLAY MESSAGE
21215 ROW=2
21220 COL=41-INT((LEN(MSG$)/2))
21225 LOCATE ROW,COL:PRINT MSG$;
21230 REM ----- DISPLAY FILE NAMES
21235 FILEROW=4:COLOR DATAFORE,DATABACK:REM set colors for DATA
21240 FOR DROW%=1 TO FROW
21245  FOR DCOL%=1 TO MAXCOL
21250   LOCATE DROW%-1+FILEROW,((DCOL%-1)*11)+4            :REM COLUMN SPACING
21255   PRINT FILENAME1$(DROW%,DCOL%)
21260  NEXT DCOL%
21265 NEXT DROW%
21270 REM ----- MOVE THROUGH FILE NAMES AND SELECT ONE
21275 ESCAPE=0:LOCATE ,,0:FROW=1:FCOL=1:OLDFROW=FROW:OLDFCOL=FCOL
21280 LOCATE FROW-1+FILEROW,FCOL+3                         :REM COLUMN SPACING
21285 COLOR FIELDFORE,FIELDBACK:REM set colors for FIELD
21290 PRINT FILENAME1$(FROW,FCOL)
21295 COLOR DATAFORE,DATABACK:REM set colors for DATA
21300 LOCATE FROW-1+FILEROW,FCOL+4
21305 IN$=INKEY$:IF IN$="" THEN 21305
21310 IF IN$=CHR$(13) THEN 21440
21315 IF IN$=CHR$(27) THEN ESCAPE=-1:FILE$="":GOTO 21445
21320 IF IN$=CHR$(0)+CHR$(75) THEN 21355:REM LEFT
21325 IF IN$=CHR$(0)+CHR$(77) THEN 21365:REM RIGHT
21330 IF IN$=CHR$(0)+CHR$(72) THEN 21375:REM UP
21335 IF IN$=CHR$(0)+CHR$(80) THEN 21385:REM DOWN
21340 REM ----- BEEP ON ERROR
21345 BEEP:GOTO 21305
21350 REM
21355 IF FCOL>1 THEN OLDFROW=FROW:OLDFCOL=FCOL:FCOL=FCOL-1
21360 GOTO 21395
21365 IF FCOL<MAXCOL THEN OLDFROW=FROW:OLDFCOL=FCOL:FCOL=FCOL+1
21370 GOTO 21395
21375 IF FROW>1 THEN OLDFROW=FROW:OLDFCOL=FCOL:FROW=FROW-1
21380 GOTO 21395
21385 IF FROW<MAXROW THEN OLDFROW=FROW:OLDFCOL=FCOL:FROW=FROW+1
21390 GOTO 21395
21395 IF FILENAME1$(FROW,FCOL)<>"" THEN 21405
21400 FROW=OLDFROW:FCOL=OLDFCOL
21405 LOCATE OLDFROW-1+FILEROW,((OLDFCOL-1)*11)+4          :REM COLUMN SPACING
21410 PRINT FILENAME1$(OLDFROW,OLDFCOL)
21415 LOCATE FROW-1+FILEROW,((FCOL-1)*11)+4                :REM COLUMN SPACING
21420 COLOR FIELDFORE,FIELDBACK:REM set colors for FIELD
21425 PRINT FILENAME1$(FROW,FCOL)
21430 COLOR DATAFORE,DATABACK:REM set colors for DATA
21435 GOTO 21305
21440 FILE$=FILENAME1$(FROW,FCOL)
21445 ERASE FILENAME1$
21450 COLOR TEXTFORE,TEXTBACK:RETURN
21455 REM
21460 REM
