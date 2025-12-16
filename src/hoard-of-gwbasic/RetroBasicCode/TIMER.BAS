cls:screen 1:t=timer:ta=47

deb:
ti=timer-t
tp=ti/ta*100
locate 1,1:print ti;"/";ta;"=";tp;"%"
x= 3.2*tp
line(0,190)-(x,200),2,bf

a$=inkey$
if a$="" then goto deb
end