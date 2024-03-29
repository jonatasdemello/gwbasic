10 REM ***********************************************************************         *                      PROGRAM1                                       *
20 REM *                    by Phil Grier                                    *         *                   Laurel Maryland                                   *
30 REM *                   (301) 498-2226                                    *         ***********************************************************************
43 DEF SEG:POKE 106,0:FALSE=0:TRUE=NOT FALSE:RESET
44 CLS:PRINT"MUSIC? (Y OR N)"
46 MUSIC$=INKEY$
47 FOR I=1 TO 2:IF MUSIC$=MID$("Yy",I,1) THEN MUSIC=TRUE:GOTO 50 ELSE NEXT
48 IF MUSIC$="" THEN 46
49 MUSIC=FALSE
50 IF MUSIC=FALSE THEN 61
60 S$="O3L16B.L16AL16G.L8GL16GL16AL16BO4L16CL8DDDO3B.":PLAY "XS$;"
61 DEF SEG:POKE 106,0:SCREEN 0,1,0,0:COLOR 7,0,0:WIDTH 80:CLS:FOR I=1 TO 20:A$=INKEY$:NEXT
70 KEY OFF:KEY 1,"LIST ":KEY 2,"RUN"+CHR$(13):KEY 3,"LOAD"+CHR$(34)+"B:":KEY 4,"SAVE"+CHR$(34)+"B:":KEY 5,"GOSUB ":KEY 9,"CLS":KEY 7,"FILES "+CHR$(34)+"B:*.*":KEY 8,"EDIT ":KEY 6,"RETURN":KEY 10,"SYSTEM"
79 GOTO 100
100 LOCATE 2,30:PRINT "Phil Grier's":LOCATE 4,31,0:COLOR 0,15:PRINT "PROGRAM 1":COLOR 7,0:FOR I=1 TO 3000:NEXT
110 PRINT:PRINT
120 PRINT"THE ";:COLOR 1,0:PRINT "COLOR";:COLOR 7,0:PRINT " STATEMENT IN MONOCHROME:
130 PRINT:PRINT"THE NORMAL COLOR SETTING IS 7,0";:LOCATE ,50:PRINT"NORMAL
140 PRINT "REVERSE COLOR IS 0,7";:COLOR 0,7:LOCATE ,50:PRINT"REVERSE
150 COLOR 7,0:PRINT "UNDERSCORE IS 1,0";:LOCATE ,50:COLOR 1,0:PRINT"UNDERSCORE
160 COLOR 7,0:PRINT "HIGH INTENSITY IS 15,0";:LOCATE ,50:COLOR 15,0:PRINT"HI-INTEN
170 COLOR 7,0:PRINT"BLINKING IS 18,0";:LOCATE ,50:COLOR 18,0:PRINT"BLINK
180 COLOR 7,0:PRINT "BLINKING UNDERLINED IS 17,0";:LOCATE ,50:COLOR 17,0:PRINT "BLINK & UNDERSCORE
190 COLOR 7,0:PRINT "HIGH INTENSITY BLINKING IS 26,0";:LOCATE ,50:COLOR 26,0:PRINT "HI-INTEN & BLINK
200 COLOR 7,0:PRINT "BLINK & UNDERSCORE & HI INTENSITY IS 25,0";:LOCATE ,50:COLOR 25,0:PRINT "BLINK & HI & UNDRSCR
210 COLOR 7,0
220 GOSUB 5000:GOSUB 6000:GOSUB 5000
300 CLS:LOCATE 1,25:COLOR 0,7:PRINT " A L T E R N A T I V E S ":COLOR 7,0:PRINT :PRINT "ALT + A = AUTO
310 PRINT "ALT + B = BSAVE
320 PRINT "ALT + C = COLOR
330 PRINT "ALT + D = DELETE
340 PRINT "ALT + E = ELSE
350  PRINT "ALT + F = FOR
360 PRINT "ALT + G = GOTO
370 PRINT "ALT + H = HEX$
380 PRINT "ALT + I = INPUT
390 PRINT "ALT + K = KEY
400 PRINT "ALT + L = LOCATE
410 PRINT "ALT + M = MOTOR
420 PRINT "ALT + N = NEXT
430 PRINT "ALT + O = OPEN
440 PRINT "ALT + P = PRINT
450 PRINT "ALT + R = RUN
460 PRINT "ALT + S = SCREEN
470 PRINT "ALT + T = THEN
480 PRINT "ALT + U = USING
490 PRINT "ALT + V = VAL
500 PRINT "ALT + W = WIDTH
510 PRINT "ALT + X = XOR";
520 LOCATE 3,40:PRINT "CTRL + G = BEL
530 LOCATE 5,40:PRINT "CTRL + Break = EXIT PROGRAM - EXIT AUTO
540 LOCATE 7,40:PRINT "Ctrl + Alt + Del = SYSTEM RESET
550 LOCATE 9,40:PRINT "Ctrl + Num Lock = PAUSE
555 LOCATE 10,58:PRINT "(any key to continue)
560 LOCATE 12,40:PRINT "Ctrl + Home = CLEAR SCREEN
570 LOCATE 14,40:PRINT "Ctrl + (CURSOR RIGHT) = NEXT WORD
580 LOCATE 16,40:PRINT "Ctrl + (CURSOR LEFT) = PREVIOUS WORD
590 LOCATE 18,40:PRINT "Ctrl + End = ERASE TO NEXT ENTER
595 GOSUB 5000
600 CLS:LOCATE 1,15:COLOR 0,7:PRINT " B A S I C :   G E N E R A L  S T A T E M E N T S ";:COLOR 7,0
610 PRINT:PRINT:PRINT"COMMON":LOCATE 3,15:PRINT"var list":LOCATE 3,30:PRINT"statement":LOCATE 3,52:PRINT"pass var to chained pgm
620 PRINT"DATA":LOCATE 4,15:PRINT"data list":LOCATE 4,30:PRINT"statement":LOCATE 4,52:PRINT"create data table
630 PRINT"DATE$":LOCATE 5,30:PRINT"function":LOCATE 5,52:PRINT"set system date
640 PRINT"DEF FN":LOCATE 6,15:PRINT"variable":LOCATE 6,30:PRINT"function":LOCATE 6,52:PRINT"define function
650 PRINT"DEF":LOCATE 7,15:PRINT"variable":LOCATE 7,30:PRINT"function":LOCATE 7,52:PRINT"define variable
660 PRINT"DIM":LOCATE 8,15:PRINT"var list":LOCATE 8,30:PRINT"statement":LOCATE 8,52:PRINT"allocate dimension space
670 PRINT"END":LOCATE 9,30:PRINT"statement":LOCATE 9,52:PRINT"return to command level
680 PRINT"ERASE":LOCATE 10,30:PRINT"statement":LOCATE 10,52:PRINT"eliminate arrays values
690 PRINT"ERROR":LOCATE 11,15:PRINT"number":LOCATE 11,30:PRINT"statement":LOCATE 11,52:PRINT"simulate error
700 PRINT"FOR X=A TO B":LOCATE 12,30:PRINT"statement":LOCATE 12,52:PRINT"program loop
710 PRINT"IF V THEN N ELSE M":LOCATE 13,30:PRINT"statement":LOCATE 13,52:PRINT"decision & transfer
720 PRINT"LET X=V":LOCATE 14,30:PRINT"statement":LOCATE 14,52:PRINT"evaluate expression
730 PRINT"NEXT":LOCATE 15,30:PRINT"statement":LOCATE 15,52:PRINT"terminates a for loop
740 PRINT"OPTION BASE":LOCATE 16,15:PRINT"(0 or 1)":LOCATE 16,30:PRINT"statement":LOCATE 16,52:PRINT"set minimum array subscript
750 PRINT"PEEK":LOCATE 17,30:PRINT"statement & function":LOCATE 17,52:PRINT"observe byte in memory
760 PRINT"POKE":LOCATE 18,30:PRINT"statement & function":LOCATE 18,52:PRINT"put byte in memory
770 PRINT"RANDOMIZE":LOCATE 19,15:PRINT"numeric":LOCATE 19,30:PRINT"statement":LOCATE 19,52:PRINT"generate random number
780 PRINT"RND":LOCATE 20,15:PRINT"(X)":LOCATE 20,30:PRINT"function":LOCATE 20,52:PRINT"random number generation
790 PRINT"READ":LOCATE 21,30:PRINT"statement":LOCATE 21,52:PRINT"read DATA statements
800 PRINT"REM":LOCATE 22,30:PRINT"statement":LOCATE 22,52:PRINT"listing remarks
810 PRINT"RESTORE":LOCATE 23,30:PRINT"statement":LOCATE 23,52:PRINT"reset data pointer
830 GOSUB 5000
850 CLS:PRINT"cont":LOCATE 1,15:COLOR 0,7:PRINT " B A S I C :   G E N E R A L  S T A T E M E N T S ";:COLOR 7,0
860 LOCATE 5,1:PRINT "STOP":LOCATE 5,30:PRINT"statement":LOCATE 5,50:PRINT"halt program execution
870 LOCATE 7,1:PRINT"SWAP":LOCATE 7,15:PRINT"numeric":LOCATE 7,30:PRINT"statement":LOCATE 7,50:PRINT"exchange values
880 LOCATE 9,1:PRINT"TIME$":LOCATE 9,15:PRINT"string":LOCATE 9,30:PRINT"function":LOCATE 9,50:PRINT"set system time
890 LOCATE 11,1:PRINT"WEND":LOCATE 11,30:PRINT"statement":LOCATE 11,50:PRINT"close while loop
900 LOCATE 13,1:PRINT"WHILE":LOCATE 13,15:PRINT"variable":LOCATE 13,30:PRINT"statement":LOCATE 13,50:PRINT"loop as long as true
950 GOSUB 5000
1000 CLS:LOCATE 1,15:COLOR 0,7:PRINT " B A S I C :   C O N T R O L  S T A T E M E N T S ";:COLOR 7,0
1010 PRINT:PRINT:PRINT"CALL":LOCATE 3,17:PRINT"(X,X,X)":LOCATE 3,30:PRINT"statement":LOCATE 3,50:PRINT"call M/L subroutine
1020 PRINT"CHAIN":LOCATE 4,17:PRINT"file spec.":LOCATE 4,30:PRINT"statement":LOCATE 4,50:PRINT"overlay programs
1030 PRINT"GOSUB":LOCATE 5,17:PRINT"line #":LOCATE 5,30:PRINT"statement":LOCATE 5,50:PRINT"call BASIC subroutine
1040 PRINT"GOTO":LOCATE 6,17:PRINT"line #":LOCATE 6,30:PRINT"statement":LOCATE 6,50:PRINT"transfer control
1050 PRINT"ON COM N GOSUB":LOCATE 7,17:PRINT"line #":LOCATE 7,30:PRINT"adv. statement":LOCATE 7,50:PRINT"communications trap
1060 PRINT"ON ERR GOSUB":LOCATE 8,17:PRINT"line #":LOCATE 8,30:PRINT"statement":LOCATE 8,50:PRINT"error trap
1070 PRINT"ON V GOTO":LOCATE 9,17:PRINT"line #":LOCATE 9,30:PRINT"statement":LOCATE 9,50:PRINT"conditional branch
1080 PRINT"ON KEY N GOSUB":LOCATE 10,17:PRINT"line #":LOCATE 10,30:PRINT"adv. statement":LOCATE 10,50:PRINT"function key trap
1090 PRINT"ON PEN GOSUB":LOCATE 11,17:PRINT"line #":LOCATE 11,30:PRINT"adv. statement":LOCATE 11,50:PRINT"trap off light pen
1100 PRINT"ON STRIG N GOSUB":LOCATE 12,17:PRINT"line #":LOCATE 12,30:PRINT"adv. statement":LOCATE 12,50:PRINT"trap off joystick
1110 PRINT"RESUME":LOCATE 13,17:PRINT"line #":LOCATE 13,30:PRINT"statement":LOCATE 13,50:PRINT"return from error trap
1120 PRINT"RETURN":LOCATE 14,30:PRINT"statement":LOCATE 14,50:PRINT"return from subroutine
1130 PRINT"USR":LOCATE 15,17:PRINT"var. list":LOCATE 15,30:PRINT"function":LOCATE 15,50:PRINT"call M/L subroutine
1140 PRINT"VARPTR":LOCATE 16,17:PRINT"numeric":LOCATE 16,30:PRINT"function":LOCATE 16,50:PRINT"gives address of variable
1150 GOSUB 5000
1200 CLS:LOCATE 1,17:COLOR 0,7:PRINT " B A S I C :   F I L E   S T A T E M E N T S ";:COLOR 7,0
1210 PRINT:PRINT:PRINT"CLOSE","numeric",,"statement","close file
1220 PRINT:PRINT"EOF","numeric",,"function","end of file condition
1230 PRINT:PRINT"ERL",,,"function","error line number
1240 PRINT:PRINT"ERR",,,"function","error number code
1250 PRINT:PRINT"FIELD","function: N AS X$","statement","format a buffer
1260 PRINT:PRINT"GET",,,"function","read rand. file record
1270 PRINT:PRINT"LSET","x$ = y$",,"func & stmnt","left justify a field
1280 PRINT:PRINT"OPEN","FS for md as fl#","statement","open file
1290 PRINT:PRINT"PUT",,,"statement","write from rand file rec
1300 PRINT"RSET","x$ = y$",,"func & stmnt","right justify a field
1350 GOSUB 5000
1400 CLS:LOCATE 1,17:COLOR 0,7:PRINT " B A S I C :   I / O    S T A T E M E N T S ";:COLOR 7,0
1410 PRINT:PRINT:PRINT"BEEP",,"statement","beep speaker (bel)
1420 PRINT"COM N","on/off/stop","statement","on/off comm trap
1430 PRINT"KEY","on/off","statement","function keys display
1440 PRINT"KEY","n,x$","statement","set function key
1450 PRINT"KEY","on/off/stop","statement","on/off function key trap
1460 PRINT"LOC","numeric","function","file pointer position
1470 PRINT"LOF","numeric","function","# of 128 byte blocks in file
1480 PRINT"LPOS","numeric","function","printer carrage position
1490 PRINT"MOTOR","numeric","statement","cassette motor switch
1500 PRINT"OPEN COM","n:parms","statement","open communications file
1510 PRINT"OUT","port,byte","statement","output byte to port
1520 PRINT"PEN","numeric","function","read light pen
1530 PRINT"PEN","on/off/stop","statement","on/off light pen trap
1540 PRINT"SOUND","f:duration","statement","generate speaker sound
1550 PRINT"STICK","(n)","function","joystick coordinates
1560 PRINT"STRIG","(n)","function","state of joystick button
1570 PRINT"WAIT","port/mask","function","suspend port until mask
1580 GOSUB 5000
1600 CLS:LOCATE 1,17:COLOR 0,7:PRINT " B A S I C :   K E Y B O A R D   &   S C R E E N ";:COLOR 7,0
1610 PRINT:PRINT:PRINT"CIRCLE","(x,y),z","statement","draw circle on screen
1620 PRINT"CLS",,"statement","clear screen
1630 PRINT"COLOR","x,y","statement","set screen colors
1640 PRINT"DRAW","x$","statement","draw figure in string
1650 PRINT"GET","(x1,y1)-(x2,y2) statement","read graphics from screen
1660 PRINT"INPUT","x$","statement","read from keyboard
1670 PRINT"LINE","(x1,y1)-(x2,y2) statement","draw line on display
1680 PRINT"LINE INPUT","x$","statement","read entire line from keyboard
1690 PRINT"LOCATE","n,m","statement","position cursor row & column
1700 PRINT"LPRINT","vl","statement","output to printer
1710 PRINT"LPRINT USING","vl","statement","formatted output to printer
1720 PRINT"PAINT","(n,m)x1,x2","statement","color an area on display
1730 PRINT"PRINT","vl","statement","display data on screen
1740 PRINT"PRESET","(n,m) x","statement","display color point background
1750 PRINT"PSET","(n,m) x","statement","display color point
1760 PRINT"PUT","(x1,y1)-(x2,y2) statement","put graphics to screen
1770 PRINT"SCREEN","m,n,pg1,pg2","statement","set screen paramenters
1780 PRINT"WRITE","vl","statement","display to screen
1790 GOSUB 5000
1800 CLS:LOCATE 1,17:COLOR 0,7:PRINT " B A S I C :   S T R I N G   F U N C T I O N S ";:COLOR 7,0
1810 PRINT:PRINT:PRINT:PRINT:PRINT"ASC","(x$)","function","ASCII code for 1st character
1820 PRINT"CVI$/CVS$/CVD$   (x$)","function","convert value to ASCII
1830 PRINT"CHR$","(x$)","function","character with ASCII code
1840 PRINT"HEX$","x","function","convert to ASCII hex string
1850 PRINT"INSTR","(N,X$,Y$)","statement","compare string & give position
1860 PRINT"LEFT$","(x$,n)","function","left most n characters
1870 PRINT"MID$","(x$,m,n,)","function","n characters in x$ starting at m
1880 PRINT"MKI$/MKS$/MKD$  (x)","function","convert ASCII to value
1890 PRINT"OCT$","(n)","function","convert to octal string
1900 PRINT"RIGHT$","(x$,n)","function","right most n characters
1910 PRINT"SPACE$","(n)","function","string of n spaces
1920 PRINT"STR$","(x)","function","convert to string
1930 PRINT"STRING$","(n,x$)","function","repeat 1st character
1940 GOSUB 5000
2000 CLS:LOCATE 1,17:COLOR 0,7:PRINT " B A S I C :   M A T H   F U N C T I O N S ";:COLOR 7,0
2010 PRINT:PRINT:PRINT:PRINT"ABS","(x)","function","absolute value
2020 PRINT"ATN","(x)","function","arctangent (radians)
2030 PRINT"COBL","(x)","function","convert to double precision
2040 PRINT"CINT","(x)","function","convert to integer
2050 PRINT"COS","(x)","function","cosine (radians)
2060 PRINT"CSGN","(x)","function","convert to single precision
2070 PRINT"EXP","(x)","function","exponential base e
2080 PRINT"FIX","(x)","function","truncate to integer
2090 PRINT"INT","(x)","function","convert to integer
2100 PRINT"LOG","(x)","function","natural logarithm
2110 PRINT"RND","(x)","function","random number generator
2120 PRINT"SGN","(x)","function","sign of number
2130 PRINT"SQR","(x)","function","square root of number
2140 PRINT"TAN","(x)","function","tangent (radians)
2150 GOSUB 5000
2200 CLS:LOCATE 1,17:COLOR 0,7:PRINT " B A S I C :   C O M M A N D S ";:COLOR 7,0
2210 PRINT:PRINT"AUTO","(n,m)","generate automatic line numbers
2220 PRINT"BLOAD","filespec","load binary data file
2230 PRINT"BSAVE","filespec","save binary data file
2240 PRINT"CLEAR",",x,y","clear variables & set memory
2250 PRINT"CONT",,"continue program execution
2260 PRINT"DELETE","n-m","delete lines
2270 PRINT"EDIT","n","display & edit a line
2280 PRINT"FILES","filespec","list files that match
2290 PRINT"KILL","filespec","delete files
2300 PRINT"LIST","n-m","display program lines
2310 PRINT"LLIST","n-m","print program lines
2320 PRINT"LOAD","filespec","load file
2330 PRINT"MERGE","filespec","overlay program from file
2340 PRINT"NAME","fs as fs","rename file
2350 PRINT"NEW",,"delete current program from memory
2360 PRINT"RENUM","i,j,k","renumber lines
2370 PRINT"RESET",,"close all files
2380 PRINT"RUN",,"execute program in memory
2390 PRINT"SAVE","filespec","dump program to disk file
2400 PRINT"SYSTEM",,"end basic & return to DOS
2410 PRINT"TRON",,"turn trace on
2420 PRINT"TROFF",,"turn trace off
2450 GOSUB 5000
2500 CLS:LOCATE 1,19:COLOR 0,7:PRINT " D O S :   C O M M A N D S ";:COLOR 7,0
2510 PRINT:PRINT:PRINT"BATCH","(d:) fn param",,"execute batch file
2520 PRINT"CHKDSK","(d:)",,"display disk status
2530 PRINT"COMP","(fs)(d:)fn(ext)","compare files
2540 PRINT"COPY","(fs)(d:)fn(ext)","copy files
2550 PRINT"DATE","mm/dd/yy",,"enter system date
2560 PRINT"DIR","(d:)fn(ext)",,"display disk directory
2570 PRINT"DISKCOMP","(d:)(d:)",,"compare disks
2580 PRINT"DISKCOPY","(d:)(d:)",,"copy disks
2590 PRINT"ERASE","filespec",,"delete file
2600 PRINT"FORMAT","(d:)(/s)",,"format disk
2610 PRINT"MODE","(dev)(,n)(,m)(,t)","set mode for printer & display
2620 PRINT"PAUSE","(rem)",,"system pause
2630 PRINT"REM","(rem)",,"display remarks
2640 PRINT"RENAME","fs fn (ext)",,"rename file
2650 PRINT"SYS",,,"transfer DOS
2660 PRINT"TIME","hr:min:sec.ms",,"enter system time
2670 PRINT"TYPE","filespec",,"display file
2680 PRINT"EDLIN","filespec",,"execute editor
2690 PRINT"LINK",,,"execute linker
2700 PRINT"DEBUG","filespec",,"ececute debug program
2710 GOSUB 5000
2800 CLS:LOCATE 1,19:COLOR 0,7:PRINT " D E B U G :   C O M M A N D S ";:COLOR 7,0
2810 PRINT:PRINT:PRINT:PRINT"D(ADR)",,"display address
2820 PRINT"D(RNG)",,"display range of address
2830 PRINT"A ADR(LIST)",,"alter memory
2840 PRINT"F RNG LIST",,"fill range with list
2850 PRINT"G (ADR) (ADR)",,"execute until break point
2860 PRINT"H VAL VAL",,"hex arithmetic
2870 PRINT"I PORT",,"input & display byte
2880 PRINT"L(ADR)(D SECT SECT)","load file or disk sectors
2890 PRINT"M RNG ADR",,"move memory block
2900 PRINT"N FS(FS)",,"define files
2910 PRINT"O PORT BYTE",,"output byte to port
2920 PRINT"Q",,"quit debug program
2930 PRINT"R(REG)",,"display registers & flags
2940 PRINT"S RNG LIST",,"search for characters
2950 PRINT"T(=ADR)(VALUE)","execute instr. & display register
2960 PRINT"U ADR",,"disassemble addresss
2970 PRINT"U RNG",,"disassemble range
2980 PRINT"W(ADR)(D SECT SECT)","write file of disk sector
2990 GOSUB 5000
3000 CLS:LOCATE 1,19:COLOR 0,7:PRINT " E D L I N :   C O M M A N D S ";:COLOR 7,0
3010 PRINT:PRINT:PRINT"(N)",:COLOR 0,7:PRINT"A";:COLOR 7,0:PRINT,":append lines
3020 PRINT:PRINT"(LN)(,LN)",:COLOR 0,7:PRINT"D";:COLOR 7,0:PRINT,":delete lines  (begin ,end)
3030 PRINT:PRINT,:COLOR 0,7:PRINT"(LN)";:COLOR 7,0:PRINT,":edit line
3040 PRINT:PRINT,:COLOR 0,7:PRINT"E";:COLOR 7,0:PRINT,":end edit  (save BAK)
3050 PRINT:PRINT"(LN)",:COLOR 0,7:PRINT"I";:COLOR 7,0:PRINT,":insert line
3060 PRINT:PRINT"(LN)(,LN)",:COLOR 0,7:PRINT"L";:COLOR 7,0:PRINT,":list lines  (begin ,end)
3070 PRINT:PRINT,:COLOR 0,7:PRINT"Q";:COLOR 7,0:PRINT,":quit - abort edit
3080 PRINT:PRINT"(LN)(,LN)(?)",:COLOR 0,7:PRINT"R STR F6 STR";:COLOR 7,0:PRINT,":replace text (preceeded with [begin][,end][?]
3090 PRINT:PRINT"(LN)(,LN)(?)",:COLOR 0,7:PRINT"S STR";:COLOR 7,0:PRINT,":search text  (preceeded with [begin][,end][?]
3100 PRINT:PRINT"(N)",:COLOR 0,7:PRINT"W";:COLOR 7,0:PRINT,":write lines to disk
3110 GOSUB 5000
3200 CLS:LOCATE ,10:COLOR 0,7:PRINT" E A S Y W R I T E R   E M B E D D E D   C O M M A N D S ";:COLOR 7,0:PRINT
3210 PRINT:PRINT:PRINT:PRINT".EJECT",,"Page eject
3220 PRINT".EJECTnn",,"Eject page within nn lines from the bottom
3230 PRINT".EOL",,"Programmable end of line character
3240 PRINT".FORMSTOP",,"Stops printer at page breaks
3250 PRINT".FORMSTOPOFF",,"Turns off .FORMSTOP
3260 PRINT".LINESnn",,"Number of printed lines per page
3270 PRINT".MARGINn",,"Sets the left margin
3280 PRINT".PAGErr,cc",,"Page numbering.  rr = row, cc = column
3290 PRINT".PAGELINESnn",,"Page length.  nn = number of lines per page
3300 PRINT".SPACEn",,"Sets additional spaces between lines
3310 PRINT".TITLEA,nn,text","Sets headers & footers
3320 PRINT".TITLEB,nn,text","Up to 3 titles per page
3330 PRINT".TITLEC,nn,text",,"
3340 PRINT".TOPn",,"Sets number of spaces at top of page
3350 PRINT".USER",,"User defined command
3360 GOSUB 5000
3400 CLS:LOCATE ,25:COLOR 0,7:PRINT" P R I N T I N G   M O D E S ";:COLOR 7,0:PRINT
3410 LOCATE 8,1:PRINT"COMPRESSED ON",,"CTRL O - CTRL O
3420 PRINT"COMPRESSED OFF","CTRL O - CTRL R
3430 PRINT:PRINT"DOUBLE STRIKE ON","CTRL O - ESC G
3440 PRINT"DOUBLE STRIKE OFF","CTRL O - ESC H
3450 PRINT:PRINT"DOUBLE WIDTH ON","CTRL O - CTRL N
3460 PRINT"DOUBLE WIDTH OFF","CTRL O - CTRL T
3470 PRINT:PRINT"EMPHASIZED ON",,"CTRL O - ESC E
3480 PRINT"EMPHASIZED OFF","CTRL O - ESC F
3490 GOSUB 5000
4090 GOTO 9990
5000 KEY OFF:PN=PN+1:LOCATE 1,72:PRINT"page"PN:LOCATE 25,65:COLOR 18,0:PRINT "PRESS ANY KEY";:COLOR 7,0
5010 A$=INKEY$:IF A$<>"" THEN 5010
5020 A$=INKEY$:IF A$="" THEN 5020
5030 IF A$=CHR$(27) THEN 9990 ELSE CLS:RETURN
6000 CLS:X=0:COLOR ,0
6010 FOR I=0 TO 31
6020 IF X=0 THEN COLOR I:PRINT"COLOR"I",0";:X=1:GOTO 6040
6030 IF X THEN PRINT TAB(40);:COLOR I:PRINT"COLOR"I",0":X=0
6040 NEXT:COLOR 7,0:GOSUB 5000
6050 CLS:X=0:COLOR ,7
6060 FOR I=0 TO 31
6070 IF X=0 THEN COLOR I:PRINT"COLOR"I",7";:X=1:GOTO 6090
6080 IF X THEN PRINT TAB(40);:COLOR I:PRINT"COLOR"I",7":X=0
6090 NEXT:COLOR 7,0:RETURN
9990 IF MUSIC=FALSE THEN 9997
9995 S$="O3L8GD16D-16D16D+DP4L8F+.L8G.":PLAY "XS$;"
9997 CLS:COLOR 7,0:KEY ON:END
10000 SAVE"B:PROGRAM1
10010 GOTO 9997
