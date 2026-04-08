.model small
.data
    org 2600h
    N DB 10h    
.code
.startup
MOV SI,2600h
XOR AX,AX ; Clear AX
MOV AL,[SI]
MOV BX,AX ; BX is n
MOV CX,AX ; CX is n+1
INC CX
MOV DX,02h
MUL DX
INC AX
MUL BX
MUL CX
MOV BX,06h
DIV BX
MOV DI,2800h
MOV [DI],AX
.exit
end