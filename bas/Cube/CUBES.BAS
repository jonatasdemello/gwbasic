DECLARE SUB drawcube (x&, y&, z&)
DECLARE SUB polydiagfill (sx&(), sy&(), npoints%)
DECLARE FUNCTION clippoly% ()
DECLARE SUB setupgetreadpos (rx&(), ry&())
DECLARE FUNCTION scale& (eax&, ebx&, ecx&)
DECLARE FUNCTION divscale& (eax&, ebx&, ecx&)
DECLARE SUB dhline (x&, y&)
DECLARE SUB dvline (x&, y&)
DECLARE FUNCTION mulscale& (eax&, ebx&, ecx&)
DECLARE SUB setuprotate3d (a1%, a2%, a3%)
DECLARE SUB rotate3d (nx&, ny&, nz&)
DECLARE SUB initboard ()

CONST XDIM = 320&
CONST YDIM = 200&
CONST BSIZ = 7
CONST MAXPOINTS = 8

DIM SHARED board%(BSIZ, BSIZ, BSIZ), pic%(8192)

DIM SHARED posx&, posy&, posz&, a1%, a2%, a3%
DIM SHARED ofx&(6, 4), ofy&(6, 4), ofz&(6, 4)
  
   'Global position variables
DIM SHARED px&(MAXPOINTS), py&(MAXPOINTS), pz&(MAXPOINTS)
DIM SHARED rx&(MAXPOINTS), ry&(MAXPOINTS), rz&(MAXPOINTS)
DIM SHARED rx2&(MAXPOINTS), ry2&(MAXPOINTS), rz2&(MAXPOINTS)
DIM SHARED sx&(MAXPOINTS), sy&(MAXPOINTS), zoom&, npoints%

   'Global filling variables
DIM SHARED umost&(XDIM), dmost&(XDIM)
DIM SHARED last1&(XDIM + XDIM + YDIM), hplc%(XDIM), hinc%(XDIM), globm&

   'Global rotation variables
DIM SHARED gxx&, gxy&, gxz&, gyx&, gyy&, gyz&, gzx&, gzy&, gzz&

   'Global texturizing variables
DIM SHARED getd&, getdxinc&, getdyinc&
DIM SHARED gett&
DIM SHARED getu&, getuxinc&, getuyinc&
DIM SHARED getv&, getvxinc&, getvyinc&
DIM SHARED globuinc&, globvinc&

DIM SHARED globalpicoffs&, globalshade&, pixelcount&
 
DIM SHARED xlist&(BSIZ), ylist&(BSIZ), zlist&(BSIZ)

SCREEN 13: RANDOMIZE TIMER
OUT &H3C8, 0
FOR z% = 0 TO 62
   OUT &H3C9, z%: OUT &H3C9, z%: OUT &H3C9, z%
   OUT &H3C9, z%: OUT &H3C9, z%: OUT &H3C9, z% + 1
   OUT &H3C9, z% + 1: OUT &H3C9, z%: OUT &H3C9, z%
   OUT &H3C9, z%: OUT &H3C9, z% + 1: OUT &H3C9, z%
NEXT z%
FOR z% = 0 TO 4
   OUT &H3C9, z%: OUT &H3C9, z%: OUT &H3C9, z%
NEXT z%

CALL initboard

zoom& = 256
FOR z% = 0 TO XDIM + XDIM + YDIM - 1
   last1&(z%) = &H7FFFFFFF
NEXT z%

DO
   CALL setuprotate3d(a1%, a2%, a3%)
  
   CLS

   xp& = posx& \ 1024: yp& = posy& \ 1024: zp& = posz& \ 1024
   cnt% = 0
   FOR z% = 0 TO xp& - 1: xlist&(cnt%) = z%: cnt% = cnt% + 1: NEXT z%
   FOR z% = BSIZ - 1 TO xp& + 1 STEP -1: xlist&(cnt%) = z%: cnt% = cnt% + 1: NEXT z%
   xlist&(cnt%) = xp&
  
   cnt% = 0
   FOR z% = 0 TO yp& - 1: ylist&(cnt%) = z%: cnt% = cnt% + 1: NEXT z%
   FOR z% = BSIZ - 1 TO yp& + 1 STEP -1: ylist&(cnt%) = z%: cnt% = cnt% + 1: NEXT z%
   ylist&(cnt%) = yp&
  
   cnt% = 0
   FOR z% = 0 TO zp& - 1: zlist&(cnt%) = z%: cnt% = cnt% + 1: NEXT z%
   FOR z% = BSIZ - 1 TO zp& + 1 STEP -1: zlist&(cnt%) = z%: cnt% = cnt% + 1: NEXT z%
   zlist&(cnt%) = zp&

   pixelcount& = XDIM * YDIM

   FOR xx& = BSIZ - 1 TO 0 STEP -1
      x& = xlist&(xx&)
      FOR yy& = BSIZ - 1 TO 0 STEP -1
         y& = ylist&(yy&)
         FOR zz& = BSIZ - 1 TO 0 STEP -1
            z& = zlist&(zz&)
            IF board%(x&, y&, z&) <> 0 THEN CALL drawcube(x&, y&, z&)
            IF pixelcount& <= 0 THEN GOTO endraw
          NEXT zz&
      NEXT yy&
   NEXT xx&
endraw:
   SOUND 523, .1
  
   DO
      z$ = INKEY$
   LOOP WHILE z$ = ""
   DO
      IF z$ = CHR$(27) THEN END
      IF z$ = CHR$(0) + CHR$(75) THEN a3% = ((a3% - 32) AND 2047)
      IF z$ = CHR$(0) + CHR$(77) THEN a3% = ((a3% + 32) AND 2047)
      IF z$ = CHR$(0) + CHR$(72) THEN a2% = ((a2% + 32) AND 2047)
      IF z$ = CHR$(0) + CHR$(80) THEN a2% = ((a2% - 32) AND 2047)
      IF z$ = "," OR z$ = "<" THEN a1% = ((a1% + 32) AND 2047)
      IF z$ = "." OR z$ = ">" THEN a1% = ((a1% - 32) AND 2047)
      IF z$ = "-" AND zoom& > 16 THEN zoom& = zoom& - 16
      IF z$ = "=" AND zoom& < 1024 THEN zoom& = zoom& + 16
      IF z$ = " " THEN
         DO
            posx& = INT((BSIZ - 2) * RND) * 1024 + 1536
            posy& = INT((BSIZ - 2) * RND) * 1024 + 1536
            posz& = INT((BSIZ - 2) * RND) * 1024 + 1536
         LOOP WHILE board%(posx& \ 1024, posy& \ 1024, posz& \ 1024) <> 0
         a1% = INT(2048 * RND): a2% = INT(2048 * RND): a3% = INT(2048 * RND)
      END IF
      z$ = INKEY$
   LOOP WHILE z$ <> ""
LOOP WHILE z$ <> CHR$(27)

SUB backrotate3d (nx&, ny&, nz&)
   x& = nx&: y& = ny&: z& = nz&
   nx& = mulscale&(x&, gxx&, 28) + mulscale&(y&, gyx&, 28) + mulscale&(z&, gzx&, 28)
   ny& = mulscale&(x&, gxy&, 28) + mulscale&(y&, gyy&, 28) + mulscale&(z&, gzy&, 28)
   nz& = mulscale&(x&, gxz&, 28) + mulscale&(y&, gyz&, 28) + mulscale&(z&, gzz&, 28)
END SUB

FUNCTION clippoly%
      'Clip polygon in 3-space
   npoints% = 4
 
      'Clip edge 1
   npoints2% = 0
   zzsgn& = rx&(0) + rz&(0)
   FOR z& = 0 TO npoints% - 1
      zz& = z& + 1: IF zz& = npoints% THEN zz& = 0
      zsgn& = zzsgn&: zzsgn& = rx&(zz&) + rz&(zz&)
      IF zsgn& >= 0 THEN
         rx2&(npoints2%) = rx&(z&)
         ry2&(npoints2%) = ry&(z&)
         rz2&(npoints2%) = rz&(z&)
         npoints2% = npoints2% + 1
      END IF
      IF (zsgn& XOR zzsgn&) < 0 THEN
         t& = divscale&(zsgn&, zsgn& - zzsgn&, 16)
         rx2&(npoints2%) = rx&(z&) + mulscale&(t&, rx&(zz&) - rx&(z&), 16)
         ry2&(npoints2%) = ry&(z&) + mulscale&(t&, ry&(zz&) - ry&(z&), 16)
         rz2&(npoints2%) = rz&(z&) + mulscale&(t&, rz&(zz&) - rz&(z&), 16)
         npoints2% = npoints2% + 1
      END IF
   NEXT z&
   IF npoints2% <= 2 THEN clippoly% = 0: EXIT FUNCTION
    
      'Clip edge 2
   npoints% = 0
   zzsgn& = rx2&(0) - rz2&(0)
   FOR z& = 0 TO npoints2% - 1
      zz& = z& + 1: IF zz& = npoints2% THEN zz& = 0
      zsgn& = zzsgn&: zzsgn& = rx2&(zz&) - rz2&(zz&)
      IF zsgn& <= 0 THEN
         rx&(npoints%) = rx2&(z&)
         ry&(npoints%) = ry2&(z&)
         rz&(npoints%) = rz2&(z&)
         npoints% = npoints% + 1
      END IF
      IF (zsgn& XOR zzsgn&) < 0 THEN
         t& = divscale&(zsgn&, zsgn& - zzsgn&, 16)
         rx&(npoints%) = rx2&(z&) + mulscale&(t&, rx2&(zz&) - rx2&(z&), 16)
         ry&(npoints%) = ry2&(z&) + mulscale&(t&, ry2&(zz&) - ry2&(z&), 16)
         rz&(npoints%) = rz2&(z&) + mulscale&(t&, rz2&(zz&) - rz2&(z&), 16)
         npoints% = npoints% + 1
      END IF
   NEXT z&
   IF npoints% <= 2 THEN clippoly% = 0: EXIT FUNCTION
    
      'Clip edge 3
   npoints2% = 0
   zzsgn& = ry&(0) * 160 + rz&(0) * 100
   FOR z& = 0 TO npoints% - 1
      zz& = z& + 1: IF zz& = npoints% THEN zz& = 0
      zsgn& = zzsgn&: zzsgn& = ry&(zz&) * 160 + rz&(zz&) * 100
      IF zsgn& >= 0 THEN
         rx2&(npoints2%) = rx&(z&)
         ry2&(npoints2%) = ry&(z&)
         rz2&(npoints2%) = rz&(z&)
         npoints2% = npoints2% + 1
      END IF
      IF (zsgn& XOR zzsgn&) < 0 THEN
         t& = divscale&(zsgn&, zsgn& - zzsgn&, 16)
         rx2&(npoints2%) = rx&(z&) + mulscale&(t&, rx&(zz&) - rx&(z&), 16)
         ry2&(npoints2%) = ry&(z&) + mulscale&(t&, ry&(zz&) - ry&(z&), 16)
         rz2&(npoints2%) = rz&(z&) + mulscale&(t&, rz&(zz&) - rz&(z&), 16)
         npoints2% = npoints2% + 1
      END IF
   NEXT z&
   IF npoints2% <= 2 THEN clippoly% = 0: EXIT FUNCTION

      'Clip edge 4
   npoints% = 0
   zzsgn& = ry2&(0) * 160 - rz2&(0) * 100
   FOR z& = 0 TO npoints2% - 1
      zz& = z& + 1: IF zz& = npoints2% THEN zz& = 0
      zsgn& = zzsgn&: zzsgn& = ry2&(zz&) * 160 - rz2&(zz&) * 100
      IF zsgn& <= 0 THEN
         rx&(npoints%) = rx2&(z&)
         ry&(npoints%) = ry2&(z&)
         rz&(npoints%) = rz2&(z&)
         npoints% = npoints% + 1
      END IF
      IF (zsgn& XOR zzsgn&) < 0 THEN
         t& = divscale&(zsgn&, zsgn& - zzsgn&, 16)
         rx&(npoints%) = rx2&(z&) + mulscale&(t&, rx2&(zz&) - rx2&(z&), 16)
         ry&(npoints%) = ry2&(z&) + mulscale&(t&, ry2&(zz&) - ry2&(z&), 16)
         rz&(npoints%) = rz2&(z&) + mulscale&(t&, rz2&(zz&) - rz2&(z&), 16)
         npoints% = npoints% + 1
      END IF
   NEXT z&
   IF npoints% <= 2 THEN clippoly% = 0: EXIT FUNCTION

   clippoly% = npoints%
END FUNCTION

SUB dhline (x&, y&)
   x1& = last1&(y& + XDIM): x2& = x&
   IF x2& < x1& THEN SOUND 30000, .03: EXIT SUB
   last1&(y& + XDIM) = &H7FFFFFFF
 
   scrx& = x1& - 160
   scry& = (y& - 100) * 65536 + x1& * globm&

   d& = getd& + scrx& * getdxinc& + mulscale&(scry&, getdyinc&, 16)
   IF d& >= -512 THEN EXIT SUB
   r& = divscale&(65536, d&, 24)
       
   t& = mulscale&(gett&, r&, 30)
   u& = mulscale&(getu& + scrx& * getuxinc& + mulscale&(scry&, getuyinc&, 16), r&, 40 - (24 + 6))
   v& = mulscale&(getv& + scrx& * getvxinc& + mulscale&(scry&, getvyinc&, 16), r&, 40 - (24 + 6))
   IF x2& > x1& THEN
      'globuinc& = getuxinc& + mulscale&(getuyinc&, globm&, 16)
      'globvinc&= getvxinc& + mulscale&(getvyinc&, globm&, 16)
      uu& = mulscale&(globuinc&, r&, 40 - (24 + 6))
      vv& = mulscale&(globvinc&, r&, 40 - (24 + 6))
    
      'u1& = mulscale&(getuxinc&, r&, 40 - (24 + 6))
      'v1& = mulscale&(getvxinc&, r&, 40 - (24 + 6))
      'u2& = mulscale&(getuyinc&, r&, 40 - (24 + 6))
      'v2& = mulscale&(getvyinc&, r&, 40 - (24 + 6))
      'IF globm& > 0 THEN
      '   u2& = u1& + u2&: v2& = v1& + v2&
      'ELSE
      '   u2& = u1& - u2&: v2& = v1& - v2&
      'END IF
   END IF

   DEF SEG = &HA000
   p& = (hplc%(x1&) + y&) * 320 + x1&
   FOR dax& = x1& TO x2&
      IF PEEK(p&) = 0 THEN
         dat% = ((u& \ 16777216) * 64 + (v& \ 16777216)) AND 4095
         POKE p&, pic%(dat% + globalpicoffs&) + (102 - t&) + globalshade&
         pixelcount& = pixelcount& - 1
      END IF

      u& = u& + uu&: v& = v& + vv&: p& = p& + hinc%(dax&)
      'IF hinc%(dax&) = 1 THEN
      '   u& = u& + u1&: v& = v& + v1&: p& = p& + 1
      'ELSE
      '   u& = u& + u2&: v& = v& + v2&: p& = p& + hinc%(dax&)
      'END IF
   NEXT dax&
END SUB

FUNCTION divscale& (eax&, ebx&, ecx&)
   'divscale
   '66 b8 01 00 00 00                    mov     eax,00000001H
   '66 bb 02 00 00 00                    mov     ebx,00000002H
   '66 b9 03 00 00 00                    mov     ecx,00000003H
   '66 99                                cdq
   '66 0f a5 c2                          shld    edx,eax,cl
   '66 d3 e0                             shl     eax,cl
   '66 f7 fb                             idiv    ebx

   '26 a3 00 00 00 00                   mov es:[00000000H], ax
   '66 c1 e8 10                         shr eax, 10H
   '26 a3 00 00 00 00                   mov es:[00000000H], ax

   deax$ = MKL$(eax&): debx$ = MKL$(ebx&): decx$ = MKL$(ecx&)
   segment& = VARSEG(divscale&): offset& = VARPTR(divscale&)

   DIM asmprog%(27)
   DEF SEG = VARSEG(asmprog%(0)): p& = VARPTR(asmprog%(0))
   POKE p& + 0, &H55                                          'push bp
   POKE p& + 1, &H8B: POKE p& + 2, &HEC                       'mov bp, sp
   POKE p& + 3, &HB8: POKE p& + 4, (segment& AND 255): POKE p& + 5, (segment& \ 256) AND 255
   POKE p& + 6, &H8E: POKE p& + 7, &HC0                       'mov es, ax
   POKE p& + 8, &H66: POKE p& + 9, &HB8: POKE p& + 10, ASC(MID$(deax$, 1, 1)): POKE p& + 11, ASC(MID$(deax$, 2, 1)): POKE p& + 12, ASC(MID$(deax$, 3, 1)): POKE p& + 13, ASC(MID$(deax$, 4, 1))
   POKE p& + 14, &H66: POKE p& + 15, &HBB: POKE p& + 16, ASC(MID$(debx$, 1, 1)): POKE p& + 17, ASC(MID$(debx$, 2, 1)): POKE p& + 18, ASC(MID$(debx$, 3, 1)): POKE p& + 19, ASC(MID$(debx$, 4, 1))
   POKE p& + 20, &H66: POKE p& + 21, &HB9: POKE p& + 22, ASC(MID$(decx$, 1, 1)): POKE p& + 23, ASC(MID$(decx$, 2, 1)): POKE p& + 24, ASC(MID$(decx$, 3, 1)): POKE p& + 25, ASC(MID$(decx$, 4, 1))
   POKE p& + 26, &H66: POKE p& + 27, &H99
   POKE p& + 28, &H66: POKE p& + 29, &HF: POKE p& + 30, &HA5: POKE p& + 31, &HC2
   POKE p& + 32, &H66: POKE p& + 33, &HD3: POKE p& + 34, &HE0
   POKE p& + 35, &H66: POKE p& + 36, &HF7: POKE p& + 37, &HFB
   POKE p& + 38, &H26: POKE p& + 39, &HA3: POKE p& + 40, offset& AND 255: POKE p& + 41, (offset& \ 256) AND 255
   POKE p& + 42, &H66: POKE p& + 43, &HC1: POKE p& + 44, &HE8: POKE p& + 45, &H10
   POKE p& + 46, &H26: POKE p& + 47, &HA3: POKE p& + 48, (offset& + 2) AND 255: POKE p& + 49, ((offset& + 2) \ 256) AND 255
   POKE p& + 50, &H5D                                         'pop bp
   POKE p& + 51, &HCA: POKE p& + 52, &H2: POKE p& + 53, &H0   'ret 2
   CALL ABSOLUTE(0, p&)
   DEF SEG
   ERASE asmprog%
END FUNCTION

SUB drawcube (x&, y&, z&)
   cx& = x& * 1024 + 512
   cy& = y& * 1024 + 512
   cz& = z& * 1024 + 512

   globalpicoffs& = (board%(x&, y&, z&) - 1) * 4096

   FOR zzx% = 0 TO 2
      zz% = zzx%
      IF zz% = 0 AND posx& > cx& THEN zz% = zz% + 3
      IF zz% = 1 AND posy& > cy& THEN zz% = zz% + 3
      IF zz% = 2 AND posz& > cz& THEN zz% = zz% + 3
     
      good% = 1
      IF zz% = 0 AND x& > 0 THEN
         IF board%(x& - 1, y&, z&) <> 0 THEN good% = 0
      END IF
      IF zz% = 1 AND y& > 0 THEN
         IF board%(x&, y& - 1, z&) <> 0 THEN good% = 0
      END IF
      IF zz% = 2 AND z& > 0 THEN
         IF board%(x&, y&, z& - 1) <> 0 THEN good% = 0
      END IF
      IF zz% = 3 AND x& < BSIZ - 1 THEN
         IF board%(x& + 1, y&, z&) <> 0 THEN good% = 0
      END IF
      IF zz% = 4 AND y& < BSIZ - 1 THEN
         IF board%(x&, y& + 1, z&) <> 0 THEN good% = 0
      END IF
      IF zz% = 5 AND z& < BSIZ - 1 THEN
         IF board%(x&, y&, z& + 1) <> 0 THEN good% = 0
      END IF
                
      IF good% = 1 THEN
         FOR z% = 0 TO 3
            rx&(z%) = cx& + ofx&(zz%, z%) - posx&
            ry&(z%) = cy& + ofy&(zz%, z%) - posy&
            rz&(z%) = cz& + ofz&(zz%, z%) - posz&
            CALL rotate3d(rx&(z%), ry&(z%), rz&(z%))
         NEXT z%
         CALL setupgetreadpos(rx&(), ry&())
         npoints% = 4: npoints% = clippoly%
         IF npoints% >= 3 THEN
            FOR z% = 0 TO npoints% - 1
               sx&(z%) = divscale&(rx&(z%) * 160& * zoom&, rz&(z%), 8) + 160& * 65536
               sy&(z%) = divscale&(ry&(z%) * 160& * zoom&, rz&(z%), 8) + 100& * 65536
            NEXT z%
            globalshade& = (zzx% - 1) * 32 + 128 - 32
            CALL polydiagfill(sx&(), sy&(), npoints%)
         END IF
      END IF
   NEXT zzx%
END SUB

SUB dvline (x&, y&)
   y1& = last1&(x& + XDIM): y2& = y&
   IF y2& < y1& THEN SOUND 30000, .03: EXIT SUB
   last1&(x& + XDIM) = &H7FFFFFFF

   scrx& = (x& - 160) * 65536 + y1& * globm&
   scry& = y1& - 100
 
   d& = getd& + mulscale&(scrx&, getdxinc&, 16) + scry& * getdyinc&: IF d& >= -128 THEN EXIT SUB
   r& = divscale&(65536, d&, 24)

   t& = mulscale&(gett&, r&, 30)
   u& = mulscale&(getu& + mulscale&(scrx&, getuxinc&, 16) + scry& * getuyinc&, r&, 40 - (24 + 6))
   v& = mulscale&(getv& + mulscale&(scrx&, getvxinc&, 16) + scry& * getvyinc&, r&, 40 - (24 + 6))
   IF y2& > y1& THEN
      uu& = mulscale&(globuinc&, r&, 40 - (24 + 6))
      vv& = mulscale&(globvinc&, r&, 40 - (24 + 6))
   END IF

   DEF SEG = &HA000
   p& = y1& * 320 + (hplc%(y1&) + x&)

   FOR day& = y1& TO y2&
      IF PEEK(p&) = 0 THEN
         dat% = ((u& \ 16777216) * 64 + (v& \ 16777216)) AND 4095
         POKE p&, pic%(dat% + globalpicoffs&) + (102 - t&) + globalshade&
         pixelcount& = pixelcount& - 1
      END IF
      u& = u& + uu&: v& = v& + vv&: p& = p& + hinc%(day&)
   NEXT day&
END SUB

SUB initboard
   FOR z% = 0 TO BSIZ - 1
      FOR zz% = 0 TO BSIZ - 1
         FOR zzz% = 0 TO BSIZ - 1
            IF INT(4 * RND) = 0 THEN
               board%(z%, zz%, zzz%) = 2
            END IF
         NEXT zzz%
      NEXT zz%
   NEXT z%
   FOR z% = 0 TO BSIZ - 1
      FOR zz% = 0 TO BSIZ - 1
         board%(z%, zz%, 0) = 1
         board%(z%, zz%, BSIZ - 1) = 1
         board%(z%, 0, zz%) = 1
         board%(z%, BSIZ - 1, zz%) = 1
         board%(0, z%, zz%) = 1
         board%(BSIZ - 1, z%, zz%) = 1
      NEXT zz%
   NEXT z%
        
   DO
      posx& = INT((BSIZ - 2) * RND) * 1024 + 1536
      posy& = INT((BSIZ - 2) * RND) * 1024 + 1536
      posz& = INT((BSIZ - 2) * RND) * 1024 + 1536
   LOOP WHILE board%(posx& \ 1024, posy& \ 1024, posz& \ 1024) <> 0
   a1% = INT(2048 * RND): a2% = INT(2048 * RND): a3% = INT(2048 * RND)
  
   ofx&(0, 0) = -512: ofy&(0, 0) = -512: ofz&(0, 0) = -512  'posx < x
   ofx&(0, 1) = -512: ofy&(0, 1) = 512: ofz&(0, 1) = -512
   ofx&(0, 2) = -512: ofy&(0, 2) = 512: ofz&(0, 2) = 512
   ofx&(0, 3) = -512: ofy&(0, 3) = -512: ofz&(0, 3) = 512
   ofx&(1, 0) = -512: ofy&(1, 0) = -512: ofz&(1, 0) = -512   'posy < y
   ofx&(1, 1) = -512: ofy&(1, 1) = -512: ofz&(1, 1) = 512
   ofx&(1, 2) = 512: ofy&(1, 2) = -512: ofz&(1, 2) = 512
   ofx&(1, 3) = 512: ofy&(1, 3) = -512: ofz&(1, 3) = -512
   ofx&(2, 0) = -512: ofy&(2, 0) = -512: ofz&(2, 0) = -512   'posz < z
   ofx&(2, 1) = 512: ofy&(2, 1) = -512: ofz&(2, 1) = -512
   ofx&(2, 2) = 512: ofy&(2, 2) = 512: ofz&(2, 2) = -512
   ofx&(2, 3) = -512: ofy&(2, 3) = 512: ofz&(2, 3) = -512
  
   ofx&(3, 0) = 512: ofy&(3, 0) = -512: ofz&(3, 0) = -512    'posx > x
   ofx&(3, 1) = 512: ofy&(3, 1) = -512: ofz&(3, 1) = 512
   ofx&(3, 2) = 512: ofy&(3, 2) = 512: ofz&(3, 2) = 512
   ofx&(3, 3) = 512: ofy&(3, 3) = 512: ofz&(3, 3) = -512
   ofx&(4, 0) = -512: ofy&(4, 0) = 512: ofz&(4, 0) = -512    'posy > y
   ofx&(4, 1) = 512: ofy&(4, 1) = 512: ofz&(4, 1) = -512
   ofx&(4, 2) = 512: ofy&(4, 2) = 512: ofz&(4, 2) = 512
   ofx&(4, 3) = -512: ofy&(4, 3) = 512: ofz&(4, 3) = 512
   ofx&(5, 0) = -512: ofy&(5, 0) = -512: ofz&(5, 0) = 512    'posz > z
   ofx&(5, 1) = -512: ofy&(5, 1) = 512: ofz&(5, 1) = 512
   ofx&(5, 2) = 512: ofy&(5, 2) = 512: ofz&(5, 2) = 512
   ofx&(5, 3) = 512: ofy&(5, 3) = -512: ofz&(5, 3) = 512

   FOR z% = 0 TO 63
      FOR zz% = 0 TO 63
         zx% = z% * 64 + zz%
         pic%(zx%) = (z% OR zz%) \ 2
         pic%(zx% + 4096) = ((z% AND 7) XOR (zz% AND 7)) * 4
      NEXT zz%
   NEXT z%

END SUB

FUNCTION mulscale& (eax&, ebx&, ecx&)
   'mulscale
   '66 b8 01 00 00 00                    mov     eax,00000001H
   '66 bb 02 00 00 00                    mov     ebx,00000002H
   '66 b9 03 00 00 00                    mov     ecx,00000003H
   '66 f7 eb                             imul    ebx
   '66 0f ad d0                          shrd    eax,edx,cl

   '26 a3 00 00 00 00                   mov es:[00000000H], ax
   '66 c1 e8 10                         shr eax, 10H
   '26 a3 00 00 00 00                   mov es:[00000000H], ax

   deax$ = MKL$(eax&): debx$ = MKL$(ebx&): decx$ = MKL$(ecx&)
   segment& = VARSEG(mulscale&): offset& = VARPTR(mulscale&)

   DIM asmprog%(25)
   DEF SEG = VARSEG(asmprog%(0)): p& = VARPTR(asmprog%(0))
   POKE p& + 0, &H55                                          'push bp
   POKE p& + 1, &H8B: POKE p& + 2, &HEC                       'mov bp, sp
   POKE p& + 3, &HB8: POKE p& + 4, (segment& AND 255): POKE p& + 5, (segment& \ 256) AND 255
   POKE p& + 6, &H8E: POKE p& + 7, &HC0                       'mov es, ax
   POKE p& + 8, &H66: POKE p& + 9, &HB8: POKE p& + 10, ASC(MID$(deax$, 1, 1)): POKE p& + 11, ASC(MID$(deax$, 2, 1)): POKE p& + 12, ASC(MID$(deax$, 3, 1)): POKE p& + 13, ASC(MID$(deax$, 4, 1))
   POKE p& + 14, &H66: POKE p& + 15, &HBB: POKE p& + 16, ASC(MID$(debx$, 1, 1)): POKE p& + 17, ASC(MID$(debx$, 2, 1)): POKE p& + 18, ASC(MID$(debx$, 3, 1)): POKE p& + 19, ASC(MID$(debx$, 4, 1))
   POKE p& + 20, &H66: POKE p& + 21, &HB9: POKE p& + 22, ASC(MID$(decx$, 1, 1)): POKE p& + 23, ASC(MID$(decx$, 2, 1)): POKE p& + 24, ASC(MID$(decx$, 3, 1)): POKE p& + 25, ASC(MID$(decx$, 4, 1))
   POKE p& + 26, &H66: POKE p& + 27, &HF7: POKE p& + 28, &HEB
   POKE p& + 29, &H66: POKE p& + 30, &HF: POKE p& + 31, &HAD: POKE p& + 32, &HD0
   POKE p& + 33, &H26: POKE p& + 34, &HA3: POKE p& + 35, offset& AND 255: POKE p& + 36, (offset& \ 256) AND 255
   POKE p& + 37, &H66: POKE p& + 38, &HC1: POKE p& + 39, &HE8: POKE p& + 40, &H10
   POKE p& + 41, &H26: POKE p& + 42, &HA3: POKE p& + 43, (offset& + 2) AND 255: POKE p& + 44, ((offset& + 2) \ 256) AND 255
   POKE p& + 45, &H5D                                         'pop bp
   POKE p& + 46, &HCA: POKE p& + 47, &H2: POKE p& + 48, &H0   'ret 2
   CALL ABSOLUTE(0, p&)
   DEF SEG
   ERASE asmprog%
END FUNCTION

SUB polydiagfill (sx&(), sy&(), npoints%)
   IF ABS(getdxinc&) <= ABS(getdyinc&) THEN
      IF getdyinc& = 0 THEN
         globm& = 0
      ELSE
         globm& = -divscale&(getdxinc&, getdyinc&, 16)
      END IF

      globuinc& = getuxinc& + mulscale&(getuyinc&, globm&, 16)
      globvinc& = getvxinc& + mulscale&(getvyinc&, globm&, 16)
 
      xmin& = &H7FFFFFFF: xmax& = &H80000000
      FOR z% = 0 TO npoints% - 1
         IF sx&(z%) < xmin& THEN xmin& = sx&(z%): lpoint% = z%
         IF sx&(z%) > xmax& THEN xmax& = sx&(z%): rpoint% = z%
      NEXT z%
      lx& = (xmin& + 65535) \ 65536: IF lx& < 0 THEN lx& = 0
      rx& = (xmax& + 65535) \ 65536: IF rx& > XDIM THEN rx& = XDIM
    
      m& = lx& * globm&
      FOR x& = lx& TO rx& - 1
         hplc%(x&) = m& \ 65536: m& = m& + globm&
      NEXT x&
      FOR x& = lx& TO rx& - 2
         IF hplc%(x&) = hplc%(x& + 1) THEN
            hinc%(x&) = 1
         ELSE
            IF globm& > 0 THEN hinc%(x&) = 321 ELSE hinc%(x&) = -319
         END IF
      NEXT x&
 
      z% = lpoint%
      DO
         zz% = z% + 1: IF zz% = npoints% THEN zz% = 0
              
         x1& = sx&(z%): dax1& = (x1& + 65535) \ 65536
         x2& = sx&(zz%): dax2& = (x2& + 65535) \ 65536
         IF dax2& > dax1& THEN
            y1& = sy&(z%): y2& = sy&(zz%)
            yinc& = divscale&(y2& - y1&, x2& - x1&, 16)
            yplc& = y1& + 65535 + mulscale&((-x1&) AND 65535, yinc&, 16)
            IF dax1& < 0 THEN xplc& = xplc& - xinc& * dax1&: dax1& = 0
            IF dax2& > XDIM THEN day2& = XDIM
            FOR x& = dax1& TO dax2& - 1
               umost&(x&) = yplc& \ 65536: yplc& = yplc& + yinc&
               IF umost&(x&) < 0 THEN umost&(x&) = 0
            NEXT x&
         END IF
   
         z% = zz%
      LOOP WHILE z% <> rpoint%
    
      DO
         zz% = z% + 1: IF zz% = npoints% THEN zz% = 0
        
         x1& = sx&(z%): dax1& = (x1& + 65535) \ 65536
         x2& = sx&(zz%): dax2& = (x2& + 65535) \ 65536
         IF dax2& < dax1& THEN
            y1& = sy&(z%): y2& = sy&(zz%)
            yinc& = divscale&(y2& - y1&, x2& - x1&, 16)
            yplc& = y2& - 1 + mulscale&((-x2&) AND 65535, yinc&, 16)
            IF dax2& < 0 THEN xplc& = xplc& - xinc& * dax2&: dax2& = 0
            IF dax1& > XDIM THEN day1& = XDIM
            FOR x& = dax2& TO dax1& - 1
               dmost&(x&) = yplc& \ 65536: yplc& = yplc& + yinc&
               IF dmost&(x&) >= YDIM THEN dmost&(x&) = YDIM - 1
            NEXT x&
         END IF
  
         z% = zz%
      LOOP WHILE z% <> lpoint%
    
      um& = umost&(lx&) - hplc%(lx&): dm& = um& - 1
      FOR x& = lx& TO rx& - 1
         y& = hplc%(x&): y1& = umost&(x&) - y&: y2& = dmost&(x&) - y&
         WHILE y1& < um&: um& = um& - 1: last1&(um& + XDIM) = x&: WEND
         WHILE y1& > um&: CALL dhline(x& - 1, um&): um& = um& + 1: WEND
         WHILE y2& > dm&: dm& = dm& + 1: last1&(dm& + XDIM) = x&: WEND
         WHILE y2& < dm&: CALL dhline(x& - 1, dm&): dm& = dm& - 1: WEND
      NEXT x&
      WHILE dm& >= um&: CALL dhline(x& - 1, um&): um& = um& + 1: WEND
   ELSE
      globm& = -divscale&(getdyinc&, getdxinc&, 16)
    
      globuinc& = getuyinc& + mulscale&(getuxinc&, globm&, 16)
      globvinc& = getvyinc& + mulscale&(getvxinc&, globm&, 16)

      ymin& = &H7FFFFFFF: ymax& = &H80000000
      FOR z% = 0 TO npoints% - 1
         IF sy&(z%) < ymin& THEN ymin& = sy&(z%): upoint% = z%
         IF sy&(z%) > ymax& THEN ymax& = sy&(z%): dpoint% = z%
      NEXT z%
      ux& = (ymin& + 65535) \ 65536: IF ux& < 0 THEN ux& = 0
      dx& = (ymax& + 65535) \ 65536: IF dx& > YDIM THEN dx& = YDIM
    
      m& = ux& * globm&
      FOR y& = ux& TO dx& - 1
         hplc%(y&) = m& \ 65536: m& = m& + globm&
      NEXT y&
      FOR y& = ux& TO dx& - 2
         IF hplc%(y&) = hplc%(y& + 1) THEN
            hinc%(y&) = 320
         ELSE
            IF globm& > 0 THEN hinc%(y&) = 321 ELSE hinc%(y&) = 319
         END IF
      NEXT y&

      z% = dpoint%
      DO
         zz% = z% + 1: IF zz% = npoints% THEN zz% = 0
             
         y1& = sy&(z%): day1& = (y1& + 65535) \ 65536
         y2& = sy&(zz%): day2& = (y2& + 65535) \ 65536
         IF day2& < day1& THEN
            x1& = sx&(z%): x2& = sx&(zz%)
            xinc& = divscale&(x2& - x1&, y2& - y1&, 16)
            xplc& = x2& + 65535 + mulscale&((-y2&) AND 65535, xinc&, 16)
            IF day2& < 0 THEN xplc& = xplc& - xinc& * day2&: day2& = 0
            IF day1& > YDIM THEN day1& = YDIM
            FOR y& = day2& TO day1& - 1
               umost&(y&) = xplc& \ 65536: xplc& = xplc& + xinc&
               IF umost&(y&) < 0 THEN umost&(y&) = 0
            NEXT y&
         END IF
  
         z% = zz%
      LOOP WHILE z% <> upoint%
   
      DO
         zz% = z% + 1: IF zz% = npoints% THEN zz% = 0
      
         y1& = sy&(z%): day1& = (y1& + 65535) \ 65536
         y2& = sy&(zz%): day2& = (y2& + 65535) \ 65536
         IF day2& > day1& THEN
            x1& = sx&(z%): x2& = sx&(zz%)
            xinc& = divscale&(x2& - x1&, y2& - y1&, 16)
            xplc& = x1& - 1 + mulscale&((-y1&) AND 65535, xinc&, 16)
            IF day1& < 0 THEN xplc& = xplc& - xinc& * day1&: day1& = 0
            IF day2& > YDIM THEN day2& = YDIM
            FOR y& = day1& TO day2& - 1
               dmost&(y&) = xplc& \ 65536: xplc& = xplc& + xinc&
               IF dmost&(y&) >= XDIM THEN dmost&(y&) = XDIM - 1
            NEXT y&
         END IF
 
         z% = zz%
      LOOP WHILE z% <> dpoint%
   
      lm& = umost&(ux&) - hplc%(ux&): rm& = lm& - 1
      FOR y& = ux& TO dx& - 1
         x& = hplc%(y&): x1& = umost&(y&) - x&: x2& = dmost&(y&) - x&
         WHILE x1& < lm&: lm& = lm& - 1: last1&(lm& + XDIM) = y&: WEND
         WHILE x1& > lm&: CALL dvline(lm&, y& - 1): lm& = lm& + 1: WEND
         WHILE x2& > rm&: rm& = rm& + 1: last1&(rm& + XDIM) = y&: WEND
         WHILE x2& < rm&: CALL dvline(rm&, y& - 1): rm& = rm& - 1: WEND
      NEXT y&
      WHILE rm& >= lm&: CALL dvline(lm&, y& - 1): lm& = lm& + 1: WEND
   END IF
END SUB

SUB rotate3d (nx&, ny&, nz&)
   x& = nx&: y& = ny&: z& = nz&
   nx& = mulscale&(x&, gxx&, 28) + mulscale&(y&, gyx&, 28) + mulscale&(z&, gzx&, 28)
   ny& = mulscale&(x&, gxy&, 28) + mulscale&(y&, gyy&, 28) + mulscale&(z&, gzy&, 28)
   nz& = mulscale&(x&, gxz&, 28) + mulscale&(y&, gyz&, 28) + mulscale&(z&, gzz&, 28)
END SUB

FUNCTION scale& (eax&, ebx&, ecx&)
   'scale
   '66 b8 01 00 00 00                    mov     eax,00000001H
   '66 bb 02 00 00 00                    mov     ebx,00000002H
   '66 b9 03 00 00 00                    mov     ecx,00000003H
   '66 f7 eb                             imul    ebx
   '66 f7 f9                             idiv    ecx

   '26 a3 00 00 00 00                   mov es:[00000000H], ax
   '66 c1 e8 10                         shr eax, 10H
   '26 a3 00 00 00 00                   mov es:[00000000H], ax

   deax$ = MKL$(eax&): debx$ = MKL$(ebx&): decx$ = MKL$(ecx&)
   segment& = VARSEG(scale&): offset& = VARPTR(scale&)

   DIM asmprog%(25)
   DEF SEG = VARSEG(asmprog%(0)): p& = VARPTR(asmprog%(0))
   POKE p& + 0, &H55                                          'push bp
   POKE p& + 1, &H8B: POKE p& + 2, &HEC                       'mov bp, sp
   POKE p& + 3, &HB8: POKE p& + 4, (segment& AND 255): POKE p& + 5, (segment& \ 256) AND 255
   POKE p& + 6, &H8E: POKE p& + 7, &HC0                       'mov es, ax
   POKE p& + 8, &H66: POKE p& + 9, &HB8: POKE p& + 10, ASC(MID$(deax$, 1, 1)): POKE p& + 11, ASC(MID$(deax$, 2, 1)): POKE p& + 12, ASC(MID$(deax$, 3, 1)): POKE p& + 13, ASC(MID$(deax$, 4, 1))
   POKE p& + 14, &H66: POKE p& + 15, &HBB: POKE p& + 16, ASC(MID$(debx$, 1, 1)): POKE p& + 17, ASC(MID$(debx$, 2, 1)): POKE p& + 18, ASC(MID$(debx$, 3, 1)): POKE p& + 19, ASC(MID$(debx$, 4, 1))
   POKE p& + 20, &H66: POKE p& + 21, &HB9: POKE p& + 22, ASC(MID$(decx$, 1, 1)): POKE p& + 23, ASC(MID$(decx$, 2, 1)): POKE p& + 24, ASC(MID$(decx$, 3, 1)): POKE p& + 25, ASC(MID$(decx$, 4, 1))
   POKE p& + 26, &H66: POKE p& + 27, &HF7: POKE p& + 28, &HEB
   POKE p& + 29, &H66: POKE p& + 30, &HF7: POKE p& + 31, &HF9
   POKE p& + 32, &H26: POKE p& + 33, &HA3: POKE p& + 34, offset& AND 255: POKE p& + 35, (offset& \ 256) AND 255
   POKE p& + 36, &H66: POKE p& + 37, &HC1: POKE p& + 38, &HE8: POKE p& + 39, &H10
   POKE p& + 40, &H26: POKE p& + 41, &HA3: POKE p& + 42, (offset& + 2) AND 255: POKE p& + 43, ((offset& + 2) \ 256) AND 255
   POKE p& + 44, &H5D                                         'pop bp
   POKE p& + 45, &HCA: POKE p& + 46, &H2: POKE p& + 47, &H0   'ret 2
   CALL ABSOLUTE(0, p&)
   DEF SEG
   ERASE asmprog%
END FUNCTION

SUB setupgetreadpos (rx&(), ry&())
   rx0& = rx&(0): rx1& = rx&(1) - rx&(0): rx2& = rx&(3) - rx&(0)
   ry0& = ry&(0): ry1& = ry&(1) - ry&(0): ry2& = ry&(3) - ry&(0)
   rz0& = rz&(0): rz1& = rz&(1) - rz&(0): rz2& = rz&(3) - rz&(0)
   getdxinc& = ry2& * rz1& - ry1& * rz2&
   getuxinc& = ry0& * rz2& - ry2& * rz0&
   getvxinc& = ry1& * rz0& - ry0& * rz1&
   getdyinc& = rx1& * rz2& - rx2& * rz1&
   getuyinc& = rx2& * rz0& - rx0& * rz2&
   getvyinc& = rx0& * rz1& - rx1& * rz0&
   getd& = mulscale&(rx2& * ry1& - rx1& * ry2&, 160 * zoom&, 8)
   getu& = mulscale&(rx0& * ry2& - rx2& * ry0&, 160 * zoom&, 8)
   getv& = mulscale&(rx1& * ry0& - rx0& * ry1&, 160 * zoom&, 8)
   gett& = mulscale&(rx0&, getdxinc&, 8) + mulscale&(rx1&, getuxinc&, 8) + mulscale&(rx2&, getvxinc&, 8)
END SUB

SUB setuprotate3d (a1%, a2%, a3%)
   cosa1& = 16384 * COS(a1% * 3.141592 / 1024)
   sina1& = 16384 * SIN(a1% * 3.141592 / 1024)
   cosa2& = 16384 * COS(a2% * 3.141592 / 1024)
   sina2& = 16384 * SIN(a2% * 3.141592 / 1024)
   cosa3& = 16384 * COS(a3% * 3.141592 / 1024)
   sina3& = 16384 * SIN(a3% * 3.141592 / 1024)
   c1c3& = cosa1& * cosa3&: c1s3& = cosa1& * sina3&
   s1c3& = sina1& * cosa3&: s1s3& = sina1& * sina3&
   gxx& = mulscale&(s1s3&, sina2&, 14) + c1c3&
   gxy& = -mulscale&(c1s3&, sina2&, 14) + s1c3&
   gxz& = cosa2& * sina3&
   gyx& = -sina1& * cosa2&
   gyy& = cosa1& * cosa2&
   gyz& = sina2& * 16384
   gzx& = mulscale&(s1c3&, sina2&, 14) - c1s3&
   gzy& = -mulscale&(c1c3&, sina2&, 14) - s1s3&
   gzz& = cosa2& * cosa3&
END SUB

