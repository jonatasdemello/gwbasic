DECLARE FUNCTION kval! (st$)
DECLARE FUNCTION rcp! (x!)
DECLARE FUNCTION sqrt! (s!)
DECLARE FUNCTION max! (a!, b!)
DECLARE FUNCTION min! (a!, b!)
DECLARE FUNCTION krcpss! (a!)
DECLARE FUNCTION rcpss! (a!)
DECLARE FUNCTION rsqrtss! (a!)
DECLARE FUNCTION fixupfunc$ (bakz$)
DECLARE SUB compilefunc (ist$, cst$)
DECLARE SUB dofunc (a0!, a1!, a2!, a3!, cst$)
CONST PI = 3.141592653589793#
'GOTO skipit

SCREEN 0: WIDTH 80, 50: DIM a!(4 - 1): RANDOMIZE TIMER
FOR zx% = 0 TO 7
   CLS
   SELECT CASE zx%
      CASE 0: CALL compilefunc("(x>=0)&(x<1)", cst$)
      CASE 1: CALL compilefunc("(x+0xc00000)-0xc00000", cst$)
      CASE 2: CALL compilefunc("(x-.5+0xc00000)-0xc00000", cst$)
      CASE 3: CALL compilefunc("x+(max(3,4)+min(.3e-3,-1))", cst$)
      CASE 4: CALL compilefunc("(2-x*rcp(x))*rcp(x)", cst$)
      CASE 5: CALL compilefunc("(3-(x*rsqrt(x))*rsqrt(x))*rsqrt(x)*.5", cst$)
      CASE 6: CALL compilefunc("((((x*x)/3024+1/-42)*(x*x)+1)*(x*x)/20-1)*(x*x)*x/6+x", cst$)
      CASE 7: CALL compilefunc("((((-(x*x)/151200+1/1680)*(x*x)-1/30)*(x*x)+1)*(x*x)/24-.5)*(x*x)+1", cst$)
   END SELECT
   IF LEFT$(cst$, 1) = "!" THEN PRINT cst$: END
   PRINT " input: ";
   FOR z% = 0 TO 3
      a!(z%) = (RND - .5) * PI * 2: PRINT USING "######.######"; a!(z%);
   NEXT z%: PRINT : PRINT "qbfunc: ";
   FOR z% = 0 TO 3
      x = a!(z%)
      SELECT CASE zx%
         CASE 0: PRINT USING "######.######"; (x >= 0) AND (x < 1);
         CASE 1: PRINT USING "######.######"; CINT(x);
         CASE 2: PRINT USING "######.######"; INT(x);
         CASE 3: PRINT USING "######.######"; x + (max(3, 4) + min(.0003, -1));
         CASE 4: PRINT USING "######.######"; 1 / x;
         CASE 5: PRINT USING "######.######"; 1 / sqrt(x);
         CASE 6: PRINT USING "######.######"; SIN(x);
         CASE 7: PRINT USING "######.######"; COS(x);
      END SELECT
   NEXT z%: PRINT
   CALL dofunc(a!(0), a!(1), a!(2), a!(3), cst$)
   PRINT "dofunc: "; : FOR z% = 0 TO 3: PRINT USING "######.######"; a!(z%); : NEXT z%
   DO: LOOP WHILE INKEY$ = ""
NEXT zx%
END
skipit:
SCREEN 9: CONST XDIM = 640, YDIM = 480

sc = 30000
xof = 1 - 320 / sc
yof = 1 + 175 / sc

DIM regs%(7): regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
DO
   CLS
   LOCATE 1, 28: PRINT USING "##.#### <= x <= ##.####"; xof; xof + (XDIM - 1) * rsc;
   LOCATE 2, 28: PRINT USING "##.#### <= y <= ##.####"; yof - (YDIM - 1) * rsc; yof;
   rsc = 1 / sc
   FOR sx% = 0 TO XDIM - 1
      x = sx% * rsc + xof
      IF ABS(x) > .0001 THEN
         IF ABS((yof - 1 / x) * sc) < 1000 THEN
            LINE (sx%, (yof - 1 / x) * sc)-(sx%, (yof - rcpss(x)) * sc), 4
         END IF
         IF x > 0 THEN
            IF ABS((yof - 1 / SQR(x)) * sc) < 1000 THEN
               LINE (sx%, (yof - 1 / SQR(x)) * sc)-(sx%, (yof - rsqrtss(x)) * sc), 3
            END IF
         END IF
      END IF
   NEXT sx%
  
   SCREEN , , pag%, 1 - pag%: pag% = 1 - pag%
   WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8

   regs%(0) = 5: CALL int86old(&H33, regs%(), regs%())
   IF regs%(0) THEN
      xof = xof + XDIM * .5 / sc
      yof = yof - YDIM * .5 / sc
      IF (regs%(0) AND 1) THEN sc = sc * 1.1
      IF (regs%(0) AND 2) THEN sc = sc / 1.1
      xof = xof - XDIM * .5 / sc
      yof = yof + YDIM * .5 / sc
   END IF
   regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
   xof = xof + regs%(2) * 2 / sc
   yof = yof - regs%(3) * 2 / sc
LOOP WHILE INKEY$ = ""

'How to code an 'if' statement in parallel (11/10/2001):
'   if (xmm0 >= 1.0) { xmm0 = sqrt(xmm0); }
'
'   if code inside {} is small, or truths are likely different, use this:
'      movaps xmm1, xmm0
'      cmpgeps xmm0, [1.0]    xmm0 >= 1.0:   xmm0 < 1.0:
'      sqrtps xmm2, xmm1
'      andps xmm2, xmm0       xmm2 & 1111    xmm2 & 0000
'      andnps xmm0, xmm1      0000 & xmm0    1111 & xmm1
'      orps xmm0, xmm2
'
'   if code inside {} is large, or truths are likely the same, use this:
'      movaps xmm1, xmm0
'      cmpgeps xmm0, [1.0]
'      movmskps eax, xmm0
'      test eax, eax
'      jz skipall            ;0,0,0,0  :)
'      cmp eax, 15
'      jne domix
'      sqrtps xmm0, xmm1     ;1,1,1,1  :)
'      jmp skipall
'   domix:                   ;?,?,?,?  :(
'      sqrtps xmm2, xmm1
'      andps xmm2, xmm0
'      andnps xmm0, xmm1
'      orps xmm0, xmm2
'   skipall:

SUB compilefunc (ist$, cst$)
     'rr%(z%) = dr%(z%) op%(z%) sr%(z%)
     'op% format: +:58,-:5C,*:59,/:5E,sqrt:51,min:5D,max:5F
     'dr%/sr%  format: <0:imm#^-1, >=0:xmm/mem location (hopefully < 8)
   DIM op%(256 - 1), wr%(256 - 1), dr%(256 - 1), sr%(256 - 1)
   DIM imv&(256 - 1), imptr&(256 - 1): imcnt% = 0
   DIM lbuf%(256 - 1), rbuf%(256 - 1)
  
   fst$ = fixupfunc$(ist$): IF LEFT$(fst$, 1) = "!" THEN cst$ = fst$: EXIT SUB
   cst$ = STRING$(16, 0) + "S»SGŽÛ»O" + CHR$(0)

   lbuf%(0) = 0: rbuf%(0) = LEN(fst$): br% = 0: bw% = 1
   opnum% = 0: imcnt% = 0
   PRINT fst$
   DO
      i0% = lbuf%(br%): i1% = rbuf%(br%): br% = ((br% + 1) AND 255)
reparenth:
      obw% = bw%
     
      inpar% = 0: bestprio% = &H7FFF: ch% = -1
      FOR i% = i0% TO i1% - 1
         och% = ch%: ch% = ASC(MID$(fst$, i% + 1, 1))
         IF ch% = ASC("(") THEN inpar% = inpar% + 1
         IF ch% = ASC(")") THEN inpar% = inpar% - 1
         IF inpar% = 0 THEN
            prio% = &H7FFF
            IF ch% = ASC("&") THEN prio% = 0: dop% = &H54
            IF ch% = ASC("|") THEN prio% = 0: dop% = &H56
            IF ch% = ASC("^") THEN prio% = 0: dop% = &H57
            IF ch% = &HC2 THEN prio% = 1: dop% = &HC2     '==
            IF ch% = ASC("<") THEN prio% = 1: dop% = &HC3 '<
            IF ch% = &HC4 THEN prio% = 1: dop% = &HC4     '<=
            IF ch% = &HC6 THEN prio% = 1: dop% = &HC6     '!=
            IF ch% = &HC7 THEN prio% = 1: dop% = &HC7     '>=
            IF ch% = ASC(">") THEN prio% = 1: dop% = &HC8 '>
            IF ch% = ASC("+") THEN prio% = 2: dop% = &H58
            IF ch% = ASC("-") AND och% <> ASC("E") THEN prio% = 2: dop% = &H5C
            IF ch% = ASC("*") THEN prio% = 3: dop% = &H59
            IF ch% = ASC("/") THEN prio% = 3: dop% = &H5E
            IF ch% = ASC("*") + 128 THEN prio% = 3: dop% = &H159 '*- operator
            IF ch% = ASC("/") + 128 THEN prio% = 3: dop% = &H15E '/- operator
            'IF ch% = ASC("^") THEN prio% = 4: dop% = &HFF 'special opcode
            'IF ch% = ASC("^") + 128 THEN prio% = 4: dop% = &H1FF '^- operator
            IF prio% <= bestprio% THEN bestprio% = prio%: bestop% = dop%: bestpos% = i%
         END IF
      NEXT i%
      IF bestprio% = &H7FFF THEN
         IF MID$(fst$, i0% + 1, 1) = "(" THEN i0% = i0% + 1: i1% = i1% - 1: GOTO reparenth 'Repeat without ()
         numop% = -1: daleng% = i1% - i0%
         IF daleng% >= 3 THEN IF MID$(fst$, i0% + 1, 3) = "MIN" THEN numop% = 2: bestop% = &H5D: suckleft% = 4
         IF daleng% >= 3 THEN IF MID$(fst$, i0% + 1, 3) = "MAX" THEN numop% = 2: bestop% = &H5F: suckleft% = 4
         IF daleng% >= 3 THEN IF MID$(fst$, i0% + 1, 3) = "RCP" THEN numop% = 1: bestop% = &H53: suckleft% = 4
         IF daleng% >= 4 THEN IF MID$(fst$, i0% + 1, 4) = "SQRT" THEN numop% = 1: bestop% = &H51: suckleft% = 5
         IF daleng% >= 5 THEN IF MID$(fst$, i0% + 1, 5) = "RSQRT" THEN numop% = 1: bestop% = &H52: suckleft% = 6
         SELECT CASE numop%
            CASE 1:
               lbuf%(bw%) = i0%: rbuf%(bw%) = i0%: bw% = ((bw% + 1) AND 255) 'hack: dummy option
               lbuf%(bw%) = i0% + suckleft%: rbuf%(bw%) = i1% - 1: bw% = ((bw% + 1) AND 255)
            CASE 2:
               inpar% = 0
               FOR icomma% = i0% TO i1% - 1
                  IF MID$(fst$, icomma% + 1, 1) = "(" THEN inpar% = inpar% + 1
                  IF MID$(fst$, icomma% + 1, 1) = ")" THEN inpar% = inpar% - 1
                  IF MID$(fst$, icomma% + 1, 1) = "," AND inpar% = 1 THEN EXIT FOR
               NEXT icomma%
               IF icomma% > i1% THEN PRINT "Error: not enough parameters for a function": END
               lbuf%(bw%) = i0% + suckleft%: rbuf%(bw%) = icomma%: bw% = ((bw% + 1) AND 255)
               lbuf%(bw%) = icomma% + 1: rbuf%(bw%) = i1% - 1: bw% = ((bw% + 1) AND 255)
            CASE ELSE: REM
         END SELECT
      ELSE
         lbuf%(bw%) = i0%: rbuf%(bw%) = bestpos%: bw% = ((bw% + 1) AND 255)
         lbuf%(bw%) = bestpos% + 1: rbuf%(bw%) = i1%: bw% = ((bw% + 1) AND 255)
      END IF

      IF bw% <> obw% THEN
         COLOR 8, 0: PRINT TAB(i0% + 1); STRING$(i1% - i0%, 205);
         op%(opnum%) = bestop%: v% = opnum%: opnum% = opnum% + 1
      ELSEIF i0% >= i1% THEN
         COLOR 3, 0: PRINT TAB(i0% + 1); "1op";
      ELSEIF MID$(fst$, i0% + 1, 1) = "X" THEN
         COLOR 3, 0: PRINT TAB(i0% + 1); "X";
         v% = 0
      ELSE
         COLOR 5, 0: PRINT TAB(i0% + 1); MID$(fst$, i0% + 1, i1% - i0%);
         imv&(imcnt%) = CVL(MKS$(kval(MID$(fst$, i0% + 1, i1% - i0%))))
         v% = imcnt% XOR -1: imcnt% = imcnt% + 1
      END IF

      PRINT TAB(62); USING "### "; v%;
      z% = br% \ 2 - 1
      IF z% >= 0 THEN IF (br% AND 1) THEN sr%(z%) = v% ELSE dr%(z%) = v%
   LOOP WHILE br% <> bw%

      'Change input register from 0->opnum%
   FOR z% = 0 TO opnum% - 1
      IF sr%(z%) = 0 THEN sr%(z%) = opnum%
      IF dr%(z%) = 0 THEN dr%(z%) = opnum%
         'Hack for ^2
      IF op%(z%) = &HFF THEN
         IF imv&(sr%(z%) XOR -1) <> CVL(MKS$(2)) THEN PRINT "Error: power must be 2": END
         op%(z%) = &H59: sr%(z%) = dr%(z%)
      END IF
   NEXT z%
   FOR z% = 0 TO opnum%: wr%(z%) = z%: NEXT z%
  
IF 1 THEN
      'Show uncompiled opcode
   oy% = CSRLIN + 1
   COLOR 5, 0: LOCATE 1, 66: PRINT "3-address code:";
   FOR z% = 0 TO opnum% - 1
      COLOR 6, 0: LOCATE 2 + opnum% - 1 - z%, 66
      PRINT USING "## =### "; wr%(z%); dr%(z%);
      PRINT STRING$(3 - LEN(HEX$(op%(z%))), 32); HEX$(op%(z%)); "h";
      PRINT USING "###"; sr%(z%)
   NEXT z%
   COLOR 5, 0: LOCATE opnum% + 3, 66: PRINT "Constants:";
   FOR z% = 0 TO imcnt% - 1
      COLOR 6, 0: LOCATE z% + opnum% + 4, 65
      PRINT USING "###:"; z% XOR -1; : PRINT LTRIM$(STR$(CVS(MKL$(imv&(z%)))));
   NEXT z%
   IF CSRLIN < oy% THEN LOCATE oy%, 1 ELSE PRINT
END IF

IF 1 THEN
      'Optimize out common sub-expressions:
   k% = opnum% - 2
   DO WHILE k% >= 0
      FOR i% = k% + 1 TO opnum% - 1
         IF dr%(i%) = dr%(k%) AND op%(i%) = op%(k%) AND dr%(i%) = dr%(k%) THEN
               'Found match!
              
               'First replace references to k% with i%:
            FOR j% = 0 TO k% - 1
               IF dr%(j%) = k% THEN dr%(j%) = i%
               IF sr%(j%) = k% THEN sr%(j%) = i%
            NEXT j%
              
               'Remove opnum% k%:
            FOR j% = k% TO opnum% - 2
               wr%(j%) = wr%(j% + 1): op%(j%) = op%(j% + 1)
               dr%(j%) = dr%(j% + 1): sr%(j%) = sr%(j% + 1)
            NEXT j%
           
               'Decrease all references >= k%
            opnum% = opnum% - 1
            FOR j% = 0 TO opnum% - 1
               IF wr%(j%) > k% THEN wr%(j%) = wr%(j%) - 1
               IF dr%(j%) > k% THEN dr%(j%) = dr%(j%) - 1
               IF sr%(j%) > k% THEN sr%(j%) = sr%(j%) - 1
            NEXT j%
           
            EXIT FOR
         END IF
      NEXT i%
      k% = k% - 1
   LOOP
END IF

   DO
         'Convert 2 immediates (dst = imm op imm) into a mov instruction
      got% = 0
      FOR z% = 0 TO opnum% - 1
         IF dr%(z%) < 0 AND sr%(z%) < 0 THEN
            got% = 1
            SELECT CASE op%(z%)
               CASE &H54: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = imv&(dr%(z%) XOR -1) AND imv&(sr%(z%) XOR -1): dr%(z%) = wr%(z%)
               CASE &H55: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = (imv&(dr%(z%) XOR -1) XOR -1) AND imv&(sr%(z%) XOR -1): dr%(z%) = wr%(z%)
               CASE &H56: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = imv&(dr%(z%) XOR -1) OR imv&(sr%(z%) XOR -1): dr%(z%) = wr%(z%)
               CASE &H57: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = imv&(dr%(z%) XOR -1) XOR imv&(sr%(z%) XOR -1): dr%(z%) = wr%(z%)
               CASE &H58: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = CVL(MKS$(CVS(MKL$(imv&(dr%(z%) XOR -1))) + CVS(MKL$(imv&(sr%(z%) XOR -1))))): dr%(z%) = wr%(z%)
               CASE &H59: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = CVL(MKS$(CVS(MKL$(imv&(dr%(z%) XOR -1))) * CVS(MKL$(imv&(sr%(z%) XOR -1))))): dr%(z%) = wr%(z%)
               CASE &H5C: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = CVL(MKS$(CVS(MKL$(imv&(dr%(z%) XOR -1))) - CVS(MKL$(imv&(sr%(z%) XOR -1))))): dr%(z%) = wr%(z%)
               CASE &H5E: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = CVL(MKS$(CVS(MKL$(imv&(dr%(z%) XOR -1))) / CVS(MKL$(imv&(sr%(z%) XOR -1))))): dr%(z%) = wr%(z%)
               CASE &H159: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = CVL(MKS$(CVS(MKL$(imv&(dr%(z%) XOR -1))) * -CVS(MKL$(imv&(sr%(z%) XOR -1))))): dr%(z%) = wr%(z%)
               CASE &H15E: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = CVL(MKS$(CVS(MKL$(imv&(dr%(z%) XOR -1))) / -CVS(MKL$(imv&(sr%(z%) XOR -1))))): dr%(z%) = wr%(z%)
               CASE &H5D
                  op%(z%) = &H28 'MIN
                  IF CVS(MKL$(imv&(dr%(z%) XOR -1))) < CVS(MKL$(imv&(sr%(z%) XOR -1))) THEN imv&(sr%(z%) XOR -1) = imv&(dr%(z%) XOR -1)
                  dr%(z%) = wr%(z%)
               CASE &H5F: PRINT "MAX";
                  op%(z%) = &H28 'MAX
                  IF CVS(MKL$(imv&(dr%(z%) XOR -1))) > CVS(MKL$(imv&(sr%(z%) XOR -1))) THEN imv&(sr%(z%) XOR -1) = imv&(dr%(z%) XOR -1)
                  dr%(z%) = wr%(z%)
               CASE &HC2: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = (CVS(MKL$(imv&(dr%(z%) XOR -1))) = CVS(MKL$(imv&(sr%(z%) XOR -1)))): dr%(z%) = wr%(z%)
               CASE &HC3: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = (CVS(MKL$(imv&(dr%(z%) XOR -1))) < CVS(MKL$(imv&(sr%(z%) XOR -1)))): dr%(z%) = wr%(z%)
               CASE &HC4: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = (CVS(MKL$(imv&(dr%(z%) XOR -1))) <= CVS(MKL$(imv&(sr%(z%) XOR -1)))): dr%(z%) = wr%(z%)
               CASE &HC6: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = (CVS(MKL$(imv&(dr%(z%) XOR -1))) <> CVS(MKL$(imv&(sr%(z%) XOR -1)))): dr%(z%) = wr%(z%)
               CASE &HC7: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = (CVS(MKL$(imv&(dr%(z%) XOR -1))) >= CVS(MKL$(imv&(sr%(z%) XOR -1)))): dr%(z%) = wr%(z%)
               CASE &HC8: op%(z%) = &H28: imv&(sr%(z%) XOR -1) = (CVS(MKL$(imv&(dr%(z%) XOR -1))) > CVS(MKL$(imv&(sr%(z%) XOR -1)))): dr%(z%) = wr%(z%)
               'case &hff?
               'case &h1ff?
               CASE ELSE: PRINT "Invalid immediate operand for op &H"; HEX$(op%(z%)): END
            END SELECT
         END IF
      NEXT z%
      IF got% = 0 THEN EXIT DO

      'EXIT DO
     
         'Remove movaps if <= 1 later instructions access it in the sr%
      k% = opnum% - 1: got% = 0
      DO WHILE k% >= 0
         IF op%(k%) = &H28 AND sr%(k%) < 0 THEN
            cnt% = 0
            FOR z% = k% - 1 TO 0 STEP -1
               IF dr%(z%) = k% THEN EXIT FOR
               IF sr%(z%) = k% THEN j% = z%: cnt% = cnt% + 1
            NEXT z%
            IF cnt% = 1 AND z% < 0 THEN
               got% = 1 'Remove the movaps at k%:
              
                  'Transplant immediate
               sr%(j%) = sr%(k%)
              
                  'First replace references to k% with i%:
               FOR j% = 0 TO k% - 1
                  IF dr%(j%) = k% THEN dr%(j%) = i%
                  IF sr%(j%) = k% THEN sr%(j%) = i%
               NEXT j%
                
                  'Remove opnum% k%:
               FOR j% = k% TO opnum% - 2
                  wr%(j%) = wr%(j% + 1): op%(j%) = op%(j% + 1)
                  dr%(j%) = dr%(j% + 1): sr%(j%) = sr%(j% + 1)
               NEXT j%
             
                  'Decrease all references >= k%
               opnum% = opnum% - 1
               FOR j% = 0 TO opnum% - 1
                  IF wr%(j%) > k% THEN wr%(j%) = wr%(j%) - 1
                  IF dr%(j%) > k% THEN dr%(j%) = dr%(j%) - 1
                  IF sr%(j%) > k% THEN sr%(j%) = sr%(j%) - 1
               NEXT j%
            END IF
         END IF
         k% = k% - 1
      LOOP
      IF got% = 0 THEN EXIT DO

   LOOP

      'Convert (/ imm) to (* imm)
   FOR z% = 0 TO opnum% - 1
      IF (op%(z%) AND 255) = &H5E AND sr%(z%) < 0 THEN
         op%(z%) = op%(z%) + &H59 - &H5E
         imv&(sr%(z%) XOR -1) = CVL(MKS$(1 / CVS(MKL$(imv&(sr%(z%) XOR -1)))))
      END IF
   NEXT z%

      'Optimize code! Tries to make dr% = wr% to prevent extra mov
   FOR z% = 0 TO opnum% - 1
      good% = -2
      o% = op%(z%): opsym% = (o% = &H54 OR (o% >= &H56 AND o% <= &H59) OR o% = &H5D OR o% = &H5F OR o% = &HC2 OR o% = &HC6 OR o% = &H159)
         'Hack for single-op functions (mov,*sqrt,rcp)
      IF o% = &H10 OR o% = &H28 OR (o% >= &H51 AND o% <= &H53) THEN dr%(z%) = wr%(z%)
      DO
         IF dr%(z%) >= 0 AND dr%(z%) <> wr%(z%) THEN
            odr% = dr%(z%): ndr% = wr%(z%)
            FOR zz% = z% - 1 TO 0 STEP -1
               IF dr%(zz%) = odr% THEN EXIT FOR
               IF sr%(zz%) = odr% THEN EXIT FOR
            NEXT zz%
            IF zz% < 0 THEN
               FOR zz% = z% TO opnum%
                  IF wr%(zz%) = odr% THEN wr%(zz%) = ndr%
                  IF dr%(zz%) = odr% THEN dr%(zz%) = ndr%
                  IF sr%(zz%) = odr% THEN sr%(zz%) = ndr%
               NEXT zz%
               EXIT DO
            END IF
         END IF
            'reverse params&try again if op's symmetric:&,|,^,+,*,min,max
         IF opsym% = 0 THEN EXIT DO
         SWAP dr%(z%), sr%(z%)
         good% = good% + 1
      LOOP WHILE good% = -1
         'Put immediate in dst: (mov r,m; op r,r) beats (mov r,r; op r,m)
      'IF opsym% AND dr%(z%) >= 0 AND sr%(z%) < 0 AND dr%(z%) > wr%(z%) THEN SWAP dr%(z%), sr%(z%)
   NEXT z%
     
      'Make register #'s as low as possible
   rcnt% = 0
   FOR z% = 0 TO opnum%
      FOR zz% = opnum% TO 0 STEP -1
         IF wr%(zz%) = z% THEN EXIT FOR
      NEXT zz%
      IF zz% >= 0 THEN
         IF z% <> rcnt% THEN
            FOR zz% = 0 TO opnum%
               IF wr%(zz%) = z% THEN wr%(zz%) = rcnt%
               IF dr%(zz%) = z% THEN dr%(zz%) = rcnt%
               IF sr%(zz%) = z% THEN sr%(zz%) = rcnt%
            NEXT zz%
         END IF
         rcnt% = rcnt% + 1
      END IF
   NEXT z%
   IF rcnt% >= 8 THEN PRINT "ERROR! Code doesn't fit in 8 registers :(": END
  
      'Write the 2-address code to the code buffer
   cst$ = cst$ + CHR$(&HF) + CHR$(&H28) + CHR$(wr%(opnum%) * 8 + &H7)
   FOR z% = opnum% - 1 TO 0 STEP -1
      IF dr%(z%) >= 0 THEN
         IF wr%(z%) <> dr%(z%) THEN
            cst$ = cst$ + MKI$(&H280F) + CHR$(wr%(z%) * 8 + dr%(z%) + &HC0)
         END IF
      ELSE
         cst$ = cst$ + MKI$(&H280F) + CHR$(wr%(z%) * 8 + &H87) + "IM"
         imptr&(dr%(z%) XOR -1) = LEN(cst$) - 1
      END IF
     
      daop% = op%(z%)
         'Hack for cmp??ps instruction:
      IF op%(z%) >= &HC2 AND op%(z%) < &HC9 AND op%(z%) <> &HC5 THEN daop% = &HC2

      cst$ = cst$ + CHR$(&HF) + CHR$(daop% AND 255)
      IF sr%(z%) >= 0 THEN
         cst$ = cst$ + CHR$(wr%(z%) * 8 + sr%(z%) + &HC0)
           
            'Hack for *-, /-, (^-)
         IF op%(z%) >= &H100 THEN
            cst$ = cst$ + CHR$(&HF) + CHR$(&H57) '0x57=XORPS
            cst$ = cst$ + CHR$(wr%(z%) * 8 + &H87) + "IM"
            imv&(imcnt%) = &H80000000
            imptr&(imcnt%) = LEN(cst$) - 1: imcnt% = imcnt% + 1
         END IF
      ELSE
         cst$ = cst$ + CHR$(wr%(z%) * 8 + &H87) + "IM"
         imptr&(sr%(z%) XOR -1) = LEN(cst$) - 1
         IF op%(z%) >= &H100 THEN imv&(sr%(z%) XOR -1) = imv&(sr%(z%) XOR -1) XOR &H80000000
      END IF
     
         'Attached immediate for cmp??ps
      IF daop% = &HC2 THEN cst$ = cst$ + CHR$(op%(z%) - &HC2)
   NEXT z%
   
      'movaps ds:[bx], xmm0   pop bx   pop ds   ret
   ocstlen% = LEN(cst$)
   cst$ = cst$ + MKL$(&H5B07290F) + MKI$(&HCB1F)
  
      '0F 10 10Dst111 imm16   movups xDst, ds:[bx+imm16]
      'Store list of 16-byte immediate values after code
   IF imcnt% > 0 THEN cst$ = cst$ + STRING$((-LEN(cst$)) AND 15, &H90)
   FOR z% = 0 TO imcnt% - 1
      IF imptr&(z%) > 0 THEN
         FOR zz% = 0 TO z% - 1
            IF imv&(zz%) = imv&(z%) THEN EXIT FOR
         NEXT zz%
         IF zz% >= z% THEN
            MID$(cst$, imptr&(z%), 2) = MKI$(LEN(cst$))
            imptr&(z%) = LEN(cst$) 'Hack to remember position of immediate
            FOR zx% = 0 TO 3: cst$ = cst$ + MKL$(imv&(z%)): NEXT zx%
         ELSE
            MID$(cst$, imptr&(z%), 2) = MKI$(imptr&(zz%))
         END IF
      END IF
   NEXT z%

IF 1 THEN
   IF CSRLIN >= 30 THEN DO: LOOP WHILE INKEY$ = "": CLS
   COLOR 2, 0: PRINT "Code bytes:"; ocstlen% - 26; "(decimal)"
   instcnt% = 0
   FOR z% = 0 TO LEN(cst$) - 1
      IF (z% AND 15) = 0 THEN COLOR 7, 0: PRINT HEX$((z% \ 16) AND 15); HEX$(z% AND 15); ":";

      IF z% < 16 OR z% >= (((ocstlen% + 6) + 15) AND NOT 15) THEN
         zx% = (z% AND 4) \ 2: COLOR 6 - (zx% XOR 2), 0 'immediates
      ELSEIF z% >= ocstlen% + 6 THEN
         COLOR 8, 0 'nop's
      ELSEIF z% < 26 OR z% >= ocstlen% THEN
         COLOR 9, 1 'pre-code & post-code
      ELSEIF z% < ocstlen% THEN
         IF MID$(cst$, z% + 1, 1) = CHR$(&HF) THEN instcnt% = instcnt% + 1
         COLOR (instcnt% AND 1 XOR 1), 2
      END IF
     
      PRINT HEX$(ASC(MID$(cst$, z% + 1, 1)) \ 16);
      PRINT HEX$(ASC(MID$(cst$, z% + 1, 1)) AND 15);
      COLOR col%, 0
      IF (z% AND 15) = 15 THEN IF (z% AND 16) THEN PRINT  ELSE PRINT " ";
   NEXT z%
   COLOR 7, 0: IF (z% AND 31) THEN PRINT
  
      'Display disassembled code:
   z% = 26: COLOR 6, 0
   DO
      IF ASC(MID$(cst$, z% + 1, 1)) <> &HF THEN PRINT "Disasm error :/": END
      ch% = ASC(MID$(cst$, z% + 2, 1)): z% = z% + 2: rparm% = 0: cmpim% = 0
      SELECT CASE ch%
         CASE &H10, &H11: PRINT "movu"; : rparm% = (ch% AND 1)
         CASE &H28, &H29: PRINT "mova"; : rparm% = (ch% AND 1)
         CASE &H50: PRINT "movmsk"; : rparm% = 2 'HACK for dst=int32 register
         CASE &H51: PRINT "sqrt";
         CASE &H52: PRINT "rsqrt";
         CASE &H53: PRINT "rcp";
         CASE &H54: PRINT "and";
         CASE &H55: PRINT "andn";
         CASE &H56: PRINT "or";
         CASE &H57: PRINT "xor";
         CASE &H58: PRINT "add";
         CASE &H59: PRINT "mul";
         CASE &H5C: PRINT "sub";
         CASE &H5D: PRINT "min";
         CASE &H5E: PRINT "div";
         CASE &H5F: PRINT "max";
         CASE &HC2: PRINT "cmp"; : cmpim% = 1
      END SELECT
      PRINT "ps ";

      ch% = ASC(MID$(cst$, z% + 1, 1)): z% = z% + 1 'Parse ModR/M byte
         ' 00Dst111         rsqrtps xDst, ds:[bx]
         ' 01Dst111 imm8    movups xDst, ds:[bx+imm8]
         ' 10Dst111 imm16   movups xDst, ds:[bx+imm16]
         ' 11DstSrc         rsqrtps xDst, xSrc
      IF rparm% = 0 THEN PRINT "xmm"; CHR$(((ch% \ 8) AND 7) + 48); ", ";
      IF rparm% = 2 THEN PRINT USING "E##, "; ((ch% \ 8) AND 7);
      SELECT CASE (ch% AND &HC0)
         CASE &H0: PRINT "[bx]";
         CASE &H40: PRINT "[bx+0x"; HEX$(ASC(MID$(cst$, z% + 1, 1))); "]"; : z% = z% + 1
         CASE &H80: PRINT "[bx+0x"; HEX$(CVI(MID$(cst$, z% + 1, 2))); "]"; : z% = z% + 2
         CASE &HC0: PRINT "xmm"; CHR$((ch% AND 7) + 48);
      END SELECT
      IF rparm% = 1 THEN PRINT ", xmm"; CHR$(((ch% \ 8) AND 7) + 48);
      IF cmpim% THEN PRINT ","; ASC(MID$(cst$, z% + 1, 1)); : z% = z% + 1
      PRINT
   LOOP WHILE z% < ocstlen% + 3 - 1
   COLOR 7, 0
END IF

END SUB

SUB dofunc (a0!, a1!, a2!, a3!, c$)
   nc$ = STRING$(LEN(c$) + 15, 0): p& = ((-SADD(nc$)) AND 15)
   MID$(nc$, p& + 1, LEN(c$)) = c$
   MID$(nc$, p& + 1, 4) = MKS$(a0!): MID$(nc$, p& + 5, 4) = MKS$(a1!)
   MID$(nc$, p& + 9, 4) = MKS$(a2!): MID$(nc$, p& + 13, 4) = MKS$(a3!)
   MID$(nc$, p& + 20, 2) = MKI$(VARSEG(nc$))
   MID$(nc$, p& + 25, 2) = MKI$(SADD(nc$) + p&)
   DEF SEG = VARSEG(nc$): CALL absolute(SADD(nc$) + p& + 16)
   a0! = CVS(MID$(nc$, p& + 1, 4)): a1! = CVS(MID$(nc$, p& + 5, 4))
   a2! = CVS(MID$(nc$, p& + 9, 4)): a3! = CVS(MID$(nc$, p& + 13, 4))
END SUB

FUNCTION fixupfunc$ (bakz$)
      'Remove anything after a comment; i% = actual string length
   i% = LEN(bakz$)
   FOR z% = 0 TO i% - 2
      IF MID$(bakz$, z% + 1, 1) = "'" THEN i% = z%: EXIT FOR
      IF MID$(bakz$, z% + 1, 1) = ";" THEN i% = z%: EXIT FOR
      IF MID$(bakz$, z% + 1, 2) = "//" THEN i% = z%: EXIT FOR
   NEXT z%
   IF i% <= 0 THEN fixupfunc$ = "!ERROR: Expression blank": EXIT FUNCTION

      'Remove spaces; simplify all operator sequences to 1 char; check ()
   i% = i% - 1: z$ = "": pcnt% = 0: nc% = ASC(MID$(bakz$, i% + 1, 1))
   DO
      c% = nc%
      DO
         nc% = -1
         i% = i% - 1: IF i% >= 0 THEN nc% = ASC(MID$(bakz$, i% + 1, 1))
      LOOP WHILE nc% = 32 AND i% >= 0
      SELECT CASE c%
         CASE ASC("+")
            IF nc% = ASC("+") THEN GOTO fixupbreak
            IF nc% = ASC("-") THEN GOTO fixupbreak
            IF nc% = ASC("*") OR nc% = ASC("/") OR nc% = ASC("^") THEN GOTO fixupbreak
            z$ = CHR$(c%) + z$
         CASE ASC("-")
            IF nc% < 0 OR nc% = ASC("(") OR nc% = ASC(",") THEN z$ = "0-" + z$: GOTO fixupbreak
            IF nc% = ASC("+") THEN nc% = ASC("-"): GOTO fixupbreak
            IF nc% = ASC("-") THEN nc% = ASC("+"): GOTO fixupbreak
            IF nc% = ASC("*") OR nc% = ASC("/") OR nc% = ASC("^") THEN nc% = nc% + 128: GOTO fixupbreak
            z$ = CHR$(c%) + z$
         CASE ASC("!")
            IF nc% = ASC("=") THEN nc% = &HC6: GOTO fixupbreak
            z$ = CHR$(c%) + z$
         CASE ASC("<")
            IF nc% = ASC("=") THEN nc% = &HC7: GOTO fixupbreak
            IF nc% = ASC(">") THEN nc% = &HC6: GOTO fixupbreak
            z$ = CHR$(c%) + z$
         CASE ASC(">")
            IF nc% = ASC("=") THEN nc% = &HC7: GOTO fixupbreak
            IF nc% = ASC("<") THEN nc% = &HC6: GOTO fixupbreak
            z$ = CHR$(c%) + z$
         CASE ASC("=")
            IF nc% = ASC("=") THEN nc% = &HC2: GOTO fixupbreak
            IF nc% = ASC("<") THEN nc% = &HC4: GOTO fixupbreak
            IF nc% = ASC("!") THEN nc% = &HC6: GOTO fixupbreak
            IF nc% = ASC(">") THEN nc% = &HC7: GOTO fixupbreak
            z$ = CHR$(c%) + z$
         CASE ASC("("): pcnt% = pcnt% + 1: z$ = CHR$(c%) + z$
         CASE ASC(")"): pcnt% = pcnt% - 1: z$ = CHR$(c%) + z$
         CASE ELSE: z$ = UCASE$(CHR$(c%)) + z$
      END SELECT
fixupbreak:
   LOOP WHILE i% >= 0
   IF pcnt% < 0 THEN fixupfunc$ = "!ERROR: Too many ')'": EXIT FUNCTION
   IF pcnt% > 0 THEN fixupfunc$ = "!ERROR: Not enough ')'": EXIT FUNCTION
  
IF 0 THEN
   'PRINT z$
   innum% = 0: inpar% = 0: prio% = -1: osgn% = -2: nnum% = 0: inum% = 0
   FOR z% = 1 TO LEN(z$)
      SELECT CASE ASC(MID$(z$, z%, 1))
         CASE ASC("("): inpar% = inpar% + 1: innum% = 0
         CASE ASC(")"): inpar% = inpar% - 1: innum% = 0
         CASE 65 TO 90, 95: IF innum% = 1 THEN innum% = 2 ELSE innum% = -1
         CASE ASC(","): innum% = 0: prio% = 0
         CASE ASC("<"), ASC(">"), &HC2, &HC4, &HC6, &HC7: innum% = 0: prio% = 1
         CASE ASC("+"): innum% = 0: prio% = 2
         CASE ASC("-"): IF innum% <> 2 THEN innum% = 0: prio% = 2
         CASE ASC("*"), ASC("*") + 128: innum% = 0: prio% = 3
         CASE ASC("/"), ASC("/") + 128: innum% = 0: prio% = 3
         CASE ASC("^"), ASC("^") + 128: innum% = 0: prio% = 4
         CASE 48 TO 57, ASC("."): innum% = innum% OR 1
         CASE ELSE: PRINT "error!": END
      END SELECT
      IF ASC(MID$(z$, z%, 1)) = ASC("(") THEN
         PRINT "("; : osgn% = -2
      ELSEIF ASC(MID$(z$, z%, 1)) = ASC(")") THEN
         PRINT ")"; : osgn% = -2
      ELSE
         nsgn% = SGN(innum%)
         IF nsgn% <> osgn% THEN
            SELECT CASE nsgn%
               CASE -1: PRINT "@"; LTRIM$(STR$(nnum%)); : nnum% = nnum% + 1
               CASE 0: PRINT MID$(z$, z%, 1);
               CASE 1: PRINT "#"; LTRIM$(STR$(inum%)); : inum% = inum% + 1
            END SELECT
         END IF
         osgn% = nsgn%
      END IF
   NEXT z%
   PRINT
END IF
  
   fixupfunc$ = z$
END FUNCTION

FUNCTION krcpss! (a!)
   a# = 2125792499# - CVL(MKS$(a!)): IF a# >= 2147483648# THEN a& = a# - 4294967296# ELSE a& = a#
   'a& = &H7EB504F3 - CVL(MKS$(a!))
   b! = CVS(MKL$(a&)) * 1.393087 '1.5% error
   b! = (2 - a! * b!) * b!   '.26% or .022317% error
   krcpss! = b!
END FUNCTION

FUNCTION kval (st$)
   IF LEN(st$) > 2 THEN
      IF LEFT$(st$, 2) = "0X" THEN
         v& = 0
         FOR z% = 3 TO LEN(st$)
            ch% = ASC(MID$(st$, z%, 1))
            v& = v& * 16
            IF ch% >= 65 THEN v& = v& + ch% - 55 ELSE v& = v& + ch% - 48
         NEXT z%
         kval = v&: EXIT FUNCTION
      END IF
   END IF
   kval = VAL(st$)
END FUNCTION

FUNCTION max (a, b)
   IF a > b THEN max = a ELSE max = b
END FUNCTION

FUNCTION min (a, b)
   IF a < b THEN min = a ELSE min = b
END FUNCTION

FUNCTION rcp (x)
   IF x <> 0 THEN rcp = 1 / x ELSE rcp = CVS(MKL$(&H7F800000))
END FUNCTION

FUNCTION rcpss! (a!)
      '1E       'push ds
      '53       'push bx
      'BB imm16 'mov bx, [imm16]
      '8E DB    'mov ds, bx
      'BB imm16 'mov bx, [imm16]
      '0F 53 07 'rcpps xmm0, ds:[bx]
      '0F 29 07 'movaps ds:[bx], xmm0
      '5B       'pop bx
      '1F       'pop ds
      'CB       'ret
   DIM asm!((35 - 1) \ 4): SG& = VARSEG(asm!(0)) AND 65535: DEF SEG = SG&
   p& = VARPTR(asm!(0)) AND 65535
   POKE p& + 16, &H1E: POKE p& + 17, &H53
   POKE p& + 18, &HBB: POKE p& + 19, SG& AND 255: POKE p& + 20, SG& \ 256
   POKE p& + 21, &H8E: POKE p& + 22, &HDB
   POKE p& + 23, &HBB: POKE p& + 24, OF& AND 255: POKE p& + 25, OF& \ 256
   POKE p& + 26, &HF: POKE p& + 27, &H53: POKE p& + 28, &H7
   POKE p& + 29, &HF: POKE p& + 30, &H29: POKE p& + 31, &H7
   POKE p& + 32, &H5B: POKE p& + 33, &H1F: POKE p& + 34, &HCB
   asm!(0) = a!: CALL absolute(p& + 16): rcpss! = asm!(0): DEF SEG
END FUNCTION

FUNCTION rsqrtss! (a!)
      '1E       'push ds
      '53       'push bx
      'BB imm16 'mov bx, [imm16]
      '8E DB    'mov ds, bx
      'BB imm16 'mov bx, [imm16]
      '0F 52 07 'rsqrtps xmm0, ds:[bx]
      '0F 29 07 'movaps ds:[bx], xmm0
      '5B       'pop bx
      '1F       'pop ds
      'CB       'ret
   DIM asm!((35 - 1) \ 4): SG& = VARSEG(asm!(0)) AND 65535: DEF SEG = SG&
   p& = VARPTR(asm!(0)) AND 65535
   POKE p& + 16, &H1E: POKE p& + 17, &H53
   POKE p& + 18, &HBB: POKE p& + 19, SG& AND 255: POKE p& + 20, SG& \ 256
   POKE p& + 21, &H8E: POKE p& + 22, &HDB
   POKE p& + 23, &HBB: POKE p& + 24, OF& AND 255: POKE p& + 25, OF& \ 256
   POKE p& + 26, &HF: POKE p& + 27, &H52: POKE p& + 28, &H7
   POKE p& + 29, &HF: POKE p& + 30, &H29: POKE p& + 31, &H7
   POKE p& + 32, &H5B: POKE p& + 33, &H1F: POKE p& + 34, &HCB
   asm!(0) = a!: CALL absolute(p& + 16): rsqrtss! = asm!(0): DEF SEG
END FUNCTION

FUNCTION sqrt (s)
   IF s >= 0 THEN sqrt = SQR(s) ELSE sqrt = CVS(MKL$(&HFFC00000))
END FUNCTION

