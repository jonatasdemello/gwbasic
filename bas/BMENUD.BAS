10 '
20 ' DO NOT RENUM OR RENAME OR COMPILE THIS PROGRAM.
30 '
40 ' BASIC MENU PROGRAM. VERSION 1.0
50 ' A MAXIMUM OF 112 BASIC FILES WILL BE HANDLED BY THIS PROGRAM.
60 ' SEE BMENU.DOC FOR MORE INFORMATION. BOB STEPHENS  SAN JOSE 12/1/82
70 DEFINT A-Z
80 DIM ARRAY$(113)
90 SCREEN 0:KEY OFF :KEY 10,"RUN"+CHR$(34)+"BMENUD"+CHR$(13)
110 ' THE FOLLOWING STATEMENTS WILL BE MODIFIED WITH OPTION 99
500 'BEGIN
510 CLS:COLOR 0,7: PRINT "         PROGRAM INFORMATION         ":COLOR 7,0
520 PRINT "This program provides a sorted menu"
530 PRINT "display of the BASIC programs on your"
540 PRINT "diskette and allows for menu selected"
550 PRINT "execution of the BASIC programs."
560 PRINT " "
570 PRINT "Option 99 is used whenever BASIC"
580 PRINT "programs are added or deleted from the"
590 PRINT "diskette. While option 99 is slow to"
600 PRINT "execute the result will be a high"
610 PRINT "performance (for BASIC) menu program."
620 PRINT "Option 99 will create and kill file"
630 PRINT "BMENU.TMP and will modify itself."
640 PRINT "Be sure the default drive (set by DOS)"
650 PRINT "is the same as the drive containing"
660 PRINT "the menu program."
670 PRINT
680 COLOR 0,7:PRINT "Do not renum or change the name of this"
690 PRINT "program. This message will self        "
700 PRINT "destruct (forever) when you ENTER.     ":COLOR 7,0:PRINT
710 PRINT "          BOB STEPHENS SAN JOSE 12/1/82"
720 PRINT
730 INPUT "Press ENTER to continue...",A$
740 GOTO 1190
999 ' END
1000 ' END OF MODIFIED AREA
1005 CLS:IF ARRAY$(64)="" THEN WIDTH 40 ELSE WIDTH 80
1010 P=0:I=0:CLS:LOCATE 1,4:COLOR 14,0
1020 PRINT "BASIC programs on this diskette:"
1030 FOR DC=1 TO 66 STEP 13
1040  FOR DR=3 TO 23
1050   I=I+1
1060   IF ARRAY$(I)="" THEN 1110 ELSE LOCATE DR,DC
1070   COLOR 0,7:PRINT USING "###";I;
1080   COLOR 7,0:PRINT " ";ARRAY$(I)
1090  NEXT DR
1100 NEXT DC
1110 LOCATE 24,1:PRINT "Enter 99 to update menu";
1120 LOCATE 25,1:INPUT "Enter number of program desired: ",P
1130 IF P < 1 OR P >= I THEN 1170
1140 WIDTH 80:CLS:PRINT "Press F10 to return to menu when finished"
1150 PRINT "or enter RUN";:PRINT CHR$(34);:PRINT "BMENUD if F10 is changed."
1160 RUN ARRAY$(P)
1170 IF P=99 THEN 1190 ELSE 110
1180 ' MENU UPDATE AREA
1190 WIDTH 80:ON ERROR GOTO 1640
1200 KILL "BMENU.TMP"
1210 ON ERROR GOTO 0
1220 CLS
1230 FILES "*.BAS":AR=0
1240 PRINT:PRINT:PRINT "Reading files":PRINT
1250 FOR I=1 TO 113
1260  ARRAY$(I)=""
1270 NEXT I
1280 FOR DR=1 TO 24
1290  FOR DC=0 TO 65 STEP 13
1300   IF CHR$(SCREEN(DR,DC+1)) = " " THEN 1380
1310   AR=AR+1:IF AR=113 THEN PRINT "To many files":END
1320   FOR L=1 TO 8
1330    ARRAY$(AR)=ARRAY$(AR)+CHR$(SCREEN(DR,DC+L))
1340   NEXT L
1350  NEXT DC
1360 NEXT DR
1370 ' SORT
1380 CKSW=1
1390 PRINT "Sorting in BMENU.TMP";
1400 WHILE CKSW=1:CKSW=0
1410  FOR I=2 TO AR
1420   IF ARRAY$(I-1)>ARRAY$(I) THEN CKSW=1:SWAP ARRAY$(I-1),ARRAY$(I)
1430  NEXT I
1440 WEND
1450 ON ERROR GOTO 1600
1460 OPEN "BMENU.TMP" FOR OUTPUT AS #1
1470 ON ERROR GOTO 0
1480 PRINT #1,"500 'BEGIN"
1490 FOR I=1 TO AR
1500  IF ARRAY$(I)="" THEN 1530
1510  PRINT #1,STR$(I+500) + " ARRAY$(" + STR$(I) + " )=" + CHR$(34) + ARRAY$(I) + CHR$(34)
1520 NEXT I
1530 PRINT #1,"999 'END"
1540 ON ERROR GOTO 1650
1550 CLOSE
1560 CHAIN MERGE "BMENU.TMP",1570,ALL,DELETE 500-999
1570 KILL "BMENU.TMP"
1580 SAVE "BMENUD
1590 GOTO 90
1600 IF (ERR=70) AND (ERL=1460) THEN RESUME 1610 ELSE ON ERROR GOTO 0
1610 CLS:PRINT "The disk is write protected!"
1620 PRINT "Remove tab and press F10 or abort the program.":PRINT
1630 KEY ON:END
1640 IF (ERR=53) AND (ERL=1200) THEN RESUME NEXT ELSE ON ERROR GOTO 0
1650 IF (ERR=5) AND (ERL=1560) THEN RESUME 1660 ELSE ON ERROR GOTO 0
1660 ON ERROR GOTO 0:CHAIN MERGE "BMENU.TMP",1570,ALL:GOTO 1570
