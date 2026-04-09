.model small
.data
    STR1 DB "12345678998765432123"
    STR2 DB "12345678998765432123"
    StrLen DB 20
.code
.startup
MOV AX,DS
MOV ES,AX ; Load ES to same location as DS (model small)
XOR AX,AX
XOR BX,BX 
XOR CX,CX ;Clean garbage
LEA SI,STR1
LEA DI,STR2
MOV CL,StrLen
CLD ; Important so that DF = 0 at start
REPE CMPSB
JNZ S2
S1:
MOV BL,1h
JMP SKIP
S2:
MOV BL,0h


SKIP:
.exit
end