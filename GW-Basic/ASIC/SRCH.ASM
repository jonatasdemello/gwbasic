; SRCH.ASM -- A SAMPLE ASSEMBLY LANGUAGE SUBROUTINE THAT CAN BE CALLED FROM ASIC
; Copyright (c) 1993 by David A. Visti -- All rights reserved
; USING THE "CALL SUB" STATEMENT.  SEE FILE:   CALLSRCH.ASI  (THE CALLING PROGRAM FOR THIS SUB)
; THIS PROGRAM WILL SEARCH A STRING ARRAY FOR A SEARCH STRING AND WILL
; RETURN THE ARRAY SUBSCRIPT OF THE ELEMENT CONTAINING THE SEARCH STRING
; IF THE ELEMENT IS NOT FOUND, IT RETURNS -1 AS THE SUBSCRIPT
;
; THIS ROUTINE EXPECTS TO BE CALLED FROM ASIC AS:   
;
;       CALL SUB "SRCH" STRINGARRAY$(0),ARRAYSIZE,SEARCHSTRING$,RETURNVAL
;           WHERE STRINGARRAY$(0) IS THE ARRAY TO BE SEARCHED
;                 ARRAYSIZE IS THE NUMBER OF ELEMENTS IN THE ARRAY 
;                   (SHOULD BE THE SAME AS SPECIFIED ON THE DIM STATEMENT)
;                 SEARCHSTRING$ IS STRING WE'RE TRYING TO FIND IN STRINGARRAY$
;                 RETURNVAL IS A VARIABLE SRCH WILL USE TO RETURN IT'S RESULT
;                  RETURNVAL = -1: SEARCHSTRING$ NOT FOUND IN STRINGARRAY$()
;                  RETURNVAL >=0 : SUBSCRIPT OF FIRST STRINGARRAY$ ELEMENT
;                                  CONTAINING SEARCH STRING
;
;THE ROUTINE EXPECTS PARAMETERS TO BE PLACED ON THE STACK USING THE STANDARD
;ASIC CONVENTION.  THAT IS, EACH PARAMETER WILL BE PUSHED TO THE STACK AS A 
;FAR PTR WITH THE SEGMENT OF EACH PARAMETER PUSHED TO THE STACK FOLLOWED BY 
;ITS OFFSET.  PARAMETERS ARE PUSHED ONTO THE STACK FROM LEFT TO RIGHT.
;
;THUS THE STACK WILL APPEAR AS FOLLOWS:
;
;        SP+14h   SEGMENT FOR STRINGARRAY$  PARM
;        SP+12h   OFFSET  FOR STRINGARRAY$  PARM
;        SP+10h   SEGMENT FOR ARRAYSIZE     PARM
;        SP+0Eh   OFFSET  FOR ARRAYSIZE     PARM
;        SP+0Ch   SEGMENT FOR SEARCHSTRING$ PARM
;        SP+0Ah   OFFSET  FOR SEARCHSTRING$ PARM
;        SP+08h   SEGMENT FOR RETURNVAL     PARM
;        SP+06h   OFFSET  FOR RETURNVAL     PARM
;        SP+04h   BP REGISTER PUSHED TO STACK BY SRCH.ASM
;        SP+00h   FAR RETURN ADDRESS
;
;ASSEMBLY LANGUAGE SUBROUTINES CAN CHANGE REGISTERS AS THEY WISH, HOWEVER,
;THE "SS" REGISTER SHOULD NOT BE MODIFIED, AND IF YOU PUSH ANY VALUES TO
;THE STACK, YOU SHOULD POP THEM BEFORE RETURNING.  THE "SP" REGISTER MUST
;CONTAIN THE SAME VALUE WHEN YOU "RETF" AS IT DID WHEN YOU ENTERED THE 
;SUBROUTINE.  ASIC WILL TAKE CARE OF REMOVING THE PARAMETERS FROM THE STACK
;FOR YOU.

;ASIC CALLS SUBROUTINES USING FAR CALLS (SEGMENT:OFFSET), SO YOU MUST USE
;THE "RETF" INSTRUCTION TO RETURN TO ASIC.


                

DATA_SEG        SEGMENT PUBLIC

MAXSIZE         DW  0                       ; MAX NUM OF ENTRIES IN ARRAY
CURSUB          DW  0                       ; CURRENT ARRAY ELEMENT BEING SEARCHED
ARRAYPTR        DW  0                       ; POINTER TO CURRENT ARRAY ELEMENT
SRCHPTR         DW  0                       ; POINTER TO START OF SEARCH STRING

DATA_SEG        ENDS

CODE_SEG        SEGMENT PUBLIC
                ASSUME  CS:CODE_SEG                
                ASSUME  DS:DATA_SEG
SRCH            PROC    FAR
                PUBLIC SRCH
                
                MOV AX,DATA_SEG                 ; GET DS FOR THIS SUB
                MOV DS,AX                       
                PUSH BP                         ; SAVE BP
                MOV BP,SP                       ; AND SET TO SP

                MOV AX,[BP+08h]                 ; GET SEGMENT FOR LAST PARM
                                                ; (CURRENTLY ALL ASIC DATA IS
                                                ; IN ONE SEGMENT, SO WE WON'T
                                                ; BOTHER RETRIEVING THE OTHER
                                                ; SEGMENTS FROM THE STACK
                                                ; INSTEAD, WE'LL USE THE 
                                                ; SEGMENT REGISTER FROM THE
                                                ; LAST PARM FOR ALL PARMS)
                MOV ES,AX                       ; AND PUT IN ES REG

                MOV [CURSUB],0                  ; RESET CURSUB TO 0
                MOV BX,[BP+0Eh]                 ; GET OFFSET FOR ARRAYSIZE
                MOV AX,ES:[BX]                  ; AND GET VALUE INTO AX
                MOV [MAXSIZE],AX                ; AND STORE INTO MAXSIZE
                MOV BX,[BP+12h]                 ; GET OFFSET OF STRINGARRAY$
                MOV [ARRAYPTR],BX               ; SAVE IN ARRAYPTR
                MOV BX,[BP+0Ah]                 ; GET OFFSET OF SEARCHSTRING$
                MOV [SRCHPTR],BX                ; SAVE IN SRCHPTR
NEXTSUB:        MOV SI,[ARRAYPTR]               ; GET ARRAY PTR
                MOV DI,[SRCHPTR]                ; GET SEARCH STRING PTR
NEXTBYTE:       MOV AH,BYTE PTR ES:[SI]         ; GET NEXT BYTE OF ARRAY ELEMENT
                MOV AL,BYTE PTR ES:[DI]         ; AND NEXT BYTE OF SRCH STRING
                CMP AH,AL                       ; ARE THEY THE SAME
                JNZ NEXTPAIR                    ; NO, LET'S GET GET ARRAY SUB
                CMP AH,0
                JZ  MATCH                       ; WE'RE AT END OF STRINGS, WE MATCHED
                INC SI                          ; GET NEXT BYTE PAIR
                INC DI          
                JMP NEXTBYTE
NEXTPAIR:       MOV AX,[CURSUB]                 ; INCREMENT CURRENT SUB
                INC AX
                MOV [CURSUB],AX
                MOV BX,[MAXSIZE]                ; SEE IF WE'RE PAST MAX SIZE
                CMP AX,BX
                JG  NOMATCH                     ; SEARCH WHOLE ARRAY--DIDN'T FIND MATCH
                MOV AX,[ARRAYPTR]               ; BUMP PTR TO NEXT ELEMENT
                ADD AX,81
                MOV [ARRAYPTR],AX               ; SAVE NEW PTR
                JMP NEXTSUB                     ; AND GO COMPARE NEXT PAIR
NOMATCH:        MOV AX,-1                       ; SET AX TO ERROR VALUE
                MOV [CURSUB],AX                 ; AND STORE IN CURSUB
MATCH:          MOV AX,[CURSUB]                 ; GET ELEMENT NUMBER TO RETURN
                MOV BX,[BP+06h]                 ; GET OFFSET FOR RETURNVAL
                MOV ES:[BX],AX                  ; AND STORE CURSUB IN RETURNVAL
                POP BP                          ; RESTORE BP REGISTER
                RETF
SRCH            ENDP
CODE_SEG        ENDS
                END
