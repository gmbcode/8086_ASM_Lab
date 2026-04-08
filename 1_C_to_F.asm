.model small
.data
    Deg_Cent db 30h
    Deg_Far db ?
.code
.startup
LEA BX,Deg_Cent
MOV AL,[BX]
MOV BL,09h
IMUL BL
MOV BL,05h  
IDIV BL
ADD AL,20h
LEA BX,Deg_Far
MOV [BX],AL
.exit
end


