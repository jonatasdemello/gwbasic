

x%=160:y%=100:c%=1
screen 1

debut :

a$=inkey$
if a$="6" and x%<319 then x%=x%+1
if a$="4" and x%>0   then x%=x%-1
if a$="8" and y%>0   then y%=y%-1
if a$="2" and y%<199 then y%=y%+1
if a$=" " or a$=chr$(13) then pset(x%,y%),c%:ac%=c%
if a$="S" or a$="s"  then goto sauve
if a$="L" or a$="l"  then goto rapel
if a$="p" or a$="P"  then goto peint
if a$="c" or a$="C"  then goto couleur
if a$="r" or a$="R"  then goto rond
if x%=ax% and y%=ay% then goto debut

pset(ax%,ay%),ac%
ac%=point(x%,y%):pset(x%,y%),c%:ax%=x%:ay%=y%
line (0,0)-(319,199),0,b
goto debut

sauve :
def seg=&hb800
s$=input$(1)
Bsave "b:IMAGE.DA"+s$,0,16384
sa%=1
goto debut

rapel :
if sa%=0 then line(0,0)-(319,199),1,b:a$=input$(1):if a$="q" or a$="Q" then goto debut
cls
INPUT "Nom de l'image",n$
def seg=&hb800
bload n$
sa%=0
goto debut

peint :
line (0,0)-(319,199),2,b
co%=1:a$=input$(1)
if a$="A" or a$="a" then co%=1
if a$="z" or a$="Z" then co%=2
if a$="e" or a$="E" then co%=3
pset (x%,y%),0:paint(x%,y%),co%,c%:ac%=co%
goto debut

couleur :
a$=input$(1)
if a$="a" or a$="A" then c%=1
if a$="z" or a$="Z" then c%=2
if a$="e" or a$="E" then c%=3
goto debut

rond :
line (0,0)-(319,199),2,b
a$=input$(2)
circle (x%,y%),val(a$),c%
goto debut
