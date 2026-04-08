.model small
.data
    ARRAY1 DB 10h,20h,30h,40h
    ARRAY2 DB 1h,2h,3h,4h
.code
.startup
LEA BX,ARRAY1
LEA SI,ARRAY2
MOV DI,7000h
MOV CX,04h
L1:
MOV AL,[BX]
ADD AL,[SI]
MOV [DI],AX
INC BX
INC SI
INC DI
LOOP L1
.exit
end