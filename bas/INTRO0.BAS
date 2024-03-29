0' ====> INTRO.bas
1 DEF SEG=0:IF (PEEK(&H410) AND &H20)=&H20 THEN 5
2 CLS:LOCATE 5,5:PRINT "Whoa!  This program requires an":LOCATE 7,11:PRINT "80 column display!":LOCATE 9,5:PRINT "You better check your switches!"
3 PLAY "t255l64":FOR I=1 TO 3:FOR O=2 TO 4:PLAY "o=o;cc+dd+eff+gg+aa+b":NEXT:FOR O=4 TO 2 STEP -1:PLAY"o=o;ba+ag+gf+fed+dc+d":NEXT:NEXT
4 SYSTEM
5 ON ERROR GOTO 7
6 OPEN"i",#1,"data.dat":INPUT#1,MONO,LSN$,PAGE:CLOSE:GOTO 9
7 DEF SEG=0:CONFIG=PEEK(&H410):IF (CONFIG AND &H30)=&H30 THEN MONO=-1
8 OPEN"o",#1,"data.dat":WRITE#1,MONO,"0",0:CLOSE:RESUME 9
9 ON ERROR GOTO 0
10 IF MONO THEN C1=7:C2=0:C3=8:C4=2 ELSE C1=(VAL(RIGHT$(TIME$,2)) MOD 6)+2:C2=0:C4=0:C3=(C1+2)+(6*(C1>5))
11 SCREEN 0,0,0:COLOR C2,C1:KEY OFF:LOCATE ,,0:CLS
12 TEMP$=CHR$(31)+CHR$(29)+CHR$(178)
13 TASSLE$=CHR$(218)+CHR$(31)+CHR$(29)+CHR$(179)+CHR$(31)+CHR$(29)+CHR$(234)+TEMP$+TEMP$+TEMP$+TEMP$+TEMP$+TEMP$+TEMP$+TEMP$+TEMP$
14 TEMP$=CHR$(31)+CHR$(29)+CHR$(32)
15 ELSSAT$=CHR$(32)+TEMP$+TEMP$+TEMP$+TEMP$+TEMP$+TEMP$+TEMP$+TEMP$+TEMP$+TEMP$+TEMP$
16 PLAY "mbmnt100o2l2gl8f+gl4al2edco1l8bo2cl4do1l1al2bo2l8c#l4dl8el2adgl8gl4f+l8el1d"
17 FOR C=1 TO 60
18 FOR I=1 TO 100:NEXT I
19 LOCATE 6,C:PRINT CHR$(219):IF C<7 THEN 26
20 LOCATE 7,C-6:PRINT CHR$(219):IF C<20 THEN 26
21 LOCATE 5,C-19:PRINT CHR$(219):IF C<22 THEN 26
22 LOCATE 5,C-21:PRINT CHR$(196):IF C<35 THEN 26
23 LOCATE 7,C-34:PRINT CHR$(32):IF C<41 THEN 26
24 LOCATE 5,C-40:PRINT TASSLE$:IF C<42 THEN 26
25 LOCATE 5,C-41:PRINT ELSSAT$
26 NEXT C
27 LOCATE 9,28:PRINT "The PC-Prof. (TM) presents":PLAY "mfo2l2gl8f+gl4al2ed"
28 LOCATE 11,34:PRINT "The BASIC Prof.":PLAY "co1l8bo2cl4do1l1a"
29 LOCATE 13,34:PRINT "Beginning BASIC":PLAY "l2bo2l8c#l4dl8el2ad"
30 LOCATE 15,22:PRINT "Copyright (c) 1983  EAGLE Software, Inc.":PLAY "gl8gl4f+l8el1d"
31 SCREEN 0,0,0:WIDTH 80:KEY OFF:COLOR C1,C2:CLS
32 LOCATE 1,1:PRINT "Introduction to the BASIC Prof."
33 LOCATE 3,9:PRINT "You are about to begin a fascinating learning experience, actually"
34 PRINT "programming a computer in ";:COLOR C3,C4:PRINT "BASIC";:COLOR C1,C2:PRINT " language.  Within a short period of time, you"
35 PRINT "will understand the fundamental concepts of ";:COLOR C3,C4:PRINT "BASIC";:COLOR C1,C2:PRINT "."
36 LOCATE 7,9:PRINT "The tutorial is designed to gradually increase in complexity and"
37 PRINT "difficulty.  The concepts you learn early on will be the building blocks for"
38 PRINT "what comes later, so carefully review until you have a thorough understanding"
39 PRINT "of each piece of new material."
40 LOCATE 12,9:PRINT "Don't be afraid to make mistakes.  Often times your mistakes will help"
41 PRINT "you better understand a difficult concept.  However, read each screen of text"
42 PRINT "through completely before following the instructions.  This will lessen your"
43 PRINT "chances of misunderstanding the information."
44 LOCATE 17,9:PRINT "Some words on the screen should be ";:COLOR C3,C4:PRINT "brighter or of a different"
45 PRINT "color";:COLOR C1,C2:PRINT " than the rest.  ";:COLOR C2,C1:PRINT "This sentence should also be reversed."
46 LOCATE 20,9:COLOR C1,C2:PRINT "Does this look O.K. to you?  (Press ";:COLOR C3,C4:PRINT "Y";:COLOR C1,C2:PRINT " or ";:COLOR C3,C4:PRINT "N";:COLOR C1,C2:PRINT " please.)"
47 IF INKEY$<>"" THEN 47
48 CHOICE$=INKEY$:IF CHOICE$="" THEN 48
49 IF CHOICE$="Y" OR CHOICE$="y" THEN CHAIN"a0"
50 MONO=NOT MONO:IF MONO THEN C1=7:C2=0:C3=8:C4=2 ELSE C1=(VAL(RIGHT$(TIME$,2)) MOD 6)+2:C2=0:C4=0:C3=(C1+2)+(6*(C1>5))
51 OPEN"o",#1,"data.dat":WRITE#1,MONO,"0","0":CLOSE:GOTO 31
