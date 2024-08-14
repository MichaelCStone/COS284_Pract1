; ==========================
; Group member 01: Name_Surname_student-nr
; Group member 02: Name_Surname_student-nr
; Group member 03: Name_Surname_student-nr
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
	
    xor rax, rax
    xor rdi, rdi
    xor rsi, rsi
    xor rdx, rdx

    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret                         ; return from function