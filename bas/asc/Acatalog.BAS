1000 PROG1$="        A C A T A L O G        "
1010 REV$ = "          Rev: 830122          "
1020 ID$  = "      By  Robert Hamilton      "
1030 NOTE$= "NOTE: This is a catalog of programs on this disk:
1040 SCREEN 0,0,0:WIDTH 80:COLOR 2,0,0:KEY OFF:CLS
1050 LOCATE ,,1,12,13:DEF SEG=0:IF PEEK (&H410)= 109 THEN LOCATE ,,,6,7
1060 DEF SEG=64:POKE 23,128:DEF SEG:ON ERROR GOTO 1310
1070 OPTION BASE 1:CL$=STRING$(79,0):UP$=STRING$(1,30):Q$=CHR$(34)
1080 DIM A$(112):DEFINT I
1090 KEY 1,CHR$(27)+"CLS:LIST ":KEY 2,CHR$(27)+"RUN"+CHR$(7)
1100 KEY 9,CHR$(12)+"COLOR 6,0:CLS"+CHR$(13)
1110 FOR I=1 TO 10:ON KEY(I) GOSUB 0:KEY (I) ON:NEXT '   Turns Keys Off, Basica
1120      REM: �� TITLE
1130 CLS:LOCATE 4,25:COLOR 2,0:PRINT CHR$(213)+STRING$(31,205)+CHR$(184):PFLAG=0:RESTORE
1140 PRINT TAB(25);CHR$(179);:COLOR 6,0:PRINT PROG1$;:COLOR 2,0:PRINT CHR$(179)
1150 PRINT TAB(25);CHR$(179)+STRING$(31,32)+CHR$(179)
1160 PRINT TAB(25);CHR$(179)+REV$;CHR$(179)
1170 PRINT TAB(25);CHR$(212)+STRING$(31,205)+CHR$(190)
1180 PRINT CHR$(10);TAB(25);ID$;    '                              Name Option
1190 LOCATE 20,1:COLOR 6,0:PRINT NOTE$;   '                        Note Option
1200 LOCATE 24,1:COLOR 0,7:PRINT" SPACE ";:COLOR 5,0:PRINT" For CRT Report   ";
1210 COLOR 0,7:PRINT" P ";:COLOR 5,0:PRINT" For Printer Report   ";
1220 COLOR 0,7:PRINT" Q ";:COLOR 5,0:PRINT" To Quit ";:COLOR 6,0:SOUND 500,6
1230 K$=INKEY$
1240 IF MID$(K$,1,1)="p" OR MID$(K$,1,1)="P" THEN PFLAG=1
1250 IF MID$(K$,1,1)="q" OR MID$(K$,1,1)="Q" THEN 1280
1260 IF K$="" THEN 1230
1270 GOTO 1330
1280 ' Cls:Locate 24,1:System:End '             Remove first ' To Return To DOS
1290 CLS:LOCATE 20,1:COLOR 6,0:PRINT"DONE";CHR$(10):KEY ON:SOUND 200,6:END
1300 IF ERR=24 OR ERR=25 OR ERR=27 THEN BEEP:CLOSE #1:LOCATE 23,1:COLOR 12,0:PRINT"CHECK PRINTER";:GOSUB 1940:RESUME 1800
1310 SOUND 600,5:PRINT CHR$(10):COLOR 6,0:CLS:LOCATE 22,1:ON ERROR GOTO 0:END
1320 '
1330     REM: �� DATA
1340 'REM "FILENAME.ext  DESCRIPTION
1350 DATA "ACATALOG.bas  A Catalog of the programs on this disk
1360 DATA "ASCICHAR.bas  Display or Prints primary and alternate charater sets
1370 DATA "ASCII   .bas  A chart of ASCII Characters (Decimal)
1380 DATA "AUTOINST.bas  Prints Autostart Program Instructions (AUTOST.bas)
1390 DATA "AUTOPEEK.bas  Displays 10 locations of memory in Dec or Hex
1400 DATA "AUTOST  .bas  Sets Date & Time, Displays Files & Runs program
1410 DATA "CHECKOUT.bas  Checks Serial & Parallel equipment & handshake
1420 DATA "COLORSET.bas  Displays color options on a color monitor
1430 DATA "KEYSBAS .bas  Programs Function keys for Basic and Prints Overlay
1440 DATA "KEYSMP  .bas  Prints a Function Key Overlay for Multiplan Program
1450 DATA "LONGZONE.bas  Computes GMT (UCT) and Local Time for any longitude
1460 DATA "MENU    .bas  Runs AUTOST.bas program
1470 DATA "MINIPROG.bas  A skeletin Basic Program used to start a new program
1480 DATA "MODULO  .bas  Demonstrates Modulo Arithemetic
1490 DATA "MONOSET .bas  Displays screen options for the Monochrome Monitor
1500 DATA "NUMVERT .bas  Displays numbers in ASCII, DEC, OCT, HEX, and BINARY
1510 DATA "OPKEYS  .bas  Programs the Function Keys for basic programming
1520 DATA "PAYMENT .bas  Computes Payment for a fully amortized loan
1530 DATA "PEEK    .bas  Peeks at a location in memory
1540 DATA "Q       .bas  Returns to DOS with clear screen and keys reset
1550 DATA "REAL$   .bas  Displays and Prints a table of Real Estate Appreciation
1560 DATA "SYS     .bas  Returns to DOS with clear screen and keys reset
1570 DATA "TIME    .bas  Displays System Date and Time on the screen
1580 DATA "!       .bat  Boots up Basica and Autost from DOS
1590 DATA "AUTOEXEC.bat  Boots up Basica and Autost from Power ON Startup
1600 DATA "STARTUP .bat  Transfers DOS and Basica from DOS Disk in B to Disk in Drive A
1610 DATA "2COLOR  .com  Transfers to Color Graphics Adaptor and Monitor from DOS
1620 DATA "2MONO   .com  Transfers to Monochrome Adaptor and Monitor from DOS
1630 DATA "DISKID  .rev  Contains Disk ID Label and Year for AUTOST program
1640 DATA "2COLOR  .sys  Transfers to Color Graphics Adaptor and Monitor from Basica
1650 DATA "2MONO   .sys  Transfers to Monochrome Adaptor and Monitor from Basica
1660 DATA ""
1670 DATA "NOTE: The above programs will run with 64 Kb RAM and an 80 Column Monitor"
1680 DATA ""
1690 DATA "NOTE: To transfer DOS and Basica to this disk,  go to DOS with  A>  showing on        screen.  Place this disk in Drive A.  Place a disk with DOS and Basica in       Drive B.  Type STARTUP  and  press ENTER."
1700 DATA "End"
1710 '
1720      REM: �� REPORT
1730      B$="                            CATALOG  OF  PROGRAMS"
1740      C$="NAME          DESCRIPTION"
1750      D$="========.===  ================================================================"
1760 ON ERROR GOTO 2050
1770 FOR I=1 TO 112: READ A$(I):NEXT
1780 ON ERROR GOTO 1300:IF PFLAG=1 THEN GOSUB 1930
1790 IF PFLAG<>1 THEN OPEN "SCRN:" FOR OUTPUT AS #1
1800 IF PFLAG=1 THEN OPEN "LPT1:" FOR OUTPUT AS #1
1810 IF PFLAG=1 THEN GOSUB 2030:GOTO 1830
1820 GOSUB 2020
1830 FOR I = 1 TO FIN:IF I/20=I\20 AND PFLAG<>1 THEN GOSUB 1980:GOSUB 2020
1840 IF PFLAG=1 AND I/57=I\57 THEN PRINT #1,CHR$(12);:GOSUB 2030
1850 PRINT #1,A$(I)
1860 NEXT
1870 IF PFLAG=1 THEN PRINT #1,CHR$(12);
1880 CLOSE #1:GOSUB 1960
1890 K$=INKEY$
1900 IF MID$(K$,1,1)="q" OR MID$(K$,1,1)="Q" THEN 1280
1910 IF K$="" THEN 1890
1920 GOTO 1130
1930 CLS
1940 LOCATE 25,1:COLOR 12,0:PRINT"Turn Matrix Printer ON and ENTER to Continue";
1950 COLOR 6,0:INPUT;"",ZZ$:CLS:LOCATE 25,1:PRINT"WAIT - PRINTING";:RETURN
1960 LOCATE 25,1:PRINT CL$;:LOCATE ,1:COLOR 0,7:PRINT" SPACE ";:COLOR 5,0:PRINT" To Continue   ";
1970 COLOR 0,7:PRINT" Q ";:COLOR 5,0:PRINT" To Quit ";:COLOR 6,0:RETURN
1980 GOSUB 1960
1990 K$=INKEY$:IF MID$(K$,1,1)="q" OR MID$(K$,1,1)="Q" THEN 1280
2000 IF K$="" THEN 1990
2010 CLS:RETURN
2020 CLS:LOCATE 1,1:COLOR 6,0:PRINT #1,C$;CHR$(10);D$;CHR$(10):RETURN
2030 PRINT #1,CHR$(10);B$;CHR$(10)
2040 PRINT #1,C$;D$;CHR$(10):RETURN
2050 FIN=I:RESUME 1780
2060 END
