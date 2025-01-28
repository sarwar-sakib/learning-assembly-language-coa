.MODEL SMALL
.STACK 100H

N EQU 0DH;
L EQU 0AH; 


.DATA  
A1 DB N,L,'ENTER TWO ALPHABETES: $';

A2 DB N,L,'THE CORRECT ORDER IS: $';
 
A3 DB '@@@@@ $';


 

C1 DB ?, '$';
C2 DB ?, '$';


.CODE

MAIN PROC
      
    ;MOVING DATA TO AX
    MOV AX, @DATA;
    MOV DS, AX;
                 
                ;DISPLAY A1
    LEA DX, A3;
    MOV AH, 9;
    INT 21H;             
              
              
                        ;DISPLAY A1
    LEA DX, A1;
    MOV AH, 9;
    INT 21H;     
                 
    MOV AH,1;
    INT 21H;
    MOV C1,AL; 
    
      
    MOV AH,1;
    INT 21H;
    MOV C2,AL;
    
      



           ;DISPLAY A1
    LEA DX, A2;
    MOV AH, 9;
    INT 21H;            
                   
    ;DISPLAY A1
    LEA DX, C2;
    MOV AH, 9;
    INT 21H;  
             
         ;DISPLAY A1
    LEA DX, C1;
    MOV AH, 9;
    INT 21H;
    
        
 
    
           
    
   
    

    ;EXIT THE HANDLER
    MOV AH,4CH;
    INT 21H
    
        
    MAIN ENDP
END MAIN