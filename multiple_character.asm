ORG 100h
start:
MOV DX, OFFSET msg_input
MOV AH, 09h
INT 21h
MOV DI, OFFSET buffer
input_loop:
MOV AH, 01h
INT 21h
CMP AL, 0Dh
JE display
CMP DI, OFFSET buffer_end
JE input_loop
STOSB
JMP input_loop
display:
MOV BYTE PTR [DI], '$'
MOV DX, OFFSET msg_output
MOV AH, 09h
INT 21h
MOV DX, OFFSET buffer
MOV AH, 09h
INT 21h
MOV AH, 4Ch
INT 21h
msg_input DB 'Enter characters (press Enter to stop): $'
msg_output DB 0Dh, 0Ah, 'The entered characters are: $'
buffer DB 256 DUP (?)
buffer_end DB '$'
END start
