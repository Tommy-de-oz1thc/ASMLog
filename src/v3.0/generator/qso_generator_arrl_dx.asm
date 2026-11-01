bits 64
default rel

global qso_generate_arrl_dx
global arrl_exchange
global arrl_state_generated


extern cty_match_entity
extern fclose
extern fgets
extern fopen
extern GetTickCount64
extern lookup_country
extern log_text

extern printf
extern sprintf
extern strcmp
extern _strupr_s
extern strcpy_s

section .data


arrl_country_usa:    db "United States", 0
arrl_country_canada: db "Canada", 0



arrl_exchange_format:
    db "599 %s", 0


	
arrl_file_ok:
    db "ARRL MULT FILE: OK", 10, 0

arrl_file_error:
    db "ARRL MULT FILE: ERROR", 10, 0
	


arrl_mult_filename:
    db "data/arrl_dx_mult.txt", 0
	
arrl_power_100:      db "100", 0


	
arrl_read_mode:
    db "r", 0





arrl_state_test:
    db "MA", 0


section .bss

arrl_exchange:
    resb 16

arrl_mult_buffer:
    resb 16
	
arrl_random_line:
    resd 1

arrl_state_generated:
    resb 8


section .text

qso_generate_arrl_dx:

    push rbx
    sub rsp, 48

    ; RCX = pointer til valgt CALL
    mov rbx, rcx

    ; Kopier CALL til CTY-buffer
    lea rcx, [log_text]
    mov edx, 256
    mov r8, rbx
    call strcpy_s

    ; Lav CALL til store bogstaver
    lea rcx, [log_text]
    mov edx, 256
    call _strupr_s

    ; Find landet
    lea rcx, [log_text]
    call lookup_country

   

	; Tilfaeldig linje 1-63
    call GetTickCount64

    xor rdx, rdx
    mov rcx, 63
    div rcx

    inc edx                 ; 1-63

	mov [arrl_random_line], edx

	
	
	; Aabn arrl_dx_mult.txt
    lea rcx, [arrl_mult_filename]
    lea rdx, [arrl_read_mode]
    call fopen

    test rax, rax
    jz .arrl_file_error

    ; Filen blev aabnet
    mov [rsp + 32], rax

    ; Start ved linje 1
    mov dword [rsp + 40], 1

.arrl_read_line:

    lea rcx, [arrl_mult_buffer]
    mov edx, 16
    mov r8, [rsp + 32]
    call fgets

    ; EOF eller laesefejl
    test rax, rax
    jz .arrl_close_file

    ; Er dette den valgte linje?
    mov eax, [rsp + 40]
    cmp eax, [arrl_random_line]
    je .arrl_line_found

    inc dword [rsp + 40]
    jmp .arrl_read_line


.arrl_line_found:

    ; Fjern CR/LF
    lea rax, [arrl_mult_buffer]

.arrl_remove_newline:

    cmp byte [rax], 0
    je .arrl_show_file_state

    cmp byte [rax], 13
    je .arrl_terminate_line

    cmp byte [rax], 10
    je .arrl_terminate_line

    inc rax
    jmp .arrl_remove_newline


.arrl_terminate_line:

    mov byte [rax], 0


.arrl_show_file_state:

   


.arrl_close_file:

    mov rcx, [rsp + 32]
    call fclose

    jmp .arrl_file_done

    lea rcx, [arrl_file_ok]
    call printf

    
    jmp .arrl_file_done

.arrl_file_error:
    lea rcx, [arrl_file_error]
    call printf

.arrl_file_done:

    ; Kontroller om stationen er fra USA
    lea rcx, [cty_match_entity]
    lea rdx, [arrl_country_usa]
    call strcmp
    test eax, eax
    jz .arrl_exchange_country_done

    ; Kontroller om stationen er fra Canada
    lea rcx, [cty_match_entity]
    lea rdx, [arrl_country_canada]
    call strcmp
    test eax, eax
    jz .arrl_exchange_country_done

    ; Andre lande sender POWER = 100
    lea rcx, [arrl_mult_buffer]
    mov edx, 16
    lea r8, [arrl_power_100]
    call strcpy_s

.arrl_exchange_country_done:

    

    ; Kopier valgt State/Province til arrl_state_generated
    lea rsi, [arrl_mult_buffer]
    lea rdi, [arrl_state_generated]

.arrl_copy_state:
    mov al, [rsi]
    mov [rdi], al

    test al, al
    jz .arrl_state_copied

    inc rsi
    inc rdi
    jmp .arrl_copy_state

.arrl_state_copied:

    

    ; Byg samlet exchange "599 MA"
    lea rcx, [arrl_exchange]
    lea rdx, [arrl_exchange_format]
    lea r8, [arrl_state_generated]
    call sprintf

   

    ; Returner samme CALL-pointer
    mov rax, rbx

    add rsp, 48
    pop rbx
    ret