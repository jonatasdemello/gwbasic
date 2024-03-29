100 'DATAFIX
120 '
140 'BY         Art Schneider Feb 8,1982
150 '           Boston Computer Society, IBM Personal Computer Users Group
160 '
180 'DESCRIPTION:   Utility program for Sequential data files!
200 '
220 '           1.  For line line numbered data files this program
240 '           strips off line numbers {and or leading  <',>
260 '           characters} from the data line and saves the remaining
280 '           full data line in a new file.  The line numbered file
300 '           must have been saved in ASCII (A'option)
320 '
340 '           2.  For convential data files (with out line numbers)
360 '           this program will add a leading line number and <',>
380 '           {remark format}.  The new line numbered file may be
400 '           loaded and edited in BASIC
420 '
440 'INSTRUCTIONS:  Run program and respond to questions.
460 '           Questions relate to choice 1 or 2 as noted above;
480 '           the names of input and output files;  and if you wish
500 '           to see on the screen the file modification as it occurs.
510 '
515 'REFERENCE:    "DIRECT TYPED SEQUENTIAL DATA FILES"
517 '
520 '           Type and edit data files with the full Screen Basic Editor!
522 '
525 '           A 15 page report on how to use this program with sequential
527 '           data files is available.  SEND $1.00 to:
530 '           Art Schneider   8 Melanie Ln    Mattapoisett MA 02739
540 '
560 'LANQUAGE:      BASIC  IBM Personal Computer (microsoft) Disk
570 '
580 '...................................   INITIALIZE   ................
600 '
620 SCREEN 0,0 : CLS : CLOSE            'set up & clear
640 DEFINT A-Z : WIDTH 80 : K =0
660 KEY OFF : TB = 10 : C$ =""
680 FALSE = 0 : TRUE = NOT FALSE
700 PRINT TAB(TB+10);
720 COLOR 0,7 :PRINT "SEQUENTIAL  DATA  FILE  UTILITY  DATAFIX"
740 PRINT : COLOR 15,0                  'bright screen
760 PRINT TAB(TB);"Select option to ADD or REMOVE line numbers from data file"
780 PRINT : PRINT TAB(TB); "A = Add  R = Remove ";:INPUT "[A or R]";S$
800 PRINT
820 PRINT TAB(TB);"Do you want the as modified file also listed on the screen;"
840 PRINT TAB(TB);:INPUT "{ LIST ... Y or N }";P$
860 IF P$="Y" OR P$ ="y" THEN P = TRUE  'yes do a screen list
880 IF S$ ="A" OR S$="a" THEN 1600      'add line utility
900 IF S$ ="R" OR S$="r" THEN 960       'remove line
920 PRINT S$; " ain't A or R ":GOTO 780
940 '
960 '................................   REMOVE  LINE NUMBERS  UTILITY  ...
1000 COLOR 7,0 : PRINT
1020 PRINT "Remove line numbers from......"
1040 INPUT "Line numbered data file name...d:Name.Ext ";L$
1060 ON ERROR GOTO 2260                 'process open error
1080 OPEN "I",#1,L$                     'input file with line #
1100 PRINT "input File.... ";L$;" found"
1120 PRINT
1140 PRINT "State file format  1,2,3"
1160 PRINT "1 = Direct  2 = Comma  3 = Remark  (4=HELP)";
1180 INPUT "   {1,2,3 or 4} ";F
1200 IF F = 4 THEN GOTO 2600            'help - explain format
1220 IF F=1 THEN C$ = " " ELSE C$ = CHR$(44) ' 1 =blank 2&3 = comma
1240 PRINT
1260 PRINT "If you name a presaved output file we will append to it!!"
1280 INPUT "Name of file without line #.......d:Name.Ext   ";D$
1300 ON ERROR GOTO 2380                 'open file error
1320 OPEN "A",#2,D$                     'with optional Append
1340 PRINT "output file ";D$ ; " ready"
1360 LOCATE 25,30                       'reserved 25th line
1380 COLOR 18,0: PRINT " processing file " ' Blink it
1400 COLOR 7,0                          'normal screen
1420 WHILE NOT EOF(1)                   'close & end
1440 LINE INPUT #1,A$                   'read full data line
1460 B = INSTR(1,A$,C$)                 'locate 1st delimeter
1480 K = K+1                            'count the lines
1500 B$ = RIGHT$(A$,LEN(A$)-B)          'the desired full data string
1520 PRINT #2,B$                        'save data string in D$ file
1540 IF P OR K <2 THEN PRINT B$         'list all or atleast one line
1560 WEND                               'continue for the length of file
1580 GOTO 2740
1600 '..................  ADD LINE NUMERS AND <',>  UTILITY  ...........
1640 COLOR 7,0 : PRINT
1660 PRINT "Add line numbers and <',> to data in file...."
1680 INPUT "Data file name....d:Name.Ext  ";L$
1700 ON ERROR GOTO 2320
1720 OPEN "I" ,#1,L$                    'input a sequential data file
1740 PRINT : PRINT "File ...." L$ " Found"
1760 PRINT
1780 PRINT "If you name a presaved file next, we will destroy old values!!"
1800 INPUT "Line numbered data file ... d:Name.Ext";D$
1820 ON ERROR GOTO 2440                 'open error trap
1840 OPEN "O",#2,D$                     'file with line numbers
1860 PRINT : PRINT "Output file " D$ " Ready"
1880 PRINT : ON ERROR GOTO 2500         'trap large data line
1900 LOCATE 25,30
1920 COLOR 18,0 : PRINT " processing file"
1940 COLOR 7,0
1960 LINENUM= 990 : INC=10              '1st line number & increment
1980 R$ =" "+CHR$(39)+","               'remark format < ',>
2000 WHILE NOT EOF(1)                   'close and end
2020 LINE INPUT #1,A$                   'read full data line
2040 LINENUM = LINENUM + INC            'the line number
2060 'drop leading numeric line number blank by string conversion
2080 LINES$ =RIGHT$(STR$(LINENUM),4) + R$ 'line number string
2100 B$ = LINES$ + A$                   'put them together
2120 K = K + 1                          'counter
2140 PRINT #2,B$                        'load the file
2160 IF P OR K <2 THEN PRINT B$         'list all or atleast one line
2180 WEND                               'continue
2200 GOTO 2740
2220 '......................  ERROR  TRAPS  .......................
2240 '
2260 IF ERR= 53 OR ERR=64 THEN PRINT "I Can't find file ";L$ : RESUME 1040
2280 IF ERR= 68 OR ERR=71 THEN PRINT "check disk & retype name":RESUME 1040
2300 ON ERROR GOTO 0            'halt on any other error
2320 IF ERR= 53 OR ERR=64 THEN PRINT "I Can't find file ";L$ : RESUME 1640
2340 IF ERR= 68 OR ERR=71 THEN PRINT "check disk & retype name":RESUME 1640
2360 ON ERROR GOTO 0            'halt on any other error
2380 IF ERR= 53 OR ERR= 64 THEN PRINT "I Can't open file ";D$ : RESUME 1240
2400 IF ERR= 68 OR ERR=71 THEN PRINT "check disk & retype name":RESUME 1240
2420 ON ERROR GOTO 0            'halt on any other error
2440 IF ERR= 53 OR ERR= 64 THEN PRINT "I Can't open file ";D$ : RESUME 1760
2460 IF ERR= 68 OR ERR=71 THEN PRINT "check disk & retype name":RESUME 1760
2480 ON ERROR GOTO 0            'halt on any other error
2500 IF ERR = 15 THEN RESUME 2520 ELSE ON ERROR GOTO 0
2520 PRINT
2540 PRINT TAB(TB) "You have a very big line and I can't add the line number"
2560 PRINT :PRINT A$            'big line
2580 PRINT : PRINT "So I have to halt":GOTO 2740
2600 PRINT :PRINT "    By format we mean the first characters after the line number" : PRINT "Your line numbered file should be in one of the following forms:"
2620 PRINT
2640 PRINT "    1. DIRECT  a string data value follows the line number."
2660 PRINT "    2. COMMA   a <,> follows the line number."
2680 PRINT "    3. REMARK  the two <',> characters follow the line number."
2700 GOTO  1120                 'repeat the question
2710 '
2720 '.........................  CLOSE  AND  END  .....................
2740 CLOSE     'all data files
2760 PRINT : PRINT : COLOR 15,0
2780 PRINT TAB(TB) K "  Data Lines Processed into " CHR$(34) D$;
2800 IF INSTR(1,D$,".") THEN PRINT CHR$(34) ELSE PRINT ".   " CHR$(34)
2820 RD1 = VAL(MID$(TIME$,4,2))*540     'use clock for random seed
2840 RD2 = VAL(MID$(TIME$,7,2))*100
2860 RANDOMIZE RD1-RD2
2880 FOR J = 1 TO 5
2900 SOUND RND*1000+37,4        'random sound at end
2920 NEXT J : SOUND 100,0 : COLOR 7,0
2940 KEY ON : ON ERROR GOTO 0   'must also end open error traps
2960 END                        'by Art Schneider (617) 993-2621
