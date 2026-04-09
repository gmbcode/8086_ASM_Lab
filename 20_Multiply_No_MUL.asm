.model small
.data
    NUM1 DB 0Fh
    NUM2 DB 0Ah
    PROD DW ?
.code
.startup
    MOV AL, NUM1    
    MOV AH, 00h
    
    MOV BL, NUM2    
    XOR DX, DX ; Clear garbage and store product
    MOV CX, 08h

L1:
    SHR BL, 1       ; Shift Multiplier right. The lowest bit falls into the Carry Flag
    JNC SKIP        ; If Carry Flag is 0 (the bit was 0), skip the addition
    
    ADD DX, AX      ; If Carry Flag is 1, add the Multiplicand to our Product
SKIP:
    SHL AX, 1       ; Shift Multiplicand left
    LOOP L1
    MOV PROD, DX    ; Store the 16-bit result into memory

.exit
end