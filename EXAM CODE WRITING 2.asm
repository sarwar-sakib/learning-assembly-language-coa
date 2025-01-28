.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER THE FIRST NUMBER:$'                        ; Prompt for input
    MSG2 DB 0DH, 0AH, 'THE DIFFERENCE OF $' ; "The Sum of" message
    MSG3 DB ' AND $'                 ; "AND" message
    MSG4 DB ' IS $'                  ; "IS" message 
     MSG5 DB 0DH,0AH, 'ENTER THE SECOND NUMBER:$' 
      MSG6 DB 0DH,0AH, 'INVALID TRY AGAIN$'
    NUM1 DB ? ,  '$'                           ; First number
    NUM2 DB ?  , '$'                           ; Second number
    SUB_RES DB ?, '$'                    ; Sum result

.CODE
MAIN PROC

    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display '?'
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; Input first digit
    MOV AH, 1
    INT 21H
    SUB AL, '0'       ; Convert ASCII to decimal
    MOV NUM1, AL 
    
     ; Display '?'
    LEA DX, MSG5
    MOV AH, 9
    INT 21H

    ; Input second digit
    MOV AH, 1
    INT 21H
    SUB AL, '0'       ; Convert ASCII to decimal
    MOV NUM2, AL

    ; Calculate the sum
    MOV AL, NUM1
    SUB AL, NUM2
    ADD AL, '0'       ; Convert back to ASCII
    MOV SUB_RES, AL   ; Store the result as ASCII

    ; Display "The Sum of"
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    ; Display first number
    MOV AL, NUM1
    ADD AL, '0'       ; Convert to ASCII
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Display "AND"
    LEA DX, MSG3
    MOV AH, 9
    INT 21H

    ; Display second number
    MOV AL, NUM2
    ADD AL, '0'       ; Convert to ASCII
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Display "IS"
    LEA DX, MSG4
    MOV AH, 9
    INT 21H

    ; Display the sum
    LEA DX, SUB_RES
    MOV AH, 9
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
