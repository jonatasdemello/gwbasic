100 'EDIPAGE
120 '   by      Art Schneider  Feb 8 1982
125 '            Boston Computer Society, IBM Personal Computer Users Group
130 '
140 ' DESCRIPTION
150 '   Lists an ASCII file in page formate; 50 lines per page
155 '   with FILE NAME,  REMARKS,  DATE,  PAGE NUMBER on page top
158 '   and either  `continued'  or  `end'  at page bottom.
160 '   Start printer at aprox. six lines down with continous feed paper
162 '
170 '   Used on 80 column printer width & Spinwriter 7730
180 '
190 DEFINT A-Z
200 WIDTH "lpt1:",80            'print line width, alter if desired
300 LP = 50                     'lines of file per page, alter if desired
500 '
1000 PRINT "Page List Program"
1100 PRINT
1150 PRINT "File you want to list must be saved in ASCII { see `A OPTION' }"
1200 COLOR 15,0 : INPUT "Full ASCII File Name   d:name.ext ";ASCIIFILE$
1220 '
1225 'Listing file name as printed may differ from actual disk file name
1227 'per the next input.  The next input name will print to the left top of
1230 'of each page.  Current date and page number will print at the right.
1240 '
1250 PRINT : INPUT "List heading file name........";HEAD$
1260 INPUT "2 = Screen    1 = printer  (1 or 2)";FF
1270 ON FF GOTO 1300,1350
1300 OPEN "lpt1:" FOR OUTPUT AS #FF :GOTO 1400
1350 OPEN "scrn:" FOR OUTPUT AS #FF
1400 OPEN ASCIIFILE$ FOR INPUT AS #3
1430 '
1440 'Use a short discriptive comment about file on next input.
1442 'This heading will center on each page of the listing
1445 '
1450 PRINT : INPUT "Short heading remark";REMLINE$
1500 PAGE =0 : COLOR 7,0 : PRINT : TB = 5
1600 PAGE = PAGE + 1 : GOSUB 3000
2000 '
2100 K = K+1
2200 IF K = LP THEN PRINT #FF, "  " : PRINT #FF, TAB(30) "continued" CHR$(12):GOTO 1600
2300 LINE INPUT #3,A$
2320 LA = LEN(A$) :IF LA > 80 THEN K= K+1 : IF LA > 160 THEN K = K +1
2400 PRINT #FF,  A$
2500 IF EOF(3) THEN 6000 ELSE 2100
3000 PRINT #FF, HEAD$ TAB(20) REMLINE$ TAB(60) DATE$ "  page" PAGE
3100 PRINT #FF, " ": PRINT #FF, " ":K=0 : RETURN
6000 PRINT #FF, " "
6100 PRINT #FF, " "
6300 PRINT #FF, TAB(30) "end" CHR$(12)
6400 CLOSE : END
