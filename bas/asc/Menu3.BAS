10 REM ============================= ADX008 =================================
20 REM This program presents a menu of the programs available on this     ===
30 REM diskette and allows the user to select a program by moving the     ===
40 REM cursor to the desired program and pressing ENTER.                  ===
50 REM ======================================================================
60 REM  Turn off KEY display, set display width, clear the screen and set ===
70 REM KEY(10) to reload this menu program when pressed in command mode. ===
80 REM =====================================================================
90 KEY OFF:WIDTH 80:CLS
100 REM $s2
110 REM =====================================================================
120 REM Display the menu of the programs available on this diskette.      ===
130 REM =====================================================================
140 LOCATE 1,37,0:COLOR 0,7:PRINT " ADX008 ";
150 LOCATE 3,10:COLOR 7,0:PRINT "The following programs are available on this diskette:";
160 LOCATE 5,30:PRINT "Reading Program"
170 LOCATE 6,30:PRINT "Mastermind"
180 LOCATE 7,30:PRINT "Math program"
190 LOCATE 8,30:PRINT "Frankenstein"
200 LOCATE 9,30:PRINT "Game of Nim"
210 LOCATE 10,30:PRINT "Backgammon"
220 LOCATE 11,30:PRINT"Blackjack"
230 LOCATE 12,30:PRINT"Trucker"
240 LOCATE 13,30:PRINT "IQ Builder"
245 LOCATE 14,30:PRINT "Exit to BASIC"
250 LOCATE 18,1:PRINT"Use the ";:COLOR 15:PRINT"UP ("CHR$(24)")";:COLOR 7:PRINT" and ";:COLOR 15:PRINT"DOWN ("CHR$(25)")";:COLOR 7:PRINT" arrows to position the cursor to the function"
260 LOCATE 19,1:PRINT"desired and then press the ";:COLOR 15:PRINT"ENTER ("CHR$(17)CHR$(196)CHR$(217)")";:COLOR 7:PRINT" key."
270 REM =====================================================================
280 REM Set up the initial coordinates for the selection arrow.           ===
290 REM =====================================================================
300 X=25:Y=5
310 REM =====================================================================
320 REM Set up UP and DOWN arrows for moving selection arrow.             ===
330 REM =====================================================================
340 KEY(11) ON:KEY(14) ON:ON KEY(11) GOSUB 610:ON KEY(14) GOSUB 680
390 REM =====================================================================
400 REM Display highlighted selection arrow at Y,X.                       ===
410 REM =====================================================================
420 COLOR 15:LOCATE Y,X:PRINT "==>";
430 POKE 106,0'clear kybd buffer
440 REM =====================================================================
450 REM If ENTER is pressed, go to program run routine.                   ===
460 REM =====================================================================
470 REM $s2
480 IF INKEY$ = CHR$(13) THEN BEEP:COLOR 7:CLS:GOTO 750
490 REM $s2
500 REM =====================================================================
510 REM Display the date and time at the bottom of the display.           ===
520 REM =====================================================================
530 REM $s2
540 COLOR 7:LOCATE 25,25:PRINT DATE$,TIME$;
550 GOTO 420
560 REM $pa
570 REM =====================================================================
580 REM Move the selection arrow up if it isn't at the top of the menu.   ===
590 REM =====================================================================
600 REM $s2
610 BEEP:Y1=CSRLIN:X1=POS(0):LOCATE Y,X:PRINT "   ";:LOCATE Y1,X1:IF Y>5 THEN Y=Y-1
620 RETURN 420
630 REM $s2
640 REM =====================================================================
650 REM Move the selection arrow down if it isn't at the top of the menu. ===
660 REM =====================================================================
670 REM $s2
680 BEEP:Y1=CSRLIN:X1=POS(0):LOCATE Y,X:PRINT "   ";:LOCATE Y1,X1:IF Y<14 THEN Y=Y+1
690 RETURN 420
700 REM $s2
710 REM =====================================================================
720 REM Run the selected program. If selection is invalid, return to menu.===
730 REM =====================================================================
740 REM $s2
750 IF Y=5 THEN RUN "reading"
760 IF Y=6 THEN RUN "master"
770 IF Y=7 THEN RUN "math"
780 IF Y=8 THEN RUN "frank"
790 IF Y=9 THEN RUN "nim"
800 IF Y=10 THEN RUN "backgam"
810 IF Y=11 THEN RUN "black"
820 IF Y=12 THEN RUN "trucker"
830 IF Y=13 THEN RUN "iqbuild"
835 IF Y=14 THEN STOP
840 BEEP:LOCATE 2,1:PRINT "Please make another selection."
850 FOR I=1 TO 1000:NEXT I:RUN
