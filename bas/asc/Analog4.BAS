5 KEY(10) ON:ON KEY(10) GOSUB 600:KEY(9) ON:ON KEY(9) GOSUB 700:DIM A(12):FOR I=1 TO 12:A(I)=I:NEXT I
10 CLS:R=0:N=0:GOSUB 59980:FOR I=1 TO 100:SWAP A(INT(RND*12+1)),A(INT(RND*12+1)):NEXT I
30 LOCATE 2,34:PRINT"Analogies 4":COLOR 7,0
50 RESTORE:IF C>1 THEN FOR L=1 TO C-1:FOR X=1 TO 14:READ A$:NEXT X,L
90 PRINT:PRINT"Which analogy below is most similar to this one:"
110 REM
120 FOR X=1 TO 5:PRINT"(";:COLOR 15:PRINT X;:COLOR 7:PRINT")  ";:READ A$,B$:PRINT A$ " is to " B$:NEXT X
210 IF XX<13 THEN C=A(XX):GOTO 50
600 RUN "iqbuild"
700 CHAIN MERGE "analog5",5
5500 DATA team, coach, carpenter, tools, club, advisor, army, general, truck, driver, men, man, 3, organized group
5510 DATA carelessness, accident, fire, burn, care, safety, punch, fight, flee, run, thoughtlessness, oversight, 5, human error
5520 DATA brake, car, thinker, doer, root, plant, choke, carburetor, nest, bird, block, movement,3, holds back unit
5530 DATA parsimonious, frugal, generous, spendthrift, joyful, happy, poor, miserly, hate, love, profit, capitalist, 1, 1st word extreme of other
5540 DATA choir, singer, fort, soldiers, orchestra, musician, college, professors, team, coach, men, man, 2, musical group
5550 DATA painting, frame, photo, album, frame, house, bristles, brush, water, rain, statue, chisel, 1, holds art
5560 DATA dentist, drill, pencil, paper, satirist, words, saw, wood, tooth, bite, doctor, disease, 2, tools need not be physical
5570 DATA heat, coal, fuel, gas, car, move, power, energy, gunpowder, explode, light, kerosene, 5, energy from a thing
5580 DATA unbrella, rain, hammer, chisel, computer, program, snow, storm, coat, cold, roof, house, 4, shield for the element
5590 DATA city, town, continent, island, mayor, council, house, barn, lawyers, farmers, smart, dumb, 1, size difference
5600 DATA disease, fever, allergy, sneeze, flu, spread, run, perspire, knife, whet, sick, cold, 1, problem to symptom
5610 DATA mozart, rock, inventor, invention, quality, junk, shakespear, soap opera, ballet, hastle, records, tape, 3, classical artist to pop
5620 REM
5630 REM
5640 REM
5650 REM
5660 REM
5670 REM
