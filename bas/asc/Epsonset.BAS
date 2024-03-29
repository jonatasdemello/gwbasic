5 CLS:KEY OFF:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 10-57
10 '*****************  PRINTER STYLES AND CONTROL CODES  **********************
12 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
14 '�                EPSON/GEMINI 10/15 PRINT CONTROL PRINTOUT                �
16 '�                                                                         �
18 '�    This program establishes a series of standard control codes for      �
20 '� the MX-80 and GEMINI series printers. If the controls are entered in    �
22 '� your program as a subroutine and read on initializing, they may be      �
24 '� used for printer control from your program in single or combined form.  �
26 '� Run this program for an example of the print formats and then check out �
28 '� the referenced line numbers to see the code make up and 'call code.'    �
30 '� For an easy merge task, call up PRNTCALL.BAS on this disk.              �
32 '�    The error routine will take care of printer 'off' or 'off line'. It  �
34 '� will go to Basic error-handling for 'paper-out' or others.  This pro-   �
36 '� gram may be used in whole or part without license or attribution.       �
38 '�                    (c) G I N A C O   1983            Ver 5.1/160/320    �
40 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLS
300  SCREEN 0,0,0
310   WIDTH 80
320    CLEAR
330     FOR I! = 1 TO 10
340        KEY I!,""
350       NEXT
360 GOSUB 900
370  GOSUB 5000
380   CLS
390    LOCATE 6,20
400     PRINT "TURN PRINTER ON AND SET PAPER FOR PRINTOUT"
410      LOCATE 8,20
420       PRINT "THIS WILL PRINTOUT A TEST OF ALL SETTINGS"
430        LOCATE 10,20
440         PRINT "YOU CAN THEN CHECK OUTPUT WITH CODES USED"
450 LOCATE 12,20
460  PRINT "FOR YOUR OWN PROGRAMMING & PRINTING WORK."
470   LOCATE 16,28
480    PRINT "PRESS ANY KEY TO CONTINUE"
490 IF INKEY$ = "" THEN 490 ELSE 500
500 GOSUB 900
510  LPRINT SMALL$;"THIS IS CONDENSED -- LINE 5030"
520   GOSUB 900
530    LPRINT UNSMALL$;"THIS IS CONDENSED CLEARED -- LINE 5060"
540     GOSUB 900
550      LPRINT EXPAND.SMALL$;"THIS IS CONDENSED EXPANDED  -- LINE 5090"
560       GOSUB 900
570        CANX.EXP.COMP$ = CHR$(18) + CHR$(20)
580 GOSUB 900
590  LPRINT EXPAND$;"EXPANDED SINGLE LINE  -- LINE 5150"
600   GOSUB 900
610    LPRINT EXPAND.END$;"THIS CLEARS EXPANDED -- LINE 5180"
620     GOSUB 900
630      LPRINT DARK$;"THIS IS EMPHASIZED PRINT -- LINE 5210"
640       GOSUB 900
650 LPRINT ITALIC$;"THIS IS ITALICS MODE -- LINE 5240"
660  GOSUB 900
670   LPRINT ITALIC.EXP.CON$;"ITALICS EXPAND CONDENSED -- LINE 5270"
680    GOSUB 900
690     LPRINT ITALIC.EXP$;"THIS IS ITALICS EXPANDED -- LINE 5300"
700      GOSUB 900
710 LPRINT END.ITALIC$;"THIS CLEARS ALL ITALICS -- LINE 5330"
720  GOSUB 900
730   LPRINT START.ULINE$;"THIS STARTS UNDERLINE -- LINE 5360"
740    GOSUB 900
750     LPRINT END.ULINE$;"THIS ENDS UNDERLINE -- LINE 5390"
760      GOSUB 900
770 LPRINT PERM.EXPAN$;"SETS PERMANENT EXPAND -- LINE 5420"
780  GOSUB 900
790   LPRINT END.PERMEXP$;"THIS CLEARS PERMANENT EXPAND -- LINE 5450"
800    GOSUB 900
810     LPRINT START.DSTRIKE$;"STARTS DOUBLE STRIKE -- LINE 5480"
820      GOSUB 900
830 LPRINT END.DSTRIKE$;"TERMINATES DOUBLE STRIKE -- LINE 5510"
840  GOSUB 900
850   LPRINT TINYLINE$;"PRINTS SUBSCRIPT TINYLINE -- LINE 5540"
860    GOSUB 900
870     LPRINT END.TINY$;"CLEARS SUBSCRIPT MODE -- LINE 5570"
880      LLIST 5000 - 5660
890       END
900 ON ERROR GOTO 6030
910 LPRINT CLEANUP$
920  RETURN
5000 REM **** PRINTER SUBROUTINES ***
5030 SMALL$ = CHR$(15)
5060 UNSMALL$ = CHR$(18)
5090 EXPAND.SMALL$ = CHR$(14) + CHR$(15)
5120 CANX.EXP.COMP$ = CHR$(18) + CHR$(20)
5150 EXPAND$ = CHR$(14)
5180 EXPAND.END$ = CHR$(20)
5210 DARK$ = CHR$(27) + CHR$(69)
5240 ITALIC$ = CHR$(27) + CHR$(52)
5270 ITALIC.EXP.CON$ = CHR$(14) + CHR$(15) + CHR$(27) + CHR$(52)
5300 ITALIC.EXP$ = CHR$(27) + CHR$(52) + CHR$(14)
5330 END.ITALIC$ = CHR$(27) + CHR$(53)
5360 START.ULINE$ = CHR$(27) + CHR$(45) + CHR$(1)
5390 END.ULINE$ = CHR$(27) + CHR$(45) + CHR$(0)
5420 PERM.EXPAN$ = CHR$(27) + CHR$(87) + CHR$(1)
5450 END.PERMEXP$ = CHR$(27) + CHR$(87) + CHR$(0)
5480 START.DSTRIKE$ = CHR$(27) + CHR$(71)
5510 END.DSTRIKE$ = CHR$(27) + CHR$(72)
5540 TINYLINE$ = CHR$(27) + CHR$(83) + CHR$(0)
5570 END.TINY$ = CHR$(27) + CHR$(84)
5600 CLEANUP$ = CHR$(27) + CHR$(64)
5630 ESC$ = CHR$(27)
5660 RETURN
6000 REM ********* PRINTER ERROR ROUTINE ***************
6030 IF ERR = 24 THEN 6120 ELSE 6060
6060 IF ERR = 25 THEN 6120 ELSE 6090
6090 ON ERROR GOTO 0
6120 KEY OFF
6150  BEEP
6180   BEEP
6210    LOCATE 25,1
6240     PRINT SPC( 79)
6270      LOCATE 25,20
6300       PRINT "CHECK PRINTER - PRESS ANY KEY TO CONTINUE"
6330 IF INKEY$ = "" THEN 6330
6360 KEY ON
6390  RESUME
6420   LLIST 5000 - 5600
6450    END
65000 REM****************** SAVE ROUTINE **************************************
65100 SAVE "B:EPSONSET.BAS"
