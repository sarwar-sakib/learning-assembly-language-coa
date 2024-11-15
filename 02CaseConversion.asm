.MODEL SMALL
.STACK 100H  


.DATA 
MSG1 DB 'LOWER TO UPPER: ENTER A LOWER CASE LETTER: $';
MSG2 DB 0DH,0AH, 'THE LETTER IN UPPER CASE IS: $';
MSG3 DB 0DH,0AH, 'UPPER TO LOWER: ENTER A UPPER CASE NUMBER: $';
MSG4 DB 0DH,0AH, 'THE LETTER IN LOWER CASE IS: $';
CHAR DB ?, '$';

.CODE

MAIN PROC  
    
    MOV AX, @DATA;
    MOV DS, AX;
     
    ;DISPLAY MSG1
    LEA DX, MSG1;
    MOV AH, 9;
    INT 21H;  
    
    ;INPUT CHAR    
    MOV AH, 1;
    INT 21H;
             
    ;LOWER TO UPPER CONVERSION; SUB 20   
    SUB AL, 20H;
    MOV CHAR, AL;
    
    ;DISPLAY MSG2
    LEA DX, MSG2;
    MOV AH, 9;
    INT 21H;
    
    ;CONVERTED UPPER CASE DISPLAY    
    LEA DX, CHAR;
    MOV AH, 9;
    INT 21H;
    
    
    
    ;UPPER TO LOWER CONVERSION
    LEA DX, MSG3;
    MOV AH, 9;
    INT 21H;  
    
    ;INPUT CHAR
    MOV AH, 1;
    INT 21H;
             
    ;UPPER TO LOWER CONVERSION    
    ADD AL, 20H;
    MOV CHAR, AL;
    
    ;DISPLAY MSG2    
    LEA DX, MSG4;
    MOV AH, 9;
    INT 21H;
    
    ;DISPLAY UPPER CASE    
    LEA DX, CHAR;
    MOV AH, 9;
    INT 21H;
    
        
    ;EXIT THE HANDLER
    MOV AH,4CH;
    INT 21H
    
    ;REFERENCE: PDF PAGE 82; 
        
    MAIN ENDP
END MAIN
    
    
    
    
    