5 REM * PUBLIC DOMAIN SOFTWARE *
10 COLOR 15:CLS:KEY OFF:SCREEN 0,0,0:WIDTH "SCRN:",80
20 ON ERROR GOTO 4010 
30 PRINT "ENTER THE NUMBER OF ONE OF THE FOLLOWING PROGRAMS:"
40 PRINT
50 PRINT "   1 - PRESENT VALUE OF A FUTURE SUM"
60 PRINT "   2 - SIMPLE INTEREST FOR DAYS"
70 PRINT "   3 - FUTURE VALUE OF A PRESENT SUM"
80 PRINT "   4 - AMORTIZATION SCHEDULE"
90 PRINT "   5 - INTEREST RATE - COMPOUND INTEREST"
100 PRINT "   6 - INTEREST RATE - INSTALLMENT LOAN"
110 PRINT "   7 - DAYS BETWEEN DATES"
120 PRINT "   8 - TERM OF AN INSTALLMENT LOAN"
130 PRINT "   9 - PRESENT VALUE OF A SERIES OF PAYMENTS"
140 PRINT "  10 - REAL ESTATE CAPITAL INVESTMENT"
141 PRINT "  11 - NOMINAL & EFFECTIVE INTEREST RATES
142 PRINT "  12 - INTERNAL RATE OF RETURN
143 PRINT "  13 - FUTURE VALUE OF REGULAR DEPOSITS
144 PRINT "  14 - REGULAR DEPOSITS FOR FUTURE VALUE
145 PRINT "  15 - DEPRECIATION - AMOUNT
146 PRINT "  16 - DEPRECIATION - RATE
147 PRINT "  17 - DEPRECIATION - SALVAGE VALUE
148 PRINT "  18 - DEPRECIATION - SCHEDULE
149 PRINT "  19 - BOND - PRESENT VALUE
150 PRINT "  20 - BOND - YIELD TO MATURITY
151 PRINT:INPUT "TYPE PROGRAM NUMBER (OR SPACE BAR TO EXIT) AND PRESS 'ENTER'";F
160 IF F<1 THEN STOP
170 ON F GOTO 190,390,550,720,1030,1310,1670,1940,2220,2510,4220,4380,4630,4820,4950,5100,5190,5290,5590,5750
180 RUN   
190 F=0:R=0:M=0:N=0
200 CLS:PRINT:PRINT "THIS PROGRAM CALCULATES THE PRESENT VALUE OF"
210 PRINT "A FUTURE SUM, DISCOUNTING IT FOR A PARTICULAR"
220 PRINT "INTEREST RATE, COMPOUNDED AS INSTRUCTED."
230 PRINT:INPUT "STATE THE FUTURE SUM, IN DOLLARS ";F
240 INPUT "STATE THE ANNUAL INTEREST RATE, IN % ";R
250 INPUT "STATE THE NUMBER OF PERIODS IN ONE YEAR ";M
260 INPUT "STATE THE NUMBER OF PERIODS TO BE CALCULATED ";N
270 I=R/M:I=I/100
280 T=1+I:A=T
290 IF N=1 GOTO 310
300 FOR X=1 TO (N-1):S=A*T:A=S:NEXT X
310 P=F/A:CLS:PRINT:PRINT:PRINT
320 PRINT " A FUTURE SUM OF $";F;" FOR ";N;" PERIODS,"
330 PRINT " WHERE THERE ARE";M;"PERIODS PER YEAR AT"
340 PRINT R;"% PER YEAR IS WORTH, IN  TODAY'S DOLLARS:"
350 PRINT:PRINT TAB(30);"$";P
360 PRINT:INPUT "PRESS ENTER TO RETURN. ";A$
370 RUN   
380 END
390 P=0:D=0:R=0
400 CLS:PRINT:PRINT "THIS ROUTINE CALCULATES SIMPLE INTEREST ON
410 PRINT "DOLLARS HELD IN DEPOSIT FOR A SPECIFIED PERIOD
420 PRINT "USING A SPECIFIED PERCENTAGE OF INTEREST.":PRINT
430 INPUT "HOW LARGE IS THE DEPOSIT (IN DOLLARS)";P
440 INPUT "HOW LONG WILL YOU LEAVE IT IN (IN DAYS)";D
450 INPUT "WHAT INTEREST RATE DO YOU EXPECT (IN %)";R
460 CLS:PRINT:PRINT:PRINT "FOR A STARTING PRINCIPAL OF $";P;"AT A"
470 PRINT "RATE OF";R;"% FOR ";D;"DAYS, THE INTEREST"
480 PRINT "AMOUNTS TO $";
490 I=R/100/365*D*P
500 IF I>327.68 GOTO 520  
510 I=INT(I*100+.5)/100
520 PRINT TAB(12);I;"OR $";I/D;"PER DAY.":PRINT:PRINT:PRINT
530 INPUT "PRESS ENTER TO RETURN.";A$:RUN   
540 END
550 CLS:P=0:R=0:M=0:N=0
560 PRINT:INPUT "ENTER PRESENT SUM, IN DOLLARS:";P
570 PRINT:INPUT "ENTER ANNUAL INTEREST RATE, IN % ";R
580 PRINT:INPUT "ENTER NUMBER OF PERIODS IN ONE YEAR ";M
590 PRINT:INPUT "ENTER NUMBER OF PERIODS TO MATURITY ";N
600 I=R/M:I=I/100:T=I+1:A=T
610 IF N=1 THEN GOTO 630  
620 FOR K=1 TO (N-1):S=A*T:A=S:NEXT K
630 F=P*A:CLS
640 CLS:PRINT "FOR A PRESENT SUM OF $";P;"AT AN ANNUAL"
650 PRINT "INTEREST RATE OF";R;"%, FOR ";N;"PERIODS, WHERE"
660 PRINT "THERE ARE";M;"PERIODS PER YEAR:"
670 PRINT:PRINT "THE FUTURE VALUE IS $";F
680 PRINT "THE INCREASE IS $";F-P;", OR";(F/P)*100-100;"%"
690 PRINT:INPUT "PRESS ENTER TO RETURN TO MENU.";A$
700 RUN   
710 END
720 DEFDBL I,T:C=0:P=0:L=0:R=0:M=0:CLS
730 INPUT " PRINCIPAL, DOLLARS AND CENTS ";P
740 INPUT " # OF PERIODS, IN MONTHS ";L
750 INPUT " ANNUAL INTEREST RATE, IN % ";R
760 INPUT " PAYMENT, IF  KNOWN, (ENTER) IF  NOT ";M
770 I=R/1200
780 T=1-1/(1+I)^L:K=P
790 IF M<>0 THEN GOTO 810  
800 M=P*I/T
810 GOSUB 990
820 FOR Z=1 TO L
830 IF C<12 GOTO 880  
840 PRINT " YEAR OF LOAN ";INT(Z-1)/12;
850 PRINT "    $";K;"FOR ";L;"MONTHS AT";R;"%"
860 INPUT "PRESS ENTER TO CONTINUE, 1 TO RETURN TO MENU ";CH:IF CH=1 THEN 10   
870 C=0:GOSUB 990
880 A=P*I
890 A=INT(A*100+.5)/100
900 M=INT(M*100+.5)/100
910 B=M-A:P=P-B
920 B=INT(B*100+.5)/100
930 P=INT(P*100+.5)/100
940 PRINT USING "####    ";Z;:PRINT USING "###,###.##";P;M;B;A
950 IF  P<=0  THEN  970
960 C=C+1:NEXT Z
970 PRINT:INPUT "PRESS ENTER TO RETURN TO MENU.";A$:RUN   
980 END
990 CLS
1000 PRINT "PAYMENT   REMAINING  MONTHLY   PRINCIPAL INTEREST"
1010 PRINT "NUMBER    PRINCIPAL  PAYMENT   PAYMENT   PAYMENT
1020 RETURN
1030 CLS:PRINT:PRINT:PRINT
1040 INPUT "STATE THE FUTURE VALUE, IN $";FV
1050 IF F=2 THEN 1130 
1060 INPUT "STATE THE PRESENT VALUE, IN $";PV
1070 IF F=1 THEN 1130 
1080 INPUT "STATE THE NUMBER OF INTEREST PERIODS PER YEAR ";PY
1090 IF F=3 THEN 1130 
1100 PRINT "STATE THE LENGTH OF TIME OF THE TOTAL FOR WHICH"
1110 PRINT "INTEREST IS TO BE FIGURED, USING THE FOLLOWING"
1120 INPUT "FORMAT (YY,MM,DD) ";Y,M,D
1130 PD=Y*PY+M*PY/12+D*PY/365
1140 I=((FV/PV)^(1/PD)-1)*100*PY
1150 A$="###.##":F=O
1160 CLS:PRINT:PRINT:PRINT "FOR A FUTURE SUM OF $";FV;"WITH A PRESENT VALUE"
1170 PRINT "OF $";PV;"WHERE THERE ARE";PY;"PERIODS PER YEAR,
1180 PRINT "OVER";Y;"YEARS,";M;"MONTHS AND";D;"DAYS, THE"
1190 PRINT "ANNUAL INTEREST RATE IS ";:PRINT USING A$;I;:PRINT " %"
1200 PRINT:PRINT "WHAT DO YOU WANT TO DO?"
1210 PRINT "   1 - CHANGE PRESENT VALUE"
1220 PRINT "   2 - CHANGE FUTURE VALUE"
1230 PRINT "   3 - CHANGE PERIODS PER YEAR
1240 PRINT "   4 - CHANGE TIME RANGE
1250 PRINT "   5 - RERUN ENTIRE PROGRAM"
1260 PRINT "   6 - RETURN TO MENU"
1270 PRINT:INPUT "ENTER THE NUMBER OF YOUR CHOICE";F
1280 IF F<1 OR F>6 THEN 1160 
1290 F=INT(F):ON F GOTO 1060,1040,1080,1100,1030,10
1300 END
1310 CLEAR:F=0:CLS:DEFDBL I:A$="##.## %"
1320 ON ERROR GOTO 4010 
1330 PRINT:PRINT "STATE THE PRESENT VALUE (AMOUNT), IN $ ";:INPUT PV
1340 IF F=1 GOTO 1420 
1350 INPUT "STATE THE NUMBER OF TERMS PER YEAR";NY
1360 IF F=3 GOTO 1420 
1370 INPUT "STATE THE NUMBER OF PERIODS OF THE LOAN";N
1380 IF F=2 GOTO 1420 
1390 INPUT "STATE THE AMOUNT OF EACH PAYMENT, IN $";P
1400 IF F=4 GOTO 1420 
1410 CLS:PRINT:PRINT "THIS IS AN ITERATIVE PROCESS AND WILL TAKE A FEW SECONDS"
1420 I=8.000001E-03
1430 I1=P/PV*((1+I)^N-1)/(1+I)^N
1440 IF ABS(I-I1)<.000001 THEN 1470 
1450 I=I1
1460 GOTO 1430 
1470 I=I1*NY*100
1480 CLS:PRINT
1490 PRINT "FOR A LOAN WITH A PRESENT VALUE OF $";PV
1500 PRINT "AND";N;"PAYMENTS OF $";P;", WHERE THERE"
1510 PRINT "ARE";NY;"PAYMENTS PER YEAR, THE ANNUAL"
1520 PRINT "INTEREST RATE IS ";
1530 PRINT USING A$;I
1540 F=0:PRINT
1550 PRINT "DO YOU WANT  TO :"
1560 PRINT "   1 - CHANGE LOAN VALUE"
1570 PRINT "   2 - CHANGE NUMBER OF INTEREST PERIODS"
1580 PRINT "   3 - CHANGE PERIODS PER YEAR"
1590 PRINT "   4 - CHANGE PAYMENT AMOUNT"
1600 PRINT "   5 - RERUN ENTIRE PROGRAM"
1610 PRINT "   6 - RETURN TO MENU"
1620 PRINT:INPUT "ENTER THE NUMBER OF YOUR CHOICE";F
1630 IF F<1 OR F>6 THEN 1620 
1640 ON F GOTO 1330,1370,1350,1390,1310,10   
1650 F=INT(F):RUN   
1660 END
1670 CLS:CH=0:PRINT:PRINT
1680 PRINT "USING THE FOR MAT  (MM,DD,YYYY),
1690 INPUT "ENTER THE FIRST DATE ";M,D,Y:GOSUB 1870
1700 N=M:F=D:Z=Y:E=T
1710 IF CH=1 GOTO 1740 
1720 INPUT "ENTER THE SECOND DATE ";M,D,Y:GOSUB 1870
1730 P=M:G=D:W=Y:L=T
1740 IF E>L THEN PRINT "CHECK THE DATES.  TRY AGAIN":GOTO 1690 
1750 O=L-E:CLS:PRINT:PRINT:PRINT
1760 PRINT "THE LENGTH IN DAYS FROM ";N;"/";F;"/";Z
1770 PRINT " TO  ";P;"/";G;"/";W;" IS";O;" DAYS."
1780 CH=0:PRINT:PRINT "DO YOU WISH  TO :"
1790 PRINT "   1 - CHANGE EARLY DATE"
1800 PRINT "   2 - CHANGE LATEST DATE"
1810 PRINT "   3 - RERUN ENTIRE PROGRAM"
1820 PRINT "   4 - RETURN TO MENU"
1830 INPUT "ENTER THE NUMBER OF YOUR CHOICE";CH
1840 IF (CH<>INT(CH)) OR CH>4 THEN 1830 
1850 IF CH<=0 THEN 1830 
1860 ON CH GOTO 1690,1720,1670,10
1870 YY=Y-1:T=365*YY+FIX(YY/4)-FIX(YY/100)+FIX(YY/400)
1880 CD=30*(M-1)+FIX((M-1)/3)+D
1890 IF M=2 OR M=9 OR M>10 THEN CD=CD+1:GOTO 1910
1900 IF M>2 AND M<8 AND M<>6 THEN CD=CD-1
1910 IF M<3 OR Y<>4*FIX(Y/4) THEN 1930
1920 IF Y=400*FIX(Y/400) OR Y<>100*FIX(Y/100) THEN CD=CD+1
1930 T=T+CD:RETURN
1940 CLS:PRINT:PRINT "THIS PROGRAM WILL DETERMINE THE LENGTH OF TIME NEEDED"
1950 PRINT " TO  PAY AN INSTALLMENT LOAN.  PLEASE PROVIDE THE "
1960 PRINT "FOLLOWING INFORMATION."
1970 PRINT:INPUT "WHAT WAS THE ORIGINAL AMOUNT OF THE LOAN";OA
1980 IF F=1 GOTO 2040 
1990 INPUT "HOW MUCH IS THE PAYMENT";PT
2000 IF F=2 GOTO 2040 
2010 INPUT "HOW MANY PAYMENTS PER YEAR";PY
2020 IF F=3 GOTO 2040 
2030 INPUT "WHAT IS THE ANNUAL INTEREST RATE";IR
2040 CLS:IO=OA*IR/100/PY
2050 IF PT<=IO THEN PRINT "IMPOSSIBLE!  THE PAYMENT DOES NOT COVER THE INTEREST. INTEREST ONLY FOR THE PERIOD IS $";IO;" TRY AGAIN.":GOTO 1970 
2060 Y=-(LOG(1-(OA*(IR/100))/(PY*PT))/(LOG(1+(IR/100)/PY)*PY))
2070 NP=Y*PY
2080 PRINT "FOR AN ORIGINAL LOAN AMOUNT OF $";OA;"PAYABLE"
2090 PRINT "AT";IR;"% WITH";PY;"PAYMENTS PER YEAR, THE NUMBER OF
2100 PRINT "$";PT;" PAYMENTS NECESSARY TO PAY THE LOAN IS";NP
2110 PRINT "OR";Y;" YEARS."
2120 PRINT:PRINT "WHAT DO YOU WANT TO DO:"
2130 PRINT "    1 - CHANGE ORIGINAL LOAN AMOUNT
2140 PRINT "    2 - CHANGE AMOUNT OF PAYMENT
2150 PRINT "    3 - CHANGE PAYMENTS PER YEAR
2160 PRINT "    4 - CHANGE ANNUAL INTEREST RATE
2170 PRINT "    5 - RERUN ENTIRE PROGRAM
2180 PRINT "    6 - RETURN TO MENU
2190 PRINT:PRINT "ENTER THE NUMBER OF YOUR CHOICE:";:INPUT F
2200 IF F<>ABS(INT(F)) OR F>6 THEN 2190 
2210 ON F GOTO 1970,1990,2010,2030,1940,10   
2220 CLS:PRINT:PRINT "THIS PROGRAM DETERMINES THE PRESENT VALUE OF A SERIES"
2230 PRINT "OF PAYMENTS.  IT IS NORMALLY USED TO DETERMINE THE AMOUNT
2240 PRINT "REMAINING ON A LOAN.  YOU MUST KNOW THE AMOUNT OF THE
2250 PRINT "REGULAR PAYMENT, THE NUMBER OF PAYMENTS REMAINING,
2260 PRINT "THE NUMBER OF PAYMENTS PER YEAR AND THE INTEREST RATE.
2270 PRINT:INPUT "HOW MUCH IS THE REGULAR PAYMENT";PT
2280 IF F=1 GOTO 2340 
2290 INPUT "HOW MANY PAYMENTS REMAIN       ";NP
2300 IF F=2 GOTO 2340 
2310 INPUT "HOW MANY PAYMENTS PER YEAR     ";PY
2320 IF F=3 GOTO 2340 
2330 INPUT "WHAT IS THE ANNUAL INTEREST RATE";IR
2340 I=IR/100:CLS:T1=1+(I/PY):T1=T1^NP:T1=1/T1:T1=1-T1
2350 PR=PT*PY*T1/I
2360 PRINT "FOR ";NP;" PAYMENTS OF $";PT;"WHERE THERE ARE";PY
2370 PRINT "PAYMENTS PER YEAR AT AN ANNUAL INTEREST RATE OF";IR;"%"
2380 PRINT "THE ORIGINAL PRINCIPAL (OR THE VALUE OF THE REMAINING
2390 PRINT "PAYMENTS) IS $";PR
2400 PRINT:PRINT:PRINT "WHAT DO YOU WANT TO DO:
2410 PRINT "    1 - CHANGE PAYMENT AMOUNT
2420 PRINT "    2 - CHANGE NUMBER OF PAYMENTS
2430 PRINT "    3 - CHANGE PAYMENTS PER YEAR
2440 PRINT "    4 - CHANGE ANNUAL INTEREST RATE
2450 PRINT "    5 - RERUN ENTIRE PROGRAM
2460 PRINT "    6 - RETURN TO MENU
2470 INPUT "ENTER THE NUMBER OF YOUR CHOICE";F
2480 IF F<>ABS(INT(F)) OR F>6 THEN 2470 
2490 ON F GOTO 2270,2290,2310,2330,2220,10   
2500 END
2510 CLEAR 30
2520 ON ERROR GOTO 4010 
2530 DEFDBL A-E,G-W:DEFINT F,X,Z
2540 A1$="####,###.##"
2550 A2$="###,###.##"
2560 A3$="##.##"
2570 A4$="##"
2580 A5$="###,###.##-"
2590 A6$="#####,###.##"
2600 CLS:PRINT "WHAT IS THE PURCHASE PRICE OF THE PROPERTY";
2610 INPUT GP
2620 IF X=4 GOTO 3010 
2630 PRINT "WHAT IS THE VACANCY ALLOWANCE (IN %)";
2640 INPUT VA
2650 IF X=2 GOTO 3010 
2660 PRINT "HOW MANY UNITS DOES THE PROPERTY HAVE";:INPUT UN
2670 PRINT "HOW MANY SQUARE FEET OF USABLE SPACE";:INPUT SF
2680 PRINT "WHAT IS THE ANTICIPATED GROSS INCOME";
2690 INPUT GI
2700 IF X=1 THEN 3010 
2710 PRINT "WHAT IS THE EXPECTED EXPENSE RATIO, THAT IS, THE"
2720 INPUT "EXPENSES OVER THE GROSS INCOME, IN %";ER
2730 IF X=3 THEN 3010 
2740 INPUT "HOW MANY MORTGAGES WILL THERE BE, 1 OR 2";MN:CLS:IF MN>2 GOTO 2740 
2750 CLS:PRINT "FOR INTEREST ONLY OR BALLOON MORTGAGES,"
2760 PRINT "MONTHS = 1000"
2770 DEFINT I
2780 MT=0
2790 FOR I=1 TO 2:AM(I)=0:TM(I)=0:RT(I)=0:Y1(I)=0
2800 CF(I)=0:PT(I)=0:NEXT I
2810 FOR I=1 TO MN
2820 PRINT:PRINT "FOR MORTGAGE NUMBER ";I;"GIVE THE FOLLOWING"
2830 INPUT "TOTAL AMOUNT OF THE MORTGAGE";AM(I)
2840 INPUT "THE TERM, IN MONTHS";TM(I)
2850 INPUT "THE INTEREST RATE, IN % ";RT(I)
2860 MT=MT+AM(I)
2870 NEXT I
2880 IF X=5 GOTO 3010 
2890 CLS:PRINT "DESCRIBE DEPRECIATION METHODS"
2900 INPUT "ALLOCATION TO BUILDING IN % ";D1
2910 INPUT "ALLOCATION TO PERSONALTY IN %";D2
2920 IF D1+D2>=100 THEN PRINT " TOO MUCH":FOR F3=1 TO 1000:NEXT F3:GOTO 2900
2930 PRINT "WHAT METHOD OF DEPRECIATION IS TO BE USED"
2940 PRINT "FOR THE BUILDING.  INPUT SL, DDB, 125%, OR 150%";
2950 INPUT DB$:IF Y=10 THEN 3300
2960 INPUT "TERM OF BUILDING DEPRECIATION, IN YRS";YB
2970 PRINT "WHAT METHOD OF DEPRECIATION IS TO BE USED"
2980 PRINT "FOR PERSONAL PROPERTY.  INPUT SL, DDB, 125% OR 150%";
2990 INPUT DP$:IF Y=11 THEN GOTO 3350
3000 INPUT "TERM OF PERSONAL PROPERTY DEP. IN YRS";YP
3010 CLS:PRINT "COMPUTER WORKING - BE WITH YOU IN A FEW SECONDS...."
3020 VS=VA*GI/100
3030 ER(1)=ER*(GI-VS)/100
3040 OI=GI-VS-ER(1)
3050 IF MN=0 THEN 3230 
3060 DEFDBL I:M1=0:M2=0:PT(1)=0:PT(2)=0:IT(1)=0:IT(2)=0
3070 FOR X=1 TO MN
3080  IF TM(X)=1000 THEN IT(X)=AM(X)*(RT(X)/100):GOTO 3200 
3090  I(X)=RT(X)/1200
3100  T=(I(X)+1)^(-TM(X)):T=1-T:MP(X)=I(X)*AM(X)/T
3110  MP(X)=INT(MP(X)*100+.5)/100
3120  IT(X)=0:PT(X)=0:RP=AM(X)
3130  FOR Z=1 TO 12
3140   IM=INT(RP*I(X)*100+.5)/100
3150   PM=MP(X)-IM
3160   IT(X)=IT(X)+IM
3170   PT(X)=PT(X)+PM
3180   RP=RP-PM
3190  NEXT Z
3200  IT=IT+IT(X):PT=PT+PT(X)
3210 NEXT X
3220 M1=PT(1)+IT(1):M2=PT(2)+IT(2)
3230 CF=OI-M1-M2
3240 PP=PT(1)+PT(2)
3250 AM=AM(1)+AM(2)
3260 RN=CF+PP
3270 EQ=GP-AM
3280 RT=RN/EQ*100
3290 DP=0
3300 IF DB$="DDB" THEN DP=D1*GP/YB/50:GOTO 3350 
3310 IF DB$="SL" THEN DP=D1*GP/YB/100:GOTO 3350 
3320 IF DB$="125%" THEN DP=D1*GP/YB*.0125:GOTO 3350 
3330 IF DB$="150%" THEN DP=D1*GP/YB*.015:GOTO 3350 
3340 PRINT:PRINT "ENTER PROPER DEPRECIATION METHOD":FOR Y=1 TO 1000:NEXT Y:Y=10:GOTO 2930 
3350 IF DP$="DDB" THEN DP=DP+D2/YP/50:GOTO 3400 
3360 IF DP$="SL" THEN DP=DP+D2*GP/YP/100:GOTO 3400 
3370 IF DP$="125%" THEN DP=DP+D2*GP/YP*.0125:GOTO 3400 
3380 IF DP$="150%" THEN DP=DP+D2*GP/YP*.015:GOTO 3400 
3390 PRINT:PRINT "NEED METHOD FOR PERSONAL PROPERTY DEPRECIATION":FOR Y=1 TO 1000:NEXT Y:Y=11:GOTO 2970 
3400 TI=RN-DP
3410 PU=GP/UN
3420 PF=GP/SF
3430 CR=OI/GP*100
3440 MR=GP/(GI-VS)
3450 '
3460 CLS:FOR X=0 TO 63:PRINT "+";:NEXT X:PRINT
3470 PRINT "COMPUTED GROSS     ";:PRINT USING A1$;GI;
3480 PRINT TAB(33)"MTG PMT YR1  #1         #2"
3490 PRINT "VAC ALLOWANCE ";:PRINT USING A4$;VA;:PRINT " %  ";:PRINT USING A2$;VS;
3500 PRINT TAB(33)"PRINCIPAL ";:PRINT USING A2$;PT(1);:PRINT " ";:PRINT USING A2$;PT(2)
3510 PRINT "EXP. RATIO ";:PRINT USING A3$;ER;:PRINT " %";:PRINT " ";:PRINT USING A1$;ER(1);
3520 PRINT TAB(33)"INTEREST  ";:PRINT USING A2$;IT(1);:PRINT " ";:PRINT USING A2$;IT(2)
3530 PRINT "NET OPER INC.      ";:PRINT USING A1$;OI;:PRINT TAB(33)"TOTAL     ";:PRINT USING A2$;M1;:PRINT " ";:PRINT USING A2$;M2
3540 FOR X=0 TO 63:PRINT "+";:NEXT X:PRINT
3560 PRINT "CASH FLOW           ";:PRINT USING A5$;CF;:PRINT " ";:PRINT TAB(33)"PURCH PRICE        ";:PRINT USING A6$;GP
3570 PRINT "PRIN. PAYMENT       ";:PRINT USING A5$;PP;
3580 PRINT TAB(33)"MORTGAGE TOTAL     ";:PRINT USING A6$;AM
3590 PRINT "EQU RTN = ";:PRINT USING A3$;RT;:PRINT " %   ";:PRINT USING A5$;RN;
3600 PRINT TAB(33)"EQUITY             ";:PRINT USING A6$;EQ
3610 PRINT "DEPRECIATION        ";:PRINT USING A5$;DP;
3620 PRINT TAB(33)"RTN ON CAP RATE         ";:PRINT USING A3$;CR;:PRINT " %"
3630 PRINT "TAXABLE INCOME      ";:PRINT USING A5$;TI;
3640 PRINT TAB(33)"MULTIPLIER (X EARNINGS)   ";:PRINT USING A3$;MR
3650 FOR X=0 TO 63:PRINT "+";:NEXT X:PRINT
3660 PRINT "PRICE PER UNIT = ";:PRINT USING A1$;PU;
3670 PRINT TAB(33)"PRICE / SQ FT =      ";:PRINT USING A2$;PF
3680 FOR X=0 TO 63:PRINT "+";:NEXT X:PRINT:PRINT
3690 PRINT "DO YOU WISH TO  1 - DISPLAY CURRENT VALUES"
3692 PRINT "                2 - CHANGE A VALUE"
3694 PRINT "                3 - RERUN THE PROGRAM"
3696 PRINT "                4 - RETURN TO MENU"
3710 PRINT:INPUT "ENTER THE NUMBER OF YOUR CHOICE:";F
3720 IF F<>ABS(INT(F)) OR F>4 GOTO 3710 
3730 ON F GOTO 3740,3880,2510,10   
3740 CLS:PRINT "PRICE";TAB(33)"";:PRINT USING A6$;GP
3750 PRINT "GROSS INCOME";TAB(33)"";:PRINT USING A6$;GI
3760 PRINT:PRINT "DEPRECIATION";TAB(20)"% ALLOC.";TAB(30)"YEARS";TAB(40)"TYPE
3770 PRINT "BUILDING";TAB(20)D1;TAB(30)YB;TAB(40)DB$
3780 PRINT "PERSONAL PROP.";TAB(20)D2;TAB(30)YP;TAB(40)DP$
3790 IF MN=0 THEN PRINT:PRINT "THERE ARE NO MORTGAGES":GOTO 3830 
3800 PRINT:FOR X1=1 TO MN:PRINT "MTG. #";X1;"IS $";:PRINT USING A6$;AM(X1);:PRINT " AT";RT(X1);"% ";:IF TM(X1)=1000 THEN PRINT "FIRST YEAR INTEREST ONLY":GOTO 3820 
3810 PRINT "OVER";TM(X1);" PERIODS."
3820 NEXT X1
3830 PRINT:PRINT "THE BUILDING HAS"UN;"UNITS AND";SF;"SQUARE FEET.
3840 PRINT:PRINT "DO YOU WISH TO  1 - DISPLAY FIRST YEAR"
3842 PRINT "                2 - CHANGE A VALUE"
3844 PRINT "                3 - RERUN PROGRAM"
3850 PRINT "                4 - RETURN TO MENU"
3855 PRINT:PRINT "ENTER THE NUMBER OF YOUR CHOICE ";:INPUT X
3860 X=ABS(INT(X)):ON X GOTO 3450,3880,2510,10
3870 GOTO 3840 
3880 CLS
3890 PRINT:PRINT "DO YOU WISH TO CHANGE:
3900 PRINT "    1 - COMPUTED GROSS INCOME
3910 PRINT "    2 - VACANCY ALLOWANCE
3920 PRINT "    3 - EXPENSE RATIO
3930 PRINT "    4 - PURCHASE PRICE
3940 PRINT "    5 - MORTGAGE INFORMATION
3950 PRINT "    6 - DEPRECIATION INFORMATION
3960 PRINT:PRINT "ENTER THE NUMBER OF YOUR CHOICE ";:INPUT X
3970 IF X<>ABS(INT(X)) OR F>6 THEN 3960 
3980 ON X GOTO 2680,2630,2710,2600,2740,2890
3990 GOTO 3960 
4000 END
4010 CLS:IF ERR/2+1=11 THEN PRINT "A DIVIDE BY ZERO ERROR HAS OCCURRED.  THIS USUALLY" ELSE 4050
4020 PRINT "MEANS THAT A VALUE WAS NOT ENTERED PROPERLY.  IT
4030 PRINT "MIGHT MEAN THAT THE ERROR OTHERWISE WAS COMPUTED.
4040 INPUT "LET'S GO BACK AND TRY AGAIN.  PRESS ENTER WHEN READY";A$:RUN   
4050 PRINT "ERROR";ERR;"HAS OCCURRED ON LINE";ERL;
4055 PRINT ".  LET'S GO BACK AND TRY AGAIN."
4060 PRINT:INPUT "PRESS ENTER FOR MENU.";A$:RUN
4220 'NOMINAL & EFFECTIVE INTEREST RATES
4230 CLEAR:ON ERROR GOTO 5950 
4240 CLS:PRINT "THIS PROGRAM GIVES YOU THE NOMINAL AND EFFECTIVE
4250 PRINT "INTEREST RATES WHEN GIVEN THE FUTURE VALUE, PRESENT
4260 PRINT "VALUE, NUMBER OF PERIODS BETWEEN THE TWO, AND THE NUMBER
4270 PRINT "OF COMPOUNDING PERIODS PER YEAR.
4280 PRINT:INPUT "ENTER FUTURE VALUE";FV
4290 INPUT "ENTER PRESENT VALUE";PV
4300 INPUT "ENTER TOTAL NUMBER OF PERIODS";NP
4310 INPUT "ENTER NUMBER OF PERIODS PER YEAR";PY
4320 NR=(PY*((FV/PV)^(1/NP))-PY)*100
4330 ER=((FV/PV)^(PY/NP)-1)*100
4340 PRINT:PRINT "THE NOMINAL RATE IS";NR;" %
4350 PRINT "THE EFFECTIVE RATE IS";ER;" %
4360 GOTO 4060
4380 'INTERNAL RATE OF RETURN
4390 CLEAR:CLS:ON ERROR GOTO 5950 
4400 PRINT "THIS PROGRAM FIGURES THE INTERNAL RATE OF RETURN
4410 PRINT "ON AN INVESTMENT, THE PERIODIC EARNINGS OF THAT
4420 PRINT "INVESTMENT, DISCOUNTED FOR THE PRESENT VALUE OF
4430 PRINT "THE EXPECTED SALES PRICE.":PRINT
4440 INPUT "ENTER THE PURCHASE PRICE OR INVESTMENT";PV
4450 INPUT "ENTER THE EXPECTED SALE PRICE";FV
4460 INPUT "ENTER THE NUMBER OF PERIODS PER YEAR";PY
4470 INPUT "ENTER THE TOTAL NUMBER OF PERIODS";N
4480 DIM EP(N)
4490 FOR X=1 TO N:PRINT "ENTER THE EARNINGS FOR PERIOD #";X;:INPUT EP(X):NEXT X
4500 CLS:PRINT:PRINT:PRINT:PRINT "COMPUTER WORKING.  BE WITH YOU IN A FEW SECONDS. . . .
4510 IR=.15/PY:I1=.25
4520 PF=FV/(1+IR)^N
4530 TE=0
4540 FOR X=1 TO N
4550 PE=EP(X)/(1+IR)^X
4560 TE=TE+PE
4570 NEXT X
4580 I1=IR*(PF+TE)/PV
4590 IF ABS(IR-I1)<.000001 THEN IR=IR*PY*100:GOTO 4610 
4600 IR=I1:GOTO 4520 
4610 CLS:PRINT:PRINT:PRINT:PRINT "THE RATE OF RETURN IS";IR;"%"
4620 GOTO 970
4630 CLS:CLEAR:PRINT "THIS PROGRAM WILL GIVE YOU THE FUTURE VALUE OF A SERIES
4640 ON ERROR GOTO 5950 
4650 PRINT "OF REGULAR DEPOSITS, WHERE EACH DEPOSIT IS IDENTICAL,
4660 PRINT "AND INTEREST IS COMPOUNDED WITH THE SAME FREQUENCY
4670 PRINT "THAT THE DEPOSITS ARE MADE.  THIS IS KNOWN AS
4680 PRINT "AN ANNUITY DUE, THAT IS, PAYMENTS ARE MADE
4690 PRINT "IN ADVANCE OF THE INTEREST BEING PAID, SUCH AS A
4700 PRINT "SAVINGS ACCOUNT OR INSURANCE POLICY.
4710 INPUT "ENTER THE AMOUNT OF THE REGULAR DEPOSIT ";RD
4720 INPUT "ENTER THE NUMBER OF DEPOSITS PER YEAR ";PY
4730 PRINT "USING THE FORMAT (YY,MM),ENTER THE YEARS AND
4740 INPUT "MONTHS OF THE TERM ";Y,M
4750 Y=Y+M/12
4760 INPUT "ENTER THE NOMINAL ANNUAL INTEREST RATE, IN %";IR
4770 I=IR/PY/100
4780 T=(1+I)^(PY*Y):T=T-1:T=T/I:FV=RD*T
4790 PRINT:PRINT "THE FUTURE VALUE IS $";FV
4800 PRINT:INPUT "PRESS ENTER TO RETURN TO MENU";A$:RUN 
4810 S TO P
4820 CLS:PRINT "THIS PROGRAM COMPUTES THE AMOUNT OF REGULAR DEPOSITS
4830 PRINT "NEEDED TO PRODCE A PARTICULAR FUTURE VALUE.  IT IS
4840 PRINT "AN EXAMPLE OF AN ANNUITY DUE.":PRINT
4850 INPUT "WHAT IS THE FUTURE VALUE";FV
4860 INPUT "ENTER THE NUMBER OF DEPOSITS PER YEAR";PY
4870 PRINT "ENTER THE NUMBER OF YEARS, USING THE
4880 INPUT "FORMAT (YY,MM) ";Y,M
4890 Y=Y+M/12
4900 INPUT "ENTER THE NOMINAL ANNUAL INTEREST RATE, IN %";IR
4910 I=IR/PY/100
4920 T=(1+I)^(PY*Y):T=T-1:T=I/T:RD=FV*T
4930 PRINT:PRINT "THE AMOUNT OF THE REGULAR DEPOSIT IS $";RD
4940 PRINT:INPUT "PRESS ENTER FOR MENU";A$:RUN 
4950 CLS:PRINT "APPLYING A PARTICULAR DEPRECIATION RATE TO A SET
4960 PRINT "INVESTMENT, THIS PROGRAM DETERMINES THE AMOUNT OF
4970 PRINT "DEPRECIATION FOR EACH YEAR.":PRINT
4980 INPUT "ENTER THE AQUISITION PRICE ";PR
4990 INPUT "ENTER THE DEPRECIATION RATE, IN % ";DR
5000 INPUT "ENTER THE NUMBER OF YEARS OF DEPRECIATION ";YD
5010 DR=DR/100:DT=0
5020 PRINT "YEAR","DEPREC.","REMAINDER
5030 FOR X=1 TO YD
5040  DP=DR*PR*(1-DR)^(X-1)
5050  DT=DT+DP
5060  PRINT X,DP,PR-DT
5070  IF YD>12 THEN INPUT "PRESS ENTER TO CONTINUE";A$
5080 NEXT X
5090 PRINT:INPUT "PRESS ENTER TO RETURN TO MENU";A$:RUN 
5100 CLS:PRINT "THIS PROGRAM DETERMINES THE DEPRECIATION RATE
5110 PRINT "IF THE CURRENT VALUE, ORIGINAL PRICE, AND HOLDING
5120 PRINT "TIME ARE KNOWN.":PRINT
5130 INPUT "ENTER THE CURRENT VALUE ";DP
5140 INPUT "ENTER THE ORIGINAL PRICE ";OP
5150 INPUT "ENTER THE HOLDING TIME, IN YEARS ";YD
5160 DR=(1-(DP/OP)^(1/YD))*100
5170 PRINT:PRINT "THE DEPRECIATION RATE IS";DR;" %"
5180 PRINT:INPUT "PRESS ENTER TO RETURN TO MENU";A$:RUN 
5190 CLS:PRINT "THIS PROGRAM DETERMINES THE SALVAGE VALUE
5200 PRINT "OF AN ITEM GIVEN THE AGE, DEPRECIATION RATE AND
5210 PRINT "ORIGINAL PRICE.
5220 PRINT:INPUT "ENTER THE AGE OF THE ITEM, IN YEARS";YD
5230 INPUT "ENTER THE DEPRECIATION RATE, IN % ";DR
5240 INPUT "ENTER THE ORIGINAL PRICE ";OP
5250 PRINT:DR=DR/100
5260 SV=OP*(1-DR)^YD
5270 PRINT "THE SALVAGE VALUE IS $";SV
5280 PRINT:INPUT "PRESS ENTER TO RETURN TO MENU";A$:RUN 
5290 CLS:PRINT "THIS PROGRAM PRINTS A DEPRECIATION SCHEDULE FOR 
5300 PRINT "AN ITEM.  YOU MUST KNOW THE METHOD, AND INPUT THE
5310 PRINT "PROPER FACTOR FOR THAT METHOD.  FOR STRAIGHT LINE
5320 PRINT "DEPRECIATION, INPUT 100, FOR 125% DECLINING BALANCE
5330 PRINT "INPUT 125, FOR 150% DECLINING BALANCE INPUT 150,
5340 PRINT "AND FOR DOUBLE DECLINING BALANCE INPUT 200":PRINT
5350 INPUT "ENTER THE DEPRECIATION FACTOR ";DF
5360 INPUT "ENTER THE ORIGINAL PRICE ";OP
5370 INPUT "ENTER THE SALVAGE VALUE  ";SV
5380 INPUT "ENTER THE NUMBER OF YEARS OF DEPRECIATION";YD
5390 PRINT
5400 PRINT "YEAR","DEP.","REMAINING VALUE
5410 DV=OP-SV:RV=OP:C=0
5420 IF DF=100 THEN GOTO 5500 
5430 FOR X=1 TO YD
5440  C=C+1
5450 DP=DF/YD/100*RV:RV=RV-DP
5460  PRINT X,DP,RV
5470  IF C>11 THEN PRINT:INPUT "PRESS ENTER TO CONTINUE";A$:C=0
5480 NEXT X
5490 PRINT:INPUT "PRESS ENTER TO RETURN TO MENU";A$:RUN 
5500 RV=DV
5510 C=0
5520 FOR X=1 TO YD
5530  C=C+1
5540  DP=DV/YD:RV=RV-DP
5550  IF C>11 THEN PRINT:INPUT "PRESS ENTER TO CONTINUE";A$:C=0
5560  PRINTX,DP,RV+SV
5570 NEXT X
5580 PRINT:INPUT "PRESS ENTER TO RETURN TO MENU ";A$:RUN 
5590 CLS:CLEAR:PRINT "THIS PROGRAM DETERMINES THE PRESENT VALUE OF A COUPON
5600 ON ERROR GOTO 5950 
5610 PRINT "BOND AT THE RATE OF INTEREST SELECTED BY YOU.  IT IS
5620 PRINT "NECESSARY FOR YOU TO GIVE THE COMPUTER YOUR RATE OF
5630 PRINT "INTEREST AND THE FINANCIAL INFORMATION ON THE BOND.
5640 PRINT:INPUT "ENTER YOUR DESIRED RATE OF INTEREST, IN %";IR
5650 INPUT "ENTER THE FACE (REDEMPTION) AMOUNT OF THE BOND";AM
5660 INPUT "ENTER THE NUMBER OF PAYMENT PERIODS PER YEAR";PY
5670 INPUT "ENTER THE NUMBER OF PERIODS TO MATURITY";PN
5680 INPUT "ENTER THE PERIODIC PAYMENT, IN $";PP
5690 PRINT:PRINT
5700 IR=IR/PY/100:PV=AM/(1+IR)^PN
5710 T=(1+IR)^(-PN):T=1-T:T=T/IR:T=T*PP
5720 PV=PV+T
5730 PRINT "THE PRESENT VALUE IS $";PV
5740 PRINT:INPUT "PRESS ENTER TO RETURN TO MENU";A$:RUN 
5750 CLS:CLEAR
5760 ON ERROR GOTO 5950 
5770 PRINT "THIS PROGRAM DETERMINES THE YIELD TO MATURITY ON
5780 PRINT "A BOND GIVEN THE CURRENT PURCHASE PRICE.  THIS IS
5790 PRINT "THE TRUE RATE OF RETURN ON A BOND.
5800 PRINT:INPUT "ENTER THE PURCHASE PRICE OF THE BOND, IN $";PV
5810 INPUT "ENTER THE REDEMPTION (FACE) VALUE ";FV
5820 INPUT "ENTER THE ANNUAL QUOTED INTEREST RATE ";IR
5830 INPUT "ENTER THE NUMBER OF COUPON PAYMENTS PER YEAR ";PY
5840 INPUT "ENTER THE NUMBER OF PAYMENT PERIODS REMAINING ";N
5850 INPUT "ENTER THE AMOUNT OF THE COUPON PAYMENT ";CP
5860 PRINT:PRINT "COMPUTER WORKING.  BE WITH YOU IN A FEW SECONDS . . .
5870 IR=.08/PY
5880 PF=FV/(1+IR)^N
5890 T=(1+IR)^(-N):T=1-T:T=T/IR*CP
5900 I1=IR*(PF+T)/PV
5910 IF ABS(IR-I1)<.000001 THEN IR=IR*PY*100:GOTO 5930 
5920 IR=I1:GOTO 5880 
5930 PRINT:PRINT "THE YIELD TO MATURITY IS";IR;" %"
5940 PRINT:INPUT "PRESS ENTER TO RETURN TO MENU ";A$:RUN 
5950 CLS
5960 IF ERR/2+1=11 THEN PRINT "A DIVIDE BY ZERO ERROR HAS OCCURRED."ELSE6030 
5970 PRINT:PRINT "THIS USUALLY MEANS THAT SOME INFOR MATION REQUIRED  TO 
5980 PRINT "BE ENTERED IN TO  THE PROGRAM HAS BEEN OMITTED.  IT MAY
5990 PRINT "ALSO MEAN THAT THE ZERO WAS COMPUTED FROM VALID DATA
6000 PRINT "AND THE COMPUTER IS UNABLE TO PROCEED.  A SECOND RUN
6010 PRINT "SHOULD TELL US.  PRESS ENTER FOR MENU":INPUT A$
6020 RUN
6030 PRINT "AN ERROR HAS OCCURRED.  LET'S GO BACK
6040 INPUT "AND TRY AGAIN.  PRESS ENTER FOR MENU. ";A$:RUN 
6100 REM * PUBLIC DOMAIN SOFTWARE *
