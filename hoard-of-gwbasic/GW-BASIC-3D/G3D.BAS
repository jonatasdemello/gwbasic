   10 REM *************************************************************
   20 REM * 3D Graphics program. Written by: Tamas Bolner, 2019-09-22 *
   30 REM *************************************************************
   35 KEY OFF
   36 SCREEN 0, 0, 0, 0: CLS
   40 ACTIVE = 0: REM The screen where we draw. If 0 then 1 is shown.
   45 RADIUS = 50: BASE = 11: POINTS = BASE * BASE: MAXFRAME = 20
   50 DIM M(6, 4, 4): REM The global array of all 4x4 matrices
   60 DIM P(POINTS + 1, 3)
   65 DIM H(MAXFRAME + 1, POINTS, 2)
   70 REM *******************************
   80 REM * Generate the shape (sphere) *
   90 REM *******************************
   95 PRINT "Constructing the object"
  100 PI = 3.14159
  115 HALF = (BASE - 1) / 2
  120 FOR I = 0 TO BASE - 1: FOR J = 0 TO BASE - 1
  122 D = (I - HALF) / HALF: CR = SQR(1 - D*D) * RADIUS
  130 P(I*BASE + J, 0) = COS((2*PI/(BASE-1)) * J) * CR
  140 P(I*BASE + J, 1) = SIN((2*PI/(BASE-1)) * J) * CR
  150 P(I*BASE + J, 2) = (RADIUS/BASE) * I * 2.2
  160 NEXT J: NEXT I
 1000 REM ********************************
 1010 REM * Render points using matrices *
 1020 REM ********************************
 1040 PRINT "Rendering the screen coordinates of the points"
 1050 ALPHA = 0: AI = PI*2 / (10 * BASE)
 1060 FOR I=0 TO .96 STEP .05
 1065 PRINT INT(I*100);"% ";
 1070 BETA = PI * 2 * I: FRAME = INT(I * 20)
 1080 SY = 1: SX = ALPHA: GOSUB 6230: REM M(1) = rotZ(ALPHA)
 1090 SY = 2: SX = BETA: GOSUB 6130: REM M(2) = rotY(BETA)
 1100 SW = 3: SX = 0: SY = 0: SZ = 60: GOSUB 6010: REM M(3) = Translation
 1110 SZ = 4: SX = 2: SY = 1: GOSUB 5100: REM M(4) = M(2)*M(1)
 1120 SZ = 5: SX = 3: SY = 4: GOSUB 5100: REM M(5) = M(3)*M(4)
 1130 FOR SX = 0 TO POINTS - 1: SY = 5: GOSUB 5640
 1132 SY = FRAME: GOSUB 5825: REM Projection
 1136 NEXT SX
 1160 ALPHA = ALPHA + AI
 1170 NEXT I
 2000 REM *************
 2010 REM * Animation *
 2020 REM *************
 2100 FOR I = 0 TO 19
 2110 GOSUB 5030: REM Switch screens
 2460 SX = I: GOSUB 5870: REM Display
 2470 A$ = INKEY$: IF A$ <> "" THEN SCREEN 9, 0, ACTIVE, ACTIVE: END
 2480 NEXT I
 2600 GOTO 2100
 5000 REM *****************************
 5010 REM * Subroutine: Switch screen *
 5020 REM *****************************
 5030 ACTIVE = 1 - ACTIVE
 5040 SCREEN 9, 0, ACTIVE, 1 - ACTIVE
 5050 CLS 1
 5060 RETURN
 5070 REM *********************************
 5080 REM * Subroutine: Multiply matrices *
 5085 REM *   M(SZ) = M(SX) * M(SY)       *
 5090 REM *********************************
 5100 M(SZ,0,0) = M(SX,0,0)*M(SY,0,0) + M(SX,1,0)*M(SY,0,1) + M(SX,2,0)*M(SY,0,2) + M(SY,3,0)*M(SY,0,3)
 5110 M(SZ,0,1) = M(SX,0,1)*M(SY,0,0) + M(SX,1,1)*M(SY,0,1) + M(SX,2,1)*M(SY,0,2) + M(SY,3,1)*M(SY,0,3)
 5120 M(SZ,0,2) = M(SX,0,2)*M(SY,0,0) + M(SX,1,2)*M(SY,0,1) + M(SX,2,2)*M(SY,0,2) + M(SY,3,2)*M(SY,0,3)
 5130 M(SZ,0,3) = M(SX,0,3)*M(SY,0,0) + M(SX,1,3)*M(SY,0,1) + M(SX,2,3)*M(SY,0,2) + M(SY,3,3)*M(SY,0,3)
 5200 M(SZ,1,0) = M(SX,0,0)*M(SY,1,0) + M(SX,1,0)*M(SY,1,1) + M(SX,2,0)*M(SY,1,2) + M(SY,3,0)*M(SY,1,3)
 5210 M(SZ,1,1) = M(SX,0,1)*M(SY,1,0) + M(SX,1,1)*M(SY,1,1) + M(SX,2,1)*M(SY,1,2) + M(SY,3,1)*M(SY,1,3)
 5220 M(SZ,1,2) = M(SX,0,2)*M(SY,1,0) + M(SX,1,2)*M(SY,1,1) + M(SX,2,2)*M(SY,1,2) + M(SY,3,2)*M(SY,1,3)
 5230 M(SZ,1,3) = M(SX,0,3)*M(SY,1,0) + M(SX,1,3)*M(SY,1,1) + M(SX,2,3)*M(SY,1,2) + M(SY,3,3)*M(SY,1,3)
 5300 M(SZ,2,0) = M(SX,0,0)*M(SY,2,0) + M(SX,1,0)*M(SY,2,1) + M(SX,2,0)*M(SY,2,2) + M(SY,3,0)*M(SY,2,3)
 5310 M(SZ,2,1) = M(SX,0,1)*M(SY,2,0) + M(SX,1,1)*M(SY,2,1) + M(SX,2,1)*M(SY,2,2) + M(SY,3,1)*M(SY,2,3)
 5320 M(SZ,2,2) = M(SX,0,2)*M(SY,2,0) + M(SX,1,2)*M(SY,2,1) + M(SX,2,2)*M(SY,2,2) + M(SY,3,2)*M(SY,2,3)
 5330 M(SZ,2,3) = M(SX,0,3)*M(SY,2,0) + M(SX,1,3)*M(SY,2,1) + M(SX,2,3)*M(SY,2,2) + M(SY,3,3)*M(SY,2,3)
 5400 M(SZ,3,0) = M(SX,0,0)*M(SY,3,0) + M(SX,1,0)*M(SY,3,1) + M(SX,2,0)*M(SY,3,2) + M(SY,3,0)*M(SY,3,3)
 5410 M(SZ,3,1) = M(SX,0,1)*M(SY,3,0) + M(SX,1,1)*M(SY,3,1) + M(SX,2,1)*M(SY,3,2) + M(SY,3,1)*M(SY,3,3)
 5420 M(SZ,3,2) = M(SX,0,2)*M(SY,3,0) + M(SX,1,2)*M(SY,3,1) + M(SX,2,2)*M(SY,3,2) + M(SY,3,2)*M(SY,3,3)
 5430 M(SZ,3,3) = M(SX,0,3)*M(SY,3,0) + M(SX,1,3)*M(SY,3,1) + M(SX,2,3)*M(SY,3,2) + M(SY,3,3)*M(SY,3,3)
 5440 RETURN
 5600 REM ***************************************************
 5610 REM * Subroutine: Left-multiply a point with a matrix *
 5620 REM *    P(POINTS) = M(SY) * P(SX)                    *
 5630 REM ***************************************************
 5640 P(POINTS,0) = M(SY,0,0)*P(SX,0) + M(SY,1,0)*P(SX,1) + M(SY,2,0)*P(SX,2) + M(SY,3,0)
 5650 P(POINTS,1) = M(SY,0,1)*P(SX,0) + M(SY,1,1)*P(SX,1) + M(SY,2,1)*P(SX,2) + M(SY,3,1)
 5660 P(POINTS,2) = M(SY,0,2)*P(SX,0) + M(SY,1,2)*P(SX,1) + M(SY,2,2)*P(SX,2) + M(SY,3,2)
 5670 RETURN
 5800 REM **********************************
 5810 REM * Subroutine: Plane intersection *
 5815 REM *  H(SY, SX) = 2D point          *
 5820 REM **********************************
 5825 SF = -150: REM The Z coordinate of the focal point
 5840 H(SY,SX,0) = -SF*P(POINTS,0) * 2 / (P(POINTS,2)-SF)
 5850 H(SY,SX,1) = -SF*P(POINTS,1) * 2 / (P(POINTS,2)-SF)
 5860 RETURN
 5861 REM ***********************
 5862 REM * Subroutine: Display *
 5863 REM *   SX: Current frame *
 5865 REM ***********************
 5870 FOR SI = 0 TO BASE - 2: FOR SJ = 0 TO BASE - 2
 5875 ST = SI * BASE + SJ
 5880 SX1 = H(SX, ST, 0) + 320: SY1 = 175 - H(SX, ST, 1)
 5885 ST2 = ST + BASE
 5890 SX2 = H(SX, ST2, 0) + 320: SY2 = 175 - H(SX, ST2, 1)
 5895 ST2 = ST + 1
 5900 SX3 = H(SX, ST2, 0) + 320: SY3 = 175 - H(SX, ST2, 1)
 5910 LINE (SX1, SY1) - (SX2, SY2)
 5920 LINE (SX1, SY1) - (SX3, SY3)
 5930 NEXT SJ: NEXT SI
 5940 RETURN
 6000 REM *****************************************
 6010 REM * Subroutine: Create translation matrix *
 6015 REM *   M(SW) = t(SX, SY, SZ)               *
 6020 REM *****************************************
 6030 M(SW,0,0) = 1: M(SW,1,1) = 1: M(SW,2,2) = 1: M(SW,3,3) = 1
 6040 M(SW,1,0) = 0: M(SW,2,0) = 0: M(SW,0,1) = 0: M(SW,0,2) = 0: M(SW,0,3) = 0
 6050 M(SW,1,2) = 0: M(SW,1,3) = 0: M(SW,2,3) = 0: M(SW,2,1) = 0
 6060 M(SW,3,0) = SX: M(SW,3,1) = SY: M(SW,3,2) = SZ
 6070 RETURN
 6100 REM *****************************************************
 6110 REM * Subroutine: Create rotation matrix: around Y axis *
 6115 REM *   M(SY) = rotY(SX)                                *
 6120 REM *****************************************************
 6130 M(SY,0,0) = COS(SX): M(SY,1,0) = 0: M(SY,2,0) = SIN(SX): M(SY,3,0) = 0
 6140 M(SY,0,1) = 0: M(SY,1,1) = 1: M(SY,2,1) = 0: M(SY,3,1) = 0
 6150 M(SY,0,2) = -SIN(SX): M(SY,1,2) = 0: M(SY,2,2) = COS(SX): M(SY,3,2) = 0
 6160 M(SY,0,3) = 0: M(SY,1,3) = 0: M(SY,2,3) = 0: M(SY,3,3) = 1
 6170 RETURN
 6200 REM *****************************************************
 6210 REM * Subroutine: Create rotation matrix: around Z axis *
 6215 REM *   M(SY) = rotZ(SX)                                *
 6220 REM *****************************************************
 6230 M(SY,0,0) = COS(SX): M(SY,1,0) = SIN(SX): M(SY,2,0) = 0: M(SY,3,0) = 0
 6240 M(SY,0,1) = -SIN(SX): M(SY,1,1) = COS(SX): M(SY,2,1) = 0: M(SY,3,1) = 0
 6250 M(SY,0,2) = 0: M(SY,1,2) = 0: M(SY,2,2) = 1: M(SY,3,2) = 0
 6260 M(SY,0,3) = 0: M(SY,1,3) = 0: M(SY,2,3) = 0: M(SY,3,3) = 1
 6270 RETURN
