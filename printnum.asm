.MODEL SMALL
.STACK 100H

N EQU 0DH
L EQU 0AH

.DATA
    MSG1 DB 'INSERT A NUMBER: $' 
    MSG2 DB N, L, 'THE NUMBER IS: $' ;                       
    NUM1 DB ?,'$'
    NUM2 DB ?,'$'                           
    

.CODE
MAIN PROC

    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; Input first digit
    MOV AH, 1
    INT 21H
    SUB AL, '0'       ; Convert ASCII to decimal
    MOV NUM1, AL 
    
     MOV AH, 1
    INT 21H
    SUB AL, '0'       ; Convert ASCII to decimal
    MOV NUM2, AL
    
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    
     MOV AL, NUM1
    ADD AL, '0'       ; Convert to ASCII
    MOV DL, AL
    MOV AH, 2
    INT 21H
 
    ; Display first number
    MOV AL, NUM2
    ADD AL, '0'       ; Convert to ASCII
    MOV DL, AL
    MOV AH, 2
    INT 21H
    
    


  
    ; Exit program
    MOV AH, 4CH
    INT 21H


MAIN ENDP
END MAIN
