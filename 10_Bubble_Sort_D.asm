.model small
.data
    ARR DB 01h,02h,03h,04h,05h,06h,07h,08h
    N DB 8h
.code
.startup
LEA BX,ARR
XOR CX,CX
MOV CL,N
L1:
   PUSH CX
   MOV CL,N ; Can also remove this technically
   DEC CL
   L2:
      MOV AL,[BX]
      CMP AL,BYTE PTR [BX + 1]
      JG SKIP
      XCHG AL,[BX +1]
      MOV [BX],AL
      SKIP:
      INC BX
   LOOP L2       
   LEA BX,ARR
   POP CX
LOOP L1 
.exit
end