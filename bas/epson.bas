100 REM **********************************************************************
110 REM FILE NAME  - EPSON.BAS
120 REM
130 REM WRITTEN BY - GARY PEEK
140 REM              3201 HIGHGATE
150 REM              ST. CHARLES, MO.  63301
160 REM              314 946-5272
170 REM
180 REM LAST UPDATE - 1/27/92
190 REM
200 REM DESCRIPTION - SET SOME OF THE PRINT OPTIONS ON MOST EPSON PRINTERS
210 REM
220 REM PLEASE NOTE - PERMISSION IS GRANTED TO COPY THIS PROGRAM ONLY IF
230 REM               COPIED IN ITS ENTIRETY INCLUDING THIS HEADING.
240 REM
250 REM **********************************************************************
260 CLS
270 PRINT "SELECT EPSON PRINTER OPTIONS-"
280 PRINT
290 PRINT "1. 132 CHARACTERS PER LINE     (COMPRESSED)"
300 PRINT "2. VERY SMALL PRINT            (COMPRESSED, SUPERSCRIPT, 5/216 LF)"
310 PRINT "3. LARGE PRINT                 (DOUBLE-STRIKE, EMPHASIZED, EXPANDED)"
320 PRINT "4. RESET TO REGULAR PRINT      (SINGLE STRIKE PICA)"
330 PRINT "5. EXIT"
340 PRINT
350 LOCATE 9,1:PRINT "WHICH OPTION - 1,2,3,4 OR 5                           ";
360 LOCATE 9,30:INPUT OPT$
370 IF VAL(OPT$)=0 OR VAL(OPT$)>5 THEN GOTO 350
380 ON VAL(OPT$) GOSUB 430,440,450,460,510
390 PRINT
400 PRINT "OPTION ";OPT$;" SELECTED!"
410 PRINT
420 END
430 GOSUB 460:LPRINT CHR$(15);:RETURN
440 GOSUB 460:LPRINT CHR$(15);CHR$(27);"S0";CHR$(27);"3";CHR$(15);:RETURN
450 GOSUB 460:LPRINT CHR$(27);"G";CHR$(27);"E";CHR$(27);"W1";:RETURN
460 PRINT:PRINT "RESETTING ...."
470 LPRINT CHR$(27);"@";
480 T=TIMER
490 IF TIMER<T+3 THEN 490
500 RETURN
510 END

