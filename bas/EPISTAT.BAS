1 '                    INTRODUCTION TO EPISTAT
2 '               Written by Tracy L. Gustafson, M.D.
3 '              Round Rock, Texas. Version 3.0, 1984
5 CLEAR,,1024:OPTION BASE 1:DEFINT A-C,N,T,Z:DEFSTR D
8 DEF SEG=64:A=PEEK(23):IF NOT(A AND 32) THEN POKE 23,(A OR 32)
10 DEF SEG:KEY OFF:WIDTH 80:SCREEN 0,0,0:COLOR 7,0,0:CLS
12 PRINT TAB(14);"様様様様様様�USER-SUPPORTED SOFTWARE様様様様様様�"
15 LOCATE 4,8,1,1,13:PRINT STRING$(61,178)
20 PRINT TAB(8);"臆                                                         臆"
21 PRINT TAB(8);"臆      EPISTAT is a statistical package designed for      臆"
22 PRINT TAB(8);"臆             the analysis of small data sets.            臆"
23 PRINT TAB(8);"臆   If, after using the programs, you find them useful,   臆"
24 PRINT TAB(8);"臆  your contribution ($25 suggested) will be appreciated. 臆"
25 PRINT TAB(8);"臆                                                         臆"
26 PRINT TAB(8);"臆  Send contributions to:                                 臆"
27 PRINT TAB(8);"臆              Tracy L. Gustafson, M.D.                   臆"
28 PRINT TAB(8);"臆              1705 Gattis School Road                    臆"
29 PRINT TAB(8);"臆              Round Rock, Texas  78664                   臆"
30 PRINT TAB(8);"臆                                                         臆"
31 PRINT TAB(8);"臆    All users may copy and distribute these programs     臆"
32 PRINT TAB(8);"臆                     provided:                           臆"
33 PRINT TAB(8);"臆  1.)  The programs are not altered in any way.          臆"
34 PRINT TAB(8);"臆  2.)  No fee is charged for copying or distribution.    臆"
35 PRINT TAB(8);"臆                                                         臆"
40 PRINT TAB(8);STRING$(61,178):FOR Z=1 TO 4:PLAY "MB O=Z; L18 CEGB-":NEXT
45 FOR Z=4 TO 2 STEP -1:PLAY "MB O=Z; L14 AFC.":NEXT:PLAY "MB O1 L16 B L6 B-A L2 F"
50 FOR Z=1 TO 10000:NEXT:CLR1=7:CLR2=0:CLR3=0:SCRN=0:ON ERROR GOTO 5000
55 PRINT:PRINT TAB(10);:INPUT "Do you want to change COLORS or hardware configuration? ",A$:IF A$<>"y" AND A$<>"Y" THEN 185
60 CLS:DEF SEG=0:IF (PEEK(1040) AND 48)<>48 THEN 80
65 DEF SEG=&HB800:POKE 0,0:IF PEEK(0)<>0 THEN 120
70 INPUT "Select COLOR (C) or MONOCHROME (M) adapter:  ",A$
75 IF A$="M" OR A$="m" THEN 120 ELSE IF A$<>"C" AND A$<>"c" THEN BEEP:GOTO 70
80 DEF SEG=0:POKE 1040,(PEEK(1040) AND 207) OR 32
85 DEF SEG:SCREEN 0,1,0:LOCATE 5,10:COLOR 0,7:PRINT 0;:COLOR ,0:PRINT TAB(45);:COLOR 8:PRINT 8;STRING$(25,219)
90 FOR Z=1 TO 7:LOCATE 5+Z,10:COLOR Z,0:PRINT Z;STRING$(25,219);:COLOR 7,0:PRINT TAB(45);:COLOR Z+8:PRINT USING "##";Z+8;:PRINT" ";STRING$(25,219):NEXT
95 COLOR 7,0:PRINT:PRINT TAB(15);:INPUT "ENTER your color choices for:  FOREGROUND = ",CLR1
100 PRINT TAB(46);:INPUT "BACKGROUND = ",CLR2
105 PRINT TAB(50);:INPUT "BORDER = ",CLR3
110 IF CLR1=7 AND CLR2=0 AND CLR3=0 THEN SCRN=0 ELSE SCRN=1
115 SCREEN 0,SCRN,0:COLOR CLR1,CLR2,CLR3:PRINT
120 DEF SEG:PRINT TAB(15);:INPUT "Do you have an IBM or EPSON printer?  ",DI
125 PRINT TAB(20);:INPUT "Is your printer 80 or 132 column?  ",A$
130 VA=VAL(A$):IF VA=80 OR VA=132 THEN PRNT=VA ELSE BEEP:GOTO 125
135 PRINT TAB(7);:INPUT "Do you want (1) pica, (2) elite or (3) compressed type?  ",AD:IF ABS(AD-2)>1 THEN BEEP:GOTO 135
140 IF DI="y" OR DI="Y" THEN 160 ELSE PRINT " Enter your printer's BASIC codes for ";:RESTORE 165:FOR Z=1 TO AD:READ D,XF:NEXT:PRINT D;" type:"
145 AR=CSRLIN:LOCATE 24,5:PRINT "Enter CHR$()'s by pressing <Alt> and entering NUMBER on numeric keypad.";:LOCATE 25,19:PRINT "Press <Enter> when complete code entered.";
150 LOCATE AR,9,1:PRINT " ASCII CODE:  ";
155 A$=INKEY$:IF A$="" THEN 155 ELSE IF A$=CHR$(13) THEN TYP$=DT:GOTO 170 ELSE DT=DT+A$:PRINT ASC(A$);:GOTO 155
160 TYP$=CHR$(27)+"@":IF AD=1 THEN XF=1 ELSE IF AD=2 THEN TYP$=TYP$+CHR$(27)+"M":XF=1.2 ELSE IF AD=3 THEN TYP$=TYP$+CHR$(15):XF=1.7 ELSE BEEP:GOTO 140
165 DATA "pica",1,"elite",1.2,"compressed",1.7
170 PRNT=INT(PRNT*XF)
175 OPEN "EPISETUP.DAT" FOR OUTPUT AS #1
180 WRITE #1,CLR1,CLR2,CLR3,SCRN,PRNT,TYP$:CLOSE #1:GOTO 200
185 OPEN "EPISETUP.DAT" FOR INPUT AS #1
190 INPUT #1,CLR1,CLR2,CLR3,SCRN,PRNT,TYP$:CLOSE #1
195 SCREEN 0,SCRN,0:COLOR CLR1,CLR2,CLR3
200 CLS:PRINT TAB(21);"�";STRING$(29,205);"�":PRINT TAB(21);"� EPISTAT STATISTICAL PACKAGE �"
205 PRINT TAB(21);"�";STRING$(29,205);"�"
210 LOCATE 6,5:PRINT"Would you like to:":PRINT
215 PRINT TAB(15);"1.)  List the tests and functions available.":PRINT
220 PRINT TAB(15);"2.)  Determine the best test for your data.":PRINT
225 PRINT TAB(15);"3.)  Exit to run a specific test program."
230 LOCATE 15,20:INPUT "Enter choice:    ",ASUB:IF ABS(2-ASUB)>1 THEN BEEP:GOTO 230
235 CLS:ON ASUB GOTO 240,340,600
240 PRINT TAB(25);"TESTS AVAILABLE IN EPISTAT":PRINT TAB(25);STRING$(26,205)
245 PRINT:PRINT TAB(29);"PROGRAM";TAB(69);"PROGRAM"
250 PRINT "TEST OR FUNCTION";TAB(30);"NAME";TAB(42);"TEST OR FUNCTION";TAB(70);"NAME"
255 PRINT STRING$(16,196);TAB(29);"陳陳陳陳";TAB(42);STRING$(16,196);TAB(69);"陳陳陳�"
260 PRINT "Analysis of variance........ANOVA*";TAB(42);"McNemar's test.............MCNEMAR"
265 PRINT "Bayes' theorem..............BAYES";TAB(42);"Mean, Median and S.Dev.....DATA-ONE*"
270 PRINT "Binomial distribution.......BINOMIAL";TAB(42);"Normal distribution........NORMAL*"
275 PRINT "Chi-square test.............CHISQR";TAB(42);"Poisson distribution.......POISSON"
280 PRINT "Correlation coefficients....CORRELAT*";TAB(42);"Random sample generator....RANDOMIZ"
285 PRINT "Crosstab reports............XTAB*";TAB(42);"Rank sum test..............RANKTEST*"
290 PRINT "F Distribution..............ANOVA*";TAB(42);"Rates adjusted.............RATEADJ*"
295 PRINT "Fisher's exact test.........FISHERS";TAB(42);"Sample size determination..SAMPLSIZ"
300 PRINT "Graph histogram.............HISTOGRM*";TAB(42);"Select specific records....SELECT*"
305 PRINT "Graph scattergram...........SCATRGRM*";TAB(42);"Signed rank test...........RANKTEST*"
310 PRINT "Linear regression...........LNREGRES*";TAB(42);"Student's T test...........T-TEST*"
315 PRINT "Mantel-Haenszel Chi-square..MHCHISQR";TAB(42);"Transfer data between"
320 PRINT "Mantel-Haenszel for";TAB(45);"two EPISTAT files.......FILETRAN*"
325 PRINT TAB(3);"multiple controls/case....MHCHIMLT*";TAB(42);"Transfer data from"
330 PRINT TAB(45);"FORTRAN datafiles.......FORTRANS*"
335 LOCATE 24,5:PRINT "*Starred programs can evaluate data entered and saved using DATA-ONE.";:GOTO 660
340 CLS:PRINT TAB(18);"DETERMINING THE BEST STATISTICAL TEST":PRINT TAB(18);STRING$(37,205)
345 LOCATE 5,5:PRINT "Do you want to consider:":PRINT
350 PRINT TAB(20);"1.)  Tests for a single sample":PRINT
355 PRINT TAB(20);"2.)  Tests for 2 or more samples":PRINT
360 PRINT TAB(20);"3.)  Other statistical functions":PRINT
365 PRINT TAB(20);"4.)  Data handling utilities":PRINT
370 PRINT TAB(20);"5.)  Return to main menu"
375 LOCATE 18,25:INPUT "Enter choice:   ",ASUB:IF ABS(ASUB-3)>2 THEN BEEP:GOTO 375
380 CLS:ON ASUB GOTO 385,415,525,555,200
385 PRINT TAB(25);"TESTS FOR A SINGLE SAMPLE":PRINT
390 PRINT "The following tests compare an observed number":PRINT TAB(37);"to the expected (population) rate:":PRINT:PRINT
395 PRINT "[BINOMIAL]:  The Binomial distribution applies when a dichotomous variable":PRINT TAB(14);"has an equal probability of occurring on each of N trials.":PRINT
400 PRINT "[NORMAL]  :  The Normal distribution applies to continuous and dichotomous": PRINT TAB(14);"variables when the sample size is >30 and normally distributed."
405 PRINT TAB(14);"Specifically used when comparing a sample mean with a": PRINT TAB(14);"population mean.":PRINT
410 PRINT "[POISSON] :  The Poisson distribution applies when a dichotomous variable":PRINT TAB(14);"has a known probability of occurring on each trial,":PRINT TAB(14);"but the number of trials is not known.":GOTO 670
415 PRINT TAB(23);"TESTS FOR TWO OR MORE SAMPLES":PRINT
420 INPUT "Is the variable under consideration probably normally distributed? (Y or N)  ",A$
425 IF A$="Y" OR A$="y" THEN 450 ELSE IF A$="N" OR A$="n" THEN 430 ELSE BEEP:GOTO 420
430 PRINT:PRINT:PRINT "[RANKTEST]:   The Signed Rank Test compares the medians of paired samples."
435 PRINT TAB(15);"The Rank Sum Test compares the medians of independent samples.":PRINT
440 PRINT "[CORRELAT]:   Includes Spearman's Rank Correlation":PRINT
445 PRINT:PRINT " (NOTE: Both the T-TEST and ANOVA usually can be safely applied to":PRINT TAB(9);"nonparametric data sets that contain more than 30 observations/sample.":GOTO 670
450 PRINT:PRINT TAB(24);"NORMALLY DISTRIBUTED SAMPLES":PRINT
455 PRINT TAB(12);:INPUT"Are these samples paired (P) or independent (I)?   ",A$
460 IF A$="P" OR A$="p" THEN 465 ELSE IF A$="i" OR A$="I" THEN 495 ELSE BEEP:GOTO 455
465 PRINT:PRINT "[ANOVA]   :  TWO-WAY Analysis of Variance evaluates the combined effects":PRINT TAB(14);"of two variables on a third (ROW and COLUMN effects)"
470 PRINT:PRINT "[CORRELAT]:  Includes Pearson's correlation coefficient.":PRINT
475 PRINT "[LNREGRES]:  Linear Regression analysis evaluates linear association.":PRINT
480 PRINT "[MCNEMAR] :  McNemar's test compares paired dichotomous variables.":PRINT
485 PRINT "[MHCHIMLT]:  Mantel-Haenszel Chi-square for multiple controls compares":PRINT TAB(14);"dichotomous variables with several controls per case.":PRINT
490 PRINT "[T-TEST]  :  The paired T-Test compares means of continuous variables.":GOTO 670
495 PRINT:PRINT "[ANOVA]  :   ONE-WAY Analysis of Variance compares the means of":PRINT TAB(14);"3 or more samples."
500 PRINT TAB(14);"TWO-WAY Analysis of Variance evaluates the combined effects":PRINT TAB(14);"of 2 variables on a third variable.":PRINT
505 PRINT "[CHISQR]  :  Chi-square Test compares discrete variables when":PRINT TAB(14);"the expected value for each cell is > 5.":PRINT
510 PRINT "[FISHERS] :  Fisher's Exact Test compares dichotomous variables.":PRINT
515 PRINT "[MHCHISQR]:  Mantel-Haenszel Chi-square Test compares a dichotomous":PRINT TAB(14);"variable while controlling for another factor.":PRINT
520 PRINT "[T-TEST]  :  The unpaired T-Test compares the means of continuous variables.":GOTO 670
525 PRINT TAB(23);"OTHER STATISTICAL FUNCTIONS":PRINT:PRINT
530 PRINT "[BAYES]   :  Bayes theorem evaluates the predictive power of a":PRINT TAB(14);"diagnostic test or variable.":PRINT
535 PRINT "[NORMAL]  :  The Normal distribution calculates the percent of":PRINT TAB(14);"test values expected to fall within a given range.":PRINT
540 PRINT "[RATEADJ] :  Direct and indirect rate adjustments are performed to":PRINT TAB(14);"make a sample comparable to a standard.":PRINT
545 PRINT "[RANDOMIZ]:  Selects a random sample for survey or study.":PRINT
550 PRINT "[SAMPLSIZ]:  Calculates the appropriate sample sizes for surveys,":PRINT TAB(14);"paired and unpaired studies.":GOTO 670
555 PRINT TAB(23);"DATA HANDLING UTILITIES":PRINT:PRINT
560 PRINT "[DATA-ONE]:   Input, edit, sort and print data.":PRINT
565 PRINT "[FILETRAN]:   Transfer samples between EPISTAT datafiles.":PRINT
570 PRINT "[FORTRANS]:   Transfer data from flat card-image FORTRAN files.":PRINT
575 PRINT "[HISTOGRM]:   Graph a histogram on screen or printer.":PRINT
580 PRINT "[LNREGRES]:   Provides data transformations.":PRINT
585 PRINT "[SCATRGRM]:   Graph a scattergram on screen or printer.":PRINT
590 PRINT "[SELECT]  :   Generates a new datafile containing selected subset":PRINT TAB(15);"of the original records or cases.":PRINT
595 PRINT "[XTAB]    :   Produces 1, 2 or 3-way crosstab reports.":GOTO 670
600 PRINT TAB(20);"RUNNING EPISTAT STATISTICAL PROGRAMS"
605 PRINT TAB(20);STRING$(36,205):PRINT:PRINT
610 PRINT TAB(3);"Determine the program name (PROGNAME) from Section 1 or 2, then enter: "
615 PRINT:PRINT TAB(30);"RUN ";CHR$(34);"PROGNAME";CHR$(34):PRINT
620 PRINT "Or select the program number below:":PRINT
625 RESTORE 650:FOR Z=1 TO 10:LOCATE Z+10,10:READ D:PRINT Z;D:NEXT
630 FOR Z=11 TO 20:LOCATE Z,30:READ D:PRINT Z;D:NEXT
635 FOR Z=21 TO 24:LOCATE Z-10,50:READ D:PRINT Z;D:NEXT
640 LOCATE 25,18:INPUT;"Enter choice (Press RETURN to exit):  ",AD
645 IF AD>0 AND AD<25 THEN RESTORE 650:FOR Z=1 TO AD:READ D:NEXT:RUN D
650 DATA "DATA-ONE","ANOVA","BAYES","BINOMIAL","CHISQR","CORRELAT","FILETRAN","FISHERS","FORTRANS","HISTOGRM","LNREGRES","MHCHISQR","MHCHIMLT","MCNEMAR","NORMAL","POISSON","RANDOMIZ","RANKTEST","RATEADJ","SAMPLSIZ","SCATRGRM","SELECT","T-TEST","XTAB"
655 LOCATE 23,1:END
660 LOCATE 25,20:PRINT"Press any key to return to main menu:";
665 A$=INKEY$:IF A$="" THEN 665 ELSE 200
670 LOCATE 25,20:PRINT "Press space bar to return to menu:";
675 A$=INKEY$:IF A$=CHR$(32) THEN 340 ELSE 675
5000 BEEP:IF ERR<>71 AND ERR<>70 AND ERR<>53 THEN 5010 ELSE LOCATE 10,10:PRINT "Please place EPISTAT in drive A: (or other default).":PRINT TAB(25);"Press any key to continue:"
5005 A$=INKEY$:IF A$="" THEN 5005 ELSE RESUME
5010 ON ERROR GOTO 0
