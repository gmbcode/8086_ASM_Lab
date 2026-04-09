.model small
.data
    BIN_Data DB 0Ah
    GRAY_Out DB ?
.code
.startup
MOV AL,BIN_Data
MOV BL,AL
SHR BL,1h
XOR AL,BL
MOV GRAY_Out,AL
.exit
end