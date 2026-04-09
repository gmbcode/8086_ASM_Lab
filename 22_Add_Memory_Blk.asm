.model small
.data
    B1 DB 23h,42h,63h,77h,25h
    B2 DB 31h,12h,50h,33h,20h
    B_Len DB 05h
.code
.startup
XOR CX,CX
MOV CL,B_Len
LEA BX,B1
LEA SI,B2
L1:
    MOV AL,[BX]
    ADD [SI],AL
    INC BX
    INC SI
LOOP L1 
.exit
end