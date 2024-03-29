10 REM       FIREBALL
12 PRINT
14 INPUT "INITIAL MASS (KG)  ";MM
16 INPUT "DENSITY (KG/M^3)   ";D
18 INPUT "SPEED (KM/S)       ";V
20 INPUT "ZENITH ANGLE (DEG) ";Z
22 INPUT "TIME STEP (SEC)    ";DT
24 GOSUB 98: PRINT: GOSUB 114
26 A=1.2: L=.001: G=1: H0=.2
28 H1=500000: SG=H0/(2*G*H1)
30 H=155000: T=0: FM=10: FL=FM
32 M=MM: V=V*1000
34 RE=6371000: ZR=Z*3.14159/180
36 VV=-V*COS(ZR): VH=V*SIN(ZR)
38 REM    DENSITY OF ATMOSPHERE
40 I=INT(H/10000)
42 IF I>15 THEN I=15
44 FR=(H/10000)-I
46 R=10^(LR(I)*(1-FR)+FR*LR(I+1))
48 REM    RATES OF CHANGE
50 A2=G*A*R*V*V/(M*D*D)^.33333
52 GV=9.810001/(1+H/RE)^2
54 AV=-GV-A2*VV/V+VH*VH/(RE+H)
56 AH=-A2*VH/V-VV*VH/(RE+H)
58 M0=SG*M*V*A2
60 IF FL=FM THEN GOSUB 76
62 REM    INCREMENT VARIABLES
64 T=T+DT: S=S+VH*DT*RE/(RE+H)
66 H=H+VV*DT: M=M-M0*DT
68 VV=VV+AV*DT: VH=VH+AH*DT
70 V=SQR(VH*VH+VV*VV)
72 IF M<0 OR H<0 THEN END
74 FL=FL+1: GOTO 38
76 REM        OUTPUT
78 PRINT INT(.5+T*10)/10;
80 PRINT TAB(10);INT(.5+S/1000);
82 PRINT TAB(20);INT(.5+H/1000);
84 PRINT TAB(30);INT(.5+V/100)/10;
86 PRINT TAB(40);INT(.5+A2);
88 PRINT TAB(50);INT(.5+100*M/MM);
90 LV=.5*V*V*M0*L*1E+10/(H*H)
92 MV=6.8-1.086*LOG(LV)
94 PRINT TAB(60);INT(.5+10*MV)/10
96 FL=0: RETURN
98 REM   LOG(DENSITY) OF ATMOSPHERE
100 DIM LR(16)
102 FOR I=0 TO 16: READ LR(I): NEXT
104 DATA .09,-.38,-1.05,-1.74,-2.39
106 DATA -2.98,-3.50,-4.07,-4.72
108 DATA -5.45,-6.30,-7.00,-7.62
110 DATA -7.97,-8.32,-8.67,-8.81
112 RETURN
114 REM          HEADING
116 PRINT"        GROUND";
118 PRINT TAB(39);"ATMOS"
120 PRINT"TIME     TRACK   HEIGHT";
122 PRINT TAB(30);"SPEED    DECEL";
124 PRINT TAB(50);"MASS    VISUAL"
126 PRINT"  (S)    (KM)      (KM)";
128 PRINT TAB(30);"(KM/S) (M/S/S)";
130 PRINT TAB(50);" (%)       MAG"
132 RETURN
