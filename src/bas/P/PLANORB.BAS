DECLARE SUB drawellipse (cx#, cy#, ax#, ay#, bx#, by#, col%)
DECLARE SUB inittokeplerang ()
DECLARE FUNCTION tokeplerang# (ia#, k#)
DECLARE SUB kline (x1#, y1#, x2#, y2#, col%)
DECLARE FUNCTION getdayofweek& (d&)
DECLARE SUB getdate (d&, year&, month&, day&)
DECLARE FUNCTION getday& (year&, month&, day&)
DEFDBL A-Z

DIM SHARED planang(9), planrev(9), plandia(9), plancol(9)
DIM SHARED planmindist(9), planmaxdist(9), planperiang(9)
DIM SHARED planascnang(9), planinceang(9)
DIM SHARED month$(12), dayofweek$(7)

'CONST TIMEZONE = -5      'Add this to GMT to get EST (winter)
CONST TIMEZONE = -5 + 1  'Add this to GMT to get EDT (summer)
CONST PI = 3.141592653589793#, PI2 = PI * 2#

'Most of the planet data came from my 1997 World Almanac on page 455

   'Speed of light: 186282.3976 miles/sec

epochyear& = 1997
epochmonth& = 2
epochday& = 1
epochhour& = 12 + TIMEZONE

   'These values consistent with epoch: 0-right, 90-up, 180-left, 270-down
moonang = 242 * PI / 180 'This value was guessed from full moon tables, etc.
planang(0) = (215 + (54 + 59 / 60) / 60) * PI / 180
planang(1) = (276 + (28 + 22 / 60) / 60) * PI / 180
planang(2) = (131 + (14 + 33 / 60) / 60) * PI / 180
planang(3) = (157 + (34 + 18 / 60) / 60) * PI / 180
planang(4) = (305 + (53 + 51 / 60) / 60) * PI / 180
planang(5) = (14 + (13 + 29 / 60) / 60) * PI / 180
planang(6) = (300 + (44 + 57 / 60) / 60) * PI / 180
planang(7) = (298 + (33 + 15 / 60) / 60) * PI / 180
planang(8) = (234 + (54 + 21 / 60) / 60) * PI / 180

moonrev = 27# + (7# + (43# + 11.47# / 60#) / 60#) / 24#
planrev(0) = 87.97
planrev(1) = 224.7
planrev(2) = 365.2564
planrev(3) = 686.98
planrev(4) = 4331.8
planrev(5) = 10760!
planrev(6) = 30684!
planrev(7) = 60188.3
planrev(8) = 90466.8

moonmindist = 221463: moonmaxdist = 252710
planmindist(0) = 28.6: planmaxdist(0) = 43.4
planmindist(1) = 66.8: planmaxdist(1) = 67.7
planmindist(2) = 91.4: planmaxdist(2) = 94.6
planmindist(3) = 128.5: planmaxdist(3) = 155!
planmindist(4) = 460.6: planmaxdist(4) = 507!
planmindist(5) = 838.4: planmaxdist(5) = 937.5
planmindist(6) = 1669.3: planmaxdist(6) = 1859.7
planmindist(7) = 2760.4: planmaxdist(7) = 2821.7
planmindist(8) = 2756.4: planmaxdist(8) = 4551.4

   'Mean longitude of perihelion: 0-right, 90-up, 180-left, 270-down
planperiang(0) = (77 + (24 + 43 / 60) / 60) * PI / 180
planperiang(1) = (131 + (45 + 36 / 60) / 60) * PI / 180
planperiang(2) = (102 + (50 + 2 / 60) / 60) * PI / 180
planperiang(3) = (336 + (2 + 28 / 60) / 60) * PI / 180
planperiang(4) = (15 + (41 + 35 / 60) / 60) * PI / 180
planperiang(5) = (89 + (19 + 52 / 60) / 60) * PI / 180
planperiang(6) = (176 + (17 + 42 / 60) / 60) * PI / 180
planperiang(7) = (3 + (49 + 12 / 60) / 60) * PI / 180
planperiang(8) = (224 + (47 + 2 / 60) / 60) * PI / 180

   'Mean longitude of ascending node: 0-right, 90-up, 180-left, 270-down
planascnang(0) = (48 + (17 + 49 / 60) / 60) * PI / 180
planascnang(1) = (76 + (39 + 18 / 60) / 60) * PI / 180
planascnang(2) = (0 + (0 + 0 / 60) / 60) * PI / 180
planascnang(3) = (49 + (32 + 10 / 60) / 60) * PI / 180
planascnang(4) = (100 + (26 + 46 / 60) / 60) * PI / 180
planascnang(5) = (113 + (36 + 11 / 60) / 60) * PI / 180
planascnang(6) = (74 + (5 + 17 / 60) / 60) * PI / 180
planascnang(7) = (131 + (45 + 22 / 60) / 60) * PI / 180
planascnang(8) = (110 + (21 + 7 / 60) / 60) * PI / 180

   'Inclination of orbit to ecliptic: 0-right, 90-up, 180-left, 270-down
planinceang(0) = (7 + (0 + 18 / 60) / 60) * PI / 180
planinceang(1) = (3 + (23 + 41 / 60) / 60) * PI / 180
planinceang(2) = (0 + (0 + 0 / 60) / 60) * PI / 180
planinceang(3) = (1 + (50 + 59 / 60) / 60) * PI / 180
planinceang(4) = (1 + (18 + 17 / 60) / 60) * PI / 180
planinceang(5) = (2 + (29 + 7 / 60) / 60) * PI / 180
planinceang(6) = (0 + (46 + 24 / 60) / 60) * PI / 180
planinceang(7) = (1 + (46 + 8 / 60) / 60) * PI / 180
planinceang(8) = (17 + (7 + 9 / 60) / 60) * PI / 180

sundia = 432449 * 2
moondia = 1080 * 2
plandia(0) = 1516 * 2
plandia(1) = 3761 * 2
plandia(2) = 3964 * 2
plandia(3) = 2109 * 2
plandia(4) = 44375 * 2
plandia(5) = 37495 * 2
plandia(6) = 15885 * 2
plandia(7) = 15391 * 2
plandia(8) = 715 * 2

plancol(0) = 6
plancol(1) = 14
plancol(2) = 11
plancol(3) = 12
plancol(4) = 4
plancol(5) = 6
plancol(6) = 2
plancol(7) = 3
plancol(8) = 5

month$(1) = "January"
month$(2) = "February"
month$(3) = "March"
month$(4) = "April"
month$(5) = "May"
month$(6) = "June"
month$(7) = "July"
month$(8) = "August"
month$(9) = "September"
month$(10) = "October"
month$(11) = "November"
month$(12) = "December"

dayofweek$(0) = "Sunday"
dayofweek$(1) = "Monday"
dayofweek$(2) = "Tuesday"
dayofweek$(3) = "Wednesday"
dayofweek$(4) = "Thursday"
dayofweek$(5) = "Friday"
dayofweek$(6) = "Saturday"

  'Uncomment this code to verify date functions
'CLS
'DO
'   oy& = INT(4000 * RND) + 1
'   om& = INT(12 * RND) + 1
'   SELECT CASE om&
'      CASE 1:
'         od& = INT(31 * RND) + 1
'      CASE 2:
'         IF (oy& AND 3) <> 0 OR ((oy& MOD 100) = 0 AND (oy& MOD 400) <> 0) THEN
'            od& = INT(28 * RND) + 1
'         ELSE
'            od& = INT(29 * RND) + 1
'         END IF
'      CASE 3:
'         od& = INT(31 * RND) + 1
'      CASE 4:
'         od& = INT(30 * RND) + 1
'      CASE 5:
'         od& = INT(31 * RND) + 1
'      CASE 6:
'         od& = INT(30 * RND) + 1
'      CASE 7:
'         od& = INT(31 * RND) + 1
'      CASE 8:
'         od& = INT(31 * RND) + 1
'      CASE 9:
'         od& = INT(30 * RND) + 1
'      CASE 10:
'         od& = INT(31 * RND) + 1
'      CASE 11:
'         od& = INT(30 * RND) + 1
'      CASE 12:
'         od& = INT(31 * RND) + 1
'   END SELECT
'
'   PRINT month$(om&); STR$(od&); ","; oy&;
'   d& = getday&(oy&, om&, od&)
'   CALL getdate(d&, yy&, mm&, dd&)
'   IF yy& <> oy& OR mm& <> om& OR dd& <> od& THEN SOUND 37, 2: COLOR 0, 4
'   PRINT TAB(30); d&;
'   PRINT TAB(50); month$(mm&); STR$(dd&); ","; yy&
'   COLOR 7, 0
'   IF yy& <> oy& OR mm& <> om& OR dd& <> od& THEN DO: LOOP WHILE INKEY$ = ""
'LOOP
'END

DIM intens%(4): intens%(0) = 0: intens%(1) = 8: intens%(2) = 7: intens%(3) = 15
zoom = .27
SCREEN 12

timeupdate% = 1

epochdate& = getday&(epochyear&, epochmonth&, epochday&)
epochdayfrac = epochhour& / 24
DO
   IF timeupdate% <> 0 THEN
      dat$ = DATE$
      month& = VAL(MID$(dat$, 1, 2))
      day& = VAL(MID$(dat$, 4, 2))
      year& = VAL(MID$(dat$, 7, 4))
      tim$ = TIME$
      hour& = VAL(MID$(tim$, 1, 2))
      minute& = VAL(MID$(tim$, 4, 2))
      second& = VAL(MID$(tim$, 7, 2))
      dayfrac = (hour& + (minute& + second& / 60) / 60) / 24
  
      d# = getday&(year&, month&, day&) - epochdate& + dayfrac - epochdayfrac
   END IF

   CALL getdate(INT(d# + epochdayfrac) + epochdate&, yy&, mm&, dd&)
  
   CLS
   CIRCLE (320, 240), 2, 15: PAINT (320, 240), 15, 15
  
   LOCATE 1, 1: PRINT month$(mm&); STR$(dd&); ","; yy&; "("; dayofweek$(getdayofweek&(INT(d# + epochdayfrac) + epochdate&)); ") ";
   dz# = (d# + epochdayfrac) - INT(d# + epochdayfrac)
   PRINT LTRIM$(STR$((INT(dz# * 24 + 11#) MOD 12) + 1)); ":";
   dzz# = INT(dz# * 24 * 60) MOD 60: IF dzz# < 10 THEN PRINT "0";
   PRINT LTRIM$(STR$(dzz#)); ":";
   dzz# = INT(dz# * 24 * 60 * 60) MOD 60: IF dzz# < 10 THEN PRINT "0";
   PRINT LTRIM$(STR$(dzz#));
   dzz# = INT(dz# * 24 * 60 * 60)
   IF dzz# = 0# THEN
      PRINT "Midnight";
   ELSEIF dzz# = 12# * 60# * 60# THEN
      PRINT "Noon";
   ELSEIF dzz# < 12# * 60# * 60# THEN
      PRINT "am";
   ELSE
      PRINT "pm";
   END IF

   kenage& = yy& - 1975: IF mm& < 11 THEN kenage& = kenage& - 1
   LOCATE 2, 1: PRINT "Ken: "; kenage&

   FOR z% = 0 TO 8
        
         'Draw elliptical orbit  'CIRCLE (320, 240), r, 8
      a = (planmindist(z%) + planmaxdist(z%)) / 2
      f = a - planmindist(z%)
      b = SQR(a * a - f * f)
      cosang = zoom * 2 * COS(planperiang(z%))
      sinang = zoom * 2 * SIN(planperiang(z%))
      cx = -f * cosang + 320: cy = f * sinang + 240: cz = 0
      ax = a * -cosang: ay = a * sinang: az = 0
      bx = b * -sinang: by = b * -cosang: bz = 0
      CALL drawellipse(cx, cy, ax, ay, bx, by, 8)
     
      ang = planperiang(z%) - planperiang(z%): PSET (cx - COS(ang) * ax + SIN(ang) * bx, cy - COS(ang) * ay + SIN(ang) * by), 7
      IF planinceang(z%) <> 0 THEN ang = planascnang(z%) - planperiang(z%): PSET (cx - COS(ang) * ax + SIN(ang) * bx, cy - COS(ang) * ay + SIN(ang) * by), 9
     
      oa = tokeplerang(planang(z%) + d# * PI2 / planrev(z%) - planperiang(z%), -f / a)
      u = COS(oa): v = SIN(oa)
      px = cx - u * ax + v * bx: py = cy - u * ay + v * by
     
      dia = plandia(z%) * .001 * zoom
      CIRCLE (px, py), dia, plancol(z%)
      PAINT (px, py), plancol(z%), plancol(z%)
      IF z% = 5 THEN
         CIRCLE (px, py), dia * 1.2, 6, PI - .42, .42, .3
         CIRCLE (px, py), dia * 1.35, 14, PI - .63, .63, .3
         CIRCLE (px, py), dia * 1.5, 15, PI - .8, .8, .3
         CIRCLE (px, py), dia * 1.65, 7, PI - .91, .91, .3
      END IF
      IF z% = 2 THEN
         ang = moonang + d# * PI2 / moonrev
         mx = px + 24 * zoom * COS(ang): andx = mx - INT(mx)
         my = py - 24 * zoom * SIN(ang): andy = my - INT(my)
         'PSET (CINT(mx), CINT(my)), 15
         PSET (INT(mx), INT(my)), intens%(INT(((1 - andx) + (1 - andy)) * 2))
         PSET (INT(mx) + 1, INT(my)), intens%(INT(((andx) + (1 - andy)) * 2))
         PSET (INT(mx), INT(my) + 1), intens%(INT(((1 - andx) + (andy)) * 2))
         PSET (INT(mx) + 1, INT(my) + 1), intens%(INT(((andx) + (andy)) * 2))
      END IF
   NEXT z%

   DO: z$ = INKEY$: LOOP WHILE z$ = "" AND (timeupdate% = 0 OR LEFT$(tim$, 7) = LEFT$(TIME$, 7))
   DO
      IF z$ = CHR$(27) THEN END
      IF z$ = CHR$(0) + CHR$(115) THEN d# = d# - 1 / 24: timeupdate% = 0 'hour
      IF z$ = CHR$(0) + CHR$(116) THEN d# = d# + 1 / 24: timeupdate% = 0 'hour
      IF z$ = CHR$(0) + CHR$(75) THEN d# = d# - 1: timeupdate% = 0       'day
      IF z$ = CHR$(0) + CHR$(77) THEN d# = d# + 1: timeupdate% = 0       'day
      IF z$ = CHR$(0) + CHR$(72) THEN d# = d# - moonrev: timeupdate% = 0 'moon cycle
      IF z$ = CHR$(0) + CHR$(80) THEN d# = d# + moonrev: timeupdate% = 0 'moon cycle
      IF z$ = "*" THEN zoom = zoom * 1.1 ': CLS
      IF z$ = "/" THEN zoom = zoom * .9 ': CLS
      IF z$ = "[" THEN d# = d# - planrev(2): timeupdate% = 0 'year
      IF z$ = "]" THEN d# = d# + planrev(2): timeupdate% = 0 'year
      IF UCASE$(z$) = "R" THEN timeupdate% = 1
      z$ = INKEY$
   LOOP WHILE z$ <> "" AND (timeupdate% = 0 OR LEFT$(tim$, 7) = LEFT$(TIME$, 7))
LOOP

SUB drawellipse (cx, cy, ax, ay, bx, by, col%)
   x2 = cx + ax
   y2 = cy + ay
   FOR ang = PI2 / 64 TO PI2 STEP PI2 / 64
      u = COS(ang): v = SIN(ang)
      x1 = x2: x2 = cx + u * ax + v * bx
      y1 = y2: y2 = cy + u * ay + v * by
      CALL kline(x1, y1, x2, y2, col%)
   NEXT ang
END SUB

SUB getdate (d&, year&, month&, day&)
   year& = d& \ planrev(2) + 1
   DO
      yday& = ((year& - 1) * 365) + ((year& - 1) \ 4)
      yday& = yday& - ((year& - 1) \ 100) + ((year& - 1) \ 400)
     
      'multiples of 400 are leap years. All other multiples of 100 are not
      '0-99            -0     +0     -0
      '100-199         -1     +0     -1
      '200-299         -2     +0     -2
      '300-399         -3     +0     -3
      '400-499         -4     +1     -3
      '500-599         -5     +1     -4
      '600-699         -6     +1     -5
      '700-799         -7     +1     -6
      '800-899         -8     +2     -6
      '900-999         -9     +2     -7
      '1000-1099       -10    +2     -8
      '1100-1199       -11    +2     -9
      '1200-1299       -12    +3     -9
      '1300-1399       -13    +3     -10
      '1400-1499       -14    +3     -11
      '1500-1599       -15    +3     -12
      '1600-1699       -16    +4     -12
      '1700-1799       -17    +4     -13
      '1800-1899       -18    +4     -14
      '1900-1999       -19    +4     -15
      '2000-2099       -20    +5     -15
      '2100-2199       -21    +5     -16

      bad% = 0
      IF d& < yday& THEN year& = year& - 1: bad% = 1
      IF (year& AND 3) <> 0 OR ((year& MOD 100) = 0 AND (year& MOD 400) <> 0) THEN
         IF d& >= yday& + 365 THEN year& = year& + 1: bad% = 1
      ELSE
         IF d& >= yday& + 366 THEN year& = year& + 1: bad% = 1
      END IF
   LOOP WHILE bad% <> 0

   day& = d& - yday&
  
   month& = 1
   IF month& = 1 AND day& >= 31 THEN month& = 2: day& = day& - 31
   IF (year& AND 3) <> 0 OR ((year& MOD 100) = 0 AND (year& MOD 400) <> 0) THEN
      IF month& = 2 AND day& >= 28 THEN month& = 3: day& = day& - 28
   ELSE
      IF month& = 2 AND day& >= 29 THEN month& = 3: day& = day& - 29
   END IF
   IF month& = 3 AND day& >= 31 THEN month& = 4: day& = day& - 31
   IF month& = 4 AND day& >= 30 THEN month& = 5: day& = day& - 30
   IF month& = 5 AND day& >= 31 THEN month& = 6: day& = day& - 31
   IF month& = 6 AND day& >= 30 THEN month& = 7: day& = day& - 30
   IF month& = 7 AND day& >= 31 THEN month& = 8: day& = day& - 31
   IF month& = 8 AND day& >= 31 THEN month& = 9: day& = day& - 31
   IF month& = 9 AND day& >= 30 THEN month& = 10: day& = day& - 30
   IF month& = 10 AND day& >= 31 THEN month& = 11: day& = day& - 31
   IF month& = 11 AND day& >= 30 THEN month& = 12: day& = day& - 30
  
   day& = day& + 1
END SUB

FUNCTION getday& (year&, month&, day&)
   d& = ((year& - 1) * 365) + ((year& - 1) \ 4)
   d& = d& - ((year& - 1) \ 100) + ((year& - 1) \ 400)
  
   IF month& > 1 THEN d& = d& + 31
   IF month& > 2 THEN
      IF (year& AND 3) <> 0 OR ((year& MOD 100) = 0 AND (year& MOD 400) <> 0) THEN
         d& = d& + 28
      ELSE
         d& = d& + 29
      END IF
   END IF
   IF month& > 3 THEN d& = d& + 31
   IF month& > 4 THEN d& = d& + 30
   IF month& > 5 THEN d& = d& + 31
   IF month& > 6 THEN d& = d& + 30
   IF month& > 7 THEN d& = d& + 31
   IF month& > 8 THEN d& = d& + 31
   IF month& > 9 THEN d& = d& + 30
   IF month& > 10 THEN d& = d& + 31
   IF month& > 11 THEN d& = d& + 30
   IF month& > 12 THEN d& = d& + 31
  
   getday& = d& + (day& - 1)
END FUNCTION

FUNCTION getdayofweek& (d&)
   getdayofweek& = (d& + 1) MOD 7
END FUNCTION

SUB kline (x1, y1, x2, y2, col%)
   IF x1 < 0 AND x2 < 0 THEN EXIT SUB
   IF x1 >= 640 AND x2 >= 640 THEN EXIT SUB
   IF y1 < 0 AND y2 < 0 THEN EXIT SUB
   IF y1 >= 480 AND y2 >= 480 THEN EXIT SUB
   IF ABS(x2 - x1) >= ABS(y2 - y1) THEN
      IF x1 = x2 THEN EXIT SUB
      dy& = (y2 - y1) * 65536 / (x2 - x1)
      IF x2 >= x1 THEN
         xstart% = CINT(x1): xend% = CINT(x2) - 1
         y& = y1 * 65536 + (xstart% - x1) * dy&
      ELSE
         xstart% = CINT(x2): xend% = CINT(x1) - 1
         y& = y2 * 65536 + (xstart% - x2) * dy&
      END IF
      FOR x% = xstart% TO xend%
         PSET (x%, y& \ 65536), col%: y& = y& + dy&
      NEXT x%
   ELSE
      dx& = (x2 - x1) * 65536 / (y2 - y1)
      IF y2 >= y1 THEN
         ystart% = CINT(y1): yend% = CINT(y2) - 1
         x& = x1 * 65536 + (ystart% - y1) * dx&
      ELSE
         ystart% = CINT(y2): yend% = CINT(y1) - 1
         x& = x2 * 65536 + (ystart% - y2) * dx&
      END IF
      FOR y% = ystart% TO yend%
         PSET (x& \ 65536, y%), col%: x& = x& + dx&
      NEXT y%
   END IF
END SUB

FUNCTION tokeplerang (ia, k)
      'Make sure 0 < ia < PI*2
   ia = ia - CINT(ia / PI2) * PI2
   DO WHILE ia < 0: ia = ia + PI2: LOOP
   DO WHILE ia >= PI2: ia = ia - PI2: LOOP

   oa = ia - k * SIN(ia) * (1 - k * COS(ia))
   FOR cnt% = -7 TO 0  'WARNING! Doesn't work when k = -1
      ooa = oa: oa = oa + (ia - oa - k * SIN(oa)) / (1 + k * COS(oa))
      IF ooa = oa THEN EXIT FOR
   NEXT cnt%
   tokeplerang = oa
END FUNCTION

