DATA SEGMENT
    
    N       DW  7
    FACT    DW  ?
    
DATA ENDS   
         
CODE SEGMENT
    
    ASSUME CS:CODE, DS:DATA
    
    START:  MOV AX, DATA
            MOV DS, AX  
            
            CALL FACTORIAL
     
CODE ENDS

FACTORIAL PROC NEAR
    
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
           
    MOV CX, N  
    MOV AX, 1         
    
    REPEAT:   MUL CX  
              LOOP REPEAT
              
    MOV FACT, AX
    
    POP DX
    POP CX
    POP BX
    POP AX
    
FACTORIAL ENDP 

    END START
            
    
