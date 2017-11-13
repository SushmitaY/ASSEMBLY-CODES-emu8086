DATA SEGMENT
    
    MATRIX1 DW 01H, 02H, 03H
            DW 04H, 05H, 06H
            DW 07H, 08H, 09H    
                   
    MATRIX2 DW 01H, 02H, 03H
            DW 04H, 05H, 06H
            DW 07H, 08H, 09H 
                       
    RESULT DW 9 DUP(?)
    THREE DW 3     
    SIX DW 6
    
DATA ENDS

CODE SEGMENT                

    START:    MOV AX, DATA
              MOV DS, AX
    
              MOV SI,0
              MOV AX,0
              MOV BX,0
              MOV CX,THREE 
              
    LOOP1:    MOV SI,0
              PUSH CX
              MOV CX,THREE
    
    LOOP2:    MOV AX,MATRIX1[BX][SI]
              ADD AX,MATRIX2[BX][SI]
              MOV RESULT[BX][SI], AX
              INC SI           
              INC SI
              LOOP LOOP2
    
              ADD BX,SIX
              POP CX
              LOOP LOOP1
    
CODE ENDS 
    END START
