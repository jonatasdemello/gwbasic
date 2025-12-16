
' PROGRAMME DE REVOLUTION D'UN OU PLUSIEURS POINT(S) dans l'espace
' par DARCHE Yoann ( 27/11/90 )
'=========================================================================
'            VERSION Num‚ro 1.1     3DREVOL1.BAS (.EXE)
'=========================================================================


' programme de saisie :

 CLS:
 PRINT "Programme         : 3DREVOL1.BAS ( ou .EXE ) "
 PRINT "Date de d‚but     : 27/11/90"
 PRINT "Date de cette ver : 27/11/90"
 PRINT "Version           : 1.1 "
 PRINT "Programmeur       : Darche Yoann"
 PRINT "Adresse           : 71 avenue d'Orl‚ans 91800 BRUNOY (FRANCE)
 PRINT "T‚l‚phone         : 69-39-51-26 aprŠs 18h "
 PRINT
 PRINT " Appuyez sur Y (comme Yoann) pour continuer "

 IlseFoutDeMoi :
 A$=input$(1):if a$="Y" or a$="y" then goto PRENDONNES else goto ilsefoutdemoi

 PRENDONNES :

