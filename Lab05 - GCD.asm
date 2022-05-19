;Encryption Program               (Encrypt.asm)

; This program demonstrates simple symmetric
; encryption using the XOR instruction.

INCLUDE Irvine32.inc
; KEY = 239           any value between 1-255
BUFMAX = 128        ; maximum buffer size

.data
sDividend  BYTE  "Enter the dividend: ",0
sDivisor  BYTE  "Enter the divisor: ",0
sQuestion BYTE  "Do you want to do it again ?(y/n): ",0
sAnswer BYTE  "The greatest common divisor is : ",0
X SDWORD ?
Y SDWORD ?

.code
main PROC
L3:
    call Crlf
    call Crlf

    mov edx,OFFSET sDividend
    call    WriteString
    call    ReadInt
    mov X,eax

    mov edx,OFFSET sDivisor
    call    WriteString
    call    ReadInt
    mov Y,eax

    mov eax,X
    mov ebx,Y

    cmp eax,0
    JG L1
    neg eax
    mov X,eax


L1:

    cmp ebx,0
    JG L2
    neg ebx
    mov Y,ebx

    mov edx,0

L2: 

    mov eax,X
    cdq
    mov ebx,Y 
    idiv ebx


    mov X,ebx
    mov Y,edx
    
    cmp edx,0
    JG L2

    mov edx,OFFSET sAnswer
    call    WriteString
    mov eax,X
    call WriteInt
    call Crlf

    mov edx,OFFSET sQuestion
    call    WriteString
    call ReadChar
    call WriteChar
    cmp al,'y'
    JE L3


    exit
main ENDP

END main