20 CLS:PRINT "REMOVECR- Remove cr/lf from files and replace with SPACE."
50 PRINT:PRINT "Creates new file with the extension XCR"
70 PRINT:PRINT "Enter file name (including extension if used): ";
80 LINE INPUT FIN$:PRINT
90 IF FIN$="" THEN END
100 I=INSTR(FIN$,".")
110 IF I=0 THEN FEXT$=FIN$+".BAK":I=LEN(FIN$)+1:GOTO 140
120 IF I=1 THEN END
130 IF I>=2 THEN FEXT$=FIN$
140 FOUT$=LEFT$(FEXT$,I-1)+".XCR"
160 OPEN FIN$ FOR INPUT AS #1
170 OPEN FOUT$ FOR OUTPUT AS #2
180 REM --------------
190 IF EOF(1) THEN 270
200 A$=INPUT$(1,#1)
210 A=ASC(A$)
215 IF A<32 OR A>126 THEN 190
220 IF A=10 THEN A=32
225 IF A=13 THEN 190
230 PRINT CHR$(A);
240 PRINT #2,CHR$(A);
250 GOTO 190
260 REM -------------
270 CLOSE
290 PRINT:PRINT "Conversion done":PRINT
300 END

