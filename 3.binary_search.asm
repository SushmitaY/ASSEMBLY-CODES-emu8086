;SUBMITTED BY - SUSHMITA YADAV
;ROLL NO      - 38
        
                            ;ALP TO PERFORM BINARY SEARCH IN A SORTED ARRAY
 
DATA SEGMENT
    
    ARRAY   DB  20  DUP(?) 
                                 
    LEN     DB          ?
    
    NUM     DB          ? 
    
    BEG     DB          ?
    
    LAST    DB          ? 
    
    TWO     DB          2                     
    
    TEN     DB          10
    
    msg1    DB      'Enter length of array: ','$'
    
    msg2    DB      10,'Enter element( ascending order ): ','$'
    
    msg3    DB      10,10,'Enter number to be searched: ','$'
    
    msg4    DB      10,10,'ELEMENT FOUND AT POSITION: ','$'  
    
    msg5    DB      10,10,'ELEMENT NOT FOUND!','$'  
   
            
DATA ENDS



CODE SEGMENT
       

          ASSUME CS:CODE, DS:DATA
       
  START:    MOV AX, DATA
            MOV DS, AX 
            MOV ES, AX              ;overlapping ES and DS segment
            
            LEA DX, msg1
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

            LEA  DX, msg3            ;getting element to be searched
            CALL OUTPUT_MSG
            CALL READH               
            MOV  NUM, BL             ;saving number in 'num'
        
            CALL BSEARCH        
   
     
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
    
    
BSEARCH PROC NEAR                    ;procedures to perform binary search over the input array  
    
            MOV BEG, 0               ; beg <- 0     last <- size(array) - 1
            MOV AL, LEN 
            AND AX, 0FFH
            MOV LAST, AL
            DEC LAST
  
    SEARCH: MOV AL, BEG              
            CMP AL, LAST
            JG  NOT_FOUND            ; when beg > last => Element to be searched is not present in the array
            ADD AL, LAST
            DIV TWO                  ; AL <- (beg + last)/2
            AND AX, 0FFH 
            MOV SI, AX
            MOV DL, NUM
            CMP DL, BYTE PTR ARRAY[SI] 
            JL  LEFT
            JG  RIGHT
            JE  FOUND
     
      LEFT: MOV LAST, AL             ; If element is present in the left half of array  
            DEC LAST
            JMP SEARCH
            
     RIGHT: MOV BEG, AL              ; If element is present in the right half of array 
            INC BEG
            JMP SEARCH 
            
     FOUND: LEA DX,msg4              ; If element is found => display the index at which it is found 
            CALL OUTPUT_MSG
            MOV DX,SI
            ADD DL,30H
            MOV AH,2H
            INT 21H  
            JMP RE
            
 NOT_FOUND: LEA DX,msg5              ; If element is not found
            CALL OUTPUT_MSG
                
        RE: RET                    

BSEARCH ENDP    

    END START