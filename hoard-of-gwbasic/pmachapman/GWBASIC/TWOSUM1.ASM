0100               org 100H
0100               double    segment
                   assume  cs:double
0100    EB 17 90  start:        jmp     start1
0103              usrprg   proc far
0103    55          push bp
0104    8B EC       mov bp,sp
0106    8B 76 08    mov si,[bp]+8       ;get address of
                                        ;parameter b
0109    8B 04       mov ax,[si]         ;get value of b
010B    8B 76 0A    mov si,[bp]+10      ;get address of
                                        ;parameter a
010E    03 04       add ax,[si]         ;add value of
                                        ;a to value of
                                        ;b
0110    8B 7E 06    mov di,[bp]+6       ;get address of
                                        ;parameter c
0113    89 05       mov di,ax           ;store sum in
                                        ;parameter c
0115    5D          pop bp
0116    ca 0006     ret 6
0119              usrprg endp
                                        ;
                                        ;Program to put
                                        ;procedure in memory
                                        ;and remain resident.
                                        ;The offset and
                                        ;segment are stored
                                        ;in location 100-103H.
0119              start1:
0119    B8 0000     mov ax,0
011C    8E D8       mov ds,ax           ;data segment to 0000H
011E    BB 0100     mov bx,0100H        ;pointer to int vector
                                        ;100H
0121    83 7F 02 0  cmp word ptr [bx],0
0125    75 16       jne quit            ;program already run, exit
0127    83 3F 00    cmp word ptr2 [bx],0
012A    75 11       jne quit            ;program
                                        ;already run,
                                        ;exit
012C    B8 0103 R   mov ax,offset usrprg
012F    89 07       mov [bx],ax         ;program offset
0131    8C c8       mov ax,cs
0133    89 47 02    mov [bx+2],ax       ;data segment
0136    0E          push cs
0137    1F          pop ds
0138    BA 0141 R   mov dx,offset veryend
013B    CD 27       int 27h
013D              quit:
013D    CD 20       int 20h
013F              veryend:
013F              double ends
                    end start

