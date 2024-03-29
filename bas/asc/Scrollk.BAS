1 'Pgm = SCROLLK.BAS
2 'Softalk (IBM) May, 1983, pg 41. (no copyright notice in listing)
3 'Running SCROLLK.BAS creates SCROLLK.COM
4 'Run SCROLLK.COM once to install
5 'ScrollLock key in toggled on state will freeze display output
6 'Tapping RightShift key releases single lines
7 "Tapping LeftShift key releases 23 line pages. (see line 1010, 6th value)
8 'Following will modify page size from Basic program.
9 'def seg=0:def seg=256*peek(&h43)+peek(&h42):poke &h10d,no.of.lines
10 CHECK = 0
20 FOR I = 1 TO 251
30 READ BYTE
40 CHECK = CHECK XOR BYTE
50 NEXT
60 IF CHECK = 54 THEN 100
70 PRINT "One of the data statements may be wrong"
80 PRINT "Check lines 1000-1310, then run again"
90 STOP
100 OPEN "SCROLLK.COM" AS #1 LEN=1
110 FIELD #1,1 AS BYTE$
120 RESTORE
130 FOR I = 1 TO 251
140 READ BYTE: LSET BYTE$ = CHR$(BYTE): PUT #1
150 NEXT
160 CLOSE
170 PRINT "SCROLLK.COM created"
180 END
1000 DATA 233,  180,    0,      0,      0,      0,      0,      0
1010 DATA 0,    0,      0,      0,      0,      23,     0,      251
1020 DATA 30,   83,     80,     187,    64,     0,      142,    219
1030 DATA 160,  23,     0,      36,     16,     140,    203,    142
1040 DATA 219,  58,     6,      12,     1,      116,    30,     138
1050 DATA 30,   13,     1,      136,    30,     11,     1,      162
1060 DATA 12,   1,      81,     82,     80,     180,    3,      183
1070 DATA 0,    156,    255,    30,     3,      1,      136,    54
1080 DATA 14,   1,      88,     90,     89,     147,    88,     10
1090 DATA 219,  116,    75,     128,    252,    2,      117,    12
1100 DATA 58,   54,     14,     1,      136,    54,     14,     1
1110 DATA 126,  60,     235,    5,      128,    252,    6,      117
1120 DATA 53,   254,    6,      11,     1,      138,    62,     13
1130 DATA 1,    56,     62,     11,     1,      124,    39,     138
1140 DATA 223,  254,    203,    136,    30,     11,     1,      187
1150 DATA 64,   0,      142,    219,    138,    30,     23,     0
1160 DATA 246,  195,    16,     116,    17,     128,    227,    3
1170 DATA 116,  242,    128,    251,    1,      116,    7,      51
1180 DATA 219,  46,     136,    30,     11,     1,      91,     156
1190 DATA 46,   255,    30,     3,      1,      31,     207,    251
1200 DATA 30,   83,     140,    203,    142,    219,    10,     228
1210 DATA 117,  6,      51,     219,    136,    30,     11,     1
1220 DATA 91,   31,     46,     255,    46,     7,      1,      180
1230 DATA 3,    50,     255,    205,    16,     136,    54,     14
1240 DATA 1,    184,    0,      0,      142,    216,    161,    64
1250 DATA 0,    46,     163,    3,      1,      161,    66,     0
1260 DATA 46,   163,    5,      1,      184,    15,     1,      163
1270 DATA 64,   0,      140,    14,     66,     0,      161,    88
1280 DATA 0,    46,     163,    7,      1,      161,    90,     0
1290 DATA  46,  163,    9,      1,      184,    159,    1,      163
1300 DATA 88,   0,      140,    14,     90,     0,      186,    183
1310 DATA 1,    205,    39
