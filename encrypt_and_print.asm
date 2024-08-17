; ==========================
; Group member 01: Name_Surname_student-nr
; Group member 02: Name_Surname_student-nr
; Group member 03: Name_Surname_student-nr
; ==========================

section .data
    fmt db "%c", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your data goes here

    promptMessage db "Enter plaintext to encrypt: ", 0
    lengthP equ $ - promptMessage
    resultMessage db "The cipher text is: ", 0
    lengthR equ $ - resultMessage
    xor_key dq 0x73113777
    catch db 4
    catch_length equ 4

    ; ==========================

section .bss
    ; ==========================
    ; Your data goes here
    ; ==========================

section .text
    global encrypt_and_print
    extern printf
    extern scanf

;When using the below function, be sure to place whatever you want to print in the rax register first
print_char_32:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

encrypt_and_print:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your code goes here

    mov rax, 1 			; Syscall number for syswrite
	mov rdi, 1			; Specify file descriptor,1 for stdout
	mov rsi, promptMessage
	mov rdx, lengthP
	syscall

    ;get input
    mov rax, 0
    mov rdi, 0
    mov rsi, catch
    mov rdx, catch_length    
    syscall

    ; Display "The cipher text is: " message
    mov rax, 1             ; Syscall number for syswrite
    mov rdi, 1             ; File descriptor 1 (stdout)
    mov rsi, resultMessage ; Address of the cipher message
    mov rdx, lengthR       ; Length of the cipher message
    syscall

    ; XOR constant
    mov eax, 0x73113777    ; Load the XOR constant into EAX (32-bit)

    ; Rotate each character in the buffer
    mov rcx, catch_length  ; Loop counter (4 characters)
    mov rbx, catch         ; Start of the input buffer

; xor_loop:
;     movzx rdx, byte [rbx]  ; Load the current byte into RDX (zero-extend to 64-bit)
;     rol dl, 4              ; Rotate DL (the lower 8 bits) left by 4 bits
;     xor edx, eax           ; XOR the entire character with the full 32-bit constant in EAX

;     ; Print the encrypted character using the provided function
;     mov rax, rdx           ; Move the encrypted byte into RAX (for printing)
;     call print_char_32     ; Call the print_char_32 function

;     inc rbx                ; Move to the next character in the buffer
;     rol eax, 8             ; Rotate the XOR constant left by 8 bits (to get the next byte)
;     loop xor_loop          ; Repeat for all characters




rotate_loop:
    mov al, [rbx]          ; Load the current byte into AL (8-bit register)
    rol al, 4              ; Rotate AL left by 4 bits
    mov [rbx], al          ; Store the rotated byte back to memory

    inc rbx                ; Move to the next character in the buffer
    loop rotate_loop       ; Repeat for all characters

    ; (Optional) Display the rotated result
    mov rax, 1             ; Syscall number for syswrite
    mov rdi, 1             ; File descriptor 1 (stdout)
    mov rsi, catch         ; Buffer containing the rotated input
    mov rdx, catch_length  ; Number of bytes to write
    syscall

    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret
