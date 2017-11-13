;SUBMITTED BY - SUSHMITA YADAV
;ROLL NO      - 38

                                    ;ALP TO PERFORM LINEAR SEARCH OVER AN ARRAY
                
DATA SEGMENT
    
        ARRAY    DB    20   DUP(?) 
                                     
        LEN      DB          ?
        
        NUM      DB          ?                      
        
        TEN      DD          10
        
        msg1     DB         'Enter length of array: ','$'
        
        msg2     DB         10, 'Enter element: ','$'
        
        msg3     DB         10, 10, 'Enter number to be searched: ','$'
        
        msg4     DB         10, 10, 'ELEMENT FOUND AT POSITION: ','$'  
        
        msg5     DB         10, 10, 'ELEMENT NOT FOUND!','$'  
            
DATA ENDS
  
  
CODE SEGMENT
       
          ASSUME CS:CODE, DS:DATA
       
  START:    MOV AX, DATA
            MOV DS, AX 
            MOV ES, AX              ;overlapping ES and DS segment
            
            LEA  DX, msg1
            CALL OUTPUT_MSG
            CALL READH              ;getting length of array 
            
            CMP BL, 20
            JG  EXIT
            MOV LEN, BL             ;saving length in len
            XOR CX, CX
            MOV CL, LEN          
            
            CLD
            MOV DI, OFFSET ARRAY 
    
  INPUT:    LEA  DX, msg2           ;reading elements of array
            CALL OUTPUT_MSG
            CALL READH
            MOV  AL, BL
            STOSB
            LOOP INPUT

            LEA  DX, msg3           ;getting element to be searched
            CALL OUTPUT_MSG
            CALL READH               
            MOV  NUM, BL            ;saving number in 'num'

            CALL LSEARCH        
    
            CMP  CL, LEN              ;when element is not found in the array  
            JLE  FOUND
            LEA  DX, msg5
            CALL OUTPUT_MSG
            JMP  EXIT                   ;exiting
            
  FOUND:    LEA  DX, msg4             ;if element is found -> it's index is displayed
            CALL OUTPUT_MSG
            MOV  DL, CL
            ADD  DL, 30H
            MOV  AH, 2H
            INT  21H
     
   EXIT:    HLT

CODE ENDS
     
     
READH PROC NEAR                      ;procedure to read input and save it in BL
    
    	    XOR DX, DX 
    	    XOR BX, BX 
    	    
 REPEAT:    MOV AH, 01H
    	    INT 21H
            CMP AL, 13               ;returns when enter is pressed
            JE  RETURN 
                                                             
    	    AND  AX, 0FH             ;converts ascii to numeric
            MOV  DL, AL
            XCHG AX, BX
    	    MUL  TEN
            ADD  BX, AX
    	    JMP  REPEAT  
    	    
 RETURN:    RET                     

READH ENDP  
            
            
OUTPUT_MSG PROC NEAR                 ;procedure to display a string on console window
    
            MOV AH, 09H
            INT 21H
            RET        
    
OUTPUT_MSG ENDP


LSEARCH PROC NEAR  
    
            MOV CL, 1
            MOV SI, OFFSET ARRAY
            MOV BL, NUM              ;element to be searched   
            
    SEARCH: LODSB
            CMP AL, BL               ;element found!
            JE  RE
            INC CL
            CMP CL, LEN
            JBE SEARCH
        RE: RET                    
        
LSEARCH ENDP    

    END START