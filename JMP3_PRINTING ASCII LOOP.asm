.MODEL SMALL                ; Specifies the memory model (SMALL: single data and code segment)
.STACK 100H                 ; Allocates 256 bytes (100H) for the stack
.DATA                       ; Starts the data segment (no data declared here)

.CODE                       ; Starts the code segment
MAIN PROC                   ; Entry point for the program
   MOV CX, 127              ; Initialize CX with 127 (ASCII code for the DEL character)
   MOV BL, 0                ; Initialize BL as a counter for line breaks

   PRINT:                   ; Label for the printing loop
   MOV AH, 2                ; DOS function to display a character
   INC CX                   ; Increment CX to point to the next ASCII character
   CMP CX, 255              ; Compare CX with 255 (ASCII code of the last valid character)
   JA EXIT                  ; If CX > 255, jump to the EXIT label to terminate the program

   MOV DX, CX               ; Load CX (current character's ASCII value) into DX
   INT 21H                  ; Call DOS interrupt to print the character

   MOV DX, 32D              ; Load ASCII value for space (32 decimal) into DX
   INT 21H                  ; Print the space after the character

   JMP GO                   ; Jump to the GO label

   GO:                      ; Label for checking and updating the line break counter
   INC BL                   ; Increment BL (line character counter)
   CMP BL, 10               ; Compare BL with 10 (10 characters per line)
   JE NL                    ; If BL equals 10, jump to NL label to print a newline

   JMP PRINT                ; Otherwise, loop back to the PRINT label

   NL:                      ; Label to handle newline
   MOV AH, 2                ; DOS function to display a character
   MOV DL, 0DH              ; Load ASCII value for carriage return (CR)
   INT 21H                  ; Print the carriage return
   MOV DL, 0AH              ; Load ASCII value for line feed (LF)
   INT 21H                  ; Print the line feed (move to the next line)

   MOV BL, 0                ; Reset BL for the next line
   JMP PRINT                ; Jump back to the PRINT label

   EXIT:                    ; Label to terminate the program
   ; (No operations here; program ends after returning from MAIN)

MAIN ENDP                   ; End of the MAIN procedure
END MAIN                    ; End of the program, with MAIN as the entry point
