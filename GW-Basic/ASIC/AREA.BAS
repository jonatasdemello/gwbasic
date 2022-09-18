1 REM Sample GWBASIC program (can be converted with BAS2ASI)
10 PI=3.14159
20 INPUT "Enter the radius of a circle (or 0 to quit)";R
30 IF R<0 THEN 20
40 IF R=0 THEN END
50 AREA=PI*R*R
60 PRINT "The area of the circle is ";AREA
70 GOTO 20
