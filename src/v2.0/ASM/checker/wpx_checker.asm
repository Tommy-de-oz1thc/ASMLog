bits 64
default rel

global check_wpx_cabrillo
global wpx_highscore_menu

extern atoi

extern fclose
extern fgets
extern fprintf
extern fopen
extern printf
extern settings_callsign
extern strcmp
extern strncmp
extern strstr
extern cw_training_minutes

section .data

append_mode db "a", 0
band_ok_text db "BAND OK", 10, 0
band_error_text db "BAND FEJL", 10, 0
claimed_score_text db "CLAIMED-SCORE: ", 0
date_test_format db "HIGHSCORE DATO: %s", 10, 0
facit_wpx_cabrillo_filename db "facit/facit_wpx.cbr", 0
facit_qso_test_format db "FACIT: %s", 0
highscore_format db "%s | CQ WPX CW | %s | Claimed: %d | Real: %d | %d min", 10, 0
mult_text db "MULT", 0
point_text db " point", 0
read_mode db "r", 0
real_score_format db "REAL SCORE: %d", 10, 0
real_test_format db "REAL TEST: point=%d mult=%d", 10, 0
qso_error_text db "QSO FEJL", 10, 0
qso_ok_text db "QSO OK", 10, 0
qso_text db "QSO:", 0
wpx_cabrillo_filename db "log/wpx.cbr", 0

wpx_highscore_filename db "highscore/wpx_highscore.txt", 0
wpx_log_filename db "log/wpx_log.txt", 0
wpx_log_test_format db "LOG:   %s", 0

wpx_qso_test_format db "WPX:   %s", 0
zero_point_text db "0 point", 0


section .bss

facit_qso_buffer resb 256
facit_wpx_file resq 1

wpx_buffer resb 256
wpx_claimed_score resd 1
wpx_file resq 1
wpx_highscore_date resb 11
wpx_highscore_file resq 1
wpx_log_buffer resb 256
wpx_log_file resq 1
wpx_real_mults resd 1
wpx_real_points resd 1
wpx_real_score resd 1
wpx_qso_buffer resb 256

section .text

check_wpx_cabrillo:

    push rbx
    sub rsp, 64

    ; Nulstil Real score-data
    mov dword [wpx_real_points], 0
    mov dword [wpx_real_mults], 0
	mov byte [wpx_highscore_date], 0

    ; Aabn brugerens WPX Cabrillo
    lea rcx, [wpx_cabrillo_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .done

    mov [wpx_file], rax

    ; Laes claimed score fra brugerens Cabrillo
    mov rcx, [wpx_file]
    call read_claimed_score
    mov [wpx_claimed_score], eax


    ; Aabn facit WPX Cabrillo
    lea rcx, [facit_wpx_cabrillo_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .close_wpx

    mov [facit_wpx_file], rax

    ; Aabn brugerens WPX-log
    lea rcx, [wpx_log_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .show_real_test

    mov [wpx_log_file], rax
	
.read_log_loop:

    ; Laes naeste linje fra brugerens WPX-log
    lea rcx, [wpx_log_buffer]
    mov edx, 256
    mov r8, [wpx_log_file]
    call fgets

        test rax, rax
    jz .show_real_test

    ; Gem dato fra foerste loglinje
    cmp byte [wpx_highscore_date], 0
    jne .date_done

    mov rax, [wpx_log_buffer]
    mov [wpx_highscore_date], rax

    mov ax, [wpx_log_buffer + 8]
    mov [wpx_highscore_date + 8], ax

    mov byte [wpx_highscore_date + 10], 0

.date_done:

    ; Vis linjen
    lea rcx, [wpx_log_test_format]
    lea rdx, [wpx_log_buffer]
    call printf

    ; Er QSO'en 0 point?
    lea rcx, [wpx_log_buffer]
    lea rdx, [zero_point_text]
    call strstr

    test rax, rax
    jnz .zero_point_qso

    ; Find foerste QSO i brugerens Cabrillo
    mov rcx, [wpx_file]
    lea rdx, [wpx_qso_buffer]
    call read_first_qso

    test eax, eax
    jz .close_files

    ; Vis brugerens QSO
    lea rcx, [wpx_qso_test_format]
    lea rdx, [wpx_qso_buffer]
    call printf

    ; Find foerste QSO i facit Cabrillo
    mov rcx, [facit_wpx_file]
    lea rdx, [facit_qso_buffer]
    call read_first_qso

    test eax, eax
    jz .close_files

    ; Vis facit QSO
    lea rcx, [facit_qso_test_format]
    lea rdx, [facit_qso_buffer]
    call printf

    ; Sammenlign hele QSO-linjen med facit
    lea rcx, [wpx_qso_buffer]
    lea rdx, [facit_qso_buffer]
    call strcmp

    test eax, eax
    jnz .qso_error

    ; QSO er korrekt
    lea rcx, [qso_ok_text]
    call printf

    ; Find " point" i brugerens loglinje
    lea rcx, [wpx_log_buffer]
    lea rdx, [point_text]
    call strstr

    test rax, rax
    jz .check_mult

    ; Tegnet lige foer " point" er pointtallet
    dec rax
    movzx eax, byte [rax]
    sub eax, '0'

    ; Laeg point til Real point-sum
    add [wpx_real_points], eax

.check_mult:

    ; Er denne korrekte QSO en MULT?
    lea rcx, [wpx_log_buffer]
    lea rdx, [mult_text]
    call strstr

    test rax, rax
    jz .qso_done

    ; Godkendt multiplier
    inc dword [wpx_real_mults]

    ; QSO er faerdigbehandlet
    jmp .qso_done

.qso_error:

    ; QSO afviger fra facit
    lea rcx, [qso_error_text]
    call printf

.qso_done:

    ; Fortsaet med naeste QSO
    jmp .read_log_loop
	
.zero_point_qso:

    ; Spring tilsvarende QSO over i brugerens Cabrillo
    mov rcx, [wpx_file]
    lea rdx, [wpx_qso_buffer]
    call read_first_qso

    test rax, rax
    jz .show_real_test

    ; Spring tilsvarende QSO over i facit Cabrillo
    mov rcx, [facit_wpx_file]
    lea rdx, [facit_qso_buffer]
    call read_first_qso

    test rax, rax
    jz .show_real_test

    
    ; Fortsaet med naeste log-QSO
    jmp .read_log_loop
	  
.show_real_test:

    lea rcx, [real_test_format]
    mov edx, [wpx_real_points]
    mov r8d, [wpx_real_mults]
    call printf

    ; Beregn Real score
    mov eax, [wpx_real_points]
    imul eax, [wpx_real_mults]
    mov [wpx_real_score], eax

    ; Vis Real score
    lea rcx, [real_score_format]
    mov edx, eax
    call printf

    ; Vis highscore-dato
    lea rcx, [date_test_format]
    lea rdx, [wpx_highscore_date]
    call printf

    ; Aabn WPX highscore-fil i append mode
    lea rcx, [wpx_highscore_filename]
    lea rdx, [append_mode]
    call fopen

    test rax, rax
    jz .close_files

    mov [wpx_highscore_file], rax

    ; Skriv highscore
    mov rcx, [wpx_highscore_file]
    lea rdx, [highscore_format]
    lea r8, [wpx_highscore_date]
    lea r9, [settings_callsign]

    ; 5. argument = Claimed score
    mov eax, [wpx_claimed_score]
    mov [rsp + 32], rax

    ; 6. argument = Real score
    mov eax, [wpx_real_score]
    mov [rsp + 40], rax

    ; 7. argument = CW-traeningstid
    mov eax, [cw_training_minutes]
    mov [rsp + 48], rax

    call fprintf

    ; Luk highscore-filen
    mov rcx, [wpx_highscore_file]
    call fclose

    jmp .close_files
	
.close_files:

    ; Luk brugerens WPX-log
    mov rcx, [wpx_log_file]
    call fclose
	
    ; Luk facit Cabrillo
    mov rcx, [facit_wpx_file]
    call fclose

.close_wpx:

    ; Luk brugerens Cabrillo
    mov rcx, [wpx_file]
    call fclose

.done:
    add rsp, 64
    pop rbx
    ret
	
read_claimed_score:

    ; RCX = FILE*
    ; Returnerer score i EAX

    push rbx
    sub rsp, 32

    mov rbx, rcx

.read_loop:

    ; Laes en linje
    lea rcx, [wpx_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .not_found

    ; Find CLAIMED-SCORE:
    lea rcx, [wpx_buffer]
    lea rdx, [claimed_score_text]
    call strstr

    test rax, rax
    jz .read_loop

    ; RAX peger paa "CLAIMED-SCORE: "
    ; Teksten er 15 tegn lang
    add rax, 15

    ; Konverter scoren til integer
    mov rcx, rax
    call atoi

    jmp .done

.not_found:
    xor eax, eax

.done:
    add rsp, 32
    pop rbx
    ret
	
read_first_qso:

    ; RCX = FILE*
    ; RDX = buffer
    ; EAX = 1 hvis QSO fundet, ellers 0

    push rbx
    push r12
    sub rsp, 40

    mov rbx, rcx
    mov r12, rdx

.read_loop:

    mov rcx, r12
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .not_found

    ; Begynder linjen med "QSO:"?
    cmp byte [r12 + 0], 'Q'
    jne .read_loop

    cmp byte [r12 + 1], 'S'
    jne .read_loop

    cmp byte [r12 + 2], 'O'
    jne .read_loop

    cmp byte [r12 + 3], ':'
    jne .read_loop

    mov eax, 1
    jmp .done

.not_found:
    xor eax, eax

.done:
    add rsp, 40
    pop r12
    pop rbx
    ret