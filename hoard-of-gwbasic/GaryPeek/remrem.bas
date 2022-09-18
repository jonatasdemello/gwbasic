100 REM **********************************************************************
110 REM FILE NAME  - REMREM.BAS
120 REM
130 REM WRITTEN BY - GARY PEEK
140 REM              3201 HIGHGATE
150 REM              ST. CHARLES, MO.  63301
160 REM              314 946-5272
170 REM
180 REM LAST UPDATE - 7/29/91
190 REM
200 REM DESCRIPTION - REMOVE LINES IN A GWBASIC SOURCE FILE THAT ARE ONLY
210 REM               REMARK LINES IN THE FORMAT   12345 REM comments ....
220 REM                                       or    1234 REM comments ....
230 REM                                       or     123 REM comments ....
240 REM **********************************************************************
250 CLS:PRINT "REMOVE REMARK LINES FROM BASIC PROGRAM -":PRINT
260 INPUT "INPUT FILE NAME";INF$:PRINT:IF INF$="" THEN END
270 INPUT "OUTPUT FILE NAME";OUTF$:PRINT:IF OUTF$="" THEN END
280 PRINT "HIT ESCAPE TO QUIT WHILE CONVERSION IS IN PROGRESS":PRINT
290 OPEN INF$ FOR INPUT AS #1
300 OPEN OUTF$ FOR OUTPUT AS #2
310 IF EOF(1) THEN CLOSE:PRINT:PRINT:PRINT "CONVERSION COMPLETE":END
320 LINE INPUT#1,I$
330 IF MID$(I$,5,3)="REM" AND MID$(I$,11,1)<>"-" THEN 380
340 IF MID$(I$,6,3)="REM" AND MID$(I$,11,1)<>"-" THEN 380
350 IF MID$(I$,7,3)="REM" AND MID$(I$,11,1)<>"-" THEN 380
360 PRINT #2,I$
370 PRINT I$
380 I$=INKEY$:IF I$="" THEN 310
390 IF I$=CHR$(27) THEN CLOSE:PRINT:PRINT:PRINT "TERMINATED":END
400 GOTO 310

