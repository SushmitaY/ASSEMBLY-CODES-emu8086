DATA SEGMENT
    
    ARRAY       DW     1H, 2H, 3H, 4H, 5H, 6H, 7H
    SIZE        DW     7
    ELEMENT     DW     14H
    TABLE       DW  3  DUP(?)
    FOUND_MSG   DB     10,10,'ELEMENT FOUND!!','$'
    NFOUND_MSG  DB     10,10,'ELEMENT NOT FOUND!!','$' 
    
DATA ENDS

CODE SEGMENT 
    
    ASSUME CS:CODE, DS:DATA
    
    START:  MOV AX, DATA
            MOV DS, AX 
            MOV ES, AX
           
            MOV TABLE, OFFSET ARRAY    
            MOV TABLE+2, OFFSET SIZE
            MOV TABLE+4, OFFSET ELEMENT
            MOV BX, OFFSET TABLE
            CALL LSEARCH 
            HLT
            
CODE ENDS

LSEARCH PROC NEAR
    
    PUSH AX
    PUSH CX  
    PUSH DX
    PUSH SI
    PUSH DI
    
    MOV SI, [BX] 
    MOV DI, [BX+2]
    MOV CX, [DI]
    MOV DI, [BX+4]
    MOV DI, [DI] 
    
    REPEAT:     CMP [SI], DI
                JE FOUND   
                INC SI
                INC SI
                LOOP REPEAT
            
    NOT_FOUND:  LEA DX,NFOUND_MSG
                MOV AH,9H
                INT 21H
                JMP RE
    
    FOUND:      LEA DX,FOUND_MSG
                MOV AH,9H
                INT 21H
                
    RE:         POP DI 
                POP SI
                POP DX
                POP CX
                POP AX
    
                RET 
    
LSEARCH ENDP

    END START
                
             
    
                           
                      