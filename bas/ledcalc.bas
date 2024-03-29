10 CLS
20 PRINT "LED Series Resistor Calculations"
30 PRINT
50 PRINT "L = LED series resistor calculation"
60 PRINT "T = Display a table of standard 5% AND 1% resistor values"
70 PRINT "    Enter L or T, or hit ESCape to quit"
80 IN$=INKEY$:IF IN$="" THEN 80
90 IF IN$=CHR$(27) THEN END
110 IF IN$="L" OR IN$="l" THEN GOSUB 200:GOTO 10
120 IF IN$="T" OR IN$="t" THEN GOSUB 800:GOTO 10
130 GOTO 80
190 REM -----
200 PRINT
210 PRINT "Approximate voltage drops of common LEDs at 10-20 mA:"
220 PRINT
230 PRINT "Infrared: 1.9       Blue: 3 to 3.6          White: 3 to 3.6"
240 PRINT "Normal Red: 1.7     Orange/Yellow: 2.0      Green: 2.1"
250 PRINT "High-brightness, high-efficiency, low-current red: 1.9"
260 PRINT
270 INPUT "Enter LED voltage drop ";VLED
280 IF VLED<0 THEN 270
290 INPUT "Enter supply voltage ";VSUP
300 IF VSUP<0 THEN 290
310 INPUT "Enter LED current desired in milliamps ";ILED
320 IF ILED<0 THEN 310
330 R=(VSUP-VLED)/(ILED/1000)
340 W=VSUP*ILED/1000
350 PRINT "Series resistor should be";R;"ohms and at least";W;"watts"
360 GOSUB 600:REM WAIT FOR KEY
370 RETURN
590 REM -----
600 PRINT:PRINT
610 PRINT "Hit any key to continue";
620 IN$=INKEY$:IF IN$="" THEN 620
630 RETURN
770 REM ----------
790 REM DISPLAY TABLE OF STANDARD RESISTOR VALUES
800 PRINT
810 PRINT "Standard 5% resistor base values (divide or multiply by 10 for other values)"
820 RESTORE 1500
830 FOR VALUE=1 TO 24
840 READ R
850 PRINT USING "##";R;:PRINT " ";
860 NEXT VALUE
870 REM ---
880 PRINT:PRINT
890 PRINT "Standard 1% resistor base values (divide or multiply by 10 for other values)"
900 RESTORE 2000
910 COL=0
920 FOR VALUE=1 TO 96
930 READ R
940 PRINT USING "###";R;:PRINT " ";
950 COL=COL+1
960 IF COL=19 THEN COL=0:PRINT
970 NEXT VALUE
980 GOTO 600
990 REM ----------
1000 REM 5% RESISTOR VALUES
1500 DATA 10,11,12,13,15,16,18,20,22,24,27,30,33,36,39
1510 DATA 43,47,51,56,62,68,75,82,91
1980 REM -----
1990 REM 1% RESISTOR VALUES
2000 DATA 100,102,105,107,110,113,115,118,121,124,127
2010 DATA 130,133,137,140,143,147,150,154,158,162,165,169
2020 DATA 174,178,182,187,191,196,200,205,210,215
2030 DATA 221,226,232,237,243,249,255,261,267,274,280
2040 DATA 287,294,301,309,316,324,332,340,348,357,365,374,383,392
2050 DATA 402,412,422,432,442,453,464,475,487,499
2060 DATA 511,523,536,549,562,576,590,604,619,634,649,665,681,698
2070 DATA 715,732,750,768,787,806,825,845,866,887,909,931,953,976

