title "to print the factorial of a given number"
  .model small
  .stack
  .data
  val   dw  5
  str   db	"the factorial is:$"
  .code
prnt macro
  mov   dl, ah
  mov   dh, al
  mov   ah, 02h
  int   21h
  mov   dl, dh
  mov   ah, 02h
  int   21h
endm
main  proc
  mov   ax, @data
  mov   ds, ax
  mov   dx, offset str
  mov   ah, 09h
  int   21h
  mov   cx, val
  mov   ax, 1
top:
  mul   cx
  loop  top
  mov   dx, 0
  mov   bx, 100
  div   bx
  aam
  add   ax, 3030h
  push  dx
  prnt
  pop   ax
  aam
  add   ax, 3030h
  prnt
  mov   ah, 4ch
  int   21h
  main  endp
  end   main
