.model small
.data
    BCDNum DB 45h
.code
.startup
MOV AL,BCDNum
CALL BCDtoBin ; Store result in AL
.exit

BCDtoBin PROC NEAR
    XOR CX,CX ; Clean garbage from CX
    MOV BL,AL
    AND AL,0F0h ; Upper nibble in AL
    AND BL,0Fh ; Lower nibble in BL
    MOV CL,04h
    SHR AL,CL
    MOV CL,0Ah
    MUL CL
    ADD AL,BL
    RET
BCDtoBin ENDP

end
    
