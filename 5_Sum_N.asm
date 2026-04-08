.model small
.data
    NSUM DW ?
    MSG DB "Enter a number between 01 and 20:$"
.code
.startup
LEA DX,MSG
MOV AH,09h
INT 21h
MOV AH,01h
INT 21h
SUB AL,30h
MOV AH,00h
MOV CX,0Ah
MUL CX
MOV DX,AX
MOV AH,01h
INT 21h
SUB AL,30h
MOV AH,00h
ADD AX,DX ; AX has our input now
MOV BX,AX
INC BX ; Get n+1
MUL BX ; DX:AX is now n(n+1)
MOV CX,02h
DIV CX     
MOV NSUM,AX ; Store answer in nsum
.exit
end
