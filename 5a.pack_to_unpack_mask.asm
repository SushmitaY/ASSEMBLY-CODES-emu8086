;SUBMITTED BY - SUSHMITA YADAV
;ROLL NO      - 38

                                ; ALP TO UNPACK PACKED BCD NUMBERS USING MASKING

DATA SEGMENT
    
    PACKED    DB  21H, 34H, 56H, 73H, 32H, 68H, 95H, 87H 
    
    UNPACKED  DB  16   DUP(?) 
    
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
            
  CONVERT:  MOV AL, PACKED[SI]  
            AND AL, 0fH
            MOV AH, PACKED[SI]
            AND AH, 0f0H
            SHR AH, CL  
            MOV WORD PTR UNPACKED[DI], AX
            INC DI
            INC DI 
            INC SI
            DEC CH
            JNZ CONVERT
                       
CODE ENDS

    END START