; ==========================
; Group member 01: Name_Surname_student-nr
; Group member 02: Name_Surname_student-nr
; Group member 03: Name_Surname_student-nr
; ==========================

section .bss
    ; ==========================
    ; Your data goes here

    prompt db 'Choice:', 0
    prompt_length equ $ - prompt
    catch db 1
    catch_length equ $ - catch

    ; ==========================

section .text
    global get_user_choice

extern greeting             

get_user_choice:
    ; Call the greeting function to print the welcome message

    call greeting
    
    mov rax, 1              ; sys_call number, in this case 1 for stdout
    mov rdi, 1              ; First argument of syscall -> file descriptor, in this case 1 for sys_write
    mov rsi, prompt         
    mov rdx, prompt_length
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, catch
    mov rdx, catch_length    
    syscall


    ; ==========================
    ; Your data goes here
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing 
    ret