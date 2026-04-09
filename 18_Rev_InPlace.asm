.model small
PRINT MACRO str
    LEA DX, str
    MOV AH, 09h
    INT 21h
ENDM
.data
    STR DB "ABCDDA$"
    StrLen DB 6
    NewL DB 0Ah, 0Dh, '$'
.code
.startup
XOR AX,AX
XOR CX,CX ; Clear garbage
LEA BX,STR
MOV CL,StrLen
LEA SI,STR
ADD SI,CX
DEC SI
PRINT STR
PRINT NewL
L1:
MOV AL,[BX]
XCHG AL,[SI]
MOV [BX],AL
INC BX
DEC SI
CMP BX,SI
JAE SKIP
JMP L1
SKIP:
PRINT STR
.exit
end