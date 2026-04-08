.model small
.data
    ARR DB 09h,08h,07h,06h,05h,04h,03h,02h
    N DB 8h
.code
.startup
LEA BX,ARR
XOR CX,CX
MOV CL,N
MOV DX,CX
DEC DX
L1:
    L2:
        MOV AL,[BX]
        CMP AL,[BX+1]
        JNG SKIP
        XCHG AL,[BX+1]
        MOV [BX],AL
        SKIP:
        DEC DX
        INC BX
        CMP DX,0h
        JG L2
    MOV DL,N
    DEC DX
    LEA BX,ARR
LOOP L1 
.exit
end