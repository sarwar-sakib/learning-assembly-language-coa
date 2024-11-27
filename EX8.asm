.MODEL SMALL
.STACK 100H
N EQU 0DH;
L EQU 0AH;

.DATA

M1 DB "?$";
M2 DB N,L, "THE SUM OF$";   
M3 DB " AND $";
M4 DB "IS";

N1 DB ?;
N2 DB ?;
SUM DB ?;

.CODE
MAIN PROC
    MOV AX, @DATA;
    MOV DS, AX;
    
    MOV AH, 9;
    LEA DX, M1;
    INT 21H; 
    
    MOV AH,1;
    MOV N1,AL;
    INT 21H;
    
    MOV AH,1;
    MOV N2,AL;
    INT 21H;
    
    MOV BH, N1;
    MOV CH, N2;
    
    ADD BH,CH;
    MOV SUM,BH;
    
    MOV AH,9;
    MOV DL,SUM;
    INT 21H;
    
    ;ADD N1
    
    
    MOV AH, 4CH;
    INT 21H;
    
    MAIN ENDP;
END MAIN;
