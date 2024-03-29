1000 PROG1$=" K E Y S B A S "
1010 REV$ = "  Rev: 830120  "'By Robert Hamilton
1020 NOTE$="The Special Function Keys are programmed for Basic Programming.  An overlay template may be printed on the Matrix Printer from (LPT1:)"
1030 SCREEN 0,0,0:WIDTH 80:COLOR 6,0,0:KEY OFF:CLS:UP$=STRING$(1,30)
1040 LOCATE ,,1,12,13:DEF SEG=0:IF PEEK (&H410)= 109 THEN LOCATE ,,,6,7
1050 DEF SEG=64:POKE 23,128:DEF SEG:CL$=STRING$(79,0):Q$=CHR$(34)
1060 ON ERROR GOTO 1230
1070      REM: �� PROGRAM KEYS
1080 KEY OFF: KEY 1,CHR$(27)+"CLS:LIST "
1090 KEY 2,CHR$(27)+"RUN  "+CHR$(7):KEY 3,CHR$(27)+"LOAD"+CHR$(7)+CHR$(34)
1100 KEY 4,CHR$(27)+"SAVE "+CHR$(34):KEY 5,CHR$(27)+"RUN"+CHR$(7)+CHR$(34):KEY 6,CHR$(27)+"GOTO 1000"
1110 KEY 7,CHR$(27)+CHR$(12)+"FILES "+CHR$(34)+"A:*.*":KEY 8,CHR$(27)+"RENUM 1000"
1120 KEY 9,CHR$(12)+"COLOR 6,0:CLS"+CHR$(13):KEY 10,CHR$(27)+"RUN"+CHR$(34)+"AUTOST"
1130     REM: �� PRINT TEMPLATE
1140 CLS:LOCATE 5,30:PRINT PROG1$:LOCATE 7,30:PRINT REV$
1150 LOCATE 20,1:PRINT NOTE$
1160 LOCATE 25,1:COLOR 0,7:PRINT " SPACE ";:COLOR 5,0:PRINT " To Quit  ";
1170 COLOR 0,7:PRINT " P ";:COLOR 5,0:PRINT " To Print Template  ";:COLOR 6,0
1180 K$=INKEY$: IF MID$(K$,1,1)=CHR$(13) OR MID$(K$,1,1)=" " THEN 1220
1190 IF MID$(K$,1,1)="P" OR MID$(K$,1,1)="p" THEN 1210
1200 GOTO 1180
1210 GOSUB 1250
1220 CLS:LOCATE 20,1:BEEP:COLOR 6,0:PRINT "DONE";CHR$(10):KEY ON:END
1230 CLS:LOCATE 20,1:BEEP:COLOR 6,0:KEY ON:ON ERROR GOTO 0:END
1240     REM: �� FUNCTION KEY TEMPLATE
1250 CLS:LOCATE 23,1:COLOR 6,0:PRINT"WAIT - Printing";
1260 LPRINT CHR$(15);CHR$(27)+CHR$(71)
1270 LPRINT SPC(18);PROG1$;CHR$(10);SPC(18);REV$
1280 LPRINT " ______________________________________________ "
1290 LPRINT "|                 PROGRAMMING   KEYS           |"
1300 LPRINT "|              .----------------------.        |"
1310 LPRINT "|              |                      |        |  TRIM INSIDE"
1320 LPRINT "|   LIST       |                      | RUN    |  BORDER LINE"
1330 LPRINT "|   Program    |                      | Prog   |"
1340 LPRINT "|              |                      |        |"
1350 LPRINT "|              |         CUT          |        |"
1360 LPRINT "|   LOAD       |                      | SAVE   |"
1370 LPRINT "|   Program    |         OUT          | Prog   |"
1380 LPRINT "|              |                      |        |"
1390 LPRINT "|              |         THIS         |        |"
1400 LPRINT "|              |                      |        |"
1410 LPRINT "|   LOAD &     |         AREA         | GOTO   |"
1420 LPRINT "|   RUN Prog   |                      | Line   |"
1430 LPRINT "|              |                      |        |"
1440 LPRINT "|              |                      |        |"
1450 LPRINT "|   DIRECTORY  |                      | RENUM  |"
1460 LPRINT "|   of FILES   |                      | PROG   |"
1470 LPRINT "|              |                      |        |"
1480 LPRINT "|              |                      |        |"
1490 LPRINT "|              |                      |        |"
1500 LPRINT "|   CLEAR      |                      | RUN    |"
1510 LPRINT "|   SCREEN     |                      | AUTOST |"
1520 LPRINT "|              |______________________|        |"
1530 LPRINT "|                                              |"
1540 LPRINT "|   Esc = Abort       ? = Print     ' = REM    |"
1550 LPRINT "|______________________________________________|"
1560 PR$=STRING$(33,10):LPRINT PR$:LPRINT CHR$(18);CHR$(27)+CHR$(72):RETURN
1570 END
