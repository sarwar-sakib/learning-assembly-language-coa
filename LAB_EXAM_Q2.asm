.MODEL SMALL
.STACK 100H
.DATA
 
MSG1 DB "PROVIDE TWO INPUTS (MORE THAN 5): $"
MSG2 DB 0AH,0DH, "THE SUM OF $"
MSG3 DB  " AND $"
MSG4 DB " IS:$"

MSG5 DB " THE SUM IS: $"
MSG6 DB 0AH,0DH,"* * * * * * * * * * * $" 
MSG7 DB 0AH,0DH,"* *$"
MSG8 DB "* * $"
 
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9;FOR SHOWING MSG1
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1;Setting AH to 1 for taking input
    INT 21H;1st input
    MOV BL,AL
    INT 21H;2nd input
    MOV BH,AL
    
    MOV AH,9;Setting AH to output string
    LEA DX,MSG2
    INT 21H
    
    ;Showing the first input
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    
    MOV AH,9;FOR SHOWING MSG3
    LEA DX,MSG3
    INT 21H
    
    ;Showing the second input
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,9;FOR SHOWING MSG4
    LEA DX,MSG4
    INT 21H 
    
    ADD BL,BH;1 is constant
    SUB BL,58
    
    MOV AH,2
    MOV DL,49
    INT 21H
    MOV DL,BL
    INT 21H
    
    
    
    
    
    
    MOV AH,9;Setting AH to output string
    LEA DX,MSG6
    INT 21H
    INT 21H
    
    MOV AH,9;FOR SHOWING MSG4
    LEA DX,MSG7
    INT 21H
    
    MOV AH,9;Setting AH to output string
    LEA DX,MSG5
    INT 21H

    MOV AH,2
    MOV DL,49
    INT 21H
    MOV DL,BL
    INT 21H
    
    MOV AH,9
    LEA DX,MSG8
    INT 21H
    
    
    MOV AH,9
    LEA DX,MSG6
    INT 21H
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN