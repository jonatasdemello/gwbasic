5 CLS:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 10-57
10 '*****************   GAS/DIESEL MILEAGE CHART  *****************************
16 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
18 '�     AUTOMOBILE AND RECREATIONAL VEHICLE MILEAGE AND TRIP RECORD         �
20 '�                                                                         �
22 '�   This program produces a chart and record which is suitable for re-    �
24 '� cording daily & trip mileage in an automobile or R.V.  It is suitable   �
26 '� for tax records, if appropriate. The headings include: Octane, location �
28 '� of fuel purchase, date, odometer reading, cost/gallon; # of gallons     �
30 '� purchased, total $$$ paid, total mileage between fill ups; and miles    �
32 '� per gallon.  The daily trip portion indicates the location of the over- �
34 '� night stop, the odometer reading, and the total daily (trip) mileage.   �
35 '�   Try this form on your next trip.  The results are interesting.        �
36 '�                     (c) G I N A C O  -- 1983          Ver 5.2/160/320   �
50 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLS
100 SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT
110 LPRINT CHR$(27);CHR$(64);
120 LPRINT CHR$(15);
130 WIDTH "LPT1:",132
140 CLS:LOCATE 10,25:INPUT"Number of copies ",N
150 FOR NUMBER = 1 TO N
160 LPRINT STRING$(4,10);
170 LPRINT TAB(35)"AUTO & REC-V MILEAGE/FUEL RECORD -- DAILY AND TRIP MILEAGE";
180 LPRINT CHR$(27);"U"+CHR$(1);
190 LPRINT CHR$(27);CHR$(50)
200 LPRINT "__________________________________________________________________________________________________________________________________";
210 LPRINT "I OCT  I   LOCATION    I  DATE    I  ODOMETER  I $$/GAL  I T/GALS. I  T/$$$   I TOT/M I  M/GAL II  O'NITE   I  ODOMETER  I MILES I";
220 LPRINT CHR$(27);CHR$(48)
230 LPRINT "I------I---------------I----------I------------I---------I---------I----------I-------I--------II-----------I------------I-------I";
240 FOR I = 1 TO 34
250 LPRINT "I      I               I          I            I         I         I          I       I        II           I            I       I";
260 LPRINT "I------I---------------I----------I------------I---------I---------I----------I-------I--------II-----------I------------I-------I";
270 NEXT
280 LPRINT "I  T O T A L S:        I          I            I         I         I          I       I        II           I            I       I";
290 LPRINT "I______________________I__________I____________I_________I_________I__________I_______I________II___________I____________I_______I"
300 LPRINT CHR$(12)
310 NEXT NUMBER
320 END
65000 '************************* SAVE ROUTINE ********************************
65100 SAVE"B:GASFORM.BAS"
