.model small
.data
    Num1 db 02h
    Num2 db 03h
    GCD_Out db ?
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
MOV GCD_Out,AL
.exit
end