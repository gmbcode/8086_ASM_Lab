.model small
.data
    NUM DB 1h
    ROOT DB ?
.code
.startup
MOV AL,NUM
CMP AL, 00h
MOV DX,00h     
JE SKIP
MOV DX,1h ; DX is our counter
MOV BX,01h
L1:
SUB AL,BL
JZ SKIP
ADD BL,02h
INC DX
JMP L1
SKIP:
MOV ROOT,DL
.exit
end