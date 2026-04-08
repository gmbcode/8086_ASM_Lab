.model small
.data
    Num1 db 0FFh
    Num2 db 05h
    LCM_Out dw ?
.code
.startup
MOV AL,Num1
MOV BL,Num2
L1:
    CMP AL,BL
    JE SKIP
    JA S2
    S1:
      SUB BL,AL
      JMP L1
    S2:
      SUB AL,BL
    JMP L1
SKIP:
MOV CL,AL
MOV CH, 00h
MOV AL,Num1
MOV BL,Num2
MUL BL
XOR DX,DX
DIV CX
MOV LCM_Out,AX
.exit
end