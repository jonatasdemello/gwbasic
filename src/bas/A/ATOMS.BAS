SCREEN 12
DIM circ%(500)
CIRCLE (320, 240), 2, 15
GET (318, 238)-(322, 242), circ%
DIM a$(92), b$(92), c(92), d(92), e(92, 7), g(18), gg(18), uu(7), lett$(256)
g(1) = 2: g(2) = 2: g(3) = 6: g(4) = 2: g(5) = 6: g(6) = 2
g(7) = 10: g(8) = 6: g(9) = 2: g(10) = 10: g(11) = 6: g(12) = 2
g(13) = 14: g(14) = 10: g(15) = 6: g(16) = 2: g(17) = 14: g(18) = 10
gg(1) = 1: gg(2) = 2: gg(3) = 2: gg(4) = 3: gg(5) = 3: gg(6) = 4
gg(7) = 3: gg(8) = 4: gg(9) = 5: gg(10) = 4: gg(11) = 5: gg(12) = 6
gg(13) = 4: gg(14) = 5: gg(15) = 6: gg(16) = 7: gg(17) = 5: gg(18) = 6
pi = 3.14159
lett$(32) = "": lett$(33) = "20232424": lett$(34) = "10123032"
lett$(35) = "1014303401410343": lett$(36) = "104012320434511152332024"
lett$(37) = "400411113333": lett$(38) = "441111202031310303141432"
lett$(39) = "20212112": lett$(40) = "201111131324": lett$(41) = "203131333324"
lett$(42) = "123211331331": lett$(43) = "21231232": lett$(44) = "32333324"
lett$(45) = "0242": lett$(46) = "2424": lett$(47) = "4004"
lett$(48) = "612262223113": lett$(49) = "112020241434"
lett$(50) = "632242040444": lett$(51) = "52315233003002320434"
lett$(52) = "343030020242": lett$(53) = "52330434023200400002"
lett$(54) = "61225233204024340232": lett$(55) = "004040414104"
lett$(56) = "5111511352315233103012321434": lett$(57) = "62225111102012420424"
lett$(58) = "21212323": lett$(59) = "222323142121"
lett$(60) = "21121223": lett$(61) = "11311232": lett$(62) = "21323224"
lett$(63) = "2424232252212010": lett$(64) = "6122203052313212121111212122"
lett$(65) = "200420441232": lett$(66) = "000400300232043452315233"
lett$(67) = "204024446122": lett$(68) = "0020000404246222"
lett$(69) = "0040044402320004": lett$(70) = "004002320004"
lett$(71) = "2040224261226422": lett$(72) = "000440440242"
lett$(73) = "103014342024": lett$(74) = "103020235413"
lett$(75) = "000402400244": lett$(76) = "00040444"
lett$(77) = "0004404400242440": lett$(78) = "000400444044"
lett$(79) = "61226222": lett$(80) = "0004003002325231"
lett$(81) = "612262223344": lett$(82) = "00040030023222445231"
lett$(83) = "10401232043451115233": lett$(84) = "00402024"
lett$(85) = "000240426422": lett$(86) = "00242440"
lett$(87) = "0014142222343440": lett$(88) = "00444004"
lett$(89) = "002222402224": lett$(90) = "004040040444"
lett$(91) = "302020242434": lett$(92) = "0044"
lett$(93) = "203030343424": lett$(94) = "11202031"
lett$(95) = "0444": lett$(96) = "10212122"
lett$(97) = "200420441232": lett$(98) = "000400300232043452315233"
lett$(99) = "204024446122": lett$(100) = "0020000404246222"
lett$(101) = "0040044402320004": lett$(102) = "004002320004"
lett$(103) = "2040224261226422": lett$(104) = "000440440242"
lett$(105) = "103014342024": lett$(106) = "103020235413"
lett$(107) = "000402400244": lett$(108) = "00040444"
lett$(109) = "0004404400242440": lett$(110) = "000400444044"
lett$(111) = "61226222": lett$(112) = "0004003002325231"
lett$(113) = "612262223344": lett$(114) = "00040030023222445231"
lett$(115) = "10401232043451115233": lett$(116) = "00402024"
lett$(117) = "000240426422": lett$(118) = "00242440"
lett$(119) = "0014142222343440": lett$(120) = "00444004"
lett$(121) = "002222402224": lett$(122) = "004040040444"
lett$(123) = "302020212112122323242434": lett$(124) = "20212324"
lett$(125) = "102020212132322323242414": lett$(126) = "011010212130"
lett$(127) = "14131322223333343414"
FOR z = 1 TO 3
   FOR y = 1 TO 92
      IF z = 1 THEN READ a$(y)
      IF z = 2 THEN READ b$(y)
      IF z = 3 THEN READ c(y)
   NEXT y
NEXT z
FOR y = 1 TO 92
   FOR z = 1 TO 7
      READ e(y, z)
   NEXT z
NEXT y
200 INPUT "ELEMENT"; f$
201 f$ = UCASE$(f$)
205 IF f$ = "Q" OR f$ = "q" OR f$ = "" THEN END
210 CLS
212 IF VAL(f$) < 1 OR VAL(f$) > 92 THEN
214 y = 0
216 FOR z = 1 TO 92
218 IF a$(z) = f$ OR b$(z) = f$ THEN y = z
220 NEXT z
222 IF y = 0 THEN 200
223 f$ = MID$(STR$(y), 2, LEN(STR$(y)) - 1): ff$ = STR$(CINT(c(y)) - y)
224 GOTO 230
226 END IF
228 y = VAL(f$): ff$ = STR$(CINT(c(y)) - y)
230 FOR z = 1 TO 7
       uu(z) = RND
       FOR x = 1 TO e(y, z)
          w = ((z + 1) * 20) * COS(6.28318 * (x / e(y, z) + uu(z)))
          v = ((z + 1) * 20) * SIN(6.28318 * (x / e(y, z) + uu(z)))
          CIRCLE (w + 320, v + 240), 2, 15
       NEXT x
       IF e(y, z) <> 0 THEN zz = z
    NEXT z
330 CIRCLE (320, 240), 20, 15
340 PAINT (320, 240), 10, 15
350 phrase$ = f$ + "+": xx = 305: yy = 230: size = 6 / (LEN(f$) + 1): col = 12: GOSUB letterprint
360 phrase$ = MID$(ff$, 2, LEN(ff$) - 1) + "N": xx = 305: yy = 242: size = 6 / LEN(ff$): col = 12: GOSUB letterprint
370 phrase$ = a$(y) + " - " + b$(y): xx = 200: yy = 280 + 20 * z: size = 3: col = 14: GOSUB letterprint
380 phrase$ = "WEIGHT -" + STR$(c(y)): xx = 200: yy = 300 + 20 * z: size = 3: col = 14: GOSUB letterprint
390 x = 0: h$ = "": u = 0
400 FOR z = 1 TO 18
       IF x < y THEN x = x + g(z): w = z
    NEXT z
    FOR z = 1 TO w - 1
       h$ = h$ + MID$(STR$(gg(z)), 2, LEN(STR$(gg(z))) - 1)
       IF g(z) = 2 THEN h$ = h$ + "S2+": u = u + 2
       IF g(z) = 6 THEN h$ = h$ + "P6+": u = u + 6
       IF g(z) = 10 THEN h$ = h$ + "D10+": u = u + 10
       IF g(z) = 14 THEN h$ = h$ + "F14+": u = u + 14
    NEXT z
500 h$ = h$ + MID$(STR$(gg(z)), 2, LEN(STR$(gg(z))) - 1)
510 IF g(z) = 2 THEN h$ = h$ + "S"
520 IF g(z) = 6 THEN h$ = h$ + "P"
530 IF g(z) = 10 THEN h$ = h$ + "D"
540 IF g(z) = 14 THEN h$ = h$ + "F"
550 h$ = h$ + MID$(STR$(y - u), 2, LEN(STR$(y - u)) - 1)
560 phrase$ = h$: xx = 10: yy = 20: size = 120 / LEN(h$): col = 14: GOSUB letterprint
DO
   FOR z = 1 TO 7
      FOR x = 1 TO e(y, z)
         w = ((z + 1) * 20) * COS(6.28318 * (x / e(y, z) + uu(z)))
         v = ((z + 1) * 20) * SIN(6.28318 * (x / e(y, z) + uu(z)))
         PUT (w + 318, v + 238), circ%, XOR
         w = ((z + 1) * 20) * COS(6.28318 * (x / e(y, z) + uu(z) + (8 - z) / 2000))
         v = ((z + 1) * 20) * SIN(6.28318 * (x / e(y, z) + uu(z) + (8 - z) / 2000))
         PUT (w + 318, v + 238), circ%, XOR
         f$ = INKEY$
         IF f$ <> "" THEN SOUND 1000, .2: GOTO 200
      NEXT x
      uu(z) = uu(z) + (8 - z) / 2000
   NEXT z
LOOP

DATA H,HE,LI,BE,B,C,N,O,F,NE,NA,MG,AL,SI,P,S,CL,AR,K,CA,SC,TI,V,CR,MN
DATA FE,CO,NI,CU,ZN,GA,GE,AS,SE,BR,KR,RB,SR,Y,ZR,NB,MO,TC,RU,RH,PD,AG
DATA CD,IN,SN,SB,TE,I,XE,CS,BA,LA,CE,PR,ND,PM,SM,EU,GD,TB,DY,HO,ER,TM
DATA YB,LU,HF,TA,W,RE,OS,IR,PT,AU,HG,TL,PB,BI,PO,AT,RN,FR,RA,AC,TH,PA,U
DATA HYDROGEN,HELIUM,LITHIUM,BERYLIUM,BORON,CARBON,NITROGEN,OXYGEN
DATA FLUORINE,NEON,SODIUM,MAGNESIUM,ALUMINUM,SILICON,PHOSPHORUS,SULFUR
DATA CHLORINE,ARGON,POTASSIUM,CALCIUM,SCANDIUM,TITANIUM,VANADIUM
DATA CHROMIUM,MANGANESE,IRON,COBALT,NICKEL,COPPER,ZINC,GALLIUM
DATA GERMANIUM,ARSENIC,SELENIUM,BROMINE,KRYPTON,RUBIDIUM,STRONTIUM
DATA YTTRIUM,ZIRCONIUM,NIOBIUM,MOLYBDENOM,TECHNETIUM,RUTHENIUM
DATA RHODIUM,PALLADIUM,SILVER,CADMIUM,INDIUM,TIN,ANTIMONY,TELLURIUM
DATA IODINE,XENON,CESIUM,BARIUM,LANTHANUM,CERIUM,PRASEODYMIUM
DATA NEODYMIUM,PROMETHIUM,SAMARIUM,EUROPEUM,GADOLINIUM,TERBIUM
DATA DYSPROSIUM,HOLMIUM,ERBIUM,THULIUM,YTTERBIUM,LUTETIUM,HAFNIUM
DATA TANTALUM,TUNGSTEN,RHENIUM,OSMIUM,IRIDIUM,PLATINUM,GOLD,MERCURY
DATA THALLIUM,LEAD,BISMUTH,POLONIUM,ASTATINE,RADON,FRANCIUM,RADIUM
DATA ACTINIUM,THORIUM,PROTACTINIUM,URANIUM
DATA 1.00797,4.0026,6.939,9.0122,10.811,12.01115,14.0067,15.9994
DATA 18.9984,20.183,22.9898,24.312,26.9815,28.086,30.9738,32.064
DATA 35.453,39.948,39.102,40.08,44.956,47.90,50.942,51.996,54.9380
DATA 55.847,58.9332,58.71,63.54,65.37,69.72,72.59,74.9216,78.96
DATA 79.909,83.80,85.47,87.62,88.905,91.22,92.906,95.94,99,101.07
DATA 102.905,106.4,107.870,112.40,114.82,118.69,121.75,127.60
DATA 126.9044,131.30,132.905,137.34,138.91,140.12,140.907,144.24
DATA 147,150.35,151.96,157.25,158.924,162.50,164.930,167.26,168.934
DATA 173.04,174.97,178.49,183.948,183.85,186.2,190.2,192.2,195.09
DATA 196.967,200.59,204.37,207.19,208.980,210,210,222,223,226,227
DATA 232.038,231,238.03
DATA 1,0,0,0,0,0,0,2,0,0,0,0,0,0,2,1,0,0,0,0,0,2,2,0,0,0,0,0
DATA 2,3,0,0,0,0,0,2,4,0,0,0,0,0,2,5,0,0,0,0,0,2,6,0,0,0,0,0
DATA 2,7,0,0,0,0,0,2,8,0,0,0,0,0,2,8,1,0,0,0,0,2,8,2,0,0,0,0
DATA 2,8,3,0,0,0,0,2,8,4,0,0,0,0,2,8,5,0,0,0,0,2,8,6,0,0,0,0
DATA 2,8,7,0,0,0,0,2,8,8,0,0,0,0,2,8,8,1,0,0,0,2,8,8,2,0,0,0
DATA 2,8,9,2,0,0,0,2,8,10,2,0,0,0,2,8,11,2,0,0,0,2,8,13,1,0,0,0
DATA 2,8,13,2,0,0,0,2,8,14,2,0,0,0,2,8,15,2,0,0,0,2,8,16,2,0,0,0
DATA 2,8,18,1,0,0,0,2,8,18,2,0,0,0,2,8,18,3,0,0,0,2,8,18,4,0,0,0
DATA 2,8,18,5,0,0,0,2,8,18,6,0,0,0,2,8,18,7,0,0,0,2,8,18,8,0,0,0
DATA 2,8,18,8,1,0,0,2,8,18,8,2,0,0,2,8,18,9,2,0,0,2,8,18,10,2,0,0
DATA 2,8,18,12,2,0,0,2,8,18,13,1,0,0,2,8,18,13,2,0,0,2,8,18,15,1,0,0
DATA 2,8,18,16,1,0,0,2,8,18,18,0,0,0,2,8,18,18,1,0,0,2,8,18,18,2,0,0
DATA 2,8,18,18,3,0,0,2,8,18,18,4,0,0,2,8,18,18,5,0,0,2,8,18,18,6,0,0
DATA 2,8,18,18,7,0,0,2,8,18,18,8,0,0,2,8,18,18,8,1,0,2,8,18,18,8,2,0
DATA 2,8,18,18,9,2,0,2,8,18,20,8,2,0,2,8,18,21,8,2,0,2,8,18,22,8,2,0
DATA 2,8,18,23,8,2,0,2,8,18,24,8,2,0,2,8,18,25,8,2,0,2,8,18,25,9,2,0
DATA 2,8,18,27,8,2,0,2,8,18,28,8,2,0,2,8,18,29,8,2,0,2,8,18,30,8,2,0
DATA 2,8,18,31,8,2,0,2,8,18,32,8,2,0,2,8,18,32,9,2,0,2,8,18,32,10,2,0
DATA 2,8,18,32,11,2,0,2,8,18,32,12,2,0,2,8,18,32,13,2,0,2,8,18,32,14,2,0
DATA 2,8,18,32,15,2,0,2,8,18,32,16,2,0,2,8,18,32,18,1,0,2,8,18,32,18,2,0
DATA 2,8,18,32,18,3,0,2,8,18,32,18,4,0,2,8,18,32,18,5,0,2,8,18,32,18,6,0
DATA 2,8,18,32,18,7,0,2,8,18,32,18,8,0,2,8,18,32,18,8,1,2,8,18,32,18,8,2
DATA 2,8,18,32,18,9,2,2,8,18,32,18,10,2,2,8,18,32,20,9,2,2,8,18,32,21,9,2

letterprint:
   FOR zx = 1 TO LEN(phrase$)
      lt = ASC(MID$(phrase$, zx, 1))
      FOR zz = 1 TO LEN(lett$(lt)) STEP 4
          z1 = ASC(MID$(lett$(lt), zz, 1)) - 48
          z2 = ASC(MID$(lett$(lt), zz + 1, 1)) - 48
          z3 = ASC(MID$(lett$(lt), zz + 2, 1)) - 48
          z4 = ASC(MID$(lett$(lt), zz + 3, 1)) - 48
          IF z1 < 5 THEN LINE (z1 * size + xx, z2 * size + yy)-(z3 * size + xx, z4 * size + yy), col
          IF z1 > 4 AND z2 = 1 THEN CIRCLE (z3 * size + xx, z4 * size + yy), size * (z1 - 4), col, pi / 2, 3 * pi / 2
          IF z1 > 4 AND z2 = 2 THEN CIRCLE (z3 * size + xx, z4 * size + yy), size * (z1 - 4), col, 3 * pi / 2, pi / 2
          IF z1 > 4 AND z2 = 3 THEN CIRCLE (z3 * size + xx, z4 * size + yy), size * (z1 - 4), col, 0, pi
          IF z1 > 4 AND z2 = 4 THEN CIRCLE (z3 * size + xx, z4 * size + yy), size * (z1 - 4), col, pi, 0
      NEXT zz
      xx = xx + size * 5
   NEXT zx
RETURN

