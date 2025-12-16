REM *******************************************************
REM * FLAK Eksplozija
REM * verzija 4
REM * by Konrad (c)2002
REM *******************************************************

'   FLAK Explosion simulation!
'   Contact me at kburnik@twister.zrs.hr!
'   Flak Explosion v4.0 Simulation of an exploding Flak shell in MS-DOS QBASIC. 
'   This is version 4! Includes simple projectile motion physics simulation! 

'Flak Cannon je oruzje iz Unreal Tournamenta koje ispaljuje
'male shrapnele metala, koji razderu metu na komadice. (ako je pogode)
'Ovo je pokusaj simulacije takvog ispaljivanja.
'Shrapneli se inace odbijaju od zidova, a ovdje se odbijaju od poda.
'Jos bi trebalo uvesti rotaciju svake cestice oko svoje osi, ali
'to cuvam za verziju 5!

' *******************************************************
' Konstante:
' *******************************************************
' boja - odreduje boju cestica
' pauza - vrijeme u ms koje predstavlja duzinu pauze
' ako je stvar prebrza onda ovo povecaj, ako je prespora
' onda smanji (nemre bit jednostavnije )
' MAX - odreduje broj cestica (mozes promijeniti ako zelis )
' PI - dobri stari 3.14 (za pretvorbu kuteva u radijane) ;)
' k - konstanta trenja
' *******************************************************

boja = 7
pauza = .006
k = .1: DT = 1
CONST MAX = 100
CONST PI = 3.14159

'Flak eksplozija je obicna primjena gibanja kosog hica iz fizike, pa tako
'definiramo cestice koje nam za to odgovaraju!
'A, dobro ima tu i elastike, ali samo malo ... ;)

' *******************************************************
' * Definicija cestice:
' *******************************************************
'  x,y - polozaj u prostoru
'  an -pocetni kut putanje
'  u,v - horizontalna i vertikalna komponenta gibanja
'  w - domet cestice (blast radius)
'  wind - odredjuje smjer vjetra
'  alive - pokazje nam da li je cestica jos ziva
'  wid - velicina cestice
' *******************************************************


TYPE part
	x AS SINGLE
	y AS SINGLE
	an AS SINGLE
	u AS SINGLE
	v AS SINGLE
	w AS SINGLE
	wind AS INTEGER
	alive AS INTEGER
	life AS INTEGER
	wid AS INTEGER
END TYPE

DIM SHARED p(1 TO MAX)  AS part 'ovdje spremamo sve cestice

SCREEN 12
LOCATE 1, 1
COLOR 7
'Cekamo korisnika da bude spreman ...
'Poruke su na engleskom da bude kul :))
PRINT "FLAK Exsplosion Demo v4"
PRINT "by Konrad (c) 2002"
PRINT "Press key when ready ..."
a$ = INPUT$(1)
CLS
DO
RANDOMIZE TIMER
'Srediste eksplozije je u promjeru od 100 piksela od
'sredista ekrana

dx = 320 - INT(RND * 100)
dy = 240 - INT(RND * 100)

'Postavi pocetne uvjete za svaku cesticu ...
'trajanje zivota, smjer vjetra, blast radius, ...
FOR i = 1 TO MAX
	p(i).x = dx
	p(i).y = dy
	p(i).an = 1 + INT(RND * 359)
	p(i).w = 5 + INT(RND * 20)
	p(i).u = p(i).w * COS(p(i).an * PI / 180)
	p(i).v = p(i).w * SIN(p(i).an * PI / 180)
	p(i).wind = -1 + INT(1 * RND)
	p(i).alive = 1
	p(i).life = INT(RND * 200) + 1
	p(i).wid = 1 + (RND * 4)
NEXT i
SCREEN 12

u = w * COS(an)
v = w * SIN(an)

'Animacija se ponavlja sve dok netko ne stisne ESC!
DO
FOR i = 1 TO MAX
	'Ako stisnemo ESC izlazimo iz programa...
	'aa$ = INKEY$
	'IF aa$ = CHR$(27) AND aa$ <> "" THEN
	'        SCREEN 12
	'        SCREEN 0
	'        END
	'END IF

'   Ako je trenutna cestica ziva, procesiraj njezino gibanje ...
       
IF (p(i).alive = 1) THEN
	LINE (p(i).x, p(i).y)-(p(i).x + p(i).wid, p(i).y + p(i).wid), 0, BF
       
'****   mijenjaj horizontalnu i vertikalnu komponentu gibanja
'****   ovisno o gravitaciji i trenju zraka
       
	p(i).u = p(i).u - (p(i).w / 100 * k * DT) * p(i).wind
	p(i).v = p(i).v - (p(i).w * k * DT)
       
'**** promjeni polozaj cestice ovisno o komponentama gibanja
       
	p(i).x = p(i).x + p(i).u * DT
	p(i).y = p(i).y - p(i).v * DT
       
'**** skrati trajanje zivota ovoj cestici
	p(i).life = p(i).life - 1

	'ako udarimo u pod tada invertiraj okomitu komponentu
	'gibanja, tako da dobijemo efekt odskakanja od poda
       
	IF p(i).y > 480 THEN
		p(i).v = -p(i).v / 2
	END IF

	'unisti sve cestice koje su izvan ekrana
	IF p(i).life < 0 OR p(i).x < 0 OR p(i).x > 640 THEN p(i).alive = 0
	LINE (p(i).x, p(i).y)-(p(i).x + p(i).wid, p(i).y + p(i).wid), boja, BF

ELSE  'pobrisi cesticu ako nije ziva
 LINE (p(i).x, p(i).y)-(p(i).x + p(i).wid, p(i).y + p(i).wid), 0, BF
END IF
NEXT i

'mali delay kako bi se cijela stvar usporila
tx = TIMER
tx = tx + pauza
WHILE tx > TIMER: WEND


brojac = 0
'prebroji koliko nam je cestica ostalo ...
FOR j = 1 TO MAX
	IF p(j).alive = 1 THEN brojac = brojac + 1
NEXT j

'ako je broj zivih cestica manji od 10% unisti ih sve!
IF brojac < (MAX / 100) * 10 THEN
	FOR j = 1 TO MAX
	LINE (p(j).x, p(j).y)-(p(j).x + p(j).wid, p(j).y + p(j).wid), 0, BF
	NEXT j
	EXIT DO
END IF
LOOP

LOOP UNTIL INKEY$ = CHR$(27)
SCREEN 0

