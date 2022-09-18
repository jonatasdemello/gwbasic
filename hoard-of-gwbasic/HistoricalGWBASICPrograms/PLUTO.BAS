10 D$=DATE$
20 T$=TIME$
30 TAG$=MID$(D$,4,2)
40 MON$=LEFT$(D$,2)
50 JAR$=RIGHT$(D$,2)
60 STD$=LEFT$(T$,2)
70 MIN$=MID$(T$,4,2)
80 AUFRUF$="RENAME PLUTO.DAT P"+STD$+MIN$+"_"+TAG$+"."+MON$+" "
90 SHELL AUFRUF$
100 PRINT"Nachrichtendatei unter P";STD$;MIN$;"_";TAG$;".";MON$;"  gespeichert !"
110 SYSTEM
