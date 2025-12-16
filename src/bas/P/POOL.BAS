DECLARE FUNCTION divscale& (eax&, ebx&, ecx&)
DECLARE FUNCTION scale& (eax&, ebx&, ecx&)
DECLARE FUNCTION mulscale& (eax&, ebx&, ecx&)
DECLARE SUB loadboard ()
DECLARE SUB drawboard ()
DECLARE SUB moveballs ()
DECLARE FUNCTION balltrace% (x1&, y1&, x2&, y2&, x3&, y3&, hitx&, hity&)
DECLARE SUB ballmove (ballnum%)

COMMON SHARED tablex1&, tabley1&, tablex2&, tabley2&, ballradius&
DIM SHARED ballx&(16), bally&(16), ballcol%(16), ballkind%(16)
DIM SHARED ballxvel&(16), ballyvel&(16)
DIM SHARED holex&(6), holey&(6)

DIM regs%(7)
regs%(0) = 0: CALL int86old(&H33, regs%(), regs%())
CALL loadboard
RANDOMIZE TIMER
                       
SCREEN 9: pag% = 0
SCREEN 9, , 1: LINE (0, 0)-(639, 349), 0, BF
SCREEN 9, , 0: LINE (0, 0)-(639, 349), 0, BF
ballxaim& = ballx&(0): ballyaim& = bally&(0)
DO
   CALL drawboard

   regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
  
   bad% = 0
   FOR z% = 0 TO 15
      IF (ballxvel&(z%) <> 0 OR ballyvel&(z%) <> 0) AND ballcol%(z%) >= 0 THEN
         bad% = 1
         ballxaim& = ballx&(0)
         ballyaim& = bally&(0)
         EXIT FOR
      END IF
   NEXT z%
   IF bad% = 0 THEN
      ballxaim& = ballxaim& + regs%(2) * 16&
      ballyaim& = ballyaim& + regs%(3) * 16&
      CIRCLE (ballxaim& \ 256, ballyaim& \ 256), 3, 0
      LINE (ballx&(0) \ 256, bally&(0) \ 256)-(ballxaim& \ 256, ballyaim& \ 256), 2
      regs%(0) = 5: CALL int86old(&H33, regs%(), regs%())
      IF (regs%(0) AND 1) <> 0 THEN
         ballxvel&(0) = ballxvel&(0) + (ballxaim& - ballx&(0)) \ 8
         ballyvel&(0) = ballyvel&(0) + (ballyaim& - bally&(0)) \ 8
         ballxaim& = ballx&(0)
         ballyaim& = bally&(0)
      END IF
      IF (regs%(0) AND 6) <> 0 THEN END
   END IF
  
   z$ = INKEY$
   IF z$ = CHR$(0) + CHR$(75) THEN ballxvel&(0) = ballxvel&(0) - 1024
   IF z$ = CHR$(0) + CHR$(77) THEN ballxvel&(0) = ballxvel&(0) + 1024
   IF z$ = CHR$(0) + CHR$(72) THEN ballyvel&(0) = ballyvel&(0) - 1024
   IF z$ = CHR$(0) + CHR$(80) THEN ballyvel&(0) = ballyvel&(0) + 1024
  
   CALL moveballs
  
   SCREEN 9, , pag%, 1 - pag%: pag% = 1 - pag%
   WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
LOOP

SUB ballmove (ballnum%)
  
   x1& = ballx&(ballnum%)
   y1& = bally&(ballnum%)
   x2& = x1& + ballxvel&(ballnum%)
   y2& = y1& + ballyvel&(ballnum%)
   IF x1& = x2& AND y1& = y2& THEN EXIT SUB

   otherballnum% = -1
   closxhit& = x2&: closyhit& = y2&
   FOR z% = 0 TO 15
      IF z% <> ballnum% AND ballcol%(z%) >= 0 THEN
         IF balltrace%(x1&, y1&, x2&, y2&, ballx&(z%), bally&(z%), hitx&, hity&) = 1 THEN
            IF ABS(hitx& - x1&) + ABS(hity& - y1&) < ABS(closxhit& - x1&) + ABS(closyhit& - y1&) THEN
               otherballnum% = z%
               closxhit& = xhit&
               closyhit& = yhit&
            END IF
         END IF
      END IF
   NEXT z%
     
   IF otherballnum% >= 0 THEN
      xvect& = ABS(ballxvel&(ballnum%)) + ABS(ballxvel&(otherballnum%))
      yvect& = ABS(ballyvel&(ballnum%)) + ABS(ballyvel&(otherballnum%))
      bxvect& = ballx&(otherballnum%) - hitx&
      byvect& = bally&(otherballnum%) - hity&
      dist& = (ABS(xvect& * bxvect&) + ABS(yvect& * byvect&)) \ (ABS(bxvect&) + ABS(byvect&))
      hitxvect& = scale&(dist&, bxvect&, ballradius& * 2)
      hityvect& = scale&(dist&, byvect&, ballradius& * 2)

      ballxvel&(otherballnum%) = ballxvel&(otherballnum%) + hitxvect&
      ballyvel&(otherballnum%) = ballyvel&(otherballnum%) + hityvect&
      ballxvel&(ballnum%) = ballxvel&(ballnum%) - hitxvect&
      ballyvel&(ballnum%) = ballyvel&(ballnum%) - hityvect&
     
      ballx&(ballnum%) = hitx&
      bally&(ballnum%) = hity&
   ELSE
      ballx&(ballnum%) = x2&
      bally&(ballnum%) = y2&
   END IF

END SUB

FUNCTION balltrace% (x1&, y1&, x2&, y2&, x3&, y3&, hitx&, hity&)
   IF (x2& - x1&) * (x3& - x1&) + (y2& - y1&) * (y3& - y1&) < 0 THEN balltrace% = 0: EXIT FUNCTION
   IF ABS(x3& - ((x1& + x2&) \ 2)) > ABS(x2& - x1&) \ 2 + ballradius& * 2 + 8 THEN
      balltrace% = 0: EXIT FUNCTION
   END IF
   IF ABS(y3& - ((y1& + y2&) \ 2)) > ABS(y2& - y1&) \ 2 + ballradius& * 2 + 8 THEN
      balltrace% = 0: EXIT FUNCTION
   END IF
  
   a& = (x2& - x1&) * (x2& - x1&) + (y2& - y1&) * (y2& - y1&)
   b& = ((x1& - x3&) * (x2& - x1&) + (y1& - y3&) * (y2& - y1&)) * 2
   c& = ((x1& - x3&) * (x1& - x3&) + (y1& - y3&) * (y1& - y3&) - (ballradius& * ballradius& * 4))
   sqrins& = mulscale&(b&, b&, 24) - mulscale&(a&, c&, 22)
   IF sqrins& >= 0 AND a& <> 0 THEN
      sqrmess& = (-b& - SQR(sqrins&) * 4096&)
      hitx& = x1& + scale&(sqrmess&, (x2& - x1&), a& * 2)
      hity& = y1& + scale&(sqrmess&, (y2& - y1&), a& * 2)
      balltrace% = 1
   ELSE
      balltrace% = 0
   END IF
END FUNCTION

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

SUB drawboard
   LINE (tablex1& \ 256 - 12, tabley1& \ 256 - 12)-(tablex1& \ 256 - 1, tabley2& \ 256 + 12), 6, BF
   LINE (tablex2& \ 256 + 1, tabley1& \ 256 - 12)-(tablex2& \ 256 + 12, tabley2& \ 256 + 12), 6, BF
   LINE (tablex1& \ 256 - 12, tabley1& \ 256 - 1)-(tablex2& \ 256 + 12, tabley1& \ 256 - 12), 6, BF
   LINE (tablex1& \ 256 - 12, tabley2& \ 256 + 1)-(tablex2& \ 256 + 12, tabley2& \ 256 + 12), 6, BF
                                               
   LINE (tablex1& \ 256, tabley1& \ 256)-(tablex2& \ 256, tabley2& \ 256), 10, BF

   FOR z% = 0 TO 5
      x& = holex&(z%) \ 256: y& = holey&(z%) \ 256
      FOR zz% = y& - 8 TO y& + 8
         circwidth& = SQR(70 - (zz% - y&) * (zz% - y&)) * 4 / 3
         LINE (x& - circwidth&, zz%)-(x& + circwidth&, zz%), 8
      NEXT zz%
   NEXT z%
  
   FOR z% = 0 TO 15
      IF ballcol%(z%) >= 0 THEN
         CIRCLE (ballx&(z%) \ 256, bally&(z%) \ 256), 9, 2
         PAINT (ballx&(z%) \ 256, bally&(z%) \ 256), ballcol%(z%), 2
         IF ballkind%(z%) = 1 THEN
            LINE (ballx&(z%) \ 256 - 8, bally&(z%) \ 256 - 1)-(ballx&(z%) \ 256 + 8, bally&(z%) \ 256 + 1), ballcol%(z%) XOR 8, BF
         END IF
      END IF
   NEXT z%
  
END SUB

SUB loadboard
   tablex1& = 100 * 256&: tabley1& = 80 * 256&
   tablex2& = 540 * 256&: tabley2& = 260 * 256&
   ballradius& = 8 * 256&

   cnt% = 0
   FOR z& = tablex1& TO tablex2& STEP (tablex2& - tablex1&) \ 2
      FOR zz& = tabley1& + 4 * 256& TO tabley2& - 4 * 256& STEP (tabley2& - tabley1& - 8 * 256&)
         holex&(cnt%) = z&
         holey&(cnt%) = zz&
         IF z& = tablex1& THEN holex&(cnt%) = holex&(cnt%) + 8 * 256&
         IF z& = tablex2& THEN holex&(cnt%) = holex&(cnt%) - 8 * 256&
         cnt% = cnt% + 1
      NEXT zz&
   NEXT z&
                   
   triangx1& = 430 * 256&: triangx2& = 500 * 256&

   ballx&(0) = (triangx2& - triangx1&) + tablex1&
   bally&(0) = (tabley1& + tabley2&) \ 2
  
   cnt% = 1
   FOR z& = 0 TO 4
      x& = z& * ((triangx2& - triangx1&) \ 4) + triangx1&
      FOR zz& = 0 TO z&
         y& = zz& * ((triangx2& - triangx1&) \ 4)
         y& = y& - (z& * (triangx2& - triangx1&) \ 8)
         y& = y& + (tabley1& + tabley2&) \ 2
         ballx&(cnt%) = x&
         bally&(cnt%) = y&
         ballxvel&(cnt%) = 0
         ballyvel&(cnt%) = 0
         cnt% = cnt% + 1
      NEXT zz&
   NEXT z&

   ballcol%(0) = 15: ballcol%(1) = 11: ballcol%(2) = 2: ballcol%(3) = 9
   ballcol%(4) = 12: ballcol%(5) = 0: ballcol%(6) = 13: ballcol%(7) = 6
   ballcol%(8) = 14: ballcol%(9) = 11: ballcol%(10) = 2: ballcol%(11) = 12
   ballcol%(12) = 9: ballcol%(13) = 13: ballcol%(14) = 6: ballcol%(15) = 14
  
   ballkind%(0) = 0: ballkind%(1) = 1: ballkind%(2) = 2: ballkind%(3) = 2
   ballkind%(4) = 1: ballkind%(5) = 0: ballkind%(6) = 1: ballkind%(7) = 2
   ballkind%(8) = 1: ballkind%(9) = 2: ballkind%(10) = 1: ballkind%(11) = 2
   ballkind%(12) = 1: ballkind%(13) = 2: ballkind%(14) = 1: ballkind%(15) = 2

END SUB

SUB moveballs
   FOR z% = 0 TO 15
      IF ballcol%(z%) >= 0 THEN
         CALL ballmove(z%)
     
         IF ballx&(z%) > (tablex2& - ballradius&) THEN
            ballx&(z%) = (tablex2& - ballradius&) + (tablex2& - ballradius&) - ballx&(z%)
            ballxvel&(z%) = -ABS(ballxvel&(z%))
         END IF
         IF ballx&(z%) < (tablex1& + ballradius&) THEN
            ballx&(z%) = (tablex1& + ballradius&) + (tablex1& + ballradius&) - ballx&(z%)
            ballxvel&(z%) = ABS(ballxvel&(z%))
         END IF
         IF bally&(z%) > (tabley2& - ballradius&) THEN
            bally&(z%) = (tabley2& - ballradius&) + (tabley2& - ballradius&) - bally&(z%)
            ballyvel&(z%) = -ABS(ballyvel&(z%))
         END IF
         IF bally&(z%) < (tabley1& + ballradius&) THEN
            bally&(z%) = (tabley1& + ballradius&) + (tabley1& + ballradius&) - bally&(z%)
            ballyvel&(z%) = ABS(ballyvel&(z%))
         END IF

         FOR zz% = 0 TO 5
            IF ABS(ballx&(z%) - holex&(zz%)) < 3072& AND ABS(bally&(z%) - holey&(zz%)) < 3072& THEN
               dist& = (ballx&(z%) - holex&(zz%)) * (ballx&(z%) - holex&(zz%)) + (bally&(z%) - holey&(zz%)) * (bally&(z%) - holey&(zz%))
               IF dist& < 3072& * 3072& THEN
                  IF z% = 0 THEN
                     SOUND 37, .03
                  ELSE
                     ballcol%(z%) = -1
                     SOUND 523, .1
                  END IF
               END IF
            END IF
         NEXT zz%
        
         ballxvel&(z%) = (ballxvel&(z%) * 47) \ 48
         ballyvel&(z%) = (ballyvel&(z%) * 47) \ 48
         IF ballxvel&(z%) * ballxvel&(z%) + ballyvel&(z%) * ballyvel&(z%) < 16384 THEN
            ballxvel&(z%) = 0
            ballyvel&(z%) = 0
         END IF
     
      END IF
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

