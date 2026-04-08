.model small
.data
    STR db "TESTING 123$"
    STRCPY db 12 DUP (0)
    StrLen db 0Bh
    NewL db 0Dh,0Ah,'$'  
.code
.startup
XOR CX,CX
MOV AX,DS
MOV ES,AX
LEA DI,STRCPY
LEA SI,STR
MOV CL,StrLen
INC CX
REP MOVSB
LEA DX,STR
MOV AH,09h
INT 21h 
LEA DX,NewL
MOV AH,09h
INT 21h
LEA DX,STRCPY
MOV AH,09h
INT 21h
.exit
end