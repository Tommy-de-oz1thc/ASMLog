bits 64
default rel

global qso_generate_russian_dx
global russian_exchange_generated
global russian_state_generated

extern cty_match_entity
extern fclose
extern fgets
extern fopen
extern GetTickCount64
extern log_text
extern lookup_country
extern printf
extern russian_entity_asia
extern russian_entity_europe
extern russian_entity_kaliningrad
extern sprintf
extern strcmp
extern strcpy_s

section .data

russian_call_format:
    db "RUSSIAN CALL: %s", 10, 0



russian_exchange_format:
    db "599 %s", 0


	
russian_file_ok:
    db "RUSSIAN MULT FILE: OK", 10, 0

russian_file_error:
    db "RUSSIAN MULT FILE: ERROR", 10, 0
	
russian_file_state_format:
    db "RUSSIAN FILE STATE: %s", 10, 0

russian_generated_qso_format:
    db "%03d", 0	



russian_mult_filename:
    db "data/russian_dx_mult.txt", 0

russian_random_format:
    db "RUSSIAN RANDOM LINE: %d", 10, 0
	
russian_read_mode:
    db "r", 0

russian_rst_format:
    db "RUSSIAN RST: 599", 10, 0

russian_state_format:
    db "RUSSIAN STATE: %s", 10, 0

russian_state_test:
    db "MA", 0


section .bss

russian_exchange_generated:
    resb 16

russian_generated_qso_number:
    resd 1	

russian_generated_qso_text:
    resb 16

russian_mult_buffer:
    resb 16
	
russian_random_line:
    resd 1

russian_state_generated:
    resb 8


section .text

qso_generate_russian_dx:

    push rbx
    sub rsp, 48

    ; RCX = pointer til valgt CALL
    mov rbx, rcx

	; Tilfaeldigt QSO-nummer 1-999
	call GetTickCount64

	xor rdx, rdx
	mov rcx, 999
	div rcx

	inc edx                         ; 1-999
	mov [russian_generated_qso_number], edx

	; Lav nummeret som 001-999
	lea rcx, [russian_generated_qso_text]
	lea rdx, [russian_generated_qso_format]
	mov r8d, [russian_generated_qso_number]
	call sprintf

	

	
	; Kopier genereret CALL til log_text
	lea rcx, [log_text]
	mov edx, 256
	mov r8, rbx
	call strcpy_s

	; CTY-opslag paa genereret CALL
	lea rcx, [log_text]
	call lookup_country



	; European Russia?
	lea rcx, [cty_match_entity]
	lea rdx, [russian_entity_europe]
	call strcmp
	test eax, eax
	jz .generated_is_russian

	; Kaliningrad?
	lea rcx, [cty_match_entity]
	lea rdx, [russian_entity_kaliningrad]
	call strcmp
	test eax, eax
	jz .generated_is_russian

	; Asiatic Russia?
	lea rcx, [cty_match_entity]
	lea rdx, [russian_entity_asia]
	call strcmp
	test eax, eax
	jz .generated_is_russian

	; Ikke-russisk station:
	; Byg exchange som "599 123"
	lea rcx, [russian_exchange_generated]
	lea rdx, [russian_exchange_format]
	lea r8, [russian_generated_qso_text]
	call sprintf

	jmp .generated_exchange_done

.generated_is_russian:
	; Tilfaeldig linje 1-63
	call GetTickCount64
	
    xor rdx, rdx
    mov rcx, 63
    div rcx

    inc edx                 ; 1-63

	mov [russian_random_line], edx

	; Vis valgt linjenummer
	lea rcx, [russian_random_format]
	mov edx, [russian_random_line]
	call printf
	
	; Aabn russian_dx_mult.txt
    lea rcx, [russian_mult_filename]
    lea rdx, [russian_read_mode]
    call fopen

    test rax, rax
    jz .russian_file_error

    ; Filen blev aabnet
    mov [rsp + 32], rax

    ; Start ved linje 1
    mov dword [rsp + 40], 1

.russian_read_line:

    lea rcx, [russian_mult_buffer]
    mov edx, 16
    mov r8, [rsp + 32]
    call fgets

    ; EOF eller laesefejl
    test rax, rax
    jz .russian_close_file

    ; Er dette den valgte linje?
    mov eax, [rsp + 40]
    cmp eax, [russian_random_line]
    je .russian_line_found

    inc dword [rsp + 40]
    jmp .russian_read_line


.russian_line_found:

    ; Fjern CR/LF
    lea rax, [russian_mult_buffer]

.russian_remove_newline:

    cmp byte [rax], 0
    je .russian_show_file_state

    cmp byte [rax], 13
    je .russian_terminate_line

    cmp byte [rax], 10
    je .russian_terminate_line

    inc rax
    jmp .russian_remove_newline


.russian_terminate_line:

    mov byte [rax], 0


.russian_show_file_state:

    lea rcx, [russian_file_state_format]
    lea rdx, [russian_mult_buffer]
    call printf


.russian_close_file:

    mov rcx, [rsp + 32]
    call fclose

    jmp .russian_file_done

    lea rcx, [russian_file_ok]
    call printf

    
    jmp .russian_file_done

.russian_file_error:
    lea rcx, [russian_file_error]
    call printf

.russian_file_done:

    ; Vis CALL
    lea rcx, [russian_call_format]
    mov rdx, rbx
    call printf

    ; Vis RST
    lea rcx, [russian_rst_format]
    call printf

    ; Kopier valgt State/Province til russian_state_generated
    lea rsi, [russian_mult_buffer]
    lea rdi, [russian_state_generated]

.russian_copy_state:
    mov al, [rsi]
    mov [rdi], al

    test al, al
    jz .russian_state_copied

    inc rsi
    inc rdi
    jmp .russian_copy_state

.russian_state_copied:

    ; Vis State
    lea rcx, [russian_state_format]
    lea rdx, [russian_state_generated]
    call printf

    ; Byg samlet exchange "599 MA"
    lea rcx, [russian_exchange_generated]
    lea rdx, [russian_exchange_format]
    lea r8, [russian_state_generated]
    call sprintf

.generated_exchange_done:

   

    ; Returner samme CALL-pointer
    mov rax, rbx

    add rsp, 48
    pop rbx
    ret