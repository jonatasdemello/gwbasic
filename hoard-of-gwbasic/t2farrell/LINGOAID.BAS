10 KEY OFF:CLS
20 T=1
30 FOR N=1 TO 23
40 PRINT TAB(T)"LINGOAID"
50 T=T+3
60 NEXT N
70 T=72
80 LOCATE 1,1
90 U$="                                                             "
100 FOR N=1 TO 23
110 PRINT TAB(T)"LINGOAID";
120 IF T=<39 THEN PRINT MID$(U$,1,C)
130 T=T-3:C=C+3
140 NEXT N
150 LOCATE 4,10:PRINT "Written by";
160 LOCATE 5,10:PRINT "Troy Farrell &";
170 LOCATE 6,10:PRINT "Jeff Wilson";
180 LOCATE 18,50:PRINT "Copyright (C) 1988";
190 LOCATE 19,50:PRINT "T.J. Software Company Ltd.";
200 FOR Q=1 TO 2000:NEXT Q
210 DIM A$(200),B$(200),C$(200),D$(200)
220 N=0:I=0:RESTORE:CLEAR
230 FOR N=1 TO 15
240 X=INT(RND(1)*840)+500
250 SOUND X,1.25
260 NEXT N
270 CLS
280 LOCATE 7,31:PRINT "ษอออออออออออออออออป"
290 LOCATE 8,31:PRINT "บ    MAIN MENU    บ"
300 LOCATE 9,31:PRINT "ฬอออออออออออออออออน"
310 LOCATE 10,31:PRINT "บ A  Alphabetize  บ"
320 LOCATE 11,31:PRINT "บ E  Enter Names  บ"
330 LOCATE 12,31:PRINT "บ L  Load File    บ"
340 LOCATE 13,31:PRINT "บ S  Save File    บ"
350 LOCATE 14,31:PRINT "บ H  Hardcopy     บ"
360 LOCATE 15,31:PRINT "บ D  Display      บ"
370 LOCATE 16,31:PRINT "บ T  Line edit    บ"
380 LOCATE 17,31:PRINT "บ Q  Quit program บ"
390 LOCATE 18,31:PRINT "ศอออออออออออออออออผ"
400 LOCATE 20,31:PRINT "ฎEnter your choiceฏ ";
410 M$=INKEY$
420 IF M$<>"A" AND M$<>"a" AND M$<>"E" AND M$<>"e" AND M$<>"L" AND M$<>"l" AND M$<>"S" AND M$<>"s" AND M$<>"H" AND M$<>"h" AND M$<>"D" AND M$<>"d" AND M$<>"T" AND M$<>"t" AND M$<>"q" AND M$<>"Q" THEN 400
430 IF M$="A" OR M$="a" THEN 510
440 IF M$="E" OR M$="e" THEN 640
450 IF M$="L" OR M$="l" THEN 1040
460 IF M$="H" OR M$="h" THEN 1210
470 IF M$="D" OR M$="d" THEN 950
480 IF M$="S" OR M$="s" THEN 830
490 IF M$="Q" OR M$="q" THEN 1410
500 IF M$="T" OR M$="t" THEN 1560
510 :
520 CLS
530 LOCATE 12,28:PRINT "Sorting process underway"
540 FOR E=1 TO 900:NEXT E
550 FOR PASS=1 TO (I-1)
560 FOR COMP=(PASS+1) TO I
570 IF A$(PASS)>A$(COMP) THEN TEMP$=A$(PASS):A$(PASS)=A$(COMP):A$(COMP)=TEMP$:TEMP$=B$(PASS):B$(PASS)=B$(COMP):B$(COMP)=TEMP$:TEMP$=C$(PASS):C$(PASS)=C$(COMP):C$(COMP)=TEMP$:TEMP$=D$(PASS):D$(PASS)=D$(COMP):D$(COMP)=TEMP$
580 NEXT COMP
590 NEXT PASS
600 CLS
610 LOCATE 13,28:PRINT "Sorting process complete"
620 FOR S=1 TO 900:NEXT S
630 GOTO 270
640 :
650 I=I+1
660 CLS
670 PRINT
680 IF F$="" THEN F$="(new file)":BEEP:BEEP
690 PRINT "This is record number";I;"of file called ";F$
700 PRINT
710 INPUT "Enter the name";A$(I)
720 INPUT "Enter the address";B$(I)
730 INPUT "Enter the postal code";C$(I)
740 INPUT "Enter the phone number";D$(I)
750 PRINT
760 PRINT "Strike <ENTER> to continue or <D> when done ";
770 LINE INPUT C$
780 IF C$="D" OR C$="d" THEN GOTO 270
790 I=I+1
800 GOTO 660
810 :
820 CLS
830 PRINT "Enter filename for data to be saved under: ";
840 LINE INPUT F$
850 IF LEN(F$)>8 THEN PRINT:PRINT "That filename is too long":PRINT "Please try another":PRINT:GOTO 830
860 F$=F$+".DAT"
870 OPEN "O",#1,F$
880 FOR N=1 TO I
890 WRITE #1,A$(N),B$(N),C$(N),D$(N)
900 NEXT N
910 CLOSE #1
920 PRINT "Data has been saved"
930 FOR X=1 TO 900:NEXT X
940 GOTO 270
950 :
960 CLS
970 IF I=0 THEN LOCATE 15,25:PRINT "Sorry, there is no file to display":GOTO 1020
980 FOR R=1 TO I
990 PRINT A$(R);TAB(33)B$(R);TAB(62)C$(R);TAB(71)D$(R)
1000 NEXT R
1010 PRINT:PRINT "Strike <ENTER> to continue ";:LINE INPUT C$
1020 IF I=0 THEN LOCATE 17,29:PRINT "Strike <ENTER> continue ";:LINE INPUT C$
1030 GOTO 270
1040 :
1050 CLS
1060 PRINT
1070 PRINT "Enter name of file to be retrieved: ";
1080 LINE INPUT F$:IF LEN(F$)>8 THEN PRINT:PRINT "That filename is too long":PRINT "Please try another":GOTO 1060
1090 I=0:N=0
1100 F$=F$+".DAT"
1110 OPEN "I",#1,F$
1120 N=N+1
1130 IF EOF(1) THEN 1170
1140 INPUT #1,A$(N),B$(N),C$(N),D$(N)
1150 I=I+1
1160 GOTO 1120
1170 CLOSE #1
1180 PRINT "File has been retrieved"
1190 FOR C=1 TO 200:NEXT C
1200 CLS:GOTO 270
1210 :
1220 CLS:PRINT "Do you want double spacing? (y/n) ";
1230 LINE INPUT Q$
1240 LINE INPUT "Do you want a title? (y/n) ";W$
1250 CLS
1260 IF W$="Y" OR W$="y" THEN LOCATE 12,14:PRINT "Enter the title: ";:LINE INPUT H$
1270 LOCATE 12,14:LINE INPUT "Press <ENTER> to start printing process ";W$
1280 LOCATE 12,14:PRINT "Printing process underway"
1290 P=LEN(H$):P=P/2
1300 LPRINT TAB(40-P)H$
1310 LPRINT:LPRINT:LPRINT
1320 FOR N=1 TO I
1330 LPRINT A$(N);TAB(33)B$(N);TAB(62)C$(N);TAB(71)D$(N)
1340 IF Q$="Y" OR Q$="y" THEN LPRINT
1350 NEXT N
1360 PRINT "Printing process completed"
1370 FOR E=1 TO 900:NEXT E
1380 LOCATE 12,14:LINE INPUT "Would you like another copy (y/n) ";P$
1390 IF P$="Y" OR P$="y" THEN GOTO 1300
1400 GOTO 270
1410 LOCATE 14,25:PRINT "ษออออออออออออออออออออออออออออออออป"
1420 LOCATE 15,25:PRINT "บ  You are about to exit this    บ"
1430 LOCATE 16,25:PRINT "บ  program. Are you sure? (y/n)  บ"
1440 LOCATE 17,25:PRINT "ศออออออออออออออออออออออออออออออออผ"
1450 LOCATE 20,32:LINE INPUT "Enter your choice  ";C$
1460 IF C$="N" OR C$="n" THEN GOTO 270
1470 CLS:LOCATE 14,25:PRINT "ษออออออออออออออออออออออออออออออออออป"
1480 LOCATE 15,25:PRINT "บ  Do you want to exit to <B>asic  บ"
1490 LOCATE 16,25:PRINT "บ  or to <D>os?  Enter (b/d)       บ"
1500 LOCATE 17,25:PRINT "ศออออออออออออออออออออออออออออออออออผ"
1510 LOCATE 20,32:LINE INPUT "Enter your choice  ";C$
1520 IF C$="B" OR C$="b" THEN CLS:GOTO 1550
1530 CLS
1540 SYSTEM
1550 KEY ON:CLS:LOCATE 12,34:PRINT "Session Over":PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:END
1560 CLS:LOCATE 12,10:PRINT "Enter the line number of the string to be edited: ";
1570 LINE INPUT P$
1580 P=VAL(P$)
1590 PRINT:PRINT "Original string: "
1600 PRINT:PRINT A$(P);TAB(30)B$(P);TAB(55)C$(P);TAB(70)D$(P)
1610 PRINT:PRINT "Enter the new name ";
1620 LINE INPUT A$(P)
1630 LINE INPUT "Enter the new address ";B$(P)
1640 LINE INPUT "Enter the new postal code ";C$(P)
1650 LINE INPUT "Enter the new phone number ";D$(P)
1660 CLS:PRINT "Enter filename for changed data to be saved under: ";
1670 LINE INPUT F$
1680 IF LEN(F$)>8 THEN 1660
1690 F$=F$+".dat"
1700 OPEN "O",#1,F$
1710 FOR N=1 TO I
1720 WRITE #1,A$(N),B$(N),C$(N),D$(N)
1730 NEXT N
1740 CLOSE #1
1750 PRINT "Changed data has been saved"
1760 FOR X=1 TO 900:NEXT X
1770 GOTO 270
