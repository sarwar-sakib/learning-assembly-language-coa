;REFERENCE: PDF PAGE 93, EX:11; 
;10X10 BOX WITH ASTERICS MANUAL PRINTING;

.MODEL SMALL
.STACK 100H

N EQU 0DH     ;USED FOR NEW LINE1
L EQU 0AH     ;USED FOR NEW LINE1  


.DATA 
B1 DB '********** $';
B2 DB N,L, '********** $';


.CODE

MAIN PROC
      
    ;MOVING DATA TO AX
    MOV AX, @DATA;
    MOV DS, AX;
     
    ;DISPLAY B1
    LEA DX, B1;
    MOV AH, 9;
    INT 21H;  
    
    
    ;DISPLAY B2
    LEA DX, B2;
    MOV AH, 9;
    INT 21H;  
    
    
    ;DISPLAY B3
    LEA DX, B2;
    MOV AH, 9;
    INT 21H;  

    
    ;DISPLAY B4
    LEA DX, B2;
    MOV AH, 9;
    INT 21H;  

    
    ;DISPLAY B5
    LEA DX, B2;
    MOV AH, 9;
    INT 21H;
      
    
    ;DISPLAY B6
    LEA DX, B2;
    MOV AH, 9;
    INT 21H;
    
    
    ;DISPLAY B7
    LEA DX, B2;
    MOV AH, 9;
    INT 21H;  
    

    
    ;DISPLAY B8
    LEA DX, B2;
    MOV AH, 9;
    INT 21H;  
    

    
    ;DISPLAY B9
    LEA DX, B2;
    MOV AH, 9;
    INT 21H;  

    
    ;DISPLAY B10
    LEA DX, B2;
    MOV AH, 9;
    INT 21H;  
    
    
        
    ;EXIT THE HANDLER
    MOV AH,4CH;
    INT 21H
    
        
    MAIN ENDP
END MAIN
    
    
    
    
    