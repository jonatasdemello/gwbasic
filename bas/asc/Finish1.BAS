10 ' Program "finish" with 8 fonts, diskette version, saved 820603.2320
20 DEFINT A-Z
30 DIM K(50), KEYS$(20)
35 SCREEN 0,,1,1: KEY OFF: CLS
40 SCREEN 0,,0,1: CLS: KEY OFF: LOCATE 23,1
50 RESTORE: GOSUB 2410: GOSUB 2590  'Set F-keys
60 DATA Lt,Rt,"17","10",Pr,Pl,Ju,Ra,Do,Si,Fi,He,Re," B",END
65 GOSUB 4000' Give an intro on the screen.
70 GOSUB 2540  'Get runtime parameters.
80 IF R.MGN.RUN>(((18-CPI)/3*.65)+1)*80 THEN PRINT"cpi & right margin clash": GOTO 70
90 IF R.MGN.RUN-L.MGN.RUN-9<LEN(HEADER$) THEN PRINT "Header won't fit between margins": GOTO 70
100 'DATA statements define system commands.
110 '
120 'Margin control --
130 DATA .tm#:' Set # of blank lines at top of page.     Default =  0
140 DATA .bm#:' Set # of blank lines at bottom of page.  Default = 12
150 DATA .lm#:' Move left margin (+ = rightward)         Default =  0
160 DATA .rm#:' Move right margin (- = leftward)         Default =  0
170 DATA .pl#:' Set # of lines per page.                 Default = 66
180 DATA .ma#:' Adjust both margins in (+) or out (-)#.  Default =  0
190 DATA .ov#:' Move all text over # columns.            Default =  0
200 'Formatting --
210 DATA .bl#:' Insert # blank lines.
220 DATA .in#:' Indent # columns.                        Default =  0
230 DATA .jl:'  Justify left margin only. (This is the default condition.)
240 DATA .jr:'  Justify right margin only.
250 DATA .jb:'  Justify both margins.
260 DATA .ls#:' Line spacing #. 1=single (default), 2=double, etc.
270 DATA .ce:'  Center the following line, up to next C/R.
280 DATA .fi:'  Fill each line as much as possible.  (Default)
290 DATA .nf:'  No filling. Print line essentially as entered.
300 'Printer font selection for the IBM printer (Epson MX-80) --
310 '  P     |  #=1 for normal, single-width, single-strike, unemphasized.
320 '  R  F  |    2 for   "           "             "        emphasized.
330 '  I  O  |    3 for   "           "       double-strike, emphasized.
340 '  N  N -|    4 for compressed, single-width, single-strike.
350 '  T  T  |    5 for     "       double-width,       "
360 '  E  S  |    6 for     "             "       double-strike.
370 '  R     |    7 for normal, double-width, single-strike, emphasized.
380 '        |    8 for   "           "       double-strike,     "     .
390 '           Default mode is runtime choice, also invoked by #=0.
400 '           Runtime "plain" font corresponds to #=1, "pretty" to #=2.
410 '           Only fonts 1-3 show proper line layout on the video screen.
420 '
430 DATA .pf#:' Select printer font (for full line only).
440 'Carriage control --
450 DATA .pa#:' Start new page, numbered #. If no #, use old# + 1.
460 DATA .wt:'  Wait for paper alignment at top of following page(s).
470 DATA .tp#:' Test page; if <# lines remain, force a .pa command.
480 DATA .hd:'  Use the following line (to C/R) as header on following page(s).
490 '
500 DATA END:' of command definitions
510 'Put the above commands into a testable string.
520 COMMAND$=".##"
530 FOR I = 0 TO 50
540 READ ZZ$: COMMAND$ = COMMAND$+LEFT$(ZZ$,3): IF ZZ$<>"END" THEN NEXT
550 'Request insertion-strings for runtime substitution at $# points.
560 PRINT"    Enter text to be inserted at each occurrence of $# place marker.
570 PRINT"A plain carriage-return will get you out of this sequence when you're done."
580 PRINT:PRINT"$#   Text to be substituted"
590 FOR I = 0 TO 9
600 PRINT I;:LINE INPUT IS$(I): IF IS$(I)<>"" THEN NEXT
610 'Get diskette ready for reading the text file.
620 FLNM$=FLNM$+".bas"
630 OPEN FLNM$ FOR INPUT AS #1
640 'Open the screen or printer as the output device.
650 PRINT:PRINT"Output to screen (s) or to printer (p)?"
660 GOSUB 2400
670 IF ZZ$<>"p" GOTO 730
680 WIDTH "lpt1:",132
690 MX.COMP=CPI: MX.EMPH=FONT: MX.WID=20: MX.STRK=72
700 ON ERROR GOTO 2980
710 LPRINT CHR$(24);: IF CPI=18 THEN LPRINT CHR$(27);CHR$(FONT); ELSE LPRINT CHR$(27);CHR$(70);CHR$(15);
720 ON ERROR GOTO 0
730 IF ZZ$="p" THEN OU$="lpt1:": LPRINT ELSE OU$="scrn:"
740 OPEN OU$ FOR OUTPUT AS #2
750 'Allow printing of partial document.
760 P.LAST.PG=3000: INPUT"Begin actual printing at what page (C/R for whole document)";P.1ST.PG
770 IF P.1ST.PG<>0 THEN PRINT"Stop printing after what page (C/R for everything from page";P.1ST.PG;"on)";:INPUT P.LAST.PG: IF P.LAST.PG=0 THEN P.LAST.PG=3000
780 'Set initial conditions to default values as listed above.
790 T.MGN=0: B.MGN=12: L.MGN=L.MGN.RUN: R.MGN=R.MGN.RUN: M.ADJ=0: M.OVR=0
800 PG.LEN=66: PG.NUM=1: WAIT.TOP=0: N.INDENT=0: FILL=0
810 CPI16.5!=1.7
820 'Do initial housekeeping.
830 TAPE$="": BUFF$="": FMAT$=""
840 GOSUB 2350: K7=0: U1=0: LN.CNT=0: NEW.PAGE=0
850 'Get the next string of text from the diskette.
860 'Exit if END-OF-FILE; else strip line number and apostrophe.
870 IF EOF(1) THEN GOSUB 1790: GOTO 2240
880 LINE INPUT #1, TAPE$: IF TAPE$="" GOTO 870
890 Z=INSTR(TAPE$,"'"): IF Z<>0 THEN Z$=LEFT$(TAPE$,Z-1) ELSE BEEP: Z=4
900 TAPE$=MID$(TAPE$,Z+1)
910 'Replace tabs with 8 spaces.
920 I=INSTR(TAPE$,CHR$(9)): IF I=0 GOTO 960
930 MID$(TAPE$,I,1)=" "
940 TAPE$=LEFT$(TAPE$,I)+SPACE$(7 - (I-1) MOD 8)+MID$(TAPE$,I+1): GOTO 920
950 'Substitute IS$(#) for corresponding $# in text.
960 I=INSTR(TAPE$,"$#"): IF I=0 GOTO 1000
970 TAPE$=LEFT$(TAPE$,I-1)+IS$(VAL(MID$(TAPE$,I+2)))+MID$(TAPE$,I+3)
980 GOTO 960
990 'Check for command at start of TAPE$ and process if found.
1000 IF LEFT$(TAPE$,1)="." GOTO 1860
1010 'Print unprocessed text if no-fill mode.
1020 IF FILL THEN FMAT$=TAPE$: GOSUB 1650: GOTO 870
1030 'Append TAPE$ to BUFF$ (or as much of TAPE$ as will fit....)
1040 IF LEN(BUFF$)+LEN(TAPE$)<=255 GOTO 1070
1050 VOL=240-LEN(BUFF$): BUFF$=BUFF$+LEFT$(TAPE$,VOL)
1060 TAPE$=MID$(TAPE$,VOL+1): GOTO 1100
1070 IF RIGHT$(BUFF$,1)<>" " AND RIGHT$(BUFF$,1)<>"-" THEN BUFF$=BUFF$+" "
1080 BUFF$=BUFF$+TAPE$: TAPE$=""
1090 'Fill FMAT$ from BUFF$.
1100 IF LEFT$(BUFF$,1)=" " THEN BUFF$=MID$(BUFF$,2): GOTO 1100
1110 GOSUB 2350
1120 IF LEN(BUFF$)<LN.LEN THEN IF LEN(TAPE$) GOTO 1080 ELSE GOTO 870
1130 GOSUB 1350: IF LN.LEN=LEN(FMAT$) THEN GOSUB 1760: JFY=0: GOSUB 1650: GOSUB 1770: GOTO 1110
1140 'Justify FMAT$.
1150 K1=1: IF N.INDENT=>0 GOTO 1170
1160 LN.LEN=LN.LEN+N.INDENT: L$=LEFT$(FMAT$,-N.INDENT): FMAT$=MID$(FMAT$,1-N.INDENT)
1170 IF JFY<2 GOTO 1300
1180 N.BLKS=LN.LEN-LEN(FMAT$): K=-1
1190 IF K1 THEN K=K+1: K1=INSTR(K1+1,FMAT$," "): K(K)=K1: GOTO 1190
1200 N.SPCS=N.BLKS\K: KF=N.BLKS-N.SPCS*K
1210 IF K7=0 OR K=1 OR K=N.BLKS OR KF<1 THEN K7=1: K0=1: KF=K-KF: GOTO 1230
1220 K7=0: K0=-1: N.SPCS=N.SPCS+1
1230 J.FMAT$="": K1=1
1240 FOR I = 0 TO K-1
1250 J.FMAT$=J.FMAT$+MID$(FMAT$,K1,K(I)-K1)+SPACE$(N.SPCS)
1260 KF=KF-1: K1=K(I)
1270 IF KF=0 THEN N.SPCS=N.SPCS+K0
1280 NEXT
1290 FMAT$=J.FMAT$+MID$(FMAT$,K(K-1))
1300 IF N.INDENT<0 THEN LN.LEN=LN.LEN-N.INDENT: FMAT$=L$+FMAT$
1310 IF JFY<>1 GOTO 1330 ELSE L=LN.LEN-LEN(FMAT$)
1320 FMAT$=SPACE$(L)+FMAT$
1330 GOSUB 1650: GOTO 1110
1340 'Subroutine to fill FMAT$.
1350 IF LN.LEN>LEN(BUFF$) THEN FMAT$=BUFF$: BUFF$="": RETURN
1360 FOR I = LN.LEN+1 TO 2 STEP -1
1370 IF MID$(BUFF$,I,1)=" " THEN IF MID$(BUFF$,I-1,1)<>" " GOTO 1420
1380 IF MID$(BUFF$,I,1)="-" THEN IF I<=LN.LEN THEN FMAT$=LEFT$(BUFF$,I):BUFF$=MID$(BUFF$,I+1): RETURN
1390 NEXT
1400 BEEP: PRINT: PRINT"line "Z$" longer than"LN.LEN"spaces:"
1410 PRINT BUFF$: STOP
1420 FMAT$=LEFT$(BUFF$,I-1): BUFF$=MID$(BUFF$,I+1)
1430 IF MID$(BUFF$,1,1)=" " THEN BUFF$=MID$(BUFF$,2): GOTO 1430
1440 RETURN
1450 'Subroutine for top-of-form and Header.
1460 T.MX.COMP=MX.COMP: T.MX.EMPH=MX.EMPH: T.MX.WID=MX.WID: T.MX.STRK=MX.STRK: MX.COMP=CPI: MX.EMPH=FONT: MX.WID=20: MX.STRK=72: T.LN.LEN=LN.LEN: T.M.ADJ=M.ADJ
1470 T.L.MGN=L.MGN: T.R.MGN=R.MGN: T.N.INDENT=N.INDENT: L.MGN=L.MGN.RUN: R.MGN=R.MGN.RUN: N.INDENT=0: M.ADJ=0: GOSUB 2350: IF LN.CNT=T.MGN+1 GOTO 1510
1480 IF PG.NUM=>P.1ST.PG THEN PRINT #2, CHR$(12): FOR LN.CNT=0 TO T.MGN: PRINT #2,: NEXT
1490 PG.NUM=PG.NUM+1: IF PG.NUM>P.LAST.PG GOTO 2240
1500 IF WAIT.TOP THEN BEEP: LINE INPUT"Align paper then hit C/R...";ZZ$
1510 LN.CNT=T.MGN+1: NEW.PAGE=1
1520 IF HEADER$="" GOTO 1590
1530 IF LN.LEN-10<LEN(HEADER$) THEN FMAT$="": GOTO 1550
1540 FMAT$=SPACE$(LN.LEN-(LEN(HEADER$)+10))
1550 FMAT$=FMAT$+HEADER$+", page"+STR$(PG.NUM)
1560 IF PG.NUM=>P.1ST.PG THEN IF OU$="lpt1:" THEN PRINT #2, CHR$(MX.COMP); CHR$(MX.WID); CHR$(27); CHR$(MX.EMPH); CHR$(27); CHR$(MX.STRK); TAB(L.MGN+M.OVR+2); FMAT$ ELSE PRINT #2, TAB(L.MGN+M.OVR); FMAT$
1570 FOR LN.CNT=LN.CNT TO LN.SPA*(LN.CNT+2): IF PG.NUM=>P.1ST.PG THEN PRINT #2,
1580 NEXT
1590 MX.COMP=T.MX.COMP: MX.EMPH=T.MX.EMPH: MX.WID=T.MX.WID: MX.STRK=T.MX.STRK: LN.LEN=T.LN.LEN
1600 L.MGN=T.L.MGN: R.MGN=T.R.MGN: N.INDENT=T.N.INDENT: M.ADJ=T.M.ADJ: RETURN
1610 'Subroutine to print a line on the output device.
1620 'The left margin is adjusted automatically to compensate for font.
1630 'Note that a bug in the MX-80 counts 2 unprintable control characters
1640 '  as printable when executing tabs, thus requiring the "+2" in TAB.DIST.
1650 IF LN.CNT>PG.LEN-B.MGN THEN T.FMAT$=FMAT$: T.BUFF$=BUFF$: GOSUB 1460: BUFF$=T.BUFF$: FMAT$=T.FMAT$
1660 TAB.DIST!=L.MGN+M.OVR+M.ADJ
1670 IF MX.COMP=15 THEN TAB.DIST!=TAB.DIST!*CPI16.5!
1680 IF MX.WID=14 THEN TAB.DIST!=TAB.DIST!/2
1690 TAB.DIST=(TAB.DIST!)+2+N.INDENT
1700 IF PG.NUM=>P.1ST.PG THEN IF OU$="lpt1:" THEN PRINT #2, CHR$(MX.COMP); CHR$(27); CHR$(MX.STRK); CHR$(27); CHR$(MX.EMPH); CHR$(MX.WID); TAB(TAB.DIST); FMAT$ ELSE PRINT #2, TAB(TAB.DIST-2); FMAT$
1710 N.INDENT=0: LN.CNT=LN.CNT+1
1720 FOR B2 = 1 TO LN.SPA-1: IF PG.NUM => P.1ST.PG THEN PRINT #2,
1730 LN.CNT=LN.CNT+1: NEXT
1740 FMAT$="": NEW.PAGE=0: RETURN
1750 'Subroutine to push and pop JFY.
1760 U1=U1+1: JFY(U1)=JFY: RETURN
1770 JFY=JFY(U1): U1=U1-1: RETURN
1780 'Subroutine to run out BUFF$.
1790 IF BUFF$="" THEN RETURN
1800 FMAT$=BUFF$: BUFF$=""
1810 IF JFY=1 THEN FMAT$=SPACE$(LN.LEN-LEN(FMAT$))+FMAT$
1820 GOSUB 1760: JFY=0
1830 IF LN.CNT+LN.SPA<PG.LEN THEN GOSUB 1660 ELSE GOSUB 1650
1840 GOSUB 1770: RETURN
1850 'Command handler.
1860 'IF MID$(TAPE$,2,2)<>"pf" THEN GOSUB 1710
1870 GOSUB 1790
1880 C.INDEX=INSTR(COMMAND$,LEFT$(TAPE$,3))\3
1890 '               .tm  .bm  .lm  .rm  .pl  .ma  .ov  .bl  .in  .jl  .jr  .jb  .ls  .ce  .fi  .nf  .pf  .pa  .wt  .tp  .hd
1900 ON C.INDEX GOTO 1920,1930,1940,1950,1960,1970,1980,1990,2040,2060,2070,2080,2090,2100,2180,2190,3010,2130,2150,2160,2120
1910 BEEP: PRINT: COLOR 0,7: PRINT"Bad command: ";LEFT$(TAPE$,3);" on line ";Z$;: COLOR 7,0: PRINT: GOTO 2200
1920 T.MGN=VAL(MID$(TAPE$,4)): GOTO 2200            'Top margin (.tm)
1930 B.MGN=VAL(MID$(TAPE$,4)): GOTO 2200            'Bottom margin (.bm)
1940 L.MGN=VAL(MID$(TAPE$,4))+L.MGN.RUN: GOTO 2200  'Left margin (.lm)
1950 R.MGN=VAL(MID$(TAPE$,4))+R.MGN.RUN: GOTO 2200  'Right margin (.rm)
1960 PG.LEN=VAL(MID$(TAPE$,4)): GOTO 2200           'Page length (.pl)
1970 M.ADJ=VAL(MID$(TAPE$,4)): GOTO 2200            'Margin adjust (.ma)
1980 M.OVR=VAL(MID$(TAPE$,4)): GOTO 2200            'Margin over (.ov)
1990 IF NEW.PAGE=1 THEN NEW.PAGE=0: GOTO 2200       'Blank line(s) (.bl)
2000 B.LNS=VAL(MID$(TAPE$,4))*LN.SPA
2010 IF B.LNS=0 THEN B.LNS=LN.SPA
2020 FOR Q = 1 TO B.LNS: IF PG.NUM=>P.1ST.PG THEN PRINT #2,
2030 LN.CNT=LN.CNT+1: IF LN.CNT=PG.LEN GOTO 2140 ELSE NEXT: GOTO 2200
2040 N.INDENT=VAL(MID$(TAPE$,4))                    'Indent (.it)
2050 LN.LEN = LN.LEN-N.INDENT: GOTO 2200
2060 JFY=0: GOTO 2200                               'Justify left (.jl)
2070 JFY=1: GOTO 2200                               'Justify right (.jr)
2080 JFY=2: GOTO 2200                               'Justify both (.jb)
2090 LN.SPA=VAL(MID$(TAPE$,4)): GOTO 2200           'Line spacing (.ls)
2100 GOSUB 2350: FMAT$=SPACE$((LN.LEN-LEN(MID$(TAPE$,4)))/2)+MID$(TAPE$,4)  'Center
2110 GOSUB 1760: JFY=0: GOSUB 1650: GOSUB 1770: GOTO 2220           ' (.ce)
2120 HEADER$=MID$(TAPE$,4): GOTO 2220               'Header (.hd)
2130 T.PG.NUM=VAL(MID$(TAPE$,4)): IF T.PG.NUM THEN PG.NUM=T.PG.NUM-1  'Page
2140 GOSUB 1460: NEW.PAGE=0: GOTO 2200 '                               (.pa)
2150 WAIT.TOP=-1: GOTO 2200                          'Wait at page top (.wt)
2160 IF LN.CNT>PG.LEN-B.MGN-VAL(MID$(TAPE$,4))*LN.SPA THEN GOSUB 1460  'Test page
2170 GOTO 2200 '                                                    (.tp)
2180 FILL=0: GOTO 2200'                               Fill line (.fi)
2190 FILL=-1: GOTO 2200'                              No filling (.nf)
2200 C.INDEX=INSTR(2,TAPE$,".")
2210 IF C.INDEX<>0 THEN TAPE$=MID$(TAPE$,C.INDEX): GOTO 1880
2220 BUFF$="": GOTO 870
2230 ' Job done. Ask about repeat.
2240 ZZ$=STRING$(30,"*"):PRINT:BEEP:PRINT ZZ$" END OF PROCESSING "ZZ$:PRINT
2250 CLOSE: IF OU$="lpt1:" THEN LPRINT CHR$(27);"F"
2260 PRINT "Do you want to rerun with the same text insertions?";
2270 GOSUB 2400
2280 IF LEFT$(ZZ$,1)<>"y" THEN KEY OFF ELSE GOTO 630
2290 ' Graceful exit.
2300 CLS: WIDTH "lpt1:",80: CHAIN "labels.bas"
2340 'Compute line length, compensating for font size.
2350 LN.LEN!=R.MGN-L.MGN-2*M.ADJ+1
2360 IF MX.COMP=15 THEN LN.LEN!=LN.LEN!*CPI16.5!
2370 IF MX.WID=14 THEN LN.LEN!=LN.LEN!/2
2380 LN.LEN=LN.LEN!-N.INDENT: RETURN
2390 'Await striking of a key.
2400 ZZ$=INKEY$: IF ZZ$="" GOTO 2400 ELSE RETURN
2410 ' Subr to set initial F-keys & defaults.
2420 KEY 1,"Lt margin at: ": L.MGN.RUN=3
2430 KEY 2,"Rt margin at: ": R.MGN.RUN=72
2440 KEY 3,"17 cpi"+CHR$(13): CPI=18
2450 KEY 4,"Plain font"+CHR$(13): FONT=69
2460 KEY 5,"Justified edge"+CHR$(13): JFY=0
2470 KEY 6,"Double-spaced"+CHR$(13): LN.SPA=1
2480 KEY 7,"File  name: ": FLNM$=""
2490 KEY 8,"Header: ": HEADER$=""
2500 KEY 9,"Review"+CHR$(13)
2510 KEY 10," Begin"
2520 DEF SEG: POKE 106,0
2530 KEY ON: RETURN
2540 ' Subr to select & implement F-key.
2550 DEF SEG: POKE 106,0: LINE INPUT FKEY$
2560 FOR I=1 TO N.KEYS: IF LEFT$(FKEY$,2)=KEYS$(I-1) GOTO 2570 ELSE NEXT: GOTO 2550
2570 ON I GOTO 2620,2640,2670,2680,2700,2710,2730,2740,2760,2770,2790,2810,2830,2580
2580 IF FLNM$="" THEN BEEP: PRINT "I can't begin; you forgot to give me a file name....": GOTO 2550 ELSE RETURN  '(key 10)
2590 ' Subr to set up array of F-key codes.
2600 FOR N.KEYS=1 TO 20: READ KEYS$(N.KEYS-1): IF KEYS$(N.KEYS-1)<>"END" THEN NEXT ELSE RETURN
2610 ' Set a margin, unless C/R without an entry>0. (Keys 1&2).
2620 VOL=VAL(MID$(FKEY$,15)): IF VOL>0 THEN L.MGN.RUN=VOL
2630 GOTO 2550
2640 VOL=VAL(MID$(FKEY$,15)): IF VOL>0 THEN R.MGN.RUN=VOL
2650 GOTO 2550
2660 ' Toggle between 16.5 & 10 characters per inch. (Key 3).
2670 CPI=15: KEY 3,"10 cpi"+CHR$(13): IF FONT=69 THEN PRINT "Plain font forced";: GOSUB 5000
2675 GOTO 2710
2680 CPI=18: KEY 3,"17 cpi"+CHR$(13): GOTO 2550
2690 ' Toggle between normal & emphasized font. (Key 4).
2700 FONT=69: KEY 4,"Plain font"+CHR$(13): IF CPI=15 THEN PRINT "10 cpi forced";: GOSUB 5000
2705 GOTO 2680
2710 FONT=70: KEY 4,"Pretty font"+CHR$(13): GOTO 2550
2720 ' Toggle between justified & ragged right edge. (Key 5).
2730 JFY=2: KEY 5,"Ragged edge"+CHR$(13): GOTO 2550
2740 JFY=0: KEY 5,"Justified edge"+CHR$(13): GOTO 2550
2750 ' Toggle between single- & double-spacing. (Key 6).
2760 LN.SPA=2: KEY 6,"Single-spaced"+CHR$(13): GOTO 2550
2770 LN.SPA=1: KEY 6,"Double-spaced"+CHR$(13): GOTO 2550
2780 ' Set cassette file name. (Key 7).
2790 FLNM$=MID$(FKEY$,13): GOTO 2550
2800 ' Set header. (Key 8).
2810 HEADER$=MID$(FKEY$,9): GOTO 2550
2820 ' Review the present settings. (Key 9).
2830 PRINT: PRINT"Left margin at";L.MGN.RUN
2840 PRINT"Right margin at";R.MGN.RUN
2850 IF CPI=15 THEN PRINT"17"; ELSE PRINT "10";
2860 PRINT" characters per inch"
2870 IF FONT=69 THEN PRINT"Pretty font" ELSE PRINT"Plain font"
2880 IF JFY=2 THEN PRINT"Justified"; ELSE PRINT"Ragged";
2890 PRINT" right edge"
2900 IF LN.SPA=2 THEN PRINT"Double-"; ELSE PRINT "Single-";
2910 PRINT"spaced lines"
2920 PRINT"File name: ";
2930 IF FLNM$="" THEN BEEP: COLOR 0,7: PRINT " Don't begin until you specify a file name! ";: COLOR 7,0: PRINT ELSE PRINT FLNM$+".bas"
2940 PRINT"Header: ";
2950 IF HEADER$="" THEN PRINT"UNSPECIFIED; neither header nor page # will be printed." ELSE PRINT HEADER$
2960 PRINT: GOTO 2550
2970 ' Alert the operator to an off-line printer.
2980 BEEP: PRINT: PRINT"Printer is off-line; hit ON LINE button."
2990 RESUME 710
3000 'Implement choice of printer font.
3010 ON VAL(MID$(TAPE$,4))+1 GOTO 3030,3040,3050,3060,3070,3080,3090,3100,3110
3020 BEEP: PRINT"Bad font-selection code. Current code survives.": GOTO 2200
3030 MX.COMP=CPI: MX.EMPH=FONT: MX.WID=20: MX.STRK=72: GOTO 2200 'Runtime font
3040 MX.COMP=18: MX.EMPH=70: MX.WID=20: MX.STRK=72: GOTO 2200    'Font 1
3050 MX.COMP=18: MX.EMPH=69: MX.WID=20: MX.STRK=72: GOTO 2200    'Font 2
3060 MX.COMP=18: MX.EMPH=69: MX.WID=20: MX.STRK=71: GOTO 2200    'Font 3
3070 MX.COMP=15: MX.EMPH=70: MX.WID=20: MX.STRK=72: GOTO 2200    'Font 4
3080 MX.COMP=15: MX.EMPH=70: MX.WID=14: MX.STRK=72: GOTO 2200    'Font 5
3090 MX.COMP=15: MX.EMPH=70: MX.WID=14: MX.STRK=71: GOTO 2200    'Font 6
3100 MX.COMP=18: MX.EMPH=69: MX.WID=14: MX.STRK=72: GOTO 2200    'Font 7
3110 MX.COMP=18: MX.EMPH=69: MX.WID=14: MX.STRK=71: GOTO 2200    'Font 8
4000 ' This is the screen of introductory remarks.
4010 LINE.1=1: LOCATE LINE.1,1
4020 PRINT TAB(35);"FINISH"
4030 PRINT TAB(16);"A text-formatting program by Paul F. Doering"
4040 PRINT: PRINT "Use the 10 function keys according to their labels to specify the runtime"
4041 PRINT "parameters."
4050 PRINT: PRINT "Notice that keys F3, F4, F5, and F6 are toggles. If you hit F6, for example,"
4060 PRINT "it will select double-spaced lines; but hitting it again will revert back to"
4070 PRINT "single spacing. The label always shows what will happen the next time you hit"
4080 PRINT "the key. It does NOT show the currently selected parameter."
4090 PRINT: PRINT "To see where things stand at any given moment, hit F9, the Review key."
4100 PRINT: PRINT "Keys F1, F2, F7, and F8 require an argument and a carriage return."
4110 PRINT "Key F10 requires a carriage return also, and the key will be ignored if you"
4120 PRINT "haven't indicated a name for the text file yet.
4130 PRINT: PRINT"Finish only works on files stored on the diskette by a SAVE command in which"
4140 PRINT "the    ,a     option was invoked; that is, it will only handle a file saved"
4150 PRINT "as an ASCII-format BASIC program."
4160 PRINT: PRINT "When specifying a file after hitting key F7, give only the file name."
4170 PRINT "Do NOT give the   .bas   extension.
4180 SCREEN 0,,0,0: RETURN
5000 PRINT ", because the pretty font is only available at 10 cpi.": RETURN
