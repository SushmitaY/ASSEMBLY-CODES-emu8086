;SUBMITTED BY - SUSHMITA YADAV
;ROLL NO      - 38
        
                                ;ALP TO CALCULATE SUM OF ELEMENTS OF ARRAY OF SIZE 10
             
             
DATA SEGMENT
    
    ARRAY       DD      1H,2H,3H,4H,5H,6H,7H,8H,9H,AH
    SUM         DD      ?   
    
DATA ENDS 



CODE SEGMENT
    
    ASSUME CS:CODE, DS:DATA
    
    START:  MOV AX, DATA                   
            MOV DS, AX 
             
            XOR AX, AX                     ;clearing AX
            XOR DX, DX                     ;clearing DX
            MOV SI, 0                      ;clearing SI  
            
            MOV CX, 10                     ;updating CX with size of the array
            
 ADDITION:  ADD AX,word ptr ARRAY[SI]      ;adding lower word
            ADC DX,word ptr ARRAY[SI+2]    ;adding upper word
            ADD SI,4
            LOOP ADDITION 
            
            MOV word ptr SUM, AX           ;storing the lower word in memory
            MOV word ptr SUM + 2, DX       ;storing the upper word in memory
    
            
CODE ENDS

    END START