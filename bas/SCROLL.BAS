10 ' SCROLL.BAS  -  Modified from the listing of DEMO.BAS on page 650 of
20 ' the October 1983 issue of "PC-Magazine"
30 '
40 CLEAR ,16000
50 DEFINT A-Z
60 FOR I = 1 TO 6
70   FOR J = 1 TO 10
80     READ X
90     TOT = TOT + X
100   NEXT
110   READ Y
120   IF TOT = Y THEN TOT = 0 : GOTO 160
130   BEEP
140   PRINT "Error in data statement #";1000 + 10 * (I - 1)
150   STOP
160 NEXT
170 RESTORE
180 DEF SEG = 16000 / 16
190 LOCAT = 0
200 FOR I = 1 TO 6
210   FOR J = 1 TO 10
220     READ X
230     POKE LOCAT,X
240     LOCAT = LOCAT + 1
250   NEXT
260   READ X
270 NEXT
280 BSAVE "SCROLL.BIN",0,60
290 CLS
300 PRINT "Subroutine file SCROLL.BIN created"
310 PRINT
320 PRINT "Hit ENTER for demo."
330 K$ = INKEY$
340 IF K$ < > CHR$(13) THEN 330
350 CLS
360 DEF SEG = 16000 / 16
370 BLOAD "SCROLL.BIN",0
380 FOR I = 1 TO 10
390   FOR J = 1 TO 16:PRINT "DEMO ";
400   NEXT
410 NEXT
420 OFFSET = 0
430 A = 7
440 B = 1
450 C = 0
460 D = 19
470 E = 22
480 F = 59
490 G = 32
500 FOR I = 1 TO 11
510   CALL OFFSET(A,B,C,D,E,F,G)
520   SOUND 32767,18
530 NEXT
540 IF A = 7 THEN A = 6 : GOTO 500
550 SOUND 32767,18
560 B = 0
570 C = 0
580 D = 19
590 E = 4
600 F = 59
610 CALL OFFSET(A,B,C,D,E,F,G)
620 SOUND 32767,18
630 B = 0
640 C = 5
650 D = 19
660 E = 9
670 F = 59
680 CALL OFFSET(A,B,C,D,E,F,G)
690 FOR I = 1 TO 5
700   B = 0
710   C = 5
720   D = 70 - (2 * I)
730   E = 4 + I
740   F = 68 + (2 * I)
750   CALL OFFSET(A,B,C,D,E,F,G)
760   SOUND 32767,18
770 NEXT
780 END
790 '
800 ' Note: Parameter requirements for SCROLL.BIN subroutine.
810 '
820 ' (All must be integer - explicitly or via DEFINT statement.)
830 '
840 ' OFFSET = Offset (from last DEF SEG) to beginning of routine
850 '          (wherever routine was loaded)
860 ' A      = "6" = "scroll up"
870 '        = "7" = "scroll down"
880 ' B      = number of lines to scroll
890 ' C,D    = row and column of upper left corner of "scroll window"
900 ' E,F    =  "   "    "    "  lower right corner of   "      "
910 ' G      = Attribute to be used on "blanked" lines
920 '
930 ' NOTES:
940 '  (1)   (C,D) and (E,F) are relative to (0,0)
950 '  (2)   None of the parameters are value checked by the subroutine,
960 '        so results of invalid parameters are unpredictable.
970 '  (3)   If B=0 then the entire window is "blanked"
980 '
1000 DATA 85,139,236,139,118,18,139,28,138,227,1267
1010 DATA 139,118,16,139,28,138,195,139,118,14,1044
1020 DATA 139,28,138,235,139,118,12,139,28,138,1114
1030 DATA 203,139,118,10,139,28,138,243,139,118,1275
1040 DATA 8,139,28,138,211,139,118,6,139,28,954
1050 DATA 138,251,179,0,205,16,93,202,14,0,1098
1060 END ' of program.
