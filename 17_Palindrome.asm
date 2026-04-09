.model small

PRINT MACRO str
    LEA DX, str
    MOV AH, 09h
    INT 21h
ENDM
.data
    STR DB "ABCCBA$"
    RevStr DB 7 DUP('$')
    StrLen DB 6
    MSG DB "The strings are equal$"
    MSG1 DB "The strings are not equal$"
    NewL DB 0Dh, 0Ah, '$'       
.code
.startup
    XOR AX, AX
    XOR CX,CX
    LEA BX, STR
    LEA SI, STR
    MOV AL, StrLen
    DEC AX
    ADD SI, AX 

L1:
    MOV AL, [BX]
    CMP AL, [SI]     
    JNE NOTP         
    
    INC BX 
    DEC SI 
    
    CMP BX, SI
    JGE P 
    JMP L1
P:
    PRINT MSG
    PRINT NewL
    PRINT STR
    PRINT NewL
    PRINT STR
    JMP SKIP 
NOTP:
    PRINT MSG1
    PRINT NewL
    PRINT STR
    PRINT NewL
    LEA BX, STR
    XOR CX, CX
    MOV CL, StrLen
    ADD BX, CX
    DEC BX  
    LEA SI, RevStr
L2:
    MOV AL, [BX]
    MOV [SI], AL
    INC SI
    DEC BX
    LOOP L2    
    PRINT RevStr

SKIP:
.exit
end