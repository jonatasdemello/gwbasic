10 REM ======================================================================
20 REM ============================= IQ Builder =============================
30 REM This program presents a menu of the programs available in the      ===
40 REM IQ Builder series and allows the user to select a program by       ===
50 REM moving the cursor to the desired program and pressing ENTER.       ===
60 REM ======================================================================
70 REM $s2
80 REM  =====================================================================
90 REM  Turn off KEY display, set display width, clear the screen and set ===
100 REM KEY(10) to reload the menu program when pressed in command mode.  ===
110 REM =====================================================================
120 REM $s2
130 KEY OFF:WIDTH 80:CLS:KEY 10,"run "+CHR$(34)+"b:???0??"+CHR$(13)
140 REM $s2
150 REM =====================================================================
160 REM Display the menu of the programs available in IQ Builder.         ===
170 REM =====================================================================
180 REM $s2
190 LOCATE 1,34,0:COLOR 0,7:PRINT " IQ Builder ";
200 LOCATE 3,10:COLOR 7,0:PRINT "The following programs are available on this diskette:";
210 LOCATE 5,30:PRINT "Number Series"
220 LOCATE 6,30:PRINT "Analogies"
230 LOCATE 7,30:PRINT "Synonyms"
240 LOCATE 8,30:PRINT "Antonyms"
270 LOCATE 16,1:PRINT"Use the ";:COLOR 15:PRINT"UP ("CHR$(24)")";:COLOR 7:PRINT" and ";:COLOR 15:PRINT"DOWN ("CHR$(25)")";:COLOR 7:PRINT" arrows to position the cursor to the function"
280 LOCATE 17,1:PRINT"desired and then press the ";:COLOR 15:PRINT"ENTER ("CHR$(17)CHR$(196)CHR$(217)")";:COLOR 7:PRINT" key."
290 REM $s2
300 REM =====================================================================
310 REM Set up the initial coordinates for the selection arrow.           ===
320 REM =====================================================================
330 REM $s2
340 X=25:Y=5
350 REM $pa
360 REM =====================================================================
370 REM Set up UP and DOWN arrows for moving selection arrow.             ===
380 REM =====================================================================
390 REM $s2
400 KEY(11) ON:KEY(14) ON:ON KEY(11) GOSUB 730:ON KEY(14) GOSUB 800
410 REM $s2
420 REM =====================================================================
430 REM Set up KEY(10) to return to MENU program on A-disk.               ===
440 REM =====================================================================
450 REM $s2
460 KEY(10) ON:ON KEY(10) GOSUB 1000
470 REM $s2
480 REM =====================================================================
490 REM Display highlighted selection arrow at Y,X.                       ===
500 REM =====================================================================
510 REM $s2
520 COLOR 31:LOCATE Y,X:PRINT "==>";
530 REM $s2
540 POKE 106,0'clear kybd buffer
550 REM $s2
560 REM =====================================================================
570 REM If ENTER is pressed, go to program run routine.                   ===
580 REM =====================================================================
590 REM $s2
600 IF INKEY$ = CHR$(13) THEN BEEP:COLOR 7:CLS:GOTO 870
610 REM $s2
620 REM =====================================================================
630 REM Display the date and time at the bottom of the display.           ===
640 REM =====================================================================
650 REM $s2
660 COLOR 7:LOCATE 25,25:PRINT DATE$,TIME$;
670 GOTO 520
680 REM $pa
690 REM =====================================================================
700 REM Move the selection arrow up if it isn't at the top of the menu.   ===
710 REM =====================================================================
720 REM $s2
730 BEEP:Y1=CSRLIN:X1=POS(0):LOCATE Y,X:PRINT "   ";:LOCATE Y1,X1:IF Y>5 THEN Y=Y-1
740 RETURN 520
750 REM $s2
760 REM =====================================================================
770 REM Move the selection arrow down if it isn't at the top of the menu. ===
780 REM =====================================================================
790 REM $s2
800 BEEP:Y1=CSRLIN:X1=POS(0):LOCATE Y,X:PRINT "   ";:LOCATE Y1,X1:IF Y<8 THEN Y=Y+1
810 RETURN 520
820 REM $s2
830 REM =====================================================================
840 REM Run the selected program. If selection is invalid, return to menu.===
850 REM =====================================================================
860 REM $s2
870 IF Y=5 THEN RUN "numbers"
880 IF Y=6 THEN RUN "analog"
890 IF Y=7 THEN RUN "synonym"
900 IF Y=8 THEN RUN "antonym"
930 BEEP:LOCATE 2,1:PRINT "Please make another selection."
940 FOR I=1 TO 1000:NEXT I:RUN
950 REM $s2
960 REM =====================================================================
970 REM Return to MENU program on the A-disk.                             ===
980 REM =====================================================================
990 REM $s2
1000 COLOR 7,0:RUN "menu"
