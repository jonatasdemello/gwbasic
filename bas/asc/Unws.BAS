10 'This program converts a Wordstar file to a standard text file
20 'that can be transmitted using 7 data bits. Wordstar uses 8-bit
30 'characters to produce soft spaces and soft hyphens.
40 'Modified from Personal Computer Age program by Larry Jordan
50 '
100 DEFINT A:CLS:KEY OFF
110 LOCATE 13,25:INPUT "Wordstar file to convert - ";IFN$
120 LOCATE 15,25:INPUT "Converted file name - ";OFN$
130 OPEN IFN$ FOR INPUT AS #1
140 OPEN OFN$ FOR OUTPUT AS #2
150 CLS:LOCATE 13,25:PRINT "Working on character - ";
160 WHILE NOT EOF(1)
170	A1=ASC(INPUT$(1,1))
180	IF A1<127 THEN 210
190	  LOCATE 13,48:PRINT CHR$(A1)
200	  A1=A1-128
210	A$=CHR$(A1):PRINT #2,A$;
220	IF A1=26 THEN 999
230 WEND
999 CLOSE:CLS:KEY ON:LOCATE 13,30:PRINT "Done....":BEEP
