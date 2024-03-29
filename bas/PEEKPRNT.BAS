5 CLS:KEY OFF:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 10-57
12 '*****************  MEMORY PEEKER/HEX CONVERTER IBM  ***********************
16 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
18 '�               R.A.M/R.O.M PEEK ROUTINE & HEX$ CONVERTER                 �
20 '�                                                                         �
22 '�    This dual purpose program will peek into designated RAM and ROM      �
24 '� areas and return the decimal value at the location. You may specify     �
26 '� the range in either HEX$ or DECIMAL.  The range is entered as two #'s   �
28 '� separated by a comma. I.E:, &H34,&H49 or 234,400.  The appropriate      �
30 '� memory values will be displayed on the screen in an array.              �
31 '�    The HEX$/DEC converter also allows input in either HEX$ or DECIMAL.  �
32 '� The range requested will be printed on the screen and then routed to    �
33 '� the printer. Certain HEX$ ranges can cause the printer to do strange    �
34 '� things.  If this happens during the printout, turn the printer OFF/ON   �
36 '� and the situation will be corrected.  This program may be used in whole �
37 '� or in part without attribution. (c) G I N A C O -- 1983 Ver 5.2/160/320 �
38 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLS:KEY OFF
70  SCREEN 0,0,0
80   WIDTH 80
90    CLEAR
100     FOR I! = 1 TO 10
110        KEY I!,""
120       NEXT
130 CLEAR
140  LPRINT CHR$(27); CHR$(64);
150   PRINT
160    PRINT
170     LOCATE 12,20
180      PRINT "FOR PEEK-POKE DISPLAY AND PRINTOUT <ENTER> 1"
190       LOCATE 14,20
200        PRINT "FOR DEC/HEX CONVERSION & PRINTOUT <ENTER> 2"
210         LOCATE 17,40
220          INPUT X!
230           ON X! GOTO 240,530
240 CLS
250  WIDTH "LPT1:",80
260   LOCATE 10,21
270    PRINT "INDICATE RANGE OF PEEK-READ AND PRINTOUT"
280     LOCATE 12,24
290      PRINT "ENTER RANGE IN DECIMAL OR HEX FORM"
300       LOCATE 14,28
310        PRINT "i.e;, 300,310  or  &H20,&H30"
320         LOCATE 16,21
330          PRINT "THE PRINTOUT WILL SHOW THE DECIMAL VALUE"
340 LOCATE 17,18
350  PRINT "OF THE DESIGNATED (DEC OR HEX) MEMORY LOCATION"
360   LOCATE 19,40
370    INPUT A!,B!
380     CLS
390      FOR I! = A! TO B!
400         PRINT I!;" "; PEEK(I!),
410        NEXT
420         FOR I! = A! TO B!
430            LPRINT I!;" "; PEEK(I!),
440           NEXT
450            LOCATE 24,2
460             PRINT "<ENTER 1> FOR ANOTHER PEEK DISPLAY";
470 LOCATE 24,44
480  PRINT "<ENTER 2> FOR A HEX/DEC CONVERSION";
490 LPRINT CHR$(13)
500  INPUT Y!
510   ON Y! GOTO 240,530
520 CLS
530 REM ********** DECIMAL/HEXIDECIMAL CONVERSION -- TWO WAY *****************
540 CLS
550  LOCATE 6,20
560   PRINT "INDICATE RANGE OF DESIRED HEX$/DEC DISPLAY"
570    LOCATE 8,20
580     PRINT "YOU MAY ENTER RANGE IN DECIMAL OR HEX FORM"
590      LOCATE 10,28
600       PRINT "i.e;, 300,310  or  &H20,&H30"
610        LOCATE 12,23
620         PRINT "THE PRINTOUT SHOWS THE DECIMAL VALUES"
630 LOCATE 13,30
640  PRINT "OF THE RANGE REQUESTED."
650   LOCATE 15,26
660    PRINT "TURN PRINTER ON AND SET PAPER"
670     LOCATE 17,31
680      PRINT "DEC/HEX NUMBER RANGE "
690       LOCATE 19,40
700        INPUT A!,B!
710         CLS
720          FOR X! = A! TO B!
730             A$ = HEX$(X!)
740              PRINT TAB( 25)"DEC    "X!"  IS    "A$"   HEX$"
750             NEXT
760 FOR X! = A! TO B!
770    A$ = HEX$(X!)
780     LPRINT TAB( 10)"DEC    "X!"  IS    "A$"   HEX$"
790    NEXT
800     LOCATE 24,2
810      PRINT "<ENTER 1> FOR ANOTHER CONVERSION";
820       LOCATE 24,42
830        PRINT "<ENTER 2> FOR PEEK/PRINT DISPLAY ";
840         INPUT Y!
850          ON Y! GOTO 530,240
860 CLS
870  END
65000 REM ***********************    SAVE ROUTINE    **************************
65100 SAVE"B:PEEKPRNT.BAS"
