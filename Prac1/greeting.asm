; ==========================
; Group member 01: Jamean_Groenewald_23524121
; Group member 02: Michael_Stone_21497682
; Group member 03: Wessel Johannes_Van der Walt_22790919
; ==========================

section .data
    ; ==========================
    ; Your data goes here

    greet db 'Welcome agent. What do you want to do, Encrypt [1] or Decrypt [2]?', 0xA
	length equ $ - greet

    ; ==========================

section .text
    global greeting

greeting:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your code goes here

    mov rax, 1 			; Syscall number for syswrite
	mov rdi, 1			; Specify file descriptor,1 for stdout
	mov rsi, greet
	mov rdx, length
	syscall
	

    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret                         ; return from function