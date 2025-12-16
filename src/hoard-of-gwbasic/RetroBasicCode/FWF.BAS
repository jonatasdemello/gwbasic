5 CLS:dim b(10000)
10 SCREEN 1:DX=20:'window (0,0)-(319,199)
15 'WINDOW SCREEN (0,0)-(1500,1500):DX=1000:DY=1000
20 REM ************************************************************************
30 REM *** FWF INSIGNE de DARCHE Yoann en BASICA avec un ‚cran CGA          ***
40 REM ************************************************************************
50 DATA 32,75,95,75,120,111,135,85,120,50,129,50,145,75,162,50,171,50,153,85,170
60 DATA 111,189,83,-1,-1,204,84,225,88,225,100,195,100,170,150,145,100,120,150
70 DATA 86,85,22,96,-2,-2
80 REM -1,-1 = arrˆt pas de liason avec la prochŠne coordonn‚e. -2,-2 fin
90 READ X,Y:IF X=-2 THEN 200 'fin
100 PSET (X+DX,Y+DY),1
110 READ X1,Y1:IF X1=-2 THEN 200' fin
120 IF X1=-1 THEN 90 'pas de liaison avec la prochaine coordonn‚e
130 LINE -(X1+DX,Y1+DY),1:GOTO 110
199 REM *************************$ Les cercles *********************************
200 CIRCLE (145+DX,150+DY),149,1,1,3.14
210 CIRCLE (151+DX,146+DY),142,1,0,3.18
220 LINE (-4+DX,150+DY)-(9+DX,150+DY),1
230 CIRCLE (227+DX,91+DY),41,1,1.3,2.3,2.5/2
240 LINE (170+DX,111+DY)-(205+DX,60+DY),1
250 CIRCLE (237+DX,137+DY),71,1,.6,2.3,2.8/2
260 PAINT (145+DX,90+DY),1
270 PAINT (10+DX,100+DY),1
280 LINE (163+DX,28+DY)-(166+DX,28+DY),1
290 PSET(172+DX,29+DY),1:PSET (256+DX,67+DY),1
300 PSET(262+DX,74+DY),1:PSET(263+DX,75+DY),1:PSET(24+DX,95+DY),1
310 get (0,0)-(319,199),b:cls
Put (0,0),b,pset
def seg=&hb800
bsave "a:fwf.pic",0,16384


