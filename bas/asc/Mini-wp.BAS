100 ' WORDMERG.BAS                                           VERSION 2.0
110 '
120 ' ******************************************************************
130 ' ******************************************************************
140 '
150 ' MINI WORD PROCESSOR-MAIL MERGE
160 '
170 ' WILLIAM HT BAILEY                                      AUGUST 1982
180 '
190 ' ******************************************************************
200 '
210 '          ---------- LIST OF VARIABLES -----------
220 '
230 ' A$     : Operator's response to a cue.
235 ' B$     : Set of valid character responses.
250 ' BEGIN% : First line of a list operation.
260 ' E%     : Last line of a list operation.
265 ' F$     : Name of user's text file.
270 ' FLAG1$ : Indicator of cassette or disk storage.
280 ' FLAG2$ : Indicator of normal or enhanced printing.
290 ' FLAG3% : End of file flag.
310 ' I%     : Indexing variable.
320 ' J%     : Indexing variable.
330 ' K%     : Indexing variable.
340 ' L%     : Indexing variable.
345 ' M$     : Name of auxillary file.
347 ' MB$    : Modify line buffer.
350 ' NEWLN$ : File buffer. Holds the modified file during editing.
360 ' OLDLN$ : File buffer. Holds the original file during editing.
365 ' P%     : Cursor position
370 ' SEL%   : Operator's response to a cue.
380 '
390 ' *******************************************************************
400 ' *******************************************************************
410 '
420 '          ------------ INITIALIZATION ------------
430 '
440 OPTION BASE 1: DIM OLDLN$(108),NEWLN$(60): DEF SEG: POKE 106,0
445 CLS: CLOSE
450 KEY OFF: LOCATE 10,1,1: PRINT "Are you using cassette or disk?"
460 PRINT "Enter C for cassette or D for disk."
470 FLAG1$=INKEY$: IF FLAG1$="" THEN 470
480 IF FLAG1$="C" OR FLAG1$="c" OR FLAG1$="D" OR FLAG1$="d" THEN 500
490 PRINT: PRINT "INVALID ENTRY": GOTO 460
500 ON ERROR GOTO 5070
510 '
520 CLS: PRINT TAB(7) "*** MINI WORD PROCESSOR-MAIL MERGE ***": PRINT
530 PRINT TAB(23) "MENU": PRINT
535 PRINT "    0. EXIT"
540 PRINT "    1. DESCRIPTION"
550 PRINT "    2. CREATE/EDIT A TEXT FILE"
560 PRINT "    3. INITIALIZE THE AUXILLARY FILE"
570 PRINT "    4. EDIT AN AUXILLARY FILE"
580 PRINT "    5. OUTPUT A TEXT FILE"
590 PRINT "    6. OUTPUT AN AUXILLARY FILE"
600 PRINT "    7. OUTPUT A TEXT FILE WITH BLOCK MERGE"
610 PRINT "    8. LIST DISK FILES": PRINT
620 PRINT "       Enter selection";
625 A$=INKEY$: IF A$="" THEN 625 ELSE SEL%=VAL(A$)
630 IF SEL%>-1 AND SEL%<9 THEN 650
640 PRINT: PRINT "       INVALID ENTRY": GOTO 620
650 IF SEL%=0 THEN ON ERROR GOTO 0: END
660 ON SEL% GOSUB 10050,15050,20050,25050,30050,35050,40050,45050
670 GOTO 520
5000 '
5010 ' *****************************************************************
5020 '
5030 '         ------------- SUBROUTINES --------------
5040 '
5050 ' ERROR HANDLER
5060 '
5070 IF ERR=53 THEN PRINT: PRINT "*** FILE NON-EXISTENT ***": GOTO 5100
5080 IF ERR=27 THEN PRINT: PRINT "*** PRINTER NOT READY ***": GOTO 5100
5090 PRINT: PRINT "*** ERROR";ERR;" DETECTED ON LINE";ERL;" ***"
5100 PRINT "    Press space bar to return to menu.";
5110 A$=INKEY$: IF A$="" THEN 5110 ELSE RESUME 520
5120 '
5130 ' PREPARE CASSETTE
5140 '
5150 PRINT: PRINT "Prepare cassette for access."
5160 PRINT "Press space bar when ready."
5170 A$=INKEY$: IF A$="" THEN 5170 ELSE RETURN
5180 '
5190 ' PREPARE PRINTER
5200 '
5210 PRINT: PRINT "Do you want normal or emphasized print?(N/E)";
5220 FLAG2$=INKEY$: IF FLAG2$="" THEN 5220 ELSE PRINT FLAG2$
5230 IF FLAG2$="N" OR FLAG2$="n" OR FLAG2$="E" OR FLAG2$="e" THEN 5250
5240 PRINT "INVALID ENTRY": GOTO 5210
5250 PRINT "Prepare printer for output."
5260 PRINT "Press space bar when ready."
5270 A$=INKEY$: IF A$="" THEN 5270 ELSE RETURN
5280 '
5290 ' PRESS SPACE BAR
5300 '
5310 PRINT: PRINT "*** PRESS SPACE BAR TO CONTINUE ***"
5320 A$=INKEY$: IF A$="" THEN 5320 ELSE RETURN
5330 '
5340 ' OPERATOR INPUT. CHARACTER RESPONSE
5350 '
5360 A$=INKEY$: IF A$="" THEN 5360 ELSE I%=1: FLAG3%=0
5370 WHILE I%<=L% AND FLAG3%=0: IF A$=MID$(B$,I%,1) THEN FLAG3%=1
5380 I%=I%+1: WEND
5390 IF FLAG3%=1 THEN PRINT A$: RETURN
5400 PRINT: PRINT "INVALID ENTRY. RE-ENTER";: GOTO 5360
5410 '
5420 ' OPERATOR INPUT. INTEGER RESPONSE
5430 '
5440 INPUT SEL%: IF SEL%>=BEGIN% AND SEL%<=E% THEN RETURN
5450 PRINT: PRINT "INVALID ENTRY. RE-ENTER.";: GOTO 5440
5460 '
5470 ' OPERATOR INPUT. NUMBER OF LINES TO EDIT
5480 '
5490 INPUT L%: IF L%>=1 AND L%<=(61-SEL%) THEN RETURN
5500 PRINT: PRINT "INVALID ENTRY. RE-ENTER.";: GOTO 5490
10000 '
10010 ' ****************************************************************
10020 '
10030 '        ------------- DESCRIPTION --------------
10040 '
10050 CLS: PRINT "   --- DESCRIPTION ---": PRINT
10060 PRINT "This program allows the user to create any number of text"
10070 PRINT "files which are 74 characters wide, up to 60 lines long and"
10080 PRINT "are user named. These files can be edited and output to"
10090 PRINT "the printer. Thus this program serves as a rudimentary"
10100 PRINT "word processor.": PRINT
10110 PRINT "User named auxillary files can also be created. These"
10120 PRINT "auxillary files are divided into 18 blocks of 6 lines. A"
10130 PRINT "selected block can be inserted between lines 6 and 7 of a"
10140 PRINT "text file during output. Thus this program can also serve"
10150 PRINT "as a rudimentary mail merger.": PRINT
10160 PRINT "All files are created as sequential files, so that cassette"
10170 PRINT "users can be supported.": PRINT
10180 PRINT "SELECTION 2"
10190 PRINT "Under this selection the user can insert lines, delete"
10200 PRINT " lines, change lines and modify lines."
10210 PRINT "The INSERT request inserts before the selected line."
10220 GOSUB 5310: CLS: PRINT "   ---DESCRIPTION continued ---"
10230 PRINT "The user should write a XXXX line to designate the end of"
10240 PRINT " the text file, if it is less than 60 lines long."
10245 PRINT "The MODIFY request allows in-line editing."
10250 PRINT "The LIST request lists 20 lines at a time."
10260 PRINT "Lines longer than 74 characters are truncated. The"
10270 PRINT " computer will beep, if a truncation has occurred."
10280 PRINT "The END request writes the modified buffer to file."
10290 PRINT "The QUIT request restores the unmodified buffer.": PRINT
10300 PRINT "SELECTION 3"
10310 PRINT "This selection initializes an auxillary file.": PRINT
10320 PRINT "SELECTION 4"
10330 PRINT "This selection allows the user to fill in selected 6 line"
10340 PRINT " blocks. Lines longer than 74 characters are truncated."
10350 PRINT " The computer will beep, if a truncation has occurred."
10360 PRINT "If the first line of a block is a XXXX, then that block"
10370 PRINT " and those following are treated as null. If the first"
10380 PRINT " line of a block is a ZZZZ, then that block only is"
10390 PRINT " treated as null.": GOSUB 5310: CLS
10400 PRINT "   --- DESCRIPTION continued ---": PRINT
10410 PRINT "SELECTION 5"
10420 PRINT "Under this selection a text file can be output to the"
10430 PRINT " display or printer."
10440 PRINT "If output is to the display then 20 lines at a time are"
10450 PRINT " displayed."
10460 PRINT "If output is to the printer then the print can be either"
10470 PRINT " normal or emphasized."
10480 PRINT "The output terminates when either line 60 or a XXXX is"
10490 PRINT " encountered.": PRINT
10500 PRINT "SELECTION 6"
10510 PRINT "This selection allows the user to output the auxillary file"
10520 PRINT " to display or printer."
10530 PRINT "If output is to the display, then 18 lines at a time are"
10540 PRINT " displayed. A XXXX line encountered at the beginning of a"
10550 PRINT " block terminates output. A ZZZZ line encountered at the"
10560 PRINT " beginning of a block generates a space block in the"
10570 PRINT " display.": GOSUB 5310: CLS
10580 PRINT "   ---DESCRIPTION continued ---"
10590 PRINT "If output is to the printer, the print can be either"
10600 PRINT " normal or emphasized. A XXXX line encountered at the"
10610 PRINT " beginning of a block terminates output. A ZZZZ line"
10620 PRINT " encountered at the beginning of a block causes the"
10630 PRINT " printer to skip that block."
10640 PRINT "When outputting to printer, a 0 to 4 line space may be"
10650 PRINT " selected between blocks."
10660 PRINT
10670 PRINT "SELECTION 7"
10680 PRINT "Under this selection a text file is output to the display"
10690 PRINT " or printer with a selected block from the auxillary file"
10700 PRINT " merged between lines 6 and 7. The output terminates at"
10710 PRINT " line 60 or a XXXX line."
10720 PRINT "If output is to the display, then 22 lines at a time are"
10730 PRINT " displayed. If output is to the printer, the print can"
10740 PRINT " be either normal or emphasized.":PRINT
10743 PRINT "SELECTION 8"
10745 PRINT "This selection lists the files on a selected disk.": PRINT
10750 PRINT "WILLIAM HT BAILEY   Phone: 215-924-0771         August 1982";
10760 GOSUB 5310: RETURN
15000 '
15010 ' ****************************************************************
15020 '
15030 '         ------------ EDIT TEXT FILE ------------
15040 '
15050 CLS: PRINT "   --- EDIT TEXT FILE ---"
15060 PRINT: PRINT "Enter file name ";: INPUT F$
15070 PRINT: PRINT "Is this a New or Old file?(N/O)";
15080 B$="NnOo": L%=4: GOSUB 5360
15090 IF A$="O" OR A$="o" THEN 15110
15093 A$="XXXX 6789 1 34567890 2 45678901 3 56789012 4 67890123 5 78901234 6 8"
15095 FOR I%=1 TO 60: NEWLN$(I%)=A$: NEXT I%: GOTO 15160
15100 '
15110 IF FLAG1$="C" OR FLAG1$="c" THEN GOSUB 5150
15120 OPEN F$ FOR INPUT AS #1: I%=1
15130 WHILE I%<=60 AND NOT EOF(1) : LINE INPUT#1,OLDLN$(I%)
15140 NEWLN$(I%)=OLDLN$(I%): I%=I%+1: WEND: CLOSE#1
15150 '
15155 PRINT
15160 PRINT"Insert,Delete,Change,Modify,List,End or Quit? (I/D/C/M/L/E/Q)";
15170 B$="IiDdCcMmLlEeQq": L%=14: GOSUB 5360
15180 IF A$="E" OR A$="e" THEN 15540
15190 IF A$="Q" OR A$="q" THEN 15610
15200 PRINT "Line number";
15205 BEGIN%=1: E%=60: GOSUB 5440
15207 IF A$="L" OR A$="l" THEN 15270
15208 PRINT "Number of lines";: GOSUB 5490
15210 IF A$="I" OR A$="i" THEN 15340
15220 IF A$="D" OR A$="d" THEN 15420
15230 IF A$="C" OR A$="c" THEN 15465
15235 IF A$="M" OR A$="m" THEN 15660
15240 '
15250 ' LIST 20 LINES
15260 '
15270 PRINT: BEGIN%=SEL%-9: E%=SEL%+10
15280 IF BEGIN%<1 THEN BEGIN%=1: E%=20
15285 IF E%>60 THEN BEGIN%=41: E%=60
15290 FOR J%=BEGIN% TO E%
15300 PRINT USING "##";J%;: PRINT ">";NEWLN$(J%): NEXT J%: GOTO 15160
15310 '
15320 'INSERT LINE
15330 '
15340 FOR K%=SEL% TO (SEL%+L%-1): IF K%=60 THEN 15360
15350 FOR J%=59 TO K% STEP -1: NEWLN$(J%+1)=NEWLN$(J%): NEXT J%
15360 PRINT:PRINT USING "##";K%;:PRINT ">";: LINE INPUT;NEWLN$(K%)
15370 IF LEN(NEWLN$(K%))>76 THEN BEEP:NEWLN$(K%)=LEFT$(NEWLN$(K%),76)
15380 NEXT K%: PRINT: GOTO 15160
15390 '
15400 ' DELETE LINE
15410 '
15420 FOR J%=SEL% TO (60-L%): NEWLN$(J%)=NEWLN$(J%+L%): NEXT J%
15430 FOR J%=60 TO (61-L%) STEP -1: NEWLN$(J%)="XXXX":NEXT J%: GOTO 15160
15440 '
15450 ' CHANGE LINE
15460 '
15465 FOR K%=SEL% TO (SEL%+L%-1)
15470 PRINT: PRINT USING "##";K%;: PRINT ">";NEWLN$(K%)
15480 PRINT USING "##";K%;: PRINT ">";: LINE INPUT;NEWLN$(K%)
15490 IF LEN(NEWLN$(K%))>76 THEN BEEP:NEWLN$(K%)=LEFT$(NEWLN$(K%),76)
15500 NEXT K%: GOTO 15160
15510 '
15520 ' END EDITING
15530 '
15540 IF FLAG1$="C" OR FLAG1$="c" THEN GOSUB 5150
15550 OPEN F$ FOR OUTPUT AS #1
15560 FOR J%=1 TO 60: PRINT#1,NEWLN$(J%): NEXT J%
15570 CLOSE#1: RETURN
15580 '
15590 ' QUIT EDITING
15600 '
15610 PRINT "Abort Edit?(Y/N)";: B$="YyNn": L%=4: GOSUB 5360
15620 IF A$="N" OR A$="n" THEN 15160 ELSE RETURN
15630 '
15640 ' MODIFY LINE
15650 '
15660 FOR K%=SEL% TO (SEL%+L%-1)
15670 PRINT: PRINT USING "##";K%;: PRINT ">";NEWLN$(K%);: LOCATE ,4,1
15680 A$=INKEY$: IF A$="" THEN 15680 ELSE P%=POS(0)
15690 IF A$=CHR$(13) THEN 15920
15700 IF LEN(A$)=2 THEN B$=MID$(A$,2,1) ELSE GOTO 15880
15710 IF ASC(B$)<>77 THEN 15750
15720 IF POS(0)=79 THEN 15680
15730 IF POS(0)=LEN(NEWLN$(K%))+1 THEN NEWLN$(K%)=NEWLN$(K%)+" "
15735 IF LEN(NEWLN$(K%))>76 THEN BEEP: NEWLN$(K%)=LEFT$(NEWLN$(K%),76):               GOTO 15680
15740 LOCATE ,(POS(0)+1): GOTO 15680
15750 IF ASC(B$)<>75 THEN 15780
15760 IF POS(0)=4 THEN 15680
15770 LOCATE ,(POS(0)-1): GOTO 15680
15780 IF ASC(B$)<>83 THEN 15830
15785 IF P%>LEN(NEWLN$(K%))+3 THEN 15680
15790 IF P%=4 THEN NEWLN$(K%)=MID$(NEWLN$(K%),2): GOTO 15820
15800 IF P%=LEN(NEWLN$(K%))+3 THEN                                                    NEWLN$(K%)=LEFT$(NEWLN$(K%),LEN(NEWLN$(K%))-1): GOTO 15820
15810 NEWLN$(K%)=LEFT$(NEWLN$(K%),(P%-4))+MID$(NEWLN$(K%),(P%-2))
15820 LOCATE ,4,0:PRINT NEWLN$(K%);" ";: LOCATE ,P%,1: GOTO 15680
15830 IF ASC(B$)<>82 THEN 15680
15835 IF P%>LEN(NEWLN$(K%))+3 THEN 15680
15840 IF P%=4 THEN NEWLN$(K%)=" "+NEWLN$(K%): GOTO 15860
15850 NEWLN$(K%)=LEFT$(NEWLN$(K%),(P%-4))+" "+MID$(NEWLN$(K%),(P%-3))
15860 IF LEN(NEWLN$(K%))>76 THEN BEEP: NEWLN$(K%)=LEFT$(NEWLN$(K%),76)
15870 LOCATE ,4,0: PRINT NEWLN$(K%);: LOCATE ,P%,1: GOTO 15680
15880 IF ASC(A$)<32 OR ASC(A$)>126 THEN 15680
15890 NEWLN$(K%)=LEFT$(NEWLN$(K%),(P%-4))+A$+MID$(NEWLN$(K%),(P%-2))
15900 IF LEN(NEWLN$(K%))>76 THEN BEEP: NEWLN$(K%)=LEFT$(NEWLN$(K%),76)
15910 LOCATE ,4,0: PRINT NEWLN$(K%);: LOCATE ,P%+1,1: GOTO 15680
15920 NEXT K%: PRINT: GOTO 15160
20000 '
20010 ' *****************************************************************
20020 '
20030 '         ------ INITIALIZE AUXILLARY FILE -------
20040 '
20050 CLS: PRINT "   --- INITIALIZE AUXILLARY FILE ---"
20055 LOCATE 10,1:INPUT "Enter name of auxillary file ";M$:PRINT
20060 PRINT "CURRENT DATA WILL BE DESTROYED"
20070 PRINT "Continue or Return to menu?(C/R)";
20080 B$="CcRr": L%=4: GOSUB 5360
20090 IF A$<>"C" AND A$<>"c" THEN RETURN
20100 IF FLAG1$="C" OR FLAG1$="c" THEN GOSUB 5150
20110 PRINT: PRINT: PRINT "Initializing auxillary file"
20120 OPEN M$ FOR OUTPUT AS #2
20125 A$="XXXX 6789 1 34567890 2 45678901 3 56789012 4 67890123 5 78901234 6 8"
20130 FOR J%=1 TO 108: OLDLN$(J%)=A$: PRINT#2,OLDLN$(J%): NEXT J%
20140 CLOSE#2: RETURN
25000 '
25010 ' *****************************************************************
25020 '
25030 '         --------- EDIT AUXILLARY FILE ----------
25040 '
25050 CLS: PRINT "   --- EDIT AUXILLARY FILE ---"
25055 PRINT:INPUT "Enter name of auxillary file ";M$
25060 IF FLAG1$="C" OR FLAG1$="c" THEN GOSUB 5150
25070 OPEN M$ FOR INPUT AS #2: J%=1
25080 WHILE J%<=108 AND NOT EOF(2): LINE INPUT#2,OLDLN$(J%)
25090 J%=J%+1: WEND: CLOSE#2
25100 '
25110 PRINT: PRINT "Enter block number (1-18) or 0 to return to menu";
25120 BEGIN%=0: E%=18: GOSUB 5440: IF SEL%=0 THEN 25240
25130 PRINT: PRINT "Block";SEL%
25140 FOR J%=((SEL%-1)*6+1) TO ((SEL%-1)*6+6)
25150 PRINT USING "###";J%;: PRINT ">";OLDLN$(J%): NEXT J%
25160 '
25170 PRINT: PRINT "Overwrite? (Y/N)";: B$="YyNn": L%=4: GOSUB 5360
25180 IF A$="N" OR A$="n" THEN 25100
25190 FOR J%=((SEL%-1)*6+1) TO ((SEL%-1)*6+6)
25200 PRINT USING "###";J%;:PRINT ">";: LINE INPUT;OLDLN$(J%): PRINT
25210 IF LEN(OLDLN$(J%))>76 THEN BEEP:OLDLN$(J%)=LEFT$(OLDLN$(J%),76)
25220 NEXT J%: GOTO 25100
25230 '
25240 IF FLAG1$="C" OR FLAG1$="c" THEN GOSUB 5150
25250 OPEN M$ FOR OUTPUT AS #2
25260 FOR J%=1 TO 100: PRINT#2,OLDLN$(J%): NEXT J%: CLOSE#2: RETURN
30000 '
30010 ' *****************************************************************
30020 '
30030 '         ----------- OUTPUT TEXT FILE ------------
30040 '
30050 CLS: PRINT "   --- OUTPUT TEXT FILE ---"
30060 PRINT: INPUT "Enter file name";F$
30070 IF FLAG1$="C" OR FLAG1$="c" THEN GOSUB 5150
30080 OPEN F$ FOR INPUT AS #1: I%=1
30090 WHILE I%<=60 AND NOT EOF(1): LINE INPUT#1,OLDLN$(I%)
30100 I%=I%+1:WEND: CLOSE#1
30110 '
30120 PRINT: PRINT "Output to Display or Printer? (D/P)";
30130 B$="DdPp": L%=4: GOSUB 5360
30140 IF A$="P" OR A$="p" THEN 30270
30150 '
30160 ' OUTPUT TO DISPLAY
30170 '
30180 FLAG3%=0: I%=0
30190 WHILE I%<=2 AND FLAG3%=0: CLS: J%=I%*20: K%=1
30200 WHILE K%<=20 AND FLAG3%=0
30210 IF MID$(OLDLN$(J%+K%),1,4)="XXXX" THEN FLAG3%=1: GOTO 30230
30220 PRINT OLDLN$(J%+K%)
30230 K%=K%+1: WEND: GOSUB 5310: I%=I%+1: WEND
30231 PRINT: PRINT "Output to printer? (Y/N)";: B$="YyNn": L%=4
30232 GOSUB 5360: IF A$="N" OR A$="n" THEN RETURN
30240 '
30250 ' OUTPUT TO PRINTER
30260 '
30270 GOSUB 5210: IF FLAG2$="E" OR FLAG2$="e" THEN LPRINT CHR$(27);"E"
30280 I%=1: FLAG3%=0
30290 WHILE I%<=60 AND FLAG3%=0
30300 IF MID$(OLDLN$(I%),1,4)="XXXX" THEN FLAG3%=1 ELSE LPRINT OLDLN$(I%)
30310 I%=I%+1: WEND: IF FLAG2$="E" OR FLAG2$="e" THEN LPRINT CHR$(27);"F"
30320 PRINT: PRINT "Another printout? (Y/N)";: B$="YyNn": L%=4
30330 GOSUB 5360: IF A$="Y" OR A$="y" THEN LPRINT CHR$(12): GOTO 30270
30340 LPRINT CHR$(12): RETURN
35000 '
35010 ' *****************************************************************
35020 '
35030 '         -------- OUTPUT AUXILLARY FILE ----------
35040 '
35050 CLS: PRINT "   --- OUTPUT AUXILLARY FILE ---"
35055 PRINT: INPUT "Enter name of auxillary file ";M$
35060 IF FLAG1$="C" OR FLAG1$="c" THEN GOSUB 5150
35070 OPEN M$ FOR INPUT AS #2: J%=1
35080 WHILE J%<=108 AND NOT EOF(2): LINE INPUT#2,OLDLN$(J%)
35090 J%=J%+1: WEND: CLOSE#2
35100 '
35110 PRINT: PRINT "Output to Display or Printer? (D/P)";
35120 B$="DdPp": L%=4: GOSUB 5360
35130 IF A$="P" OR A$="p" THEN 35300
35140 '
35150 ' OUTPUT TO DISPLAY
35160 '
35170 FLAG3%=0: I%=0
35180 WHILE I%<=17 AND FLAG3%=0: CLS: J%=1
35190 WHILE J%<=3 AND FLAG3%=0:K%=I%*6:IF OLDLN$(K%+1)<>"ZZZZ" THEN 35210
35200 FOR L%=1 TO 6: PRINT "": NEXT L%: GOTO 35230
35210 IF MID$(OLDLN$(K%+1),1,4)="XXXX" THEN FLAG3%=1: GOTO 35230
35220 FOR L%=(K%+1) TO (K%+6): PRINT OLDLN$(L%): NEXT L%
35230 IF J%<>4 THEN PRINT
35235 J%=J%+1: I%=I%+1: WEND
35240 GOSUB 5310: WEND
35250 PRINT: PRINT "Output to printer? (Y/N)";: B$="YyNn": L%=4
35260 GOSUB 5360: IF A$="N" OR A$="n" THEN RETURN
35270 '
35280 ' OUTPUT TO PRINTER
35290 '
35300 PRINT: PRINT "Number of spaces between blocks? (0-4)";
35310 BEGIN%=0: E%=4: GOSUB 5440
35320 GOSUB 5210: IF FLAG2$="E" OR FLAG2$="e" THEN LPRINT  CHR$(27);"E"
35330 I%=0: FLAG3%=0
35340 WHILE I%<=17 AND FLAG3%=0: J%=I%*6
35350 IF OLDLN$(J%+1)="ZZZZ" THEN 35400
35360 IF MID$(OLDLN$(J%+1),1,4)="XXXX" THEN FLAG3%=1: GOTO 35400
35370 FOR L%=(J%+1) TO (J%+6): LPRINT OLDLN$(L%): NEXT L%
35380 IF SEL%=0 THEN 35400
35390 FOR L%=1 TO SEL%: LPRINT: NEXT L%
35400 I%=I%+1: WEND: IF FLAG2$="E" OR FLAG2$="e" THEN LPRINT CHR$(27); "F"
35410 PRINT: PRINT "Another printout? (Y/N)";: B$="YyNn": L%=4
35420 GOSUB 5360: IF A$="Y" OR A$="y" THEN LPRINT CHR$(12): GOTO 35300
35430 LPRINT CHR$(12): RETURN
40000 '
40010 ' *****************************************************************
40020 '
40030 '         -- OUTPUT TEXT FILE WITH BLOCK MERGE ----
40040 '
40050 CLS: PRINT "   --- OUTPUT TEXT FILE WITH BLOCK MERGE ---"
40060 PRINT: INPUT "Enter file name";F$
40070 IF FLAG1$="C" OR FLAG1$="c" THEN GOSUB 5150
40080 OPEN F$ FOR INPUT AS #1: I%=1
40090 WHILE I%<=60 AND NOT EOF(1): LINE INPUT#1,NEWLN$(I%)
40100 I%=I%+1:WEND: CLOSE#1
40110 PRINT: INPUT "Enter name of auxillary file ";M$
40120 IF FLAG1$="C" OR FLAG1$="c" THEN GOSUB 5150
40130 OPEN M$ FOR INPUT AS #2: J%=1
40140 WHILE J%<=108 AND NOT EOF(2): LINE INPUT#2,OLDLN$(J%)
40150 J%=J%+1: WEND: CLOSE#2
40160 '
40170 PRINT "Enter block number (1-18)";
40180 BEGIN%=1: E%=18: GOSUB 5440
40190 IF OLDLN$((SEL%-1)*6+1)="ZZZZ" THEN PRINT "Null entry": GOTO 40170
40200 IF MID$(OLDLN$((SEL%-1)*6+1),1,4)<>"XXXX" THEN 40210
40205 PRINT "Null entry": GOTO 40170
40210 PRINT: PRINT "Output to Display or Printer? (D/P)";
40220 B$="DdPp": L%=4: GOSUB 5360
40230 IF A$="P" OR A$="p" THEN 40420
40240 '
40250 ' OUTPUT TO DISPLAY
40260 '
40270 CLS: FOR I%=1 TO 6: PRINT NEWLN$(I%): NEXT I%
40280 FOR I%=1 TO 6: PRINT OLDLN$((SEL%-1)*6+I%): NEXT I%
40290 I%=7: FLAG3%=0
40300 WHILE I%<=16 AND FLAG3%=0
40310 IF MID$(NEWLN$(I%),1,4)="XXXX" THEN FLAG3%=1 ELSE PRINT NEWLN$(I%)
40320 I%=I%+1: WEND: GOSUB 5310: IF FLAG3%=1 THEN 40370 ELSE I%=0
40330 WHILE I%<=1 AND FLAG3%=0: CLS: J%=I%*22+16: K%=1
40340 WHILE K%<=22 AND FLAG3%=0
40350 IF MID$(NEWLN$(J%+K%),1,4)="XXXX" THEN FLAG3%=1 ELSE PRINT NEWLN$(J%+K%)
40360 K%=K%+1: WEND: GOSUB 5310: I%=I%+1: WEND
40370 PRINT: PRINT "Output to printer? (Y/N)";: B$="YyNn": L%=4
40380 GOSUB 5360: IF A$="N" OR A$="n" THEN RETURN
40390 '
40400 ' OUTPUT TO PRINTER
40410 '
40420 GOSUB 5210: IF FLAG2$="E" OR FLAG2$="e" THEN LPRINT CHR$(27);"E"
40430 FOR I%=1 TO 6: LPRINT NEWLN$(I%): NEXT I%
40440 FOR I%=1 TO 6: LPRINT OLDLN$((SEL%-1)*6+I%): NEXT I%
40450 I%=7: FLAG3%=0
40460 WHILE I%<=60 AND FLAG3%=0
40470 IF MID$(NEWLN$(I%),1,4)="XXXX" THEN FLAG3%=1 ELSE LPRINT NEWLN$(I%)
40480 I%=I%+1: WEND: IF FLAG2$="E" OR FLAG2$="e" THEN  LPRINT CHR$(27);"F"
40490 PRINT: PRINT "Another printout? (Y/N)";: B$="YyNn": L%=4
40500 GOSUB 5360: IF A$="Y" OR A$="y" THEN LPRINT CHR$(12): GOTO 40170
40510 LPRINT CHR$(12): RETURN
45000 '
45010 ' ****************************************************************
45020 '
45030 '            ------------ LIST DISK FILES -------------
45040 '
45050 CLS:PRINT "    --- LIST DISK FILES ---"
45060 PRINT: PRINT "Drive A, Drive B or Return? (A/B/R) ";:B$="AaBbRr":L%=6
45065 GOSUB 5360
45070 IF A$="R" OR A$="r" THEN RETURN
45080 PRINT: PRINT TAB(27);"*** Files On Drive ";A$;" ***":FILES A$+":*.*"
45090 PRINT: GOTO 45060
49996 '
49997 ' ****************************************************************
49998 ' ****************************************************************
49999 END
