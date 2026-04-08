.model small
.data
    FIB_Out db 8 DUP (0)
    N db 08h
.code
.startup
LEA BX,FIB_Out
MOV BYTE PTR [BX],00h
INC BX
MOV BYTE PTR [BX],1h
LEA BX,N
MOV CL,[BX]
MOV CH,00h
SUB CX,02h
LEA BX,FIB_Out
ADD BX,02h
L1:
    MOV DL,[BX-1]
    MOV DH,[BX-2]
    ADD [BX],DL
    ADD [BX],DH
    INC BX
LOOP L1
.exit