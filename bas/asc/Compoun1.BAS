5 CLS:KEY OFF:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 10-57
10 '*****************  COMPOUND INTEREST COMPUTER $$$$$  **********************
12 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
14 '�                   BASIC COMPOUND INTEREST PROGRAM                       �
16 '�     This program will quickly display the annual compounded value of    �
18 '�  a sum at the end of each year -- compounded monthly. Do not use comma  �
20 '�  when entering initial dollar amount. Enter interest as whole number.   �
22 '�  MAXIMUM NUMBER OF YEARS IS 30.  To increase, change DIM statements in  �
24 '�  line 120 accordingly.  This program may be used without license or     �
26 '�  attribution. (c) G I N A C O --  1983          Ver 5.1/160/320         �
28 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLS:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT
70  SCREEN 0,0,0
80   WIDTH 80
90    CLEAR
100     FOR I! = 1 TO 10
110        KEY I!,""
120       NEXT
130 ' ** VALUE OF X PRINCIPAL AFTER Y YEARLY PERIODS (COMPOUNDED MONTHLY) **
140 DIM PR!(30),MP1!(30),MP2!(30),MP3!(30),MP4!(30),MP5!(30),MP6!(30)
150  DIM MP7!(30),MP8!(30),MP9!(30),MP10!(30),MP11!(30),MP12!(30)
160   S$ = "$#,###,###.##"
170 CLS
180  LOCATE 10,20
190   INPUT "AMOUNT OF PRINCIPAL (NO COMMAS) ",X!
200    LOCATE 12,20
210     INPUT "NUMBER OF YEARS ",Y!
220      LOCATE 14,20
230       INPUT "ANNUAL PERCENTAGE (WHOLE NUMBER) ",Z!
240        PR!(1) = X!
250         AI! = ((Z!) * .01) / 12
260          FOR I! = 1 TO Y!
270             MP1!(I!) = (PR!(I!) * AI!) + PR!(I!)
280              MP2!(I!) = (MP1!(I!) * AI!) + MP1!(I!)
290   MP3!(I!) = (MP2!(I!) * AI!) + MP2!(I!)
300    MP4!(I!) = (MP3!(I!) * AI!) + MP3!(I!)
310     MP5!(I!) = (MP4!(I!) * AI!) + MP4!(I!)
320      MP6!(I!) = (MP5!(I!) * AI!) + MP5!(I!)
330       MP7!(I!) = (MP6!(I!) * AI!) + MP6!(I!)
340        MP8!(I!) = (MP7!(I!) * AI!) + MP7!(I!)
350         MP9!(I!) = (MP8!(I!) * AI!) + MP8!(I!)
360          MP10!(I!) = (MP9!(I!) * AI!) + MP9!(I!)
370           MP11!(I!) = (MP10!(I!) * AI!) + MP10!(I!)
380   MP12!(I!) = (MP11!(I!) * AI!) + MP11!(I!)
390    PR!(I! + 1) = MP12!(I!)
400   NEXT
410    CLS
420     LOCATE 2,30
430      PRINT "MONTHLY "
440       LOCATE 3,10
450        PRINT "COMPOUNDING $"X!"FOR "Y!"YEARS AT"Z!"PERCENT"
460         LOCATE 5,10
470          PRINT "YEAR    BEGINING PRINCIPAL     ENDING PRINCIPAL"
480           LOCATE 6,10
490 PRINT "====    ==================     ================"
500  PRINT
510   FOR I! = 1 TO Y!
520      PRINT TAB( 10)I!;
530       PRINT TAB( 22) USING S$;PR!(I!);
540        PRINT TAB( 44) USING S$;PR!(I! + 1);
550       NEXT
560        PRINT
570         PRINT
580          PRINT
590           PRINT TAB( 18)"<ENTER 1> FOR ANOTHER COMPUTATION"
600 PRINT TAB( 18)"<ENTER 2> TO LEAVE PROGRAM"
610  PRINT
620   PRINT TAB( 35)"";
630    INPUT X!
640     ON X! GOTO 170,650
650 END
65000 '*********************** SAVE ROUTINE **********************************
65100 SAVE "B:COMPOUND.BAS"
