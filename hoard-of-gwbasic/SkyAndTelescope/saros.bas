10 REM     SAROS SERIES
14 REM
18 PRINT
22 INPUT "JULIAN DAY NUMBER";J
26 Q=J/29.530588-82064
30 B=INT(Q): N=Q-B
34 IF N>0.28 AND N<0.36 THEN 42
38 PRINT "WARNING: NOT NEW MOON!"
42 PRINT "  BROWN LUNATION ";B
46 D=B-848
50 S=136+38*D
54 X=-61*D
58 C=INT(X/358+0.5-D/(12*358*358))
62 S=S+223*C
66 X=X-358*C
70 IF ABS(X-(S-136)/12)<55 THEN 78
74 PRINT "WARNING: NO ECLIPSE!"
78 PRINT "  SAROS NUMBER ";S
82 PRINT "  RELATIVE ECLIPSE ";
86 PRINT INT(X-(S-136)/12+0.5)
90 PRINT
94 END
95 REM  ------------------------
96 REM  APPEARED IN ASTRONOMICAL
97 REM  COMPUTING, SKY & TELE-
98 REM  SCOPE, OCTOBER, 1985
99 REM  ------------------------
