DATA SEGMENT
    
    MATRIX1 DW 01H, 02H, 03H
            DW 04H, 05H, 06H
            DW 07H, 08H, 09H    
                   
    MATRIX2 DW 01H, 02H, 03H
            DW 04H, 05H, 06H
            DW 07H, 08H, 09H 
                       
    RESULT DW 9 DUP(?)  
    SUM    DW ?
    TWO DW 2
    THREE DW 3
    FOUR DW 4     
    SIX DW 6
    
DATA ENDS

CODE SEGMENT                

    START:    MOV AX, DATA
              MOV DS, AX
              MOV ES, AX
    
              MOV SI,0  
              MOV DI,0
              MOV AX,0
              MOV CX,THREE                   ;no. of rows of Matrix1
              
    LOOP1:    MOV DI,0
              PUSH CX
              MOV CX,THREE                  ;no. of columns of Matrix2
    
    LOOP2:    MOV BX,0 
              MOV SUM,0    
              PUSH CX
              MOV CX,THREE
              
    LOOP3:    MOV AX, MATRIX1[SI][BX] 
              PUSH BX
              PUSH AX
              MOV AX,BX
              MUL THREE
              MOV BX,AX
              POP AX
              MUL MATRIX2[BX][DI]
              POP BX
              ADD AX,SUM
              MOV SUM, AX 
              ADD BX,2 
              LOOP LOOP3
               
              MOV BX,DI         
              ADD DI, 2        
              MOV AX,SUM               
              MOV RESULT[SI][BX], AX   
              POP CX
              LOOP LOOP2
              
              ADD SI, 6 
              POP CX
              LOOP LOOP1
    
CODE ENDS 
    END START
