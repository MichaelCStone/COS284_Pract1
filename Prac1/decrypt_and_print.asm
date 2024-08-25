; ==========================
; Group member 01: Jamean_Groenewald_23524121
; Group member 02: Michael_Stone_21497682
; Group member 03: Wessel Johannes_Van der Walt_22790919
; ==========================

section .data
    fmt db "%c", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your data goes here
    ; prompt db 'Enter ciphertext to decrypt: ', 0
	; prompt_length equ $ - prompt

    xor_key db 0x73113777

    ; ==========================

section .text
global decrypt_and_print

extern printf

;When using the below function, be sure to place whatever you want to print in the rax register first
print_char_32:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

decrypt_and_print:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your code goes here

    ; mov rax, 1 			; Syscall number for syswrite
	; mov rdi, 1			; Specify file descriptor,1 for stdout
	; mov rsi, prompt
	; mov rdx, prompt_length
	; syscall

    mov rax, rdi
    xor rax, [xor_key]
    ror rax, 4
    call print_char_32

    mov rax, rsi
    xor rax, [xor_key]
    ror rax, 4
    call print_char_32
    
    mov rax, rdx
    xor rax, [xor_key]
    ror rax, 4
    call print_char_32

    mov rax, rcx
    xor rax, [xor_key]
    ror rax, 4
    call print_char_32

    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret