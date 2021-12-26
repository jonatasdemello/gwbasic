1 REM
2 REM CLASSIC ASCII SPOCK
3 REM CONVERTED TO TRS-80 BASIC ON 4/02 BY ANTHONY WOOD
4 REM
5 CLS:DEFINTP,L:PRINT@64*5,"Printing Classic Spock"
6 READ L$:IFL$="END" THEN PRINT:END
7 P=1:L=L+1:PRINT @ 64*6, "Line Number ";L
8 P=INSTR(P, L$, "B"):IF (P>0) THEN L$=LEFT$(L$,P-1)+CHR$(34)+MID$(L$, P+1):GOTO 8
9 LPRINT L$:GOTO 6
10 DATA";;-;;-;---;-;;;-;---B-BB??O8@@@@@@@@@@@@@@@@@@@@@@@8IB-;:;':'''''';-/+==?/BB-B-"
20 DATA"''''''''''''''''.;-/*O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8XB;'::::::'';B/???/B--;--"
30 DATA"'''::''''''':':':;/I@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O=-;::':''';;-;---;;;;--"
40 DATA"'''''''''''''''''O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#I?''''''';;-B;;;;;;;;"
50 DATA"''''''''''''''-/N@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8OB;;;;;;;;;;;;;;;--"
60 DATA":'''''''''''BI@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8+B;;;;;;;;;-----"
70 DATA"'''''''''''BO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O*B;;';;;;;-----"
80 DATA"''''''''''-O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#O?B;;----BBBB"
90 DATA"''''''''-=@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@S/B-//??/BBB"
100 DATA";'''''''$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@S=/????/B--"
110 DATA";'''''-I@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@NX+???/BB--"
120 DATA"'''''-X@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#X=??//BBB"
130 DATA"'''''?N@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@UI??/BBBB"
140 DATA"''''/S@@@@@$*IIO8#ON@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$N@@@@@@@@@@@@@@@@@@@@S?B-----"
150 DATA"''''/$@@@@#S*I$$88OON@@@@@@@@@@@@@@@@@@@@@@@@@@@NON@@@@@@@@@@@@@@@@@@@@$=B-----"
160 DATA"::::/#@@NOZ@@@@@@$N8SOSN#@@@@@@@@@@@@@@@##N@@@@@NN@@@@@@@@@@@@@@@@@@@@@@@**B;--"
170 DATA"::::B$@@S*#@@@@@@@@@8OOSSN$@@@###@@@@##@$O$NNN@@@@@@@@@@@@@@@@@@@@@@@@@@@@*B;--"
180 DATA"::::/#@@OS@@@@@@@@@@@@@8OO=IOON$$8N@N$#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@S?'';"
190 DATA"::::=@@@8$@@@@@@@@@@@@@@@N$8$S###$8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@NI;''"
200 DATA"::::O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*;''"
210 DATA":::-N@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O-''"
220 DATA"::'+@@@@@@#O/=8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8/;'"
230 DATA"::'*@@@@@@NO/;-*?O==BOX@#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#@@@@@@@@@@@@@@N+;;"
240 DATA":::S@@@@@@NOB'...::..:::.:.../;==8I$I=/OINO@*X=N8@N@####N#####@@@@@@@@@@@@@@S?B"
250 DATA"::BO@@@@@@N*-'..........:....:.:.;'''::'';'BB;;-BB+/OXNN#N#####@@@@@@@@@@@@@8?-"
260 DATA":-8@@@@@@@8?:;ISI':.....:...............'..'';-B-;BB/=O8N@@@@##@@@@@@@@@@@@@XB;"
270 DATA":-$@##@@@@S-:'BS$*I;;:'.........:.:...':::';;-';--/?*X$#@@@@@#N@@@@@@@@@@@@@O=-"
280 DATA"::O@N$@@@#?..'-B-OO@N$NSS?/......'...::':'':--=IO$@@@@@@@@@#$###@@@@@@@@@@@@@@O"
290 DATA"::I@@N@@@$-:;---BB==$@@@$8O//;B....''.::'':=**NN@@@@@@@@@@##8N##@@@@@@@@@@@@@@$"
300 DATA"::'IN##@@X:.;?+?/++OSN#@@@@@@@S-:..'..-?OSNN@@@@@@@@@@@@@@@@NO$##@@@@@@@@@@@@@N"
310 DATA";'...BS@N?.:;-?SN@@@@@@@@@@SS.... ..:-O@@#@@@@@@@@@@@@@@@@@#NS8#@@@@@@@@@@@@@#*"
320 DATA"      I@$B..';+#@@O+@@@@@@@SB .... . B8@@@@@@@@@@@@@@@@@@@@@#8S$@@@@@@@@@@@@@$?"
330 DATA":::/S@#@#I..-/=+I$$@@@@@@@@@@$=.....''?ON##@@@@@@@@@@@@@#@@@#8O##@@@@@@@@@@@@@$"
340 DATA"-+/ -'?N8; .:;+;::?==XX*+;; ....  ..:B$@@@@@@@@@O?I@8ON@@@@#N$OX$@@@@@@@@@@@$-"
350 DATA":;B+=B/8X  ..''...''B;/'BB;          BO@@@@@@@S*?IOOOON@@@@@#NS*O@@@@@@@@@@#I.."
360 DATA"..;;'?I$? ......  ..'; --    .......'/O@@@@@@@?';-B/=**SO$SS8##$OX$@@@@@@@#B::'"
370 DATA"..';::?N+  .....  ..'';-;  ........::+$@@@@@@@I:'-B/=**SO$SS8##$OX$@@@@@@@#B::'"
380 DATA"..'-'+$*   .  .  ..';B-;  ......  :/S######@@@='.'-B-B?+IIO8N#8OO8@@@@NN8=;::''"
390 DATA"..'-';-*S   .  .    ';-'   ....    '+8#NN####@@OB.:--B/??IIS$N#8OO$@@@@8$O?-'''"
400 DATA"..';::-'I?... .....'''    ....     :?8@##NNNN@@NX-;;;;;-+*OO8NN@@@@@@@N8S+/B-''"
410 DATA" .;;:BI;++::: ....'.::    ....     :BS@@#N$N#@@#S/;''';B+*S8$N$@@@@@@@@#NOB?/-;"
420 DATA" .'; 'B-'B;''' :......  ......     .-O#@@NN8N@@@8+;;-'/X8888$N$@@@@@@@@#O?;;'''"
430 DATA" .'' .:;.';'.'':......  .....      .;XN@@@#N#@@@$IB--B*888$8$N$@@@@@@@@#O-::'::"
440 DATA" .:' .   ::'':::'......  ... /='. .:=8@####N@@@@@8*?++*XO$N$N$$@@@@@@@@N*: .:.."
450 DATA" .::'...;:'':::'......  ... *@@=;'?BS#@@@#N@@@@@@#O*I*S8$NNNNNN@@@@@@@@N?...:::"
460 DATA".. :;'...;-':::.......... . .-/?;*#@@@@@@@@@@@@@@@@N$8#NN@#NNNN@@@@@@@@I..:::::"
470 DATA".. :'-.:+S=':::....... .. . .::':'/@@@@@@@@@@@@@@@@@@$N#N#N#NNN@@@@@@@X; .:::::"
480 DATA"     :'+';-;'':...  ..           ..:-=O@@@@@#N#@@@#N$$$$8$8$$$$$ON##OB   ......"
490 DATA"          ';'::..... :;:       ...:'B/+SO@@@##N#@@NN$$$$888$$N$8S8$N?  ..  ./X8"
500 DATA"            '::......':   . .::::';--;?XOO*OONNN#@#$$$88888$$N$8B/.       .+NN#"
510 DATA"           ;'::......:.   :..:::::';;-+XOOOXXS8$N@#N$$8$$$88$$$$O'       .*8##8"
520 DATA"    ..    :;'::......:....:. .   ... :BIOSOO88N$NNN$$$$$$$N$$$$*       :X8NN@@@"
530 DATA"  .....   .';'::::...:..::. . ;'/.. .'*IOSSO$$NNNN#8$$$N$$$$N$$=   .. '=$###@@@"
540 DATA"  ...       ';':::...:-/X+SO@#@@@##$@@@@@8$88NNNNN#N$$$$$N$$$$8?     'O$O8$$#@@"
550 DATA"   .        :;':::. .'/II*BOB+-?SX@N@@@@@@@#$NN#NN#N$$$$$$$N$88?     -SOS8NN@@@"
560 DATA"   .          '::::::'--::''''...:'''/?OO$$@@@@@@@@$$$$$$$$$8$$?    BISOO8#@@@@"
570 DATA"             .  ':::''-;:::;/+X?*/+-??**O8NN#N#@@@@$$$$$$$88NN$?   :S88S8N@@@@@"
580 DATA".. ... .        ;':::';;;;;-/?IOO#N@@@@@@@@#####@@8$N$N$$$8N##$=   +@@#$#@@@@@@"
590 DATA"........... ...;-''''''';;B/??+*IX+XX$#@@@@#@##@@@$$NNNN$$N#@@NI.  *@@@#@@@@@@@"
600 DATA"::::'''::::::::';--;';;;';;;;;;--//??*X8N@@@@@@@@@@@##NNN#@@@@#O;  $#S=N@@@@@@@"
610 DATA":::::''''::::::';---;;';'''';':':;;-;B/**O8@N@#@@@@@##NN#@@@@@@8B:=#$=;I#@@@@@@"
620 DATA" . .. ......... ..;----;'::::::::';;';B/+II=+//O8NNN$@@@@@@@@@$**NSXB. .++@@@@@"
630 DATA" ................';;;BB;':::'''';;--;;/??IX**IXON##N##@@@@@@@@#NXI#NSB. ./@@@@@"
640 DATA" .  . ...........'-;---/+BB-BB/B////?+***XOOSON#N@@@@@@@@@@@@@#N8S@@@?  .;8@N#N"
650 DATA".............. ..';;;;;B?++/++I===I=XXOXXXSO$$#NN@@@@@@@@@@@@@##@#@@@8B .:I@$OO"
660 DATA"      ..         '?;''''''+8N8#$#N#N@N#$NN###N#@@@@@@@@@###@@@@@@@@@@@@O=''+XOO"
670 DATA"    . .        . -O/'::':';+S@@@@@@@@@@@@@###@@@@@@@@@@#N#@@@@@@@@@@@@@@#O*-+OX"
680 DATA"              ...?#SB.:''';-?/8#8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$IIO"
690 DATA"  .           .. BN@S;.:'';-B=++/*8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OXO"
700 DATA"  .         .....-O@@#8/':'-BBB;;-B*O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@N8$N$"
710 DATA"  .       ..  ...B8@@@@O*;;-B?B---?=O#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@N$N##"
720 DATA"  ..  .  .    ....=@@@@@@@@N@N@#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#@"
730 DATA"  . ..    .  ....=#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#@"
740 DATA"BB//?/BBI$@#+-BB//?O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
750 DATA"++??+?/+N@@O/B/????*N@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
760 DATA"....:.:::';-O$I-Z/8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
770 DATA":.::'';;--=O@OB;-/O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
780 DATA"++??+?/+N@@O/B/????*N@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
790 DATA"END"
