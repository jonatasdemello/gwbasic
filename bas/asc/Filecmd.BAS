10 ' **************************FILCMD.BAS**************************************
20 ' *                                                                        *
30 ' *  BASIC FILECOMMAND for DOS 1.1 - MONOCHROME/80 COLUMN COLOR MONITOR    *
40 ' *                                  1,2, OR 3 DRIVES                      *
50 ' *    By Gene R. McGalliard                                               *
60 ' *    Naval Postgraduate School     For DOS 2.0 Version:                  *
70 ' *    Monterey, Ca 93943             1. Download this and FILCM2.MRG      *
80 ' *    74145,63                       2. MERGE "FILCM2.MRG" into this.     *
90 ' *                                                                        *
100 '*    This program is designed to load, run, rename or delete .BAS        *
110 '*    files from any disk, including a RAMDISK without typing the         *
120 '*    command and program name, but rather using the cursor keys and      *
130 '*    a command keystroke.  All .BAS files from the selected disk will    *
140 '*    be displayed, with one in reverse video.  The program is selected   *
150 '*    by positioning the reverse video section with cursor keys and       *
160 '*    pressing the appropriate key to load, run, rename or kill the file. *
170 '*                                                                        *
180 '*    This is an enhanced version of a program by A.D. Scarbrough,        *
190 '*    which appeared in the September 1983 issue of PC WORLD.             *
200 '*    I have found the program especially effective when loaded           *
210 '*    in a RAMDISK and loaded/run by using PROKEY, or any user defined    *
220 '*    keying system.                                                      *
230 '*                                                                        *
240 '*    Program code expanded for clarity.  To make this program take less  *
250 '*    space, run/load faster, I recommand removing remarks lines,         *
260 '*    compressing code and saving under a short name, without /A option.  *
270 '*    If you have no C: (RAMDISK/HARDDISK), change variable D in line     *
280 '*    340 to something other than 3. (i.e. D=2)                           *
290 '*                                                                        *
300 '*    Please report any bugs/suggestions to me via a SIG message.         *
310 '*                                                                        *
320 '*                                                                        *
330 '*********************CALL MAIN MENU - INITIAL INPUT***********************
340 SCREEN 0,0,0:WIDTH 80:D=3 'make d<>3 with no C: drive present
350 GOSUB 1090
360 K$=INPUT$(1)
370 IF K$="S" OR K$="s" THEN 1290 ELSE IF K$="E" OR K$="e" THEN 1300
380 IF D=3 THEN IF K$="C" OR K$="c" THEN B=2:GOTO 410
390 IF K$="B" OR K$="b" THEN B=1 ELSE IF K$="A" OR K$="a" THEN B=0 ELSE BEEP:GOTO 360
400 '************************CALL FILES ***************************************
410 IF SCRNCK=1 THEN CLS
420 LOCATE 1,1:IF B=0 THEN D$="A:" ELSE IF B=1 THEN D$="B:" ELSE IF B=2 AND D=3 THEN D$="C:"
430 ON ERROR GOTO 1280:FILES D$+"*.BAS"
440 AA=CSRLIN:GOSUB 1170:ON ERROR GOTO 350:Y=1:X=0
450 F$="":COLOR 0,7:FOR L=1 TO 12:LOCATE Y,X+L:C$=CHR$(SCREEN(Y,X+L)):PRINT C$:F$=F$+C$:NEXT L:COLOR 7,0
460 '************************INKEY$ SCREENING *********************************
470 K$=INKEY$:IF LEN(K$)=0 THEN 470
480 IF LEN(K$)=2 THEN 720 'CURSOR
490 IF K$="A" OR K$="a" THEN B=0:COLOR 7,0:GOTO 700
500 IF K$="B" OR K$="b" THEN B=1:COLOR 7,0:GOTO 700
510 IF D=3 AND (K$="C" OR K$="c") THEN B=2:COLOR 7,0:GOTO 700
520 IF SFLAG=9 THEN IF K$="Y" OR K$="y" THEN CLS:SYSTEM
530 IF SFLAG=9 AND SCRNCK=1 THEN SFLAG=0:K$="":GOSUB 1340:GOTO 360
540 IF SFLAG=9 AND SCRNCK=2 THEN GOSUB 1340:GOTO 450
550 IF SFLAG=8 THEN IF K$="Y" OR K$="y" THEN CLS:NEW
560 IF SFLAG=8 AND SCRNCK=1 THEN SFLAG=0:K$="":GOSUB 1340:GOTO 360
570 IF SFLAG=8 AND SCRNCK=2 THEN GOSUB 1340:GOTO 450
580 IF SFLAG=7 THEN IF K$="Y" OR K$="y" THEN OKAY=1:GOTO 870
590 IF SFLAG=7 THEN SFLAG=0:K$="":GOSUB 1340:GOTO 450
600 IF SFLAG=6 THEN IF K$="Y" OR K$="y" THEN OKAY=2:GOTO 920
610 IF SFLAG=6 THEN SFLAG=0:K$="":GOSUB 1340:GOTO 450
620 IF ASC(K$)=13 THEN 790 'LOAD
630 IF ASC(K$)=42 THEN 830 'RUN
640 IF ASC(K$)=83 OR ASC(K$)=115 THEN 1290 'SYSTEM
650 IF (ASC(K$)=68 OR ASC(K$)=100) AND LEFT$(F$,1)<>" " THEN 1310 'DELETE
660 IF ASC(K$)=69 OR ASC(K$)=101 THEN 1300 'END
670 IF (ASC(K$)=82 OR ASC(K$)=114) AND LEFT$(F$,1)<>" " THEN 1320 'RENAME
680 IF ASC(K$)=27 THEN 350 'RETURN MENU
690 BEEP:K$="":GOTO 470
700 FOR JJ=1 TO AA:LOCATE JJ,1:PRINT STRING$(80,32):NEXT:GOTO 410
710 '******************FILE HIGHLIGHT POSITION CONTROL*************************
720 R$=RIGHT$(K$,1):A=ASC(R$):IF A=72 AND Y>1 THEN GOSUB 1070:Y=Y-1:GOTO 450
730 IF A=80 AND Y<AA-1 THEN GOSUB 1070:Y=Y+1:GOTO 450
740 IF A=75 AND X>12 THEN GOSUB 1070:X=X-13:GOTO 450
750 IF A=77 AND X<64 THEN GOSUB 1070:X=X+13:GOTO 450
760 GOTO 470
770 '***********************EXECUTION LINES************************************
780 '=========LOADING ROUTINE
790 IF LEFT$(F$,1)=" " THEN BEEP:GOTO 450 ELSE CLS:COLOR 0,7:PRINT"Loading ---> ";F$:COLOR 7,0
800 IF B=1 THEN LOAD"B:"+F$ ELSE IF B=2 THEN LOAD"C:"+F$ ELSE LOAD"A:"+F$
810 GOTO 1070
820 '=========RUNNING ROUTINE
830 IF LEFT$(F$,1)=" " THEN BEEP:GOTO 450 ELSE CLS:COLOR 0,7:PRINT"Running ---> ";F$:COLOR 7,0
840 IF B=1 THEN RUN"B:"+F$ ELSE IF B=2 THEN RUN"C:"+F$ ELSE RUN"A:"+F$
850 GOTO 1070
860 '=========DELETING ROUTINE
870 IF OKAY=1 AND B=0 THEN KILL"A:"+F$:SFLAG=0:OKAY=0:GOTO 900
880 IF OKAY=1 AND B=1 THEN KILL"B:"+F$:SFLAG=0:OKAY=0:GOTO 900
890 IF OKAY=1 AND B=2 THEN KILL"C:"+F$:SFLAG=0:OKAY=0:GOTO 900
900 GOSUB 1340:GOTO 700
910 '=========RENAMING ROUTINE
920 COLOR 0,7:LOCATE AA+5,1:PRINT"New Name for ";F$;:INPUT" -->";N$:COLOR 7,0
925 IF LEN(N$)=0 THEN BEEP:GOTO 1020
930 IF RIGHT$(N$,4)<>".bas" OR RIGHT$(N$,4)<>".BAS" THEN N$=N$+".BAS"
940 LOCATE AA+5,1:PRINT STRING$(79,32)
950 LOCATE AA+5,1:COLOR 0,7:PRINT"Is ";N$;" correct? (Y/N)":COLOR 7,0
960 Q$=INKEY$:IF LEN(Q$)=0 THEN 960
970 IF Q$="Y" OR Q$="y" THEN Q=1:GOTO 980 ELSE 1020
980 ON ERROR GOTO 1030
990 IF Q=1 AND OKAY=2 AND B=0 THEN NAME"A:"+F$ AS "A:"+N$:GOTO 1020
1000 IF Q=1 AND OKAY=2 AND B=1 THEN NAME"B:"+F$ AS "B:"+N$:GOTO 1020
1010 IF Q=1 AND OKAY=2 AND B=2 THEN NAME"C:"+F$ AS "C:"+N$
1020 GOSUB 1340:LOCATE AA+5,1:PRINT STRING$(50,32):N$="":Q=0:SFLAG=0:OKAY=0:GOTO 410
1030 IF ERR=58 THEN RESUME 1040 ELSE SCRNCK=1:GOTO 410
1040 BEEP:BEEP:COLOR 0,7:LOCATE AA+5,1:PRINT"Duplicate Name, try again!!!!":COLOR 7,0
1050 FOR JJ=1 TO 1500:NEXT:GOTO 1020
1060 '************************SCREENS******************************************
1070 FOR L=1 TO 12:LOCATE Y,X+L:PRINT CHR$(SCREEN(Y,X+L)):NEXT L:F$=LEFT$(F$,0):RETURN
1080 '***********************SCREEN #1*****************************************
1090 ON ERROR GOTO 350:CLS:LOCATE 1,1:PRINT CHR$(201):I=1:FOR J=2 TO 43:LOCATE I,J:PRINT CHR$(205);:NEXT J
1100 PRINT CHR$(187);:I=8:AA=9
1110 FOR J=2 TO 43:LOCATE I,J:PRINT CHR$(205);:NEXT J:PRINT CHR$(188);:LOCATE 8,1:PRINT CHR$(200):J=1
1120 FOR I=2 TO 7:LOCATE I,J:PRINT CHR$(186);:NEXT I:J=44:FOR I=2 TO 7:LOCATE I,J:PRINT CHR$(186);:NEXT I
1130 IF FLAG=1 THEN LOCATE 2,5:PRINT"*** No .BAS files in drive <";D$;"> ***":FLAG=0
1140 SCRNCK=1:LOCATE 3,8:PRINT "Select drive A,B";:IF D=3 THEN PRINT", or C files"
1150 LOCATE 5,6:PRINT"<E> to END and CLEAR this program":LOCATE 6,6,0:PRINT"<S> to RETURN to DOS":RETURN
1160 '************************SCREEN #2****************************************
1170 LOCATE AA,1:FOR I=1 TO 80:PRINT CHR$(205);:NEXT:COLOR 0,7:LOCATE AA,69:PRINT"DRIVE --> ";D$:COLOR 7,0
1180 IF SCRNCK=2 THEN RETURN ELSE SCRNCK=2:LOCATE 18,1:FOR I=1 TO 80:PRINT CHR$(205);:NEXT
1190 LOCATE 19,1:PRINT"<A> ------ A-drive .BAS FILES":LOCATE 20,1:PRINT"<B> ------ B-drive .BAS FILES"
1200 IF D=3 THEN LOCATE 21,1:PRINT"<C> ------ C-drive .BAS FILES"
1210 LOCATE 22,1:PRINT"<S> ------ RETURN to DOS":LOCATE 23,1:PRINT"<E> ------ END and CLEAR this program"
1220 LOCATE 19,40:PRINT"<ESC> ---- RETURN to opening screen"
1230 LOCATE 20,40:PRINT"<ENTER> -- LOAD --- highlighted file"
1240 LOCATE 21,40:PRINT"<*> ------ RUN ---- highlighted file"
1250 LOCATE 22,40:PRINT"<D> ------ DELETE - highlighted file"
1260 LOCATE 23,40:PRINT"<R> ------ RENAME - highlighted file":RETURN
1270 '************************SAFETY CHECKS************************************
1280 BEEP:FLAG=1:RESUME 350
1290 BEEP:S$="** RETURN TO DOS **":SFLAG=9:GOTO 1330
1300 BEEP:S$="** END this PROGRAM **":SFLAG=8:GOTO 1330
1310 BEEP:S$="DELETE ---> "+F$:SFLAG=7:GOTO 1330
1320 BEEP:S$="RENAME ---> "+F$:SFLAG=6
1330 BEEP:LOCATE AA+1,1:COLOR 0,7:PRINT S$:LOCATE AA+3,1:PRINT"Are you sure? (Y/N)":COLOR 7,0:GOTO 470
1340 SFLAG=0:LOCATE AA+1,1:PRINT STRING$(30,32):LOCATE AA+3,1:PRINT STRING$(19,32):RETURN
1350 '************************END OF PROGRAM***********************************
