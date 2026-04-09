.model small
.data
    ARRAY DB 10h,14h,12h,13h,15h,17h,21h,24h
    N DB 08h
    RESULT DB ?
.code
.startup
LEA BX,ARRAY
XOR CX,CX
MOV CL,N
MOV DX,0h
L1:
    MOV AL,[BX]
    TEST AL,01h
    JZ EVEN
    ODD:
        INC DX
        JMP SKIP
    EVEN:
        DEC DX
    SKIP:
        INC BX
LOOP L1
CMP DX,0h
JE EQUAL
MOV RESULT,00h
JMP FINISH
EQUAL:
MOV RESULT,01h
FINISH:
.exit
end