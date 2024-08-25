; ==========================
; Group member 01: Jamean_Groenewald_23524121
; Group member 02: Michael_Stone_21497682
; Group member 03: Wessel Johannes_Van der Walt_22790919
; ==========================

section .data
    prompt db 'Choice:', 0
    prompt_length equ $ - prompt
    catch db 0           ; Initialize catch to 0 (1 byte)
    catch_length equ $ - catch

section .text
    global get_user_choice

extern greeting             

get_user_choice:
    ; Call the greeting function to print the welcome message
    call greeting

    ; Print the prompt message
    mov rax, 1              ; sys_write syscall number
    mov rdi, 1              ; File descriptor 1 (stdout)
    mov rsi, prompt         ; Address of the prompt
    mov rdx, prompt_length  ; Length of the prompt
    syscall

    ; Read input from stdin
    mov rax, 0             ; sys_read syscall number
    mov rdi, 0             ; File descriptor 0 (stdin)
    mov rsi, catch         ; Address of the buffer to store input
    mov rdx, 1             ; Number of bytes to read
    syscall

    ; Convert ASCII to integer
    xor rax, rax           ; Clear rax
    movzx rbx, byte [catch] ; Load the byte stored in catch into rbx
    sub bl, '0'            ; Convert ASCII character to integer (bl - '0')
    add rax, rbx           ; Move the value to rax

    ret