;SUBMITTED BY - SUSHMITA YADAV
;ROLL NO      - 38

                                ; ALP TO TRANSFER A BLOCK OF DATA FROM ONE MEMORY LOCATION TO ANOTHER

DATA SEGMENT
    
    SOURCE    DB  21H, 34H, 56H, 73H, 32H, 68H, 95H, 87H 
    
    DEST      DB  8   DUP(?) 
    
DATA ENDS

         
CODE SEGMENT
    
    ASSUME CS:CODE, DS:DATA
    
    START:  MOV AX, DATA
            MOV DS, AX
            MOV ES, AX  
            
            MOV CX, 8
            
            LEA SI, SOURCE
            LEA DI, DEST
            CLD
            REP MOVSB
                       
CODE ENDS

    END START
           







