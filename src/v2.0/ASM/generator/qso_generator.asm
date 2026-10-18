bits 64
default rel
global qso_generate
global callsign_buffer

extern qso_generate_arrl_dx
extern qso_generate_wpx
extern qso_generate_russian_dx
extern qso_generate_cqww_dx
extern qso_generate_sac_cw

extern CloseHandle
extern CreateFileA
extern GetTickCount64
extern printf
extern ReadFile
extern qso_generate_wpx
extern wpx_exchange

section .data

callsign_filename db "data\Callsigns.txt", 0

qso_arrl_test:
    db "ARRL DX GENERATOR VALGT", 10, 0
section .bss

callsign_buffer resb 32
callsign_bytes  resd 1
current_line    resd 1
qso_log_type    resb 1
random_line     resd 1
read_byte       resb 1

section .text

qso_generate:
	mov [qso_log_type], cl

    push rbx
    push rsi
    sub rsp, 56
	
	  
    ; Vaelg tilfaeldig linje
    call qso_random_line
    mov [random_line], eax
	
    ; Aabn Callsigns.txt
    lea rcx, [callsign_filename]
    mov edx, 80000000h        ; GENERIC_READ
    mov r8d, 1                ; FILE_SHARE_READ
    xor r9d, r9d
    mov qword [rsp+32], 3     ; OPEN_EXISTING
    mov qword [rsp+40], 80h   ; FILE_ATTRIBUTE_NORMAL
    mov qword [rsp+48], 0
    call CreateFileA

    cmp rax, -1
    je .error

    mov rbx, rax

    ; Start ved linje 0
    mov dword [current_line], 0

.find_random_line:

    ; Er vi naaet til den valgte linje?
    mov eax, [current_line]
    cmp eax, [random_line]
    je .read_selected_line

    ; Laes 1 byte
    mov rcx, rbx
    lea rdx, [read_byte]
    mov r8d, 1
    lea r9, [callsign_bytes]
    mov qword [rsp+32], 0
    call ReadFile

    ; Fejl eller EOF
    test eax, eax
    jz .read_error

    cmp dword [callsign_bytes], 0
    je .read_error

    ; LF = naeste linje
    cmp byte [read_byte], 10
    jne .find_random_line

    inc dword [current_line]
    jmp .find_random_line


.read_selected_line:

    ; Laes selve kaldesignalet
    lea rsi, [callsign_buffer]

.read_selected_byte:
    mov rcx, rbx
    lea rdx, [read_byte]
    mov r8d, 1
    lea r9, [callsign_bytes]
    mov qword [rsp+32], 0
    call ReadFile

    test eax, eax
    jz .selected_done

    cmp dword [callsign_bytes], 0
    je .selected_done

    mov al, [read_byte]

    cmp al, 13
    je .selected_done

    cmp al, 10
    je .selected_done

    mov [rsi], al
    inc rsi
    jmp .read_selected_byte

.selected_done:
    mov byte [rsi], 0
	
    ; Luk filen
    mov rcx, rbx
    call CloseHandle

    ; Find slutningen paa foerste linje
    lea rax, [callsign_buffer]

.find_end:
    cmp byte [rax], 13         ; CR
    je .terminate
    cmp byte [rax], 10         ; LF
    je .terminate
    cmp byte [rax], 0
    je .terminate

    inc rax
    jmp .find_end

.terminate:
    mov byte [rax], 0

    ; Vaelg generator efter logtype
	
    cmp byte [qso_log_type], 2
    je .hf
	
	cmp byte [qso_log_type], 3
	je .arrl_dx
	
	cmp byte [qso_log_type], 4
	je .russian_dx
	
	cmp byte [qso_log_type], 5
    je .cqww_dx
	
	cmp byte [qso_log_type], 6
	je .sac_cw

	; WPX fortsaetter som hidtil
	lea rcx, [callsign_buffer]
	call qso_generate_wpx
	jmp .generator_done

.hf:
    ; HF bruger det valgte CALL uden WPX-exchange
    lea rax, [callsign_buffer]
    jmp .generator_done

.arrl_dx:
    ; Send valgt CALL til ARRL DX-generator
    lea rcx, [callsign_buffer]
    call qso_generate_arrl_dx
    jmp .generator_done

.russian_dx:
    lea rcx, [callsign_buffer]
    call qso_generate_russian_dx
    jmp .generator_done

.cqww_dx:
    lea rcx, [callsign_buffer]
    call qso_generate_cqww_dx
    jmp .generator_done

.sac_cw:
    lea rcx, [callsign_buffer]
    call qso_generate_sac_cw
    jmp .generator_done

.generator_done:

    add rsp, 56
    pop rsi
    pop rbx
    ret

.read_error:
    mov rcx, rbx
    call CloseHandle
    jmp .error

.error:
    lea rcx, [callsign_buffer]
    add rsp, 56
    pop rsi
    pop rbx
    ret
	
qso_random_line:
    sub rsp, 40
    call GetTickCount64
    add rsp, 40

    ; RAX modulo 26391
    xor rdx, rdx
    mov rcx, 26391
    div rcx

    ; RDX = tilfaeldig linje 0-26390
    mov rax, rdx
    ret