100 REM **********************************************************************
110 REM FILE NAME  - HEXDUMP.BAS
120 REM
130 REM WRITTEN BY - GARY PEEK
140 REM              3201 HIGHGATE
150 REM              ST. CHARLES, MO.  63301
160 REM              314 946-5272
170 REM
180 REM LAST UPDATE - 3/30/87
190 REM
200 REM DESCRIPTION - DISPLAY A FILE IN HEXIDECIMAL FORMAT
210 REM
220 REM PLEASE NOTE - PERMISSION IS GRANTED TO COPY THIS PROGRAM ONLY IF
230 REM               COPIED IN ITS ENTIRETY INCLUDING THIS HEADING.
240 REM
250 REM **********************************************************************
260 CLS:PRINT "HEX DUMP PROGRAM -":PRINT
270 INPUT "FILE NAME";F$:PRINT:IF F$="" THEN 420
280 PRINT "HIT ESCAPE TO QUIT OR ANY OTHER KEY TO STOP/START DISPLAY":PRINT
290 OPEN F$ FOR INPUT AS #1
300 COL=1:ROW=0
310 IF EOF(1) THEN 420
320 IF COL<>1 THEN 360
330 ROW$=HEX$(ROW)
340 IF LEN(ROW$)<4 THEN ROW$="0"+ROW$:GOTO 340
350 PRINT ROW$;"  ";
360 A=ASC(INPUT$(1,#1)):H$=HEX$(A):C$=CHR$(A)
370 IF A<32 OR A>126 THEN C$="."
380 IF LEN(H$)=1 THEN H$="0"+H$
390 PRINT H$;" ";:ASCII$=ASCII$+C$
400 COL=COL+1:IF COL=17 THEN COL=1:ROW=ROW+16:PRINT "      ";ASCII$:ASCII$=""
410 I$=INKEY$:IF I$="" THEN 310
420 IF I$=CHR$(27) THEN END
430 I$=INKEY$:IF I$="" THEN 430
440 GOTO 310

