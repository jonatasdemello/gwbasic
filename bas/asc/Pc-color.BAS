5 CLS:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 10-57
12 '*****************  COLOR PALETTES AND COLOR CHIPS  ************************
16 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
18 '�                    PC-COLOR PROGRAM DELUXE                              �
20 '�                                                                         �
22 '�    This program was keyed in from the November 1982 PC-Magazine. It     �
24 '� was provided in an article entiled "Color Palettes and Color Chips" by  �
26 '� Karl Koessell. The article started on page 305.  The program allows     �
28 '� users to test monitors before purchasing them. It checks the brilliance �
30 '� of the screen, and demonstrates the color combinations which are avail- �
32 '� able on the IBM-PC. It permits the viewer to determine the clarity and  �
34 '� resolution of the WIDTH 80 presentation -- important if you plan to do  �
35 '� extensive word-processing or detailed programming. This program has no  �
36 '� commercial application and is provided as a service for personal use    �
37 '� and color monitor evaluation.   Author: Karl Koessell, address unknown. �
38 '�                G  I  N  A  C  O -- 1983                   Ver 5.2/320k  �
50 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLS:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT
100 KEY OFF
110 DEFINT A-Z
120 GOSUB 230               ' define pointers for function keys
130 FK=7                    ' Initialize variables
140 PALETTE = 1
150 '* * * * MAIN LOOP * * * * * * * * * *
160 GOSUB 490 ' change display?
170           ' change background color or ....
180 IF SCR THEN GOSUB 1990 ELSE GOSUB 1210 '.. change border color
190 FOR PAUSE=1 TO 2000  'Pause a while
200 NEXT
210 GOTO 160 'Go thru main loop again
220 '*************************************************************
230 ON KEY(1) GOSUB 380
240 ON KEY(2) GOSUB 390
250 ON KEY(3) GOSUB 400
260 ON KEY(4) GOSUB 410
270 ON KEY(5) GOSUB 420
280 ON KEY(6) GOSUB 430
290 ON KEY(7) GOSUB 440
300 ON KEY(8) GOSUB 450
310 ON KEY(9) GOSUB 460
320 ON KEY(10) GOSUB 470
330 FOR FK=1 TO 10  ' Activate all
340     KEY(FK) ON    ' ten function keys
350 NEXT
360 RETURN
370 '****** Flag FK set by function key
380 FK=1:RETURN
390 FK=2:RETURN
400 FK=3:RETURN
410 FK=4:RETURN
420 FK=5:RETURN
430 FK=6:RETURN
440 FK=7:RETURN
450 FK=8:RETURN
460 FK=9:RETURN
470 FK=10:RETURN
480 ' If FK, change display accordingly
490 ON FK GOSUB 520,600,640,640,690,740,790,880,970,1020
500 RETURN
510 '****** DISPLAYS AVAILABLE *******
520 FK=0  'Toggle between screens 0 & 1
530      SCR = (SCR+1) MOD 2
540 ' Either prepare text mode or...
550      IF SCR=0 THEN GOSUB 790: RETURN
560 ' ... Prepare med. res. graphics mode
570      W=0    'Clear text mode flag
580 GOSUB 1560
590 RETURN
600 FK=0 'Change palette, graphics only
610      PALETTE=(PALETTE+1) MOD 2
620      GOSUB 2030 'Update palette info
630      RETURN
640 ON FK GOTO 680,650,640,670  ' PAUSE
650      GOSUB 490  ' Change display
660      GOTO 640   ' Still pausing
670      FK=0 'Continue background/border cycle
680      RETURN
690 FK=0 'Rowed foreground
700      IF RB=0 OR W=41 THEN RETURN
710      RB=0 'Clear rowed background flag
720      GOSUB 1300 'Print text display
730      RETURN
740 FK=0 'Rowed background
750      IF RB=1 OR W=41 THEN RETURN
760      RB=1 'Set rowed background
770      GOSUB 1300
780      RETURN
790 FK=0 'Width 40 text
800      IF W=1 THEN RETURN
810      WIDTH 40
820      W=1 'Flag set to middle of column
830      V=9 'First line of text
840      GOSUB 1080 'Prepare text mode
850      GOSUB 1240 'Update border information
860      GOSUB 1300
870      RETURN
880 FK=0 'Width 80 text
890      IF W=41 THEN RETURN
900      WIDTH 80
910      W=41 'Flag set to middle column
920      V=1 'First line of text
930      GOSUB 1080
940      GOSUB 1240
950      GOSUB 1300
960      RETURN
970 FK=0 'Standard characters
980      IF BLINK=0 THEN RETURN
990      BLINK=0 'CLEAR BLINKING FLAG
1000      GOSUB 1300
1010      RETURN
1020 FK=0 'Blinking Characters
1030      IF BLINK=1 THEN RETURN
1040      BLINK=1 'Set blinking flag
1050      GOSUB 1300
1060      RETURN
1070 '******** Text Mode ***********
1080 SCREEN 0,1,0,0
1090 FOR FK=5 TO 10 'Activate last six function keys
1100      KEY(FK) ON
1110 NEXT
1120 KEY(2) OFF 'Deactivate key 2
1130 COLOR 7,0
1140 CLS
1150 LOCATE ,8,0
1160 PRINT "COLOR TEXT (SCREEN 0,1,,)"
1170 PRINT
1180 GOSUB 2120 'Print instructions
1190 RETURN
1200 '********* Change Border Color **********
1210 BORDER=(BORDER+1) MOD 16
1220 GOSUB 1240
1230 RETURN
1240 LOCATE 25,9+W/2
1250 COLOR BORDER,0,BORDER
1260 IF BORDER MOD 8=0 THEN COLOR ,7
1270 PRINT USING " Border is color _,_,## ";BORDER;
1280 RETURN
1290 '********* Print text display ************
1300 LOCATE V,W
1310 IF RB=1 AND W=1 THEN 1390
1320 FOR F=0 TO 15 'Rowed background
1330    LOCATE V+F,W
1340    FOR B=0 TO 7
1350       GOSUB 1510 'Print text
1360 NEXT B,F
1370 IF W=1 THEN 1440 'Skip if WIDTH 40
1380 PRINT " ";
1390 FOR B=0 TO 7 'Rowed background
1400    FOR F=0 TO 15
1410       GOSUB 1510  'Print text
1420 NEXT F,B
1430 'Using monochrome display adapter
1440 DEF SEG=0
1450 IF (PEEK(1040) AND 48)=48 THEN 1490 'If so then all done, otherwise
1460 'color monitor needs a white space in last column of 24th monitor line
1470 DEF SEG=&HB800
1480 POKE 80*24*(1-1*(W=41))-1,64+32+16
1490 RETURN
1500 '********* Text printing routine *********
1510 FG=F+16*BLINK
1520 COLOR FG,B 'SET NEW FORGROUND/BACKGROUND
1530 IF F=15 AND B=7 THEN PRINT "15,7";:GOTO 1550
1540 PRINT USING "##_,# ";FG;B;
1550 RETURN
1560 SCREEN 1,0,0,0
1570 FOR FK=5 TO 10 'Deactivate last six function keys
1580    KEY(FK) OFF
1590 NEXT
1600 KEY(2) ON 'Activate F2 key
1610 LOCATE ,5,0
1620 PRINT "MEDIUM RESOLUTION COLOR GRAPHICS"
1630 PRINT SPC(13)"(SCREEN 1,0,,)"
1640 GOSUB 2120 'Print instructions
1650 LOCATE 9,1
1660 PRINT "Changing palette changes"
1670 PRINT "the 4 foreground colors"
1680 PRINT "displayed at one time."
1690 FOR F=0 TO 3 'Boxes of color
1700    LOCATE 10+F*4,30
1710    PRINT F;"="
1720    TOP=65+F*32  'Top line
1730    BOT=TOP+23   'Bottom line
1740    LINE (272,TOP)-(319,BOT),F,BF
1750 NEXT
1760 LOCATE 13,1
1770 PRINT "For the background and"
1780 PRINT "palette chosen by the"
1790 PRINT "statement COLOR "
1800 PRINT "a foreground number of {"
1810 LOCATE 18,1
1820 PRINT "Text (for SCREEN 1,0,,)"
1830 PRINT "is printed in foreground"
1840 PRINT "color 3, Text is invisible"
1850 PRINT "for COLOR 6,0 and COLOR 7,1"
1860 PRINT "and COLOR 14,0 and COLOR 15,1"
1870 LOCATE 24,12
1880 PRINT "Pallete is COLOR ";
1890 LOCATE 25,10
1900 PRINT "Background is COLOR ";
1910 FOR BRKT=25 TO 31 'Extend brackets
1920    LOCATE 40-BRKT,BRKT
1930    PRINT "/"
1940    LOCATE BRKT-8,BRKT
1950    PRINT "\"
1960 NEXT
1970 RETURN
1980 '********* Change Background Color *********
1990 BACKGROUND=(BACKGROUND+1) MOD 16
2000 GOSUB 2030
2010 RETURN
2020 '********* Update background/palette info ********
2030 LOCATE 15,17
2040 PRINT USING "##_,#";BACKGROUND,PALETTE
2050 LOCATE 24,29
2060 PRINT USING "##_, ";PALETTE;
2070 LOCATE 25,30
2080 PRINT USING "##_, ";BACKGROUND;
2090 COLOR BACKGROUND,PALETTE
2100 RETURN
2110 '******** Function Key Instructions **********
2120 PRINT "[F1] = To Change Mode (TEXT or GRAPHICS)"
2130 IF SCR=0 THEN LOCATE 4,1:GOTO 2150
2140 PRINT SPC(19)"[F2] = Change Palette"
2150 PRINT "[F3] = To Pause    ";
2160 IF SCR=0 THEN PRINT "  ";
2170 PRINT "[F4] = To Continue"
2180 IF SCR THEN 2250
2190 IF W=41 THEN 2210 ' WIDTH 80 has both rowed foreground and rowed background
2200 PRINT "[F5] = Rowed Frgrnd  [F6]= Rowed Bkgrnd"
2210 LOCATE 6,1
2220 PRINT "[F7] = WIDTH 40      [F8] = WIDTH 80"
2230 PRINT "        Foreground chartacter choices:"
2240 PRINT "[F9] = Normal   or   [F10] = Blinking"
2250 RETURN
2260 END
65000 REM ===== SAVE ROUTINE =====
65100 SAVE"B:PC-COLOR.BAS"
