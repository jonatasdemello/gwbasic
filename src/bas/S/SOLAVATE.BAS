DECLARE SUB drawline3d (x0#, y0#, z0#, x1#, y1#, z1#, col#)
DECLARE SUB solvepanelangle (roofangle#, southangle#, zenithoffset#, panelang#, panellift#)
DECLARE FUNCTION arcsin# (a#)
DECLARE FUNCTION arccos# (a#)

DEFDBL A-Z
CONST PI = 3.141592653589793#, TORAD = PI / 180#, TODEG = 180# / PI
CONST XDIM = 640#, YDIM = 350#, CLIPDIST = 1, VEL = 1
DIM SHARED cx, cy, cz, ix, iy, iz, jx, jy, jz, kx, ky, kz, hx, hy, hz
DIM SHARED regs%(7), sunfree%

SCREEN 9: pag% = 0
hx = XDIM \ 2: hy = YDIM \ 2: hz = hx

regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())

hroofwidth = 14.6#: hroofleng = 8#: roofbaseheight = 18.5#
panellength = 12# + 7.5# / 12#: panelwidth = 4# + 7.25# / 12#

z$ = "R": sunfree% = 1
DO
   CLS 1
 
   IF z$ = "*" THEN hz = hz * 1.05
   IF z$ = "/" THEN hz = hz / 1.05
   IF z$ = "5" THEN hz = hx
  
   IF UCASE$(z$) = "R" THEN  'Total Position Reset
      roofangle = 30#: southangle = -62#: zenithoffset = 40#
      hz = hx
      panel1xpos = 7.9#: panel1ypos = -3.7#
      panel2xpos = 7.9#: panel2ypos = 5.3#
      ax = panel1xpos: ay = panel1ypos: az = TAN(roofangle * TORAD) * (hroofwidth - ax)
      ch% = 2
        
         'Hack to make starting distance 40
      cx = ax + 40: cy = az: cz = -ay
   END IF
   IF UCASE$(z$) = "H" THEN  'Set panel to Ken's angle
      roofangle = 30#: southangle = -62#: zenithoffset = 40#
      ch% = 1
   END IF
   IF UCASE$(z$) = "B" THEN  'Set panel to Solar Works' angle
      roofangle = 30#: southangle = -25.621#: zenithoffset = 46.9726#
      ch% = 1
   END IF
   IF UCASE$(z$) = "Z" THEN roofangle = CINT(roofangle) - 1: ch% = 1: IF roofangle < 0 THEN roofangle = 0
   IF UCASE$(z$) = "A" THEN roofangle = CINT(roofangle) + 1: ch% = 1: IF roofangle >= 90 THEN roofangle = 90 - 1
   IF UCASE$(z$) = "S" THEN southangle = CINT(southangle) - 1: ch% = 1: IF southangle < -180 THEN southangle = southangle + 360
   IF UCASE$(z$) = "D" THEN southangle = CINT(southangle) + 1: ch% = 1: IF southangle > 180 THEN southangle = southangle - 360
   IF UCASE$(z$) = "E" THEN zenithoffset = CINT(zenithoffset) - 1: ch% = 1: IF zenithoffset < 0 THEN zenithoffset = 0
   IF UCASE$(z$) = "X" THEN zenithoffset = CINT(zenithoffset) + 1: ch% = 1: IF zenithoffset > 90 THEN zenithoffset = 90
   IF z$ = " " THEN sunfree% = 1 - sunfree%
   IF sunfree% = 0 THEN COLOR 14: LOCATE 8, 1: PRINT "SunLock";
     
   CALL solvepanelangle(roofangle, southangle, zenithoffset, panelang, panellift)

   COLOR 6
   LOCATE 1, 1: PRINT "(A,Z) RoofAngle:"; roofangle
   LOCATE 2, 1: PRINT "(S,D) SouthAngle:"; southangle
   LOCATE 3, 1: PRINT "(E,X) ZenithOffset:"; zenithoffset
   COLOR 3
   LOCATE 5, 1: PRINT USING "PanelAng:####.###"; panelang * TODEG
   LOCATE 6, 1: PRINT USING "PanelLift:####.###"; panellift * TODEG
  
      'Calculate roof vertices
   x0 = -hroofwidth: y0 = -hroofleng: z0 = 0
   x1 = hroofwidth: y1 = -hroofleng: z1 = 0
   x2 = -hroofwidth: y2 = hroofleng: z2 = 0
   x3 = hroofwidth: y3 = hroofleng: z3 = 0
   x4 = 0: y4 = -hroofleng: z4 = TAN(roofangle * TORAD) * hroofwidth
   x5 = 0: y5 = hroofleng: z5 = TAN(roofangle * TORAD) * hroofwidth
  
      'Calculate panel vertices (first one)
   v0x = 0: v0y = 1: v0z = 0
   v1x = COS(roofangle * TORAD): v1y = 0: v1z = -SIN(roofangle * TORAD)
   v2x = SIN(roofangle * TORAD): v2y = 0: v2z = COS(roofangle * TORAD)
   cosang = COS(panelang): sinang = -SIN(panelang)
   panelsiz = COS(panellift) * panelwidth * .5
   v3x = (v0x * cosang - v1x * sinang) * panellength * .5
   v3y = (v0y * cosang - v1y * sinang) * panellength * .5
   v3z = (v0z * cosang - v1z * sinang) * panellength * .5
   v4x = (v1x * cosang + v0x * sinang) * panelsiz
   v4y = (v1y * cosang + v0y * sinang) * panelsiz
   v4z = (v1z * cosang + v0z * sinang) * panelsiz
  
   ax = panel1xpos: ay = panel1ypos: az = TAN(roofangle * TORAD) * (hroofwidth - ax)
   x6 = ax - v3x + v4x: y6 = ay - v3y + v4y: z6 = az - v3z + v4z
   x7 = ax + v3x + v4x: y7 = ay + v3y + v4y: z7 = az + v3z + v4z
   x8 = ax - v3x - v4x: y8 = ay - v3y - v4y: z8 = az - v3z - v4z
   x9 = ax + v3x - v4x: y9 = ay + v3y - v4y: z9 = az + v3z - v4z
   t = TAN(panellift) * panelsiz * 2
   x10 = x8 + t * v2x: y10 = y8 + t * v2y: z10 = z8 + t * v2z
   x11 = x9 + t * v2x: y11 = y9 + t * v2y: z11 = z9 + t * v2z

      'Calculate panel normal vector vertices
   ax = (x6 + x7 + x10 + x11) * .25
   ay = (y6 + y7 + y10 + y11) * .25
   az = (z6 + z7 + z10 + z11) * .25
   nx = (y7 - y6) * (z10 - z6) - (z7 - z6) * (y10 - y6)
   ny = (z7 - z6) * (x10 - x6) - (x7 - x6) * (z10 - z6)
   nz = (x7 - x6) * (y10 - y6) - (y7 - y6) * (x10 - x6)
   t = 1 / SQR(nx * nx + ny * ny + nz * nz)
   nx = nx * t: ny = ny * t: nz = nz * t
     
      'Force camera to be on normal line of first panel
   IF ch% > sunfree% THEN
      ch% = 0
        
         'Preserve distance from center of first panel
      t = SQR((ax - cx) ^ 2 + (ay - cz) ^ 2 + (az + cy) ^ 2)
      cx = ax + COS(southangle * TORAD) * SIN(zenithoffset * TORAD) * t
      cy = ay + SIN(southangle * TORAD) * SIN(zenithoffset * TORAD) * t
      cz = az + COS(zenithoffset * TORAD) * t
   
      kx = ax - cx
      ky = ay - cy
      kz = az - cz
      t = 1# / SQR(kx * kx + ky * ky + kz * kz)
      kx = kx * t: ky = ky * t: kz = kz * t

      SWAP cy, cz: cy = -cy
      SWAP ky, kz: ky = -ky

      IF kx <> 0 OR kz <> 0 THEN ix = kz: iy = 0: iz = -kx
      t = 1# / SQR(ix * ix + iy * iy + iz * iz)
      ix = ix * t: iy = iy * t: iz = iz * t

      jx = ky * iz - kz * iy
      jy = kz * ix - kx * iz
      jz = kx * iy - ky * ix

   END IF
     
   ''dax = ax - cx: day = ay - cz: daz = az + cy
   'dax = kx: day = kz: daz = -ky
   't = 1# / SQR(dax * dax + day * day + daz * daz)
   'dax = dax * t: day = day * t: daz = daz * t
   't = dax * nx + day * ny + daz * nz
   'badang = ABS(arccos(t)): IF t > 0 THEN badang = PI - badang
   'LOCATE 25, 1: PRINT USING "Normal deviation ####.###"; badang * 180! / PI#;

      'Draw compass
   cosang = COS(southangle * TORAD) * 8
   sinang = SIN(southangle * TORAD) * 8
   CALL drawline3d(cosang + hroofwidth, 0, sinang - hroofleng, hroofwidth, 0, -hroofleng, 14)
   CALL drawline3d(hroofwidth, 0, -hroofleng, -cosang + hroofwidth, 0, -sinang - hroofleng, 6)
   CALL drawline3d(sinang + hroofwidth, 0, -cosang - hroofleng, -sinang + hroofwidth, 0, cosang - hroofleng, 6)

   ox = cosang * 1.15 + hroofwidth - cx: oy = -cy: oz = sinang * 1.15 - hroofleng - cz
   rz = kx * ox + ky * oy + kz * oz
   IF rz > CLIPDIST THEN  'Draw 'S'
      r = hz / rz
      sx = (ix * ox + iy * oy + iz * oz) * r + hx
      sy = (jx * ox + jy * oy + jz * oz) * r + hy
      LINE (sx + 3, sy - 3)-(sx - 2, sy - 3), 14
      LINE -(sx - 3, sy - 2), 14: LINE -(sx - 3, sy - 1), 14
      LINE -(sx - 2, sy), 14: LINE -(sx + 2, sy), 14
      LINE -(sx + 3, sy + 1), 14: LINE -(sx + 3, sy + 2), 14
      LINE -(sx + 2, sy + 3), 14: LINE -(sx - 3, sy + 3), 14
   END IF
 
   ox = -cosang * 1.15 + hroofwidth - cx: oy = -cy: oz = -sinang * 1.15 - hroofleng - cz
   rz = kx * ox + ky * oy + kz * oz
   IF rz > CLIPDIST THEN  'Draw 'N'
      r = hz / rz
      sx = (ix * ox + iy * oy + iz * oz) * r + hx
      sy = (jx * ox + jy * oy + jz * oz) * r + hy
      LINE (sx - 3, sy + 3)-(sx - 3, sy - 3), 6
      LINE -(sx + 3, sy + 3), 6: LINE -(sx + 3, sy - 3), 6
   END IF

   ox = -sinang * 1.15 + hroofwidth - cx: oy = -cy: oz = cosang * 1.15 - hroofleng - cz
   rz = kx * ox + ky * oy + kz * oz
   IF rz > CLIPDIST THEN  'Draw 'E'
      r = hz / rz
      sx = (ix * ox + iy * oy + iz * oz) * r + hx
      sy = (jx * ox + jy * oy + jz * oz) * r + hy
      LINE (sx + 3, sy - 3)-(sx - 3, sy - 3), 6
      LINE -(sx - 3, sy + 3), 6: LINE -(sx + 3, sy + 3), 6
      LINE (sx - 3, sy)-(sx + 2, sy), 6
   END IF
 
   ox = sinang * 1.15 + hroofwidth - cx: oy = -cy: oz = -cosang * 1.15 - hroofleng - cz
   rz = kx * ox + ky * oy + kz * oz
   IF rz > CLIPDIST THEN  'Draw 'W'
      r = hz / rz
      sx = (ix * ox + iy * oy + iz * oz) * r + hx
      sy = (jx * ox + jy * oy + jz * oz) * r + hy
      LINE (sx - 4, sy - 3)-(sx - 2, sy + 3), 6
      LINE -(sx, sy - 2), 6: LINE -(sx + 2, sy + 3), 6
      LINE -(sx + 4, sy - 3), 6
   END IF
  
  
      'Convert vertices from overhead to screen coordinate system
   SWAP y0, z0: y0 = -y0
   SWAP y1, z1: y1 = -y1
   SWAP y2, z2: y2 = -y2
   SWAP y3, z3: y3 = -y3
   SWAP y4, z4: y4 = -y4
   SWAP y5, z5: y5 = -y5
   SWAP y6, z6: y6 = -y6
   SWAP y7, z7: y7 = -y7
   SWAP y8, z8: y8 = -y8
   SWAP y9, z9: y9 = -y9
   SWAP y10, z10: y10 = -y10
   SWAP y11, z11: y11 = -y11
   SWAP ay, az: ay = -ay
   SWAP ny, nz: ny = -ny
  
      'Determine which roof faces you're in front of
   p1 = (cy > 0) AND 4
   p2 = (cz < -hroofleng) AND 4
   p3 = (cz > hroofleng) AND 4
  
   ox = (y3 - y1) * (z4 - z1) - (z3 - z1) * (y4 - y1)
   oy = (z3 - z1) * (x4 - x1) - (x3 - x1) * (z4 - z1)
   oz = (x3 - x1) * (y4 - y1) - (y3 - y1) * (x4 - x1)
      '(<cx,cy,cz>-<16,0,0>) dot <ox,oy,oz>
   p4 = ((cx - 16) * ox + cy * oy + cz * oz > 0) AND 4
  
   ox = (y2 - y0) * (z4 - z0) - (z2 - z0) * (y4 - y0)
   oy = (z2 - z0) * (x4 - x0) - (x2 - x0) * (z4 - z0)
   oz = (x2 - x0) * (y4 - y0) - (y2 - y0) * (x4 - x0)
      '(<cx,cy,cz>-<-16,0,0>) dot <ox,oy,oz>
   p5 = ((cx + 16) * ox + cy * oy + cz * oz < 0) AND 4
  
      'Determine which panel 1 faces you're in front of
   ox = (y6 - y7) * (z11 - z7) - (z6 - z7) * (y11 - y7)
   oy = (z6 - z7) * (x11 - x7) - (x6 - x7) * (z11 - z7)
   oz = (x6 - x7) * (y11 - y7) - (y6 - y7) * (x11 - x7)
      '(<cx,cy,cz>-<x7,y7,z7>) dot <ox,oy,oz>
   p6 = ((cx - x7) * ox + (cy - y7) * oy + (cz - z7) * oz < 0) AND 11
 
   ox = (y8 - y9) * (z11 - z9) - (z8 - z9) * (y11 - y9)
   oy = (z8 - z9) * (x11 - x9) - (x8 - x9) * (z11 - z9)
   oz = (x8 - x9) * (y11 - y9) - (y8 - y9) * (x11 - x9)
      '(<cx,cy,cz>-<x9,y9,z9>) dot <ox,oy,oz>
   p7 = ((cx - x9) * ox + (cy - y9) * oy + (cz - z9) * oz > 0) AND 11
 
   ox = (y7 - y9) * (z11 - z9) - (z7 - z9) * (y11 - y9)
   oy = (z7 - z9) * (x11 - x9) - (x7 - x9) * (z11 - z9)
   oz = (x7 - x9) * (y11 - y9) - (y7 - y9) * (x11 - x9)
      '(<cx,cy,cz>-<x9,y9,z9>) dot <ox,oy,oz>
   p8 = ((cx - x9) * ox + (cy - y9) * oy + (cz - z9) * oz < 0) AND 11
 
   ox = (y8 - y10) * (z6 - z10) - (z8 - z10) * (y6 - y10)
   oy = (z8 - z10) * (x6 - x10) - (x8 - x10) * (z6 - z10)
   oz = (x8 - x10) * (y6 - y10) - (y8 - y10) * (x6 - x10)
      '(<cx,cy,cz>-<x10,y10,z10>) dot <ox,oy,oz>
   p9 = ((cx - x10) * ox + (cy - y10) * oy + (cz - z10) * oz > 0) AND 11
  
      'Draw panel 1
   IF p6 THEN
      FOR k = 1 / 4 TO .95 STEP 1 / 4
         CALL drawline3d(x6 + (x10 - x6) * k, y6 + (y10 - y6) * k, z6 + (z10 - z6) * k, x7 + (x11 - x7) * k, y7 + (y11 - y7) * k, z7 + (z11 - z7) * k, 3)
      NEXT k
      FOR k = 1 / 12 TO .95 STEP 1 / 12
         CALL drawline3d(x6 + (x7 - x6) * k, y6 + (y7 - y6) * k, z6 + (z7 - z6) * k, x10 + (x11 - x10) * k, y10 + (y11 - y10) * k, z10 + (z11 - z10) * k, 3 - (ABS(k - .5) < .01) * 8)
      NEXT k
   END IF
   CALL drawline3d(x6, y6, z6, x7, y7, z7, 8 OR p6)
   CALL drawline3d(x7, y7, z7, x9, y9, z9, 8 OR p8)
   CALL drawline3d(x9, y9, z9, x8, y8, z8, 8 OR p7)
   CALL drawline3d(x8, y8, z8, x6, y6, z6, 8 OR p9)
   CALL drawline3d(x8, y8, z8, x10, y10, z10, 8 OR p7 OR p9)
   CALL drawline3d(x9, y9, z9, x11, y11, z11, 8 OR p7 OR p8)
   CALL drawline3d(x6, y6, z6, x10, y10, z10, 8 OR p6 OR p9)
   CALL drawline3d(x7, y7, z7, x11, y11, z11, 8 OR p6 OR p8)
   CALL drawline3d(x10, y10, z10, x11, y11, z11, 8 OR p6 OR p7)
   CALL drawline3d(ax, ay, az, ax + nx * 8, ay + ny * 8, az + nz * 8, 14)
  
   c2xoff = panel2xpos - panel1xpos
   c2yoff = panel2ypos - panel1ypos
   c2zoff = TAN(roofangle * TORAD) * (-(panel2xpos - panel1xpos))
  
      'Determine which panel 2 faces you're in front of
   ox = (y6 - y7) * (z11 - z7) - (z6 - z7) * (y11 - y7)
   oy = (z6 - z7) * (x11 - x7) - (x6 - x7) * (z11 - z7)
   oz = (x6 - x7) * (y11 - y7) - (y6 - y7) * (x11 - x7)
      '(<cx,cy,cz>-<x7,y7,z7>) dot <ox,oy,oz>
   p6 = ((cx - (x7 + c2xoff)) * ox + (cy - (y7 - c2zoff)) * oy + (cz - (z7 + c2yoff)) * oz < 0) AND 11

   ox = (y8 - y9) * (z11 - z9) - (z8 - z9) * (y11 - y9)
   oy = (z8 - z9) * (x11 - x9) - (x8 - x9) * (z11 - z9)
   oz = (x8 - x9) * (y11 - y9) - (y8 - y9) * (x11 - x9)
      '(<cx,cy,cz>-<x9,y9,z9>) dot <ox,oy,oz>
   p7 = ((cx - (x9 + c2xoff)) * ox + (cy - (y9 - c2zoff)) * oy + (cz - (z9 + c2yoff)) * oz > 0) AND 11

   ox = (y7 - y9) * (z11 - z9) - (z7 - z9) * (y11 - y9)
   oy = (z7 - z9) * (x11 - x9) - (x7 - x9) * (z11 - z9)
   oz = (x7 - x9) * (y11 - y9) - (y7 - y9) * (x11 - x9)
      '(<cx,cy,cz>-<x9,y9,z9>) dot <ox,oy,oz>
   p8 = ((cx - (x9 + c2xoff)) * ox + (cy - (y9 - c2zoff)) * oy + (cz - (z9 + c2yoff)) * oz < 0) AND 11

   ox = (y8 - y10) * (z6 - z10) - (z8 - z10) * (y6 - y10)
   oy = (z8 - z10) * (x6 - x10) - (x8 - x10) * (z6 - z10)
   oz = (x8 - x10) * (y6 - y10) - (y8 - y10) * (x6 - x10)
      '(<cx,cy,cz>-<x10,y10,z10>) dot <ox,oy,oz>
   p9 = ((cx - (x10 + c2xoff)) * ox + (cy - (y10 - c2zoff)) * oy + (cz - (z10 + c2yoff)) * oz > 0) AND 11
  
      'Draw panel 2
   IF p6 THEN
      FOR k = 1 / 4 TO .95 STEP 1 / 4
         CALL drawline3d(x6 + (x10 - x6) * k + c2xoff, y6 + (y10 - y6) * k - c2zoff, z6 + (z10 - z6) * k + c2yoff, x7 + (x11 - x7) * k + c2xoff, y7 + (y11 - y7) * k - c2zoff, z7 + (z11 - z7) * k + c2yoff, 3)
      NEXT k
      FOR k = 1 / 12 TO .95 STEP 1 / 12
         CALL drawline3d(x6 + (x7 - x6) * k + c2xoff, y6 + (y7 - y6) * k - c2zoff, z6 + (z7 - z6) * k + c2yoff, x10 + (x11 - x10) * k + c2xoff, y10 + (y11 - y10) * k - c2zoff, z10 + (z11 - z10) * k + c2yoff, 3 - (ABS(k - .5) < .01) * 8)
      NEXT k
   END IF
   CALL drawline3d(x6 + c2xoff, y6 - c2zoff, z6 + c2yoff, x7 + c2xoff, y7 - c2zoff, z7 + c2yoff, 8 OR p6)
   CALL drawline3d(x7 + c2xoff, y7 - c2zoff, z7 + c2yoff, x9 + c2xoff, y9 - c2zoff, z9 + c2yoff, 8 OR p8)
   CALL drawline3d(x9 + c2xoff, y9 - c2zoff, z9 + c2yoff, x8 + c2xoff, y8 - c2zoff, z8 + c2yoff, 8 OR p7)
   CALL drawline3d(x8 + c2xoff, y8 - c2zoff, z8 + c2yoff, x6 + c2xoff, y6 - c2zoff, z6 + c2yoff, 8 OR p9)
   CALL drawline3d(x8 + c2xoff, y8 - c2zoff, z8 + c2yoff, x10 + c2xoff, y10 - c2zoff, z10 + c2yoff, 8 OR p7 OR p9)
   CALL drawline3d(x9 + c2xoff, y9 - c2zoff, z9 + c2yoff, x11 + c2xoff, y11 - c2zoff, z11 + c2yoff, 8 OR p7 OR p8)
   CALL drawline3d(x6 + c2xoff, y6 - c2zoff, z6 + c2yoff, x10 + c2xoff, y10 - c2zoff, z10 + c2yoff, 8 OR p6 OR p9)
   CALL drawline3d(x7 + c2xoff, y7 - c2zoff, z7 + c2yoff, x11 + c2xoff, y11 - c2zoff, z11 + c2yoff, 8 OR p6 OR p8)
   CALL drawline3d(x10 + c2xoff, y10 - c2zoff, z10 + c2yoff, x11 + c2xoff, y11 - c2zoff, z11 + c2yoff, 8 OR p6 OR p7)
   CALL drawline3d(ax + c2xoff, ay - c2zoff, az + c2yoff, ax + nx * 8 + c2xoff, ay + ny * 8 - c2zoff, az + nz * 8 + c2yoff, 14)
     
      'Draw house
   CALL drawline3d(x0 + 1, y0, z0, x0 + 1, y0 + roofbaseheight, z0, 8)
   CALL drawline3d(x1 - 1, y1, z1, x1 - 1, y1 + roofbaseheight, z1, 8)
   CALL drawline3d(x2 + 1, y2, z2, x2 + 1, y2 + roofbaseheight, z2, 8)
   CALL drawline3d(x3 - 1, y3, z3, x3 - 1, y3 + roofbaseheight, z3, 8)
   CALL drawline3d(x0 + 1, y0 + roofbaseheight, z0, x1 - 1, y1 + roofbaseheight, z1, 8)
   CALL drawline3d(x1 - 1, y1 + roofbaseheight, z1, x3 - 1, y3 + roofbaseheight, z3, 8)
   CALL drawline3d(x3 - 1, y3 + roofbaseheight, z3, x2 + 1, y2 + roofbaseheight, z2, 8)
   CALL drawline3d(x2 + 1, y2 + roofbaseheight, z2, x0 + 1, y0 + roofbaseheight, z0, 8)
      'Draw roof
   CALL drawline3d(x0, y0, z0, x1, y1, z1, 8 OR p1 OR p2)
   CALL drawline3d(x1, y1, z1, x3, y3, z3, 8 OR p1 OR p4)
   CALL drawline3d(x3, y3, z3, x2, y2, z2, 8 OR p1 OR p3)
   CALL drawline3d(x2, y2, z2, x0, y0, z0, 8 OR p1 OR p5)
   CALL drawline3d(x0, y0, z0, x4, y4, z4, 8 OR p2 OR p5)
   CALL drawline3d(x4, y4, z4, x1, y1, z1, 8 OR p2 OR p4)
   CALL drawline3d(x2, y2, z2, x5, y5, z5, 8 OR p3 OR p5)
   CALL drawline3d(x5, y5, z5, x3, y3, z3, 8 OR p3 OR p4)
   CALL drawline3d(x4, y4, z4, x5, y5, z5, 8 OR p4 OR p5)
  
   SCREEN , , pag%, 1 - pag%: pag% = 1 - pag%
   WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8

   z$ = INKEY$: DEF SEG = &H0
   spd = (PEEK(&H417) AND 1) * 7 + 1
   IF z$ = CHR$(0) + CHR$(72) THEN cx = cx + kx * spd: cy = cy + ky * spd: cz = cz + kz * spd
   IF z$ = CHR$(0) + CHR$(80) THEN cx = cx - kx * spd: cy = cy - ky * spd: cz = cz - kz * spd
   IF (PEEK(&H417) AND 4) THEN cx = cx - jx * spd: cy = cy - jy * spd: cz = cz - jz * spd
   IF z$ = "0" THEN cx = cx + jx * spd: cy = cy + jy * spd: cz = cz + jz * spd
   IF z$ = CHR$(0) + CHR$(75) THEN cx = cx - ix * spd: cy = cy - iy * spd: cz = cz - iz * spd
   IF z$ = CHR$(0) + CHR$(77) THEN cx = cx + ix * spd: cy = cy + iy * spd: cz = cz + iz * spd
  
   a1v = a1v * .8: a2v = a2v * .8: a3v = a3v * .8
   regs%(0) = 11: CALL int86old(&H33, regs%(), regs%())
   mousx% = regs%(2): mousy% = regs%(3)
   IF mousx% <> 0 OR mousy% <> 0 THEN
      regs%(0) = 5: CALL int86old(&H33, regs%(), regs%())
      IF (regs%(0) AND 1) THEN
         panel1xpos = panel1xpos + mousy% / 8
         panel1ypos = panel1ypos + mousx% / 8
      ELSEIF (regs%(0) AND 2) THEN
         panel2xpos = panel2xpos + mousy% / 8
         panel2ypos = panel2ypos + mousx% / 8
      ELSE
         a1v = 0: a2v = a2v - mousy% * (hx / hz) / 256: a3v = a3v + mousx% * (hx / hz) / 256
      END IF
   END IF

   cosa1 = COS(a1v): sina1 = SIN(a1v)
   cosa2 = COS(a2v): sina2 = SIN(a2v)
   cosa3 = COS(a3v): sina3 = SIN(a3v)
   c1c3 = cosa1 * cosa3: c1s3 = cosa1 * sina3
   s1c3 = sina1 * cosa3: s1s3 = sina1 * sina3
   rr(0) = s1s3 * sina2 + c1c3: rr(1) = -c1s3 * sina2 + s1c3: rr(2) = sina3 * cosa2
   rr(3) = -cosa2 * sina1: rr(4) = cosa2 * cosa1: rr(5) = sina2
   rr(6) = s1c3 * sina2 - c1s3: rr(7) = -c1c3 * sina2 - s1s3: rr(8) = cosa3 * cosa2
   ox = ix: oy = jx: oz = kx
   ix = ox * rr(0) + oy * rr(3) + oz * rr(6)
   jx = ox * rr(1) + oy * rr(4) + oz * rr(7)
   kx = ox * rr(2) + oy * rr(5) + oz * rr(8)
   ox = iy: oy = jy: oz = ky
   iy = ox * rr(0) + oy * rr(3) + oz * rr(6)
   jy = ox * rr(1) + oy * rr(4) + oz * rr(7)
   ky = ox * rr(2) + oy * rr(5) + oz * rr(8)
   ox = iz: oy = jz: oz = kz
   iz = ox * rr(0) + oy * rr(3) + oz * rr(6)
   jz = ox * rr(1) + oy * rr(4) + oz * rr(7)
   kz = ox * rr(2) + oy * rr(5) + oz * rr(8)

   jy = jy + 1
   ix = jy * kz - jz * ky
   iy = jz * kx - jx * kz
   iz = jx * ky - jy * kx
   t = 1 / SQR(ix * ix + iy * iy + iz * iz)
   ix = ix * t: iy = iy * t: iz = iz * t
   jx = ky * iz - kz * iy
   jy = kz * ix - kx * iz
   jz = kx * iy - ky * ix

LOOP WHILE z$ <> CHR$(27)

FUNCTION arccos (a)
   IF a = 0# THEN arccos = PI * .5#: EXIT FUNCTION
   IF a < -1 THEN a = -1: SOUND 37, .03
   IF a > 1 THEN a = 1: SOUND 37, .03
   arccos = ATN(SQR(1# - a * a) / a)
END FUNCTION

FUNCTION arcsin (a)
   IF a < -1 THEN a = -1: SOUND 37, .03
   IF a > 1 THEN a = 1: SOUND 37, .03
   IF a = 1 THEN arcsin = PI * .5: EXIT FUNCTION
   IF a = -1 THEN arcsin = -PI * .5: EXIT FUNCTION
   arcsin = ATN(a / SQR(1# - a * a))
END FUNCTION

SUB drawline3d (x0, y0, z0, x1, y1, z1, col)
   ox = x0 - cx: oy = y0 - cy: oz = z0 - cz
   rx0 = ix * ox + iy * oy + iz * oz
   ry0 = jx * ox + jy * oy + jz * oz
   rz0 = kx * ox + ky * oy + kz * oz
    
   ox = x1 - cx: oy = y1 - cy: oz = z1 - cz
   rx1 = ix * ox + iy * oy + iz * oz
   ry1 = jx * ox + jy * oy + jz * oz
   rz1 = kx * ox + ky * oy + kz * oz

   IF rz0 < CLIPDIST THEN
      IF rz1 < CLIPDIST THEN EXIT SUB
      t = (CLIPDIST - rz0) / (rz1 - rz0)
      rx0 = rx0 + (rx1 - rx0) * t
      ry0 = ry0 + (ry1 - ry0) * t
      rz0 = CLIPDIST
   ELSEIF rz1 < CLIPDIST THEN
      t = (CLIPDIST - rz1) / (rz0 - rz1)
      rx1 = rx1 + (rx0 - rx1) * t
      ry1 = ry1 + (ry0 - ry1) * t
      rz1 = CLIPDIST
   END IF
   r0 = hz / rz0: r1 = hz / rz1
   IF col = 8 THEN mask = &H2222 ELSE mask = &HFFFF
   LINE (rx0 * r0 + hx, ry0 * r0 + hy)-(rx1 * r1 + hx, ry1 * r1 + hy), col, , mask
END SUB

SUB solvepanelangle (roofangle, southangle, zenithoffset, panelang, panellift)

   'Given roof:
   '   roofangle = 30 (slope of roof from horizontal)
   '   southangle = -62 (angle from an ideal roof that faces south)
   'Given desired panel elevation:
   '   zenithoffset = 40 (0ø: panel straight up, 90ø: panel on its side)
   'Calculates panel position:
   '   panelang = ? (angle between panel's pivot edge & horizontal roof side)
   '   panellift = ? (angle necessary for roof rack)

      'Calculate roof normal (unit vector)
   rx = 0#
   ry = SIN(roofangle * TORAD)
   rz = -COS(roofangle * TORAD)
    
      'Calculate south direction (unit vector)
   t = SIN(zenithoffset * TORAD)
   sx = -SIN(southangle * TORAD) * t
   sy = COS(southangle * TORAD) * t
   sz = -COS(zenithoffset * TORAD)

      'l = cross product of previous 2 vectors (Note: Not unit vector!)
   lx = ry * sz - rz * sy
   ly = rz * sx - rx * sz
   lz = rx * sy - ry * sx
     
   t = lx * lx + ly * ly + lz * lz
   IF t = 0 THEN panelang = 0: panellift = 0: EXIT SUB
      '<lx,ly,lz> dot <1,0,0> = ³<lx,ly,lz>³*³<1,0,0>³*cos(panelang)
   panelang = arccos(lx / SQR(t))
   IF lx < 0 THEN panelang = panelang + PI
   IF sx < 0 THEN panelang = PI * 2# - panelang

      '<sx,sy,sz> dot <rx,ry,rz> = ³<sx,sy,sz>³*³<rx,ry,rz>³*cos(panellift)
   panellift = arccos(sx * rx + sy * ry + sz * rz)
   IF panellift < 0 THEN panellift = -PI: panelang = 0
END SUB

