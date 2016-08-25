
;
; Display the message Hello World
;
.model small
.data
msg DB "Hello World..!$"
.code
start:
mov ax, @data
mov	ds, ax
lea	dx, msg
mov	ah, 09h
int	21h
mov	ah, 4ch	; termination of program
int 21h
end start
