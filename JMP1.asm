.MODEL SMALL
.STACK 100H
.DATA
MAIN PROC
    MOV AH,2
    MOV CX,256
    MOV DL,0
    PRINT:
    INT 21H
    INC DL
    DEC CX
    JNZ PRINT
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN