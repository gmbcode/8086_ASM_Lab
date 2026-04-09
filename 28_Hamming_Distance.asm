.model small
.data
    NUM1 DB 04h
    NUM2 DB 03h
    DIST DB ?
.code
.startup
MOV AL,NUM1
MOV BL,NUM2
XOR AL,BL
MOV CX,08h
MOV DL,0h
L1:
    SHR AL,1h
    JNC SKIP
    INC DL
    SKIP:
LOOP L1
MOV DIST,DL
.exit
end