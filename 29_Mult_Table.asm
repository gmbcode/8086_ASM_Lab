.model small
.data
    NUM DB 04h
    TABLE DB 10 DUP (0)
.code
.startup
MOV CX,0Ah
MOV DX,1h
XOR AX,AX
MOV AL,NUM
LEA BX,TABLE
L1:
    MUL DL
    MOV [BX],AL
    MOV AL,NUM
    INC DX
    INC BX
LOOP L1 
.exit
end