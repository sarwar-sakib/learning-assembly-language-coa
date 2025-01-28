.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'REVERSED ORDER: $'
    MSG2 DB 0AH, 0DH, 'SUM OF NUMBERS: $'
    NEWLINE DB 0AH, 0DH, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display the message "REVERSED ORDER:"
    MOV AH, 9
    LEA DX, MSG1
    INT 21H

    ; Push the numbers '1', '2', '3' onto the stack
    MOV AL, '1'
    PUSH AX
    MOV AL, '2'
    PUSH AX
    MOV AL, '3'
    PUSH AX

    ; Pop and display each number
    POP AX
    MOV DL, AL
    SUB AL, '0'  ; Convert ASCII to numeric
    ADD BL, AL   ; Add to sum
    
    MOV AH, 2
    INT 21H

    POP AX
    MOV DL, AL
    SUB AL, '0'  ; Convert ASCII to numeric
    ADD BL, AL   ; Add to sum
    
    MOV AH, 2
    INT 21H

    POP AX
    MOV DL, AL
    SUB AL, '0'  ; Convert ASCII to numeric
    ADD BL, AL   ; Add to sum
    
    MOV AH, 2
    INT 21H

    ; Display the message "SUM OF NUMBERS:"
    MOV AH, 9
    LEA DX, MSG2
    INT 21H

    ; Display the sum
    ADD BL, '0'  ; Convert sum to ASCII
    MOV DL, BL
    MOV AH, 2
    INT 21H

    ; Exit the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
