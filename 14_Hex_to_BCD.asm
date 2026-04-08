.model small
.data
    Bin_Data db 0FFh
    BCD_Res db ?
    BCD_Hund db ?    
.code
.startup           
MOV AL, Bin_Data         
MOV AH, 00h

;Extract Hundreds
MOV BL, 100              
DIV BL                   ; AL = Quotient (Hundreds), AH = Remainder (Tens+Units)

MOV BCD_Hund, AL         ; Store hundreds digit

;Extract Tens and Units
MOV AL, AH               ; Move the remainder into AL
MOV AH, 00h              ; Clear AH again
MOV BL, 10               ; Divide by 10
DIV BL                   ; AL = Tens,AH = Units

;Combine Tens and Units into BCD_Res (Packed BCD)
MOV CL, 04h
SHL AL, CL               ; Shift Tens to the upper nibble
OR AL, AH                ; Combine with Units

MOV BCD_Res, AL

.exit
end