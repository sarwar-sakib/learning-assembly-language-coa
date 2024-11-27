.MODEL SMALL
.STACK 100H
N EQU 0DH ; Carriage return
L EQU 0AH ; Line feed

.DATA
    M1 DB "?", '$'
    M2 DB N, L, "THE SUM OF ", '$'   
    M3 DB " AND ", '$'
    M4 DB " IS ", '$'

    N1 DB 0 ; First number input as ASCII
    N2 DB 0 ; Second number input as ASCII
    SUM DB 0 ; Sum of numbers in ASCII

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display "?"
    MOV AH, 9
    LEA DX, M1
    INT 21H 
    
    ; Read first digit
    MOV AH, 1
    INT 21H
    MOV N1, AL  ; Store the first input character (ASCII)

    ; Display the entered digit
    ;MOV AH, 2
    ;MOV DL, N1
    ;INT 21H
    
    ; Read second digit
    MOV AH, 1
    INT 21H
    MOV N2, AL  ; Store the second input character (ASCII)
    
    ; Display the entered digit
   ; MOV AH, 2
   ; MOV DL, N2
   ; INT 21H

    ; Convert ASCII to numeric value
    SUB N1, '0' ; Convert from ASCII to number
    SUB N2, '0' ; Convert from ASCII to number

    ; Add the two numbers
    MOV AL, N1
    ADD AL, N2
    MOV SUM, AL  ; Store the sum in SUM

    ; Convert sum back to ASCII
    ADD SUM, '0' ; Convert from number to ASCII

    ; Display result
    MOV AH, 9
    LEA DX, M2  ; "THE SUM OF "
    INT 21H
    
    MOV AH, 2
    MOV DL, N1
    ADD DL, '0' ; Convert back to ASCII for display
    INT 21H

    MOV AH, 9
    LEA DX, M3  ; " AND "
    INT 21H

    MOV AH, 2
    MOV DL, N2
    ADD DL, '0' ; Convert back to ASCII for display
    INT 21H

    MOV AH, 9
    LEA DX, M4  ; " IS "
    INT 21H

    MOV AH, 2
    MOV DL, SUM ; Display the sum
    INT 21H

    ; New line
    MOV AH, 2
    MOV DL, N
    INT 21H
    MOV DL, L
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
