10 KEY OFF:WIDTH 80
15 'chars.bas to list character equiv. of all ascii/hex/octal on screen
20 PRINT CHR$(12)
30 INPUT "Radix? (8, 10, or 16) ",RADIX
40 IF RADIX = 8 OR RADIX = 10 OR RADIX = 16 THEN 60
50 GOTO 20
60 PRINT CHR$(12)
70 FOR C=0 TO 255
80 LOCATE INT(C-(INT(C/20)*20))+1,INT(C/20)*6+1
90 IF RADIX <> 10 THEN 120
100 PRINT USING "### ";C;
110 GOTO 160
120 IF RADIX <> 16 THEN GOTO 150
130 PRINT USING "\ \ ";HEX$(C);
140 GOTO 160
150 PRINT USING "\ \ ";OCT$(C);
160 IF C = 7 OR (C>=9 AND C<=13) OR (C>=29 AND C<=31)THEN 220
170 COLOR 15
180 PRINT CHR$(C);
190 COLOR 7
200 PRINT CHR$(186)
210 GOTO 260
220 COLOR 15
230 PRINT " ";
240 COLOR 7
250 PRINT CHR$(186)
260 NEXT C
270 LOCATE 25,1
280 PRINT "Strike 'Enter'...";
290 INPUT A$
300 KEY ON
310 END
