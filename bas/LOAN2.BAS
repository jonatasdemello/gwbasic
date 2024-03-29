10 REM BASIC LOAN ANALYSIS
12 WIDTH 80:DOLL$="$$######,.##":NUMM$="######,.##":PERR$="######,.##_ _%"
20 ON ERROR GOTO 1400
25 GOTO 100  'start main program
50 REM subroutine to strip out any comma's and evaluate a "K" entry
51 D2$=""
52 FOR C=1 TO LEN(D$)
53 IF MID$(D$,C,1)="," THEN 56 ELSE D2$=D2$+MID$(D$,C,1)
56 NEXT
57 D$=D2$ : IF RIGHT$(D$,1)="K" OR RIGHT$(D$,1)="k" THEN D=VAL(LEFT$(D$,LEN(D$)    -1))*1000  ELSE D=VAL(D$)
59 RETURN   ' end of subroutine
100 REM start main program
101 CLS:KEY OFF
105 COLOR 0,7:PRINT SPC(79):LOCATE ,30:PRINT "LOAN ANALYSIS":COLOR 7,0:PRINT
110 PRINT "This Program calculates the missing factor of any fully amortized loan" : PRINT "given the other three.  It also provides details on the full cost of the loan"
115 PRINT "and the interest paid over any specified period."
130 LOCATE 7,1:PRINT "Factors of the Loan :    Any one of these four factors may be unknown.":PRINT "Principal,  Monthly Payment,  Number of Payments, &  Annual Interest Rate"
140 PRINT "---------   ---------------   ------------------     --------------------";
145 LOCATE 25,8:PRINT "For the ONE unknown item, enter nothing, just press return";
150 LOCATE 11,1:LINE INPUT"What is the Principal Amount of the Loan   ? ";V$:       PRINT
155 D$=V$ : GOSUB 50 : V$=D$ : V=D  'strip out comma's  &  evaluate "K"
170 LINE INPUT"What is the Amount of the Monthly Payment  ? ";M$:       PRINT
175 D$=M$ : GOSUB 50 : M$=D$ : M=D  'strip out comma's  &  evaluate "K"
180 LINE INPUT"How many Monthly Payments have to be made  ? ";N$:       PRINT
185 D$=N$ : GOSUB 50 : N$=D$ : N=D  'strip out comma's  &  evaluate "K"
190 LINE INPUT"What's the Annual Percentage Interest Rate ? ";I$:       PRINT
195 D$=I$ : GOSUB 50 : I$=D$ : I=D/1200  'strip out comma's  &  evaluate "K"
199 OL=CSRLIN : LOCATE 25,8:PRINT SPC(71); : LOCATE OL,1
200 REM
201 IF V$="" AND (M$="" OR N$="" OR I$="") THEN PRINT :PRINT "MORE TAHN ONE UNKNOWN .... SORRY .... STOP PROGRAM":END
203 IF M$="" AND (N$="" OR I$="") THEN PRINT :PRINT "MORE THAN ONE UNKNOWN .... SORRY .... STOP PROGRAM":END
205 IF N$="" AND I$="" THEN PRINT :PRINT "MORE TAHN ONE UNKNOWN .... SORRY .... STOP PROGRAM":END
250 REM
251 IF M$="" THEN 500
252 IF N$="" THEN 600
253 IF M*N<V THEN PRINT :PRINT "The Monthly Payment  times  the Number of Payments  = ";M*N:PRINT "This is less than the Principal !  Loan data is inconsistant...STOP PROGRAM":END
254 IF V$="" THEN 400
255 IF I$="" THEN 700
300 PRINT :PRINT "All items are known......       Using your data : " : GOTO 900
400 REM *** calculate Principal
410 V=M*(1-(1/(1+I)^N))/I
420 PRINT :PRINT "The Principal Amount of the Loan  = ";:PRINT USING DOLL$;V;:      GOTO 900
500 REM *** calculate Monthly Payment
510 M=V*(I/(1-(1+I)^(-N)))
520 PRINT :PRINT "The Monthly Payment amount  = ";:PRINT USING DOLL$;M;:GOTO 900
600 REM *** calculate Number of Payments
610 N=LOG(1/(1-I*V/M))/LOG(1+I)
620 PRINT :PRINT "The Number of Monthly Payments  = ";:PRINT USING NUMM$;N;:        GOTO 900
700 REM *** calculate Annual Interest
702 I1=2*(N-V/M)/(N*(N+1))
704 V1=M*(1-(1+I1)^(-N))/I1
706 IF V1>1.000001#*V THEN 750
707 IF V1<.9999991#*V THEN 750
708 I=I1*1200
720 PRINT :PRINT "The Annual Interest Rate  = ";:PRINT USING PERR$;I;:I=I/1200:     GOTO 900  'switch interest to onthly value for part two of program
750 Y=(1+I1)^(-N)
751 W=1-Y
752 I1=I1*(1-(((I1*V/M)-W)/(W-(N*I1*Y/(1+I1)))))
753 GOTO 704
900 REM show total
901 PRINT TAB(50);"Total Paid = ";:PRINT USING DOLL$;M*N
905 PRINT TAB(50);"Interest   = ";:PRINT USING DOLL$;M*N-V
910 LOCATE 23,1 : LINE INPUT"Would you care to review the interest payable over a specified period   ? ";YORN$
915 IF LEFT$(YORN$,1)="y" OR YORN$="Y" THEN 1200
920 GOTO 1300   'ask if another cycle desired
1200 REM  find interest payable over a specified period
1210 CLS:LOCATE 2,20:PRINT "LOAN PROGRAM   PART 2";
1230 LOCATE 5,1 : PRINT "In order to calculate the total interest payable over some specified period" : PRINT "You must state the First and Last monthly period over which to compute."
1234 LOCATE 9,1:PRINT "Example :  First month of  13   and   Last month of 24" :     PRINT"will produce the interest for the second year of the loan .... etc."
1250 LOCATE 13,1 : LINE INPUT"What is the number of the First monthly payment for this period  ? ";N1$ : PRINT
1255 D$=N1$ : GOSUB 50 : N1=D : N1P=N1-1
1260 LOCATE 14,1 : LINE INPUT"What is the number of the Last monthly payment for this period   ? ";N2$ : PRINT
1265 D$=N2$ : GOSUB 50 : N2=D
1280 IP=M*(N2-N1P-(((1+I)^(N2-N))/I)+(((1+I)^(N1P-N))/I))
1285 LOCATE 18,1 : PRINT "The interest payable on the loan over the period ";N1;     "thru";N2;TAB(65);" =  "; : PRINT USING DOLL$;IP;: LOCATE 19,1
1290 VREMAIN=(M/I)*(1-(1+I)^(N2-N))
1292 PRINT "The remaining principal of the loan after period number  ";N2;           TAB(65);" =  "; :PRINT USING DOLL$;VREMAIN; : LOCATE 22,1
1295 LINE INPUT;"Would you like to review the interest payable over another period  ? ";YORN$
1296 IF LEFT$(YORN$,1)="y" OR YORN$="Y" THEN 1210 ELSE LOCATE 23,1
1300 REM cycle thru again if desired
1310 LINE INPUT;"Would you like to cycle thru another problem (y or n)  ? "    ;YORN$
1320 IF LEFT$(YORN$,1)="y" OR YORN$="Y" THEN RUN ELSE END
1400 REM error section
1408 IF ERR<>5 AND ERR<>6 THEN 1450
1410 SOUND 45,12:PRINT "SORRY ...  But the loan parameters you entered are beyond the computational":PRINT"           range of this program. ":PRINT
1412 LINE INPUT;"Would you like to cycle thru another problem (y or n)  ? "    ;YORN$
1414 IF LEFT$(YORN$,1)="y" OR YORN$="Y" THEN RUN ELSE END
1450 ON ERROR GOTO 0 : PRINT "Program ERROR... STOP PROGRAM":STOP
