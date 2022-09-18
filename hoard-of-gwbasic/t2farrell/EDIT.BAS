10 ' EDIT
20 ' T.J. Software Co. Ltd.
30 ' (C) 1988
40 KEY OFF:CLS
50 T=1
60 FOR N=1 TO 23
70 PRINT TAB(T)"  EDIT  "
80 T=T+3
90 NEXT N
100 T=72
110 LOCATE 1,1
120 U$="                                                             "
130 FOR N=1 TO 23
140 PRINT TAB(T)"  EDIT  ";
150 IF T=<39 THEN PRINT MID$(U$,1,C)
160 T=T-3:C=C+3
170 NEXT N
180 LOCATE 4,10:PRINT "Written by";
190 LOCATE 5,10:PRINT "Troy Farrell &";
200 LOCATE 6,10:PRINT "Jeff Wilson";
210 LOCATE 18,50:PRINT "Copyright (C) 1988";
220 LOCATE 19,50:PRINT "T.J. Software Company Ltd.";
230 FOR Q=1 TO 2000:NEXT Q
240 CLS
250 LOCATE 11,36:PRINT "ษออออออป"
260 LOCATE 12,36:PRINT "บ EDIT บ"
270 LOCATE 13,36:PRINT "ศออออออผ"
280 CLEAR:N=0
290 DIM A$(500)
300 FOR TM=1 TO 800:NEXT TM
310 CLS
320 SOUND 3100,2:SOUND 2000,2
330 PRINT:PRINT
340 LOCATE 25,7:PRINT"DOT COMMANDS:   .H(elp)   .R   .V   .C   .D   .I   .L   .S   .P   .X"
350 LOCATE 1,32:PRINT " EDIT COMMANDS "
360 PRINT
370 GOSUB 630
380 PRINT
390 PRINT "                                                                              v"
400 N=1
410 PRINT USING "##";N;:PRINT ": ";:LINE INPUT A$(N):SOUND 4000,.65
420 IF A$(N)<>".h" AND A$(N)<>".H" THEN 510
430 IF A$(N)=".h" OR A$(N)=".H" THEN PRINT:PRINT"* Help Commands *":PRINT
440 PRINT ".H = Help commands   .R = Restart"
450 PRINT ".V = View file       .C = Change Line"
460 PRINT ".D = Delete line     .I = Insert line"
470 PRINT ".L = Load file       .S = Save file"
480 PRINT ".P = Print file      .X = Exit EDIT"
490 PRINT:PRINT "* Continue *":PRINT
500 GOTO 410
510 IF A$(N)=".r" OR A$(N)=".R" THEN GOTO 700
520 IF A$(N)=".v" OR A$(N)=".V" THEN GOTO 800
530 IF A$(N)=".c" OR A$(N)=".C" THEN GOTO 870
540 IF A$(N)=".d" OR A$(N)=".D" THEN GOTO 980
550 IF A$(N)=".i" OR A$(N)=".I" THEN GOTO 1090
560 IF A$(N)=".l" OR A$(N)=".L" THEN GOTO 1200
570 IF A$(N)=".s" OR A$(N)=".S" THEN GOTO 1330
580 IF A$(N)=".x" OR A$(N)=".X" THEN GOTO 1450
590 IF A$(N)=".p" OR A$(N)=".P" THEN GOTO 1520
600 IF LEN(A$(N)) > 75 THEN PRINT:PRINT "* Last line too long *":PRINT:SOUND 100,10:GOTO 410
610 N=N+1:IF N>499 THEN CLS:LOCATE 12,10:PRINT "Memory Full":FOR Q=1 TO 1000:NEXT Q:N=500:GOTO 410
620 GOTO 410
630 ' HELP COMMAND LIST
640 PRINT "                     .H = Help commands   .R = Restart"
650 PRINT "                     .V = View file       .C = Change Line"
660 PRINT "                     .D = Delete line     .I = Insert line"
670 PRINT "                     .L = Load file       .S = Save file"
680 PRINT "                     .P = Print file      .X = Exit EDIT"
690 RETURN
700 ' RESTART ROUTINE
710 PRINT:PRINT "* Restart *":PRINT
720 PRINT "You are about to Restart the file.  All current data will be lost."
730 PRINT "Are you sure you want to restart? (y/n)                                         > ";
740 LINE INPUT IN$
750 IF IN$="n" OR IN$="N" THEN PRINT:PRINT "* Continue *":PRINT:GOTO 410
760 IF IN$="y" OR IN$="Y" THEN PRINT:PRINT "* Memory now being Deleted *"
770 FOR TM=1 TO 800:NEXT TM
780 N=0:CLEAR
790 GOTO 280
800 ' VIEW FILE ROUTINE
810 PRINT:PRINT "* View file *":PRINT
820 FOR TM=1 TO N-1
830 PRINT USING "##";TM;:PRINT ": ";A$(TM)
840 NEXT TM
850 PRINT:PRINT "* Continue *":PRINT
860 GOTO 410
870 ' CHANGE LINE ROUTINE
880 PRINT:PRINT "* Change line *":PRINT
890 LINE INPUT "What Line # do you wish to change? (0 to abort)                                 > ";Y$
900 Y=VAL(Y$)
910 IF Y=0 THEN PRINT:PRINT"* Change line aborted *":PRINT:PRINT "* Continue *":PRINT:GOTO 970
920 IF Y>N-1 THEN PRINT:GOTO 890
930 PRINT:PRINT "Old String: "
940 PRINT USING "##";Y;:PRINT ": ";A$(Y)
950 PRINT:PRINT "Enter the new string: ":PRINT USING "##";Y;:PRINT ": ";:LINE INPUT A$(Y)
960 PRINT:PRINT "* Change made *":PRINT:PRINT "* Continue *":PRINT
970 GOTO 410
980 ' DELETE LINE ROUTINE
990 PRINT:PRINT "* Delete line *":PRINT
1000 LINE INPUT "What Line # do you wish to delete? (0 to abort)                                 > ";Y$
1010 Y=VAL(Y$)
1020 IF Y=0 THEN PRINT:PRINT "* Delete line aborted *":PRINT:PRINT "* Continue *":PRINT:GOTO 410
1030 IF Y>N-1 THEN PRINT:GOTO 1000
1040 PRINT:PRINT USING "##";Y;:PRINT ": ";A$(Y)
1050 PRINT:LINE INPUT "Is it OK to delete this line? (y/n)                                             > ";IN$
1060 IF IN$="n" OR IN$="N" THEN PRINT:PRINT "* Delete line aborted *":PRINT:PRINT "* Continue *":PRINT:GOTO 410
1070 IF IN$="y" OR IN$="Y" THEN FOR X=Y TO N:A$(X)=A$(X+1):NEXT X:A$(N)="":N=N-1
1080 PRINT:PRINT "* Line Deleted *":PRINT:PRINT "* Continue *":PRINT:GOTO 410
1090 ' INSERT LINE ROUTINE
1100 PRINT:PRINT "* Insert line *":PRINT
1110 LINE INPUT "What Line # do you wish to insert after? (0 to abort)                           > ";Y$
1120 Y=VAL(Y$)
1130 IF Y=0 THEN PRINT:PRINT "* Insert line aborted *":PRINT:PRINT "* Continue *":PRINT:GOTO 410
1140 IF Y>N-1 THEN PRINT:GOTO 1110
1150 PRINT:LINE INPUT "Are you sure? (y/n)                                                             > ";IN$
1160 IF IN$="n" OR IN$="N" THEN PRINT:GOTO 1110
1170 IF IN$="y" OR IN$="Y" THEN FOR X=N TO Y STEP -1:A$(X+1)=A$(X):NEXT X:N=N+1
1180 PRINT:PRINT USING "##";Y+1;:PRINT ": ";:LINE INPUT A$(Y+1)
1190 PRINT:PRINT "* Line has been inserted *":PRINT:PRINT "* Continue *":PRINT:GOTO 410
1200 ' LOAD FILE ROUTINE
1210 PRINT:PRINT "* Load file *":PRINT
1220 PRINT"Enter the name of the file to be retrieved: (0 to abort)                        > ";:LINE INPUT F$
1230 IF F$="0" THEN PRINT:PRINT "* Load file aborted *":PRINT:PRINT "* Continue *":PRINT:GOTO 410
1240 IF LEN(F$)>8 THEN PRINT:GOTO 1220
1250 F$=F$+".edt"
1260 OPEN "I",#1,F$
1270 N=1
1280 INPUT #1,A$(N)
1290 IF EOF(1) THEN 1310
1300 N=N+1: GOTO 1280
1310 CLOSE #1
1320 N=N+1:PRINT:PRINT "* File has been retrieved *":PRINT:PRINT "* Continue *":PRINT:GOTO 410
1330 ' SAVE FILE ROUTINE
1340 PRINT:PRINT "* Save file *":PRINT
1350 PRINT"Enter the filename for data to be saved under:                                  > ";:LINE INPUT F$
1360 IF F$="0" THEN PRINT:PRINT "* Save file aborted *":PRINT:PRINT "* Continue *":PRINT:GOTO 410
1370 IF LEN(F$)>8 THEN PRINT:GOTO 1350
1380 F$=F$+".edt"
1390 OPEN "O",#1,F$
1400 FOR I=1 TO N-1
1410 WRITE #1,A$(I)
1420 NEXT I
1430 CLOSE #1
1440 PRINT:PRINT "* File has been saved *":PRINT:PRINT "* Continue *":PRINT:GOTO 410
1450 ' EXIT ROUTINE
1460 PRINT:PRINT"* Exit *":PRINT
1470 PRINT "You are about to exit EDIT.  Make sure you have saved your file because all     current data will be lost."
1480 PRINT:PRINT "Exit? (y/n)                                                                     > ";:LINE INPUT IN$
1490 IF IN$= "n" OR IN$="N" THEN PRINT:PRINT "* Exit aborted *":PRINT"* Continue *":PRINT:GOTO 410
1500 CLS:KEY ON
1510 END
1520 ' PRINT ROUTINE
1530 PRINT:PRINT "* Print file *":PRINT
1540 PRINT "Are you sure you want to print the current file now?                            > ";:LINE INPUT LP$
1550 IF LP$="n" OR LP$="N" THEN PRINT:PRINT "* Continue *":PRINT:GOTO 410
1560 PRINT:PRINT "Do you want to print a range of lines or complete file? (r/c)                   > ";:LINE INPUT B$
1570 IF B$="c" OR B$="C" THEN R1=1:R2=N-1:GOTO 1600
1580 IF B$= "r" OR B$="R" THEN PRINT:PRINT "Print from line # ";:LINE INPUT R1$:PRINT "        to line # ";:LINE INPUT R2$
1590 R1=VAL(R1$):R2=VAL(R2$)
1600 PRINT
1610 PRINT "Do you want double spacing? (y/n)                                               > ";:LINE INPUT IN$
1620 PRINT:PRINT "Press <ENTER> to start printing ";:LINE INPUT LP$
1630 PRINT:PRINT "* Printing process underway *":PRINT
1640 LC=0
1650 FOR D=R1 TO R2
1660 LPRINT A$(D)
1670 IF IN$="y" OR IN$="Y" THEN LPRINT
1680 IF IN$="y" OR IN$="Y" THEN LC=LC+2 ELSE LC=LC+1
1690 IF LC=58 THEN FOR LC=1 TO 8:LPRINT:NEXT LC:LC=0
1700 NEXT D
1710 PRINT "* Printing process completed *":PRINT:PRINT "* Continue *":PRINT:GOTO 410
