.model small

ROOT MACRO reg 
    LOCAL L_ROOT, IS_ZERO, DONE
    PUSH CX
    PUSH AX
    
    MOV AL, reg
    CMP AL, 00h
    JE IS_ZERO
    
    MOV CL, 01h
    MOV CH, 01h
    
L_ROOT:
    SUB AL, CH
    JZ DONE
    INC CL
    ADD CH, 02h
    JMP L_ROOT
    
IS_ZERO:
    MOV CL, 00h 
    
DONE: 
    MOV reg, CL
    POP AX
    POP CX
ENDM

.data
    A DB 01h        ; a = 1
    B DB 0FEh       ; b = -2
    C DB 01h        ; c = 1
    ROOT1 DB ?
    ROOT2 DB ?

.code
.startup


    MOV AL, B
    NEG AL
    MOV BL, AL

    MOV AL, B
    IMUL AL         ; Signed: AL * AL -> AX = 4. 
    MOV DL, AL      ; DL = b^2 (4)

    ; Calculate 4ac
    MOV AL, 04h
    IMUL A          ; AL = 4 * a
    IMUL C          ; AL = 4ac (4)

    ; Delta = b^2 - 4ac
    SUB DL, AL      ; DL = 4 - 4 = 0. 

    ROOT DL         ; DL now holds sqrt(Delta)
    MOV AL, 02h
    IMUL A
    MOV BH, AL

    MOV AL, BL 
    ADD AL, DL      ; AL = -b + sqrt(Delta)
    
    CBW             ; Extends AL into AX for signed division
    IDIV BH         ; Signed Divide: AX / BH. Quotient goes to AL!
    MOV ROOT1, AL   ; Store Root 1

    MOV AL, BL      ; AL = -b
    SUB AL, DL      ; AL = -b - sqrt(Delta)
    
    CBW
    IDIV BH         ; AX / BH -> AL
    MOV ROOT2, AL   ; Store Root 2

.exit
end