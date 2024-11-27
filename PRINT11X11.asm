.MODEL SMALL
.STACK 100H

N EQU 0DH;
L EQU 0AH; 


.DATA
A2 DB N,L,'*********** $';
A3 DB N,L,'****$';  
A4 DB '****$';
C1 DB ?, '$';
C2 DB ?, '$';
C3 DB ?, '$';


.CODE

MAIN PROC
      
    ;MOVING DATA TO AX
    MOV AX, @DATA;
    MOV DS, AX;
    
    MOV AH,1;
    INT 21H;
    MOV C1,AL; 
    
      
    MOV AH,1;
    INT 21H;
    MOV C2,AL;
    
      
    MOV AH,1;
    INT 21H;
    MOV C3,AL; 


           ;DISPLAY A1
    LEA DX, A2;
    MOV AH, 9;
    INT 21H;            
                   
    ;DISPLAY A1
    LEA DX, A2;
    MOV AH, 9;
    INT 21H;  
             
         ;DISPLAY A1
    LEA DX, A2;
    MOV AH, 9;
    INT 21H;
    
        ;DISPLAY A1
    LEA DX, A2;
    MOV AH, 9;
    INT 21H; 
    
            ;DISPLAY A1
    LEA DX, A2;
    MOV AH, 9;
    INT 21H;
    
            ;DISPLAY A1
    LEA DX, A3;
    MOV AH, 9;
    INT 21H;
    
                ;DISPLAY A1
    LEA DX, C1;
    MOV AH, 9;
    INT 21H;
    
                    ;DISPLAY A1
    LEA DX, C2;
    MOV AH, 9;
    INT 21H; 
    
                    ;DISPLAY A1
    LEA DX, C3;
    MOV AH, 9;
    INT 21H;
    
                    ;DISPLAY A1
    LEA DX, A4;
    MOV AH, 9;
    INT 21H;   
    
       ;DISPLAY A1
    LEA DX, A2;
    MOV AH, 9;
    INT 21H; 
    
       ;DISPLAY A1
    LEA DX, A2;
    MOV AH, 9;
    INT 21H; 
    
       ;DISPLAY A1
    LEA DX, A2;
    MOV AH, 9;
    INT 21H; 
    
       ;DISPLAY A1
    LEA DX, A2;
    MOV AH, 9;
    INT 21H; 
    
       ;DISPLAY A1
    LEA DX, A2;
    MOV AH, 9;
    INT 21H; 

    ;EXIT THE HANDLER
    MOV AH,4CH;
    INT 21H
    
        
    MAIN ENDP
END MAIN