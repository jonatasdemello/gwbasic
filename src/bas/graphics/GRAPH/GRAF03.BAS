
REM inicializar variaveis
largura = 280
altura = 190
va = -1
xfal = 5
zfal = 3
tamanho = INT(largura / xfal / 2)
prof = INT(altura / zfal / 3)

inicio = 5
DIM g(tamanho, prof)

PRINT " Calculando ... "
FOR a = -(prof / 2) TO (prof / 2)
	FOR b = -(tamanho / 2) TO (tamanho / 2)
		REM PRINT "a>"; a
		REM PRINT "b>"; b
		X = a * 18 / tamanho
		z = b * 18 / prof
	       
		REM funcão grafica
		REM F1
		REM y = (SIN(x) + COS(z)) / 60
		REM F2
		REM y = SIN(x + z) / 24
		REM F3
		REM c = 50 - (x * x) - (z * z)
		REM y = SQR(c * (SGN(c) + 1)) / 30
		REM F4
		REM c = (x * x) + (z * z) + .00001
		REM y = SGN(INT(13 / c)) / 3 + SGN(INT(35 / c)) / 15

		 y = 0
		g(b + (tamanho / 2), a + (prof / 2)) = y * va * altura
	NEXT b
NEXT a

REM hrg2: hcolor7
REM SCREEN 12 OK
SCREEN 13

REM plano x-y
FOR z = 1 TO prof
	X = 1
	xbase = xfal * z
	zbase = (altura / 2) + (z * zfal) + (inicio * va)
	xvelho = xbase + xfal
	zvelho = 191 - zbase + (X * zfal) + g(X, z)
	FOR X = 1 TO tamanho
		xnovo = xbase + (X * xfal)
		znovo = 191 - zbase + (X * zfal) + g(X, z)
		REM plotar
		REM hplot xvelho,zvelho to xnovo,znovo
		LINE (xvelho, zvelho)-(xnovo, znovo), 1
		xvelho = xnovo
		zvelho = znovo
	NEXT X
NEXT z

REM plano z-y
FOR X = 1 TO tamanho
	xbase = (xfal * X) + (prof * xfal)
	zbase = (altura / 2) - (X * zfal) + (prof * zfal) + (inicio * va)
	xvelho = xbase - xfal
	zvelho = 191 - zbase + zfal + g(X, prof - 1)
	FOR z = 0 TO prof - 1
		xnovo = xbase - (z * xfal)
		znovo = 191 - zbase + (z * zfal) + g(X, prof - z)
		REM plotar
		REM hplot xvelho,zvelho to xnovo,znovo
		LINE (xvelho, zvelho)-(xnovo, znovo), 2
		xvelho = xnovo
		zvelho = znovo
	NEXT z
NEXT X

REM FIM


