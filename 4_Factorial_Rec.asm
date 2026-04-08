.model small
.data 
    FACT dw ?       
    msg db "Enter a number between 1 and 8:$"
.stack 100h
.code
.startup
    ; Display message
    MOV DX, OFFSET msg
    MOV AH, 09h
    INT 21h 
    
    ; Read character
    MOV AH, 01h
    INT 21h 
    
    ; Convert ASCII to real integer
    SUB AL, 30h
    MOV AH, 00h

    CALL CALC_FACT
    LEA BX, FACT
    MOV [BX], AX    

.exit

CALC_FACT PROC NEAR
    CMP AX,01h
    JE done
    PUSH AX
    DEC AX
    CALL CALC_FACT
    POP CX
    MUL CX
    done:
    RET
CALC_FACT ENDP

end