.model small
.data
    NUM DB 0FFh
    COUNT DB 0h
.code
.startup
MOV AL,NUM
MOV CX,08h
L1:
SHR AL,1
JC CNT 
JMP SKIP
CNT:
INC COUNT
SKIP:
LOOP L1 
.exit
end