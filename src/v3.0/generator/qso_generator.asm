bits 64
default rel
global qso_generate
global callsign_buffer
global qso_count_callsigns

extern cty_match_entity
extern lookup_country

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
extern sac_operator_scandinavian
extern qso_generate_wpx
extern wpx_exchange

section .data

arrl_dx_callsign_filename    db "data\arrl_dx_callsigns.txt", 0

callsign_error_msg db "FEJL: Ingen gyldige kaldesignaler fundet.", 10, 0

callsign_filename db "data\Callsigns_valid.txt", 0
other_callsign_filename      db "data\other_callsigns.txt", 0
russian_dx_callsign_filename db "data\russian_dx_callsigns.txt", 0
sac_callsign_filename:
    db "data\sac_callsigns.txt", 0

other_than_sac_filename:
    db "data\other_than_sac_callsigns.txt", 0
qso_arrl_test:
    db "ARRL DX GENERATOR VALGT", 10, 0
section .bss
active_callsign_count resq 1
active_callsign_filename resq 1
arrl_dx_callsign_count       resq 1


callsign_attempts     resd 1
callsign_buffer       resb 32
callsign_bytes        resd 1
callsign_count resq 1
current_line          resd 1
callsign_line_length resd 1
other_callsign_count         resq 1
sac_callsign_count       resq 1
other_than_sac_count    resq 1
qso_log_type          resb 1
random_line           resd 1
read_byte             resb 1
russian_dx_callsign_count    resq 1

section .text

; ------------------------------------------------------------
; Tael kaldesignaler i filen ved programstart
; RAX = antal linjer, 0 hvis filen er tom eller mangler
; ------------------------------------------------------------


; ------------------------------------------------------------
; Tael kaldesignaler i alle fire filer
; RAX = antal i standardfilen
; ------------------------------------------------------------

qso_count_callsigns:
    sub rsp, 40

    lea rcx, [callsign_filename]
    call .count_file
    mov [callsign_count], rax

    lea rcx, [arrl_dx_callsign_filename]
    call .count_file
    mov [arrl_dx_callsign_count], rax

    lea rcx, [other_callsign_filename]
    call .count_file
    mov [other_callsign_count], rax

    lea rcx, [russian_dx_callsign_filename]
    call .count_file
    mov [russian_dx_callsign_count], rax

    mov rax, [callsign_count]
    lea rcx, [sac_callsign_filename]
    call .count_file
    mov [sac_callsign_count], rax

    lea rcx, [other_than_sac_filename]
    call .count_file
    mov [other_than_sac_count], rax
    add rsp, 40
	mov rax, [callsign_count]
    ret

; RCX = filnavn
; RAX = antal ikke-tomme linjer

.count_file:
    push rbx
    push rsi
    sub rsp, 56

    mov rsi, rcx
    xor ebx, ebx
    mov dword [callsign_line_length], 0

    mov rcx, rsi
    mov edx, 80000000h
    mov r8d, 1
    xor r9d, r9d

    mov qword [rsp+32], 3
    mov qword [rsp+40], 80h
    mov qword [rsp+48], 0
    call CreateFileA

    cmp rax, -1
    je .count_done

    mov rsi, rax

.read_next:
    mov rcx, rsi
    lea rdx, [read_byte]
    mov r8d, 1
    lea r9, [callsign_bytes]
    mov qword [rsp+32], 0
    call ReadFile

    test eax, eax
    jz .close_file

    cmp dword [callsign_bytes], 0
    je .end_file

    mov al, [read_byte]

    cmp al, 13
    je .read_next

    cmp al, 10
    je .newline

    inc dword [callsign_line_length]
    jmp .read_next

.newline:
    cmp dword [callsign_line_length], 0
    je .read_next

    inc rbx
    mov dword [callsign_line_length], 0
    jmp .read_next

.end_file:
    cmp dword [callsign_line_length], 0
    je .close_file

    inc rbx

.close_file:
    mov rcx, rsi
    call CloseHandle

.count_done:
    mov rax, rbx

    add rsp, 56
    pop rsi
    pop rbx
    ret


qso_generate:
    mov [qso_log_type], cl

    push rbx
    push rsi
    sub rsp, 56

    mov rax, [callsign_count]
    mov [active_callsign_count], rax

    mov dword [callsign_attempts], 0


.choose_callsign:
    

    inc dword [callsign_attempts]
    cmp dword [callsign_attempts], 100
    ja .too_many_attempts

    ; Standardfil til alle contests
    lea rax, [callsign_filename]
    mov [active_callsign_filename], rax

    mov rax, [callsign_count]
    mov [active_callsign_count], rax


    ; Vaegtning for Russian DX og ARRL DX
    cmp byte [qso_log_type], 4
    je .russian_weight

    cmp byte [qso_log_type], 3
    je .arrl_weight
   
    cmp byte [qso_log_type], 6
    je .sac_weight
  
    ; Andre contests bruger standardfilen
    jmp .callsign_file_selected

.russian_weight:
    ; Russian DX: 20% USA/Canada, 30% WW, 50% Rusland
    rdtsc
    shl rdx, 32
    or rax, rdx
    mov ecx, 100
    xor edx, edx
    div rcx

    cmp edx, 20
    jb .select_arrl_file

    cmp edx, 50
    jb .select_other_file

    jmp .select_russian_file

.arrl_weight:
    ; ARRL DX: 50% USA/Canada, 40% WW, 10% Rusland
    rdtsc
    shl rdx, 32
    or rax, rdx
    mov ecx, 100
    xor edx, edx
    div rcx

    cmp edx, 50
    jb .select_arrl_file

    cmp edx, 90
    jb .select_other_file

    jmp .select_russian_file

.sac_weight:
    ; SAC CW: 90% relevante stationer, 10% øvrige
    rdtsc
    shl rdx, 32
    or rax, rdx
    mov ecx, 100
    xor edx, edx
    div rcx

    cmp dword [sac_operator_scandinavian], 1
    je .sac_scandinavian_operator

    ; DX-operatoer: 90% SAC, 10% DX
    cmp edx, 90
    jb .select_sac_file
    jmp .select_non_sac_file

.sac_scandinavian_operator:
    ; Skandinavisk operatoer: 90% DX, 10% SAC
    cmp edx, 90
    jb .select_non_sac_file
    jmp .select_sac_file

.select_sac_file:
    lea rax, [sac_callsign_filename]
    mov [active_callsign_filename], rax
    mov rax, [sac_callsign_count]
    mov [active_callsign_count], rax
    jmp .callsign_file_selected

.select_non_sac_file:
    lea rax, [other_than_sac_filename]
    mov [active_callsign_filename], rax
    mov rax, [other_than_sac_count]
    mov [active_callsign_count], rax
    jmp .callsign_file_selected
	
.select_russian_file:
    lea rax, [russian_dx_callsign_filename]
    mov [active_callsign_filename], rax

    mov rax, [russian_dx_callsign_count]
    mov [active_callsign_count], rax
    jmp .callsign_file_selected

.select_arrl_file:
    lea rax, [arrl_dx_callsign_filename]
    mov [active_callsign_filename], rax

    mov rax, [arrl_dx_callsign_count]
    mov [active_callsign_count], rax
    jmp .callsign_file_selected

.select_other_file:
    lea rax, [other_callsign_filename]
    mov [active_callsign_filename], rax

    mov rax, [other_callsign_count]
    mov [active_callsign_count], rax

.callsign_file_selected:
    ; Vaelg tilfaeldig linje
    call qso_random_line
    mov [random_line], eax

    ; Aabn den valgte kaldesignalfil
    mov rcx, [active_callsign_filename]
    mov edx, 80000000h
    mov r8d, 1
    xor r9d, r9d
    mov qword [rsp+32], 3
    mov qword [rsp+40], 80h
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

    ; Afvis tomt kaldesignal
    cmp byte [callsign_buffer], 0
    je .choose_callsign

    


.cqww_test_done:
   
    ; Kontroller kaldesignalet med CTY
    lea rcx, [callsign_buffer]
    call lookup_country

    ; Ukendt land? Vaelg et nyt kaldesignal
    cmp byte [cty_match_entity], 0
    je .choose_callsign


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

.too_many_attempts:
    lea rcx, [callsign_error_msg]
    call printf

    mov byte [callsign_buffer], 0
    jmp .error

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

    mov rcx, [active_callsign_count]
    test rcx, rcx
    jz .no_callsigns

    xor rdx, rdx
    div rcx

    mov rax, rdx
    ret

.no_callsigns:
    xor eax, eax
    ret