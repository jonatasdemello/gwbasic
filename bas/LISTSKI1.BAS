5 CLS:KEY OFF:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 10-57
10 '************   SET PRINTER FOR PERF SKIP - COMPRESSED  **************
16 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
18 '�               STANDARD PROGRAM LISTING WITH SKIP SET                    �
20 '�                                                                         �
22 '�     This is an often overlooked sub-routine which will provide a work-  �
24 '� ing listing with a five line skip either side of the perforation when   �
26 '� you are using standard 11 inch fanfold paper. For this type of Printer  �
28 '� control two versions are used.  One provides for 10 pitch (emphasised   �
30 '� optional) print. This version is for compressed 17.5 pitch print. Note  �
32 '� REM mark (') at LINE 120. This is an optional print statements.  Not    �
33 '� all EPSON or IBM-compatible printers accept a left margin command. If   �
34 '� yours will, you may wish to adjust the width statement in line 110 as   �
35 '� appropriate. For even spacing, set print head 4 to 5 lines below the
36 '� perforation after Top Of Form (TOF) has been set or the Printer just    �
37 '� initialized.         (c) G I N A C O -- 1983          Ver 5.2/160/320   �
50 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLS:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT
70 REM ===== PRINTER LISTING PROGRAM - 17 PITCH MARGIN,10 SKIP 10  =====
80 LPRINT CHR$(27)CHR$(64);             '=== CLEARS PRINTER CONTROL REGISTER
90 LPRINT CHR$(15);                     '=== SETS COMPRESSED PRINT
100 LPRINT CHR$(27)CHR$(78)+CHR$(10);   '=== SETS 10 SPACE SKIP AT PERFORMATION
110 WIDTH "LPT1:",130                   '=== SETS PRINT WIDTH MAX 130 CHARS
120 ' LPRINT CHR$(27)CHR$(77)+CHR$(10);' === LEFT MARGIN - 10 (SOME PRINTERS)
200 CLS:LOCATE 5,10:PRINT"(1) Printer will skip 10 lines at the perforation"
210 LOCATE 7,10:PRINT"(2) Left margin at 2 spaces if Printer accepts command"
220 LOCATE 9,10:PRINT"(3) Emphasized print set if REM remove from LINE 100"
230 LOCATE 11,10:PRINT"(4) Set Print head 5 lines from TOF. Initialize printer"
240 LOCATE 13,10:PRINT"(5) Load program to be listed. "
250 LOCATE 15,10:PRINT"(6) <ENTER> LLIST XXX-YYY (Line range to Print)
260 LOCATE 17,23:PRINT"PRINTER HAS BEEN PRESET AT 17 CPS"
270 END
65000 REM  *************** SAVE ROUTINE **************************************
65100 SAVE"B:LISTSKIP.17P"
