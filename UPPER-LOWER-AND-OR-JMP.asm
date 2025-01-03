.MODEL SMALL
.STACK 100H

N EQU 0AH
L EQU 0DH

.DATA 

    PROMT DB 'ENTER A CHARACTER: $'
    MU DB N,L, 'CONVERTED TO UPPER CASE: $' 
    ML DB N,L, 'CONVERTED TO LOWER CASE: $'  
    MNL DB N,L,  'INPUT IS NOT A LETTER $'
    CHAR DB ?


.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX  
    
    MOV AH, 9
    LEA DX, PROMT
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    CMP BL, 'A'
    JB NOT_LETTER
    
    CMP BL, 'Z'
    JBE UPPER_CASE
    
    CMP BL, 'a'
    JB NOT_LETTER
    
    CMP BL, 'z'
    JBE LOWER_CASE
    
    LOWER_CASE:
    
    AND BL, 11011111B
    
    MOV AH, 9
    LEA DX, MU
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    JMP EXIT
    
    
    UPPER_CASE:
    
    
    OR BL, 00100000B
    
    MOV AH, 9
    LEA DX, ML
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H 
    JMP EXIT
    
    NOT_LETTER:
    
    MOV AH, 9
    LEA DX, MNL
    INT 21H
     
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN