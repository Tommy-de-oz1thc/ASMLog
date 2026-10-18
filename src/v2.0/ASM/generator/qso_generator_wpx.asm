bits 64
default rel

global qso_generate_wpx
global wpx_exchange
global wpx_serial

extern GetTickCount64
extern printf
extern sprintf

section .data


wpx_exchange_format db "599 %03d", 0



section .bss

wpx_exchange resb 16
wpx_serial resd 1

section .text

qso_generate_wpx:
    push rbx
    sub rsp, 32

    ; RCX = pointer til valgt CALL
    mov rbx, rcx

   
    ; Tilfaeldigt WPX serienummer 1-999
    call GetTickCount64

    xor rdx, rdx
    mov rcx, 999
    div rcx

    inc edx                 ; 1-999

	mov [wpx_serial], edx

    

    ; Byg "599 001" osv.
    lea rcx, [wpx_exchange]
    lea rdx, [wpx_exchange_format]
    mov r8d, [wpx_serial]
    call sprintf

   

    ; Returner samme CALL-pointer
    mov rax, rbx

    add rsp, 32
    pop rbx
    ret