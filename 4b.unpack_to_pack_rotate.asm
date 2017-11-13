;SUBMITTED BY - SUSHMITA YADAV
;ROLL NO      - 38

                                ; ALP TO PACK UNPACKED BCD NUMBERS USING ROTATION
DATA SEGMENT
    
    UNPACKED    DB  01H, 01H, 02H, 03H, 04H, 05H, 06H, 08H, 09H, 02H, 03H, 05H, 07H, 09H, 06H, 05H   
    
    PACKED      DB  8   DUP(?) 
    
DATA ENDS

         
CODE SEGMENT
    
    ASSUME CS:CODE, DS:DATA
    
    START:  MOV AX, DATA
            MOV DS, AX
            MOV ES, AX  
            
            MOV CH, 8 
            MOV CL, 4
            MOV SI, 0
            MOV DI, SI
            
  CONVERT:  MOV AX, WORD PTR UNPACKED[SI] 
            ROL AL, CL
            ROR AX, CL
            MOV PACKED[DI], AL
            INC DI
            INC SI
            INC SI
            DEC CH
            JNZ CONVERT
                       
CODE ENDS

    END START
           




