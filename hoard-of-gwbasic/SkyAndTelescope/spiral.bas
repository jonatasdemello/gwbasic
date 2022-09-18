100 REM   SPIRAL.BAS -- A PROGRAM 
110 REM   TO CREATE SPIRAL GAL-
120 REM   AXIES OF MANY TYPES
130 REM
140 REM    PH = angle phi
150 REM    W = orientation angle
160 REM    I = inclination angle
170 REM
180 PI=3.14159:  DR=PI/180
190 REM  DR = radians per degree
200 PRINT "Input values:"
210 INPUT "  Alpha, beta";A1,B1
220 INPUT "  Inclination (deg)";I
230 INPUT "  Orientation (deg)";W
240 XC=300: YC=150: MX=40: MY=28
250 I=I*DR: W=W*DR
260 CLS
270 SCREEN 9
280 CIRCLE (XC,YC),10
290 F=0:  GOSUB 320: REM  1st arm
300 F=PI: GOSUB 320: REM  2nd arm
310 END
320 REM      DRAW AN ARM
330 PSET(XC,YC)
340 FOR J=1 TO 100
350 R=J/20
360 IF R<1 THEN PH=(A1-B1)*R
370 IF R<1 THEN 390
380 PH=A1-B1*R+A1*LOG(R)
390 X=MX*R*COS(PH+W+F)+XC
400 Y=MY*R*SIN(PH+W+F)*COS(I)+YC
410 REM    PRINT X;Y
420 LINE -(X,Y)
430 NEXT J
440 RETURN
450 REM ***************************************
460 REM   APPEARED IN ASTRONOMICAL COMPUTING
470 REM   SKY & TELESCOPE - DECEMBER 1990 ISSUE
480 REM ***************************************