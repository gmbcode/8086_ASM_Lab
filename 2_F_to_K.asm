.model small
.data
    Deg_Far dw 0030h
    Deg_Kel dw ?
.code
.startup    
LEA BX,Deg_Far
MOV AX,[BX]
SUB AX,20h
MOV BX,05h
IMUL BX
MOV BX,09h
IDIV BX
ADD AX,0111h
LEA BX,Deg_Kel
MOV [BX],AX
.exit
end

