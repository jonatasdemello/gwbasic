DECLARE FUNCTION F1! (x!, z!)
DECLARE FUNCTION F2! (x!, z!)
DECLARE FUNCTION F3! (x!, z!)
DECLARE FUNCTION F4! (x!, z!)

DIM largura, altura, va, xfal, zfal, tamanho, prof

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

REM calcular valores
PRINT " Calculando ... "
FOR a = -(prof / 2) TO (prof / 2)
        FOR b = -(tamanho / 2) TO (tamanho / 2)
                x = a * 18 / tamanho
                z = b * 18 / prof
                REM func�o grafica
                y = F1(x, z)
                g(b + (tamanho / 2), a + (prof / 2)) = y * va * altura
        NEXT b
NEXT a

REM hrg2: hcolor7
REM SCREEN 12 OK
SCREEN 13

REM plano x-y
FOR z = 1 TO prof
        x = 1
        xbase = xfal * z
        zbase = (altura / 2) + (z * zfal) + (inicio * va)
        xvelho = xbase + xfal
        zvelho = 191 - zbase + (x * zfal) + g(x, z)
        FOR x = 1 TO tamanho
                xnovo = xbase + (x * xfal)
                znovo = 191 - zbase + (x * zfal) + g(x, z)
                REM plotar
                REM hplot xvelho,zvelho to xnovo,znovo
                LINE (xvelho, zvelho)-(xnovo, znovo), 1
                xvelho = xnovo
                zvelho = znovo
        NEXT x
NEXT z

REM plano z-y
FOR x = 1 TO tamanho
        xbase = (xfal * x) + (prof * xfal)
        zbase = (altura / 2) - (x * zfal) + (prof * zfal) + (inicio * va)
        xvelho = xbase - xfal
        zvelho = 191 - zbase + zfal + g(x, prof - 1)
        FOR z = 0 TO prof - 1
                xnovo = xbase - (z * xfal)
                znovo = 191 - zbase + (z * zfal) + g(x, prof - z)
                REM plotar
                REM hplot xvelho,zvelho to xnovo,znovo
                LINE (xvelho, zvelho)-(xnovo, znovo), 2
                xvelho = xnovo
                zvelho = znovo
        NEXT z
NEXT x


float F1 (float x, float z)
{
    F1 = (SIN(x) + COS(z)) / 60

}

float F2 (float x, float z)
{
    F2 = SIN(x + z) / 24

}

float F3 (float x, float z)
{
    DIM c
    
    c = 50 - (x * x) - (z * z)
    F3 = SQR(c * (SGN(c) + 1)) / 30

}


float F4 (float x, float z)
{
    DIM c
    
    c = (x * x) + (z * z) + .00001
    
    F4 = SGN(INT(13 / c)) / 3 + SGN(INT(35 / c)) / 15

}

