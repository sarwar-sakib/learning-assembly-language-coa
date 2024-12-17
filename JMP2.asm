.MODEL SMALL
.STACK 100H
.DATA
M1 DB ' IS A FRUIT $'  

.CODE
MAIN PROC
   MOV AX, @DATA
   MOV DS, AX
   
   MOV AH, 2
   MOV CX, 3
   
   JMP LVL_3  
   
   LVL_0:
   MOV DL, 'B'
   INT 21H
   
   JMP LVL_5
   
   LVL_1:
   MOV DL, 10
   INT 21H
   MOV DL, 13
   INT 21H
   
   JMP LVL_0
   
   LVL_2: 
   MOV DL, 'Y'
   INT 21H
   
   JMP LVL_6
   
   LVL_3:
   MOV DL, '*'
   INT 21H
   DEC CX
   
   JNZ LVL_3
   
   JMP LVL_1
   
   LVL_4:
   MOV DL, 'R'
   INT 21H
   INT 21H
   
   JMP LVL_2
   
   LVL_5:
   MOV DL, 'E'
   INT 21H
   MOV CX, 2
   
   JMP LVL_4
   
   LVL_6:
   MOV AH, 9
   LEA DX, M1
   INT 21H
   
   MOV AH, 4CH
   INT 21H
             
    MAIN ENDP
END MAIN