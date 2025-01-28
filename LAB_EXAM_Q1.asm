.MODEL SMALL
.STACK 100H
.DATA
 
MSG1 DB "Input a hex number in lower case[a-f]: $"
MSG2 DB 0AH,0DH, "In capital it is: $"
MSG3 DB 0AH,0DH, "In Decimal it is: $"

 
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9;FOR SHOWING MSG1
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1;Reading digits
    INT 21H
    MOV BL,AL
    
    MOV AH,9;Showing in capital
    LEA DX,MSG2
    INT 21H
    
    SUB BL,32;Subtract to get the upper case
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,9;Decimal String
    LEA DX,MSG3
    INT 21H
    
    MOV AH,2;Showing 1 because it is constant
    MOV DL,49
    INT 21H
    
    SUB BL,17;Converting the uppercase to hex
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN