10 CLS
20 KEY OFF
30 PRINT "LEASE/BUY DECISION"
40 DEFDBL A-Z:DEFINT Y,Z
50 REM  - FUNCTION TO ROUND TO NEAREST HUNDREDTH
60 DEF FNA(X)=INT(X*100+.5)/100
70 PRINT
80 PRINT "ENTER THE COST TO ACQUIRE ASSET ";
90 PRINT "(PRINCIPAL OF LOAN) ";
100 INPUT B1
110 PRINT "ENTER THE INTEREST RATE (%) ";
120 INPUT I1
130 REM  - CONVERT INTEREST RATE TO DECIMAL
140 I1=I1/100
150 PRINT "ENTER THE TERM IN YEARS ";
160 INPUT Y1
170 PRINT "WHAT IS THE SALVAGE VALUE ";
180 PRINT "AT THE END OF";Y1;"YEARS ";
190 INPUT S1
200 PRINT
210 PRINT "WHAT IS THE TAX RATE (%) ";
220 INPUT R1
230 REM  - CONVERT TAX RATE TO DECIMAL
240 R1=R1/100
250 PRINT "ENTER THE ANNUAL AMOUNT ";
260 PRINT "OF LOAN PAYMENTS ";
270 INPUT A1
280 PRINT "ENTER THE ANNUAL AMOUNT ";
290 PRINT "OF LEASE PAYMENTS ";
300 INPUT A2
310 REM  - RESET TOTAL AMOUNTS TO ZERO
320 T1=0
330 L1=0
340 PRINT
350 PRINT "ENTER THE DEPRECIATION AMOUNT ";
360 PRINT "FOR EACH YEAR"
370 PRINT
380 REM  - LOOP TO INPUT, CALCULATE AND ACCUMULATE
390 REM  - VALUES FOR EACH YEAR
400 FOR Z=1 TO Y1
410 IF Z>1 THEN 440
420 PRINT "YEAR NUMBER";
430 GOTO 450
440 PRINT SPC(11);
450 PRINT Z;
460 INPUT D1
470 REM  - CALCULATE INTEREST AMOUNT FOR EACH YEAR
480 B0=ABS(B1-FNA(B1*(1+I1)))
490 REM  - CONVERT D1 TO PRESENT VALUE OF COST
500 REM  - OF OWNING EACH YEAR
510 D1=FNA((A1-FNA((D1+B0)*R1))/((1+I1)^Z))
520 REM  - SUBTRACT ANNUAL PAYMENT,
530 REM  - ADD ANNUAL INTEREST TO PRINCIPAL
540 B1=B1-A1+B0
550 REM  - SUM PRESENT VALUE AMOUNTS OF EACH YEAR
560 T1=T1+D1
570 REM  - COMPUTE PRESENT VALUE OF COST TO LEASE FOR EACH YEAR
580 L1=L1+FNA((A2-(A2*R1))/(1+I1)^Z)
590 NEXT Z
600 REM  - SUBTRACT PRESENT VALUE OF SALVAGE VALUE
610 REM  - FROM TOTAL COST TO OWN
620 T1=T1-FNA(S1/(1+I1)^Y1)
630 REM  -OUTPUT RESULTS
640 PU$="$$,###,###,###.##"
650 PRINT
660 PRINT "PRESENT VALUE OF COST OF LOAN  =";
670 PRINT USING PU$; T1
680 PRINT "PRESENT VALUE OF COST OF LEASE =";
690 PRINT USING PU$; L1
700 PRINT
710 IF L1<T1 THEN 750
720 PRINT "ADVANTAGE OF BUYING =";
730 PRINT USING PU$;L1-T1
740 GOTO 770
750 PRINT "ADVANTAGE OF LEASING =";
760 PRINT USING PU$;T1-L1
770 PRINT
780 REM  - RESTART OR END PROGRAM?
790 PRINT "WOULD YOU LIKE TO RE-RUN THIS PROGRAM";
800 PRINT " WITH NEW DATA (Y/N)?"
810 Z$=INKEY$:IF Z$="" THEN 810
820 IF Z$="Y" OR Z$="y" THEN 70
830 IF Z$<>"N" AND Z$<>"n" THEN 790
840 END
