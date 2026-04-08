.model small
.data 
    fact dw ?
    msg db "Enter a number between 1 and 8 :$"
.code
.startup     
MOV DX,OFFSET msg
MOV AH,09h
INT 21h ;Display message
MOV AH,01h
INT 21h ; Read character into AL 
SUB AL,30h ; Convert ASCII to decimal
AND AX,00FFh
MOV CX,AX
MOV AX,01h
L1:
JCXZ skip
MUL CX
LOOP L1
skip:
LEA BX,fact
MOV [BX],AX
.exit
end
