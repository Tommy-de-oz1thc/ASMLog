bits 64
default rel

global check_russian_dx_cabrillo
global russian_dx_highscore_menu

extern atoi
extern cw_training_minutes
extern fclose
extern fgets
extern fprintf
extern settings_callsign
extern fopen
extern printf
extern strcmp
extern strncmp
extern strstr

section .data

append_mode db "a", 0
band_ok_text db "BAND OK", 10, 0
band_error_text db "BAND FEJL", 10, 0
claimed_score_text db "CLAIMED-SCORE: ", 0
date_test_format db "HIGHSCORE DATO: %s", 10, 0
facit_russian_dx_cabrillo_filename db "facit/facit_russian_dx.cbr", 0
facit_qso_test_format db "FACIT: %s", 0
highscore_format db "%s | RUSSIAN DX CW | %s | Claimed: %d | Real: %d | %d min", 10, 0
mult_text db "MULT", 0
point_text db " point", 0
read_mode db "r", 0
real_score_format db "REAL SCORE: %d", 10, 0
real_test_format db "REAL TEST: point=%d mult=%d", 10, 0
qso_error_text db "QSO FEJL", 10, 0
qso_ok_text db "QSO OK", 10, 0
qso_text db "QSO:", 0
russian_dx_cabrillo_filename db "log/russian_dx.cbr", 0

russian_dx_highscore_filename db "highscore/russian_dx_highscore.txt", 0
russian_dx_log_filename db "log/russian_dx_log.txt", 0
russian_dx_log_test_format db "LOG:   %s", 0

russian_dx_qso_test_format db "russian_dx:   %s", 0
zero_point_text db "| 0 |", 0


section .bss

facit_qso_buffer resb 256
facit_russian_dx_file resq 1

russian_dx_buffer resb 256
russian_dx_claimed_score resd 1
russian_dx_file resq 1
russian_dx_highscore_date resb 11
russian_dx_highscore_file resq 1
russian_dx_log_buffer resb 256
russian_dx_log_file resq 1
russian_dx_real_mults resd 1
russian_dx_real_points resd 1
russian_dx_real_score resd 1
russian_dx_qso_buffer resb 256

section .text

check_russian_dx_cabrillo:

    push rbx
    sub rsp, 64

    ; Nulstil Real score-data
    mov dword [russian_dx_real_points], 0
    mov dword [russian_dx_real_mults], 0
	mov byte [russian_dx_highscore_date], 0

    ; Aabn brugerens russian_dx Cabrillo
    lea rcx, [russian_dx_cabrillo_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .done

    mov [russian_dx_file], rax

    ; Laes claimed score fra brugerens Cabrillo
    mov rcx, [russian_dx_file]
    call read_claimed_score
    mov [russian_dx_claimed_score], eax


    ; Aabn facit russian_dx Cabrillo
    lea rcx, [facit_russian_dx_cabrillo_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .close_russian_dx

    mov [facit_russian_dx_file], rax

    ; Aabn brugerens russian_dx-log
    lea rcx, [russian_dx_log_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .show_real_test

    mov [russian_dx_log_file], rax
	
.read_log_loop:

    ; Laes naeste linje fra brugerens russian_dx-log
    lea rcx, [russian_dx_log_buffer]
    mov edx, 256
    mov r8, [russian_dx_log_file]
    call fgets

        test rax, rax
    jz .show_real_test

    ; Gem dato fra foerste loglinje
    cmp byte [russian_dx_highscore_date], 0
    jne .date_done

    mov rax, [russian_dx_log_buffer]
    mov [russian_dx_highscore_date], rax

    mov ax, [russian_dx_log_buffer + 8]
    mov [russian_dx_highscore_date + 8], ax

    mov byte [russian_dx_highscore_date + 10], 0

.date_done:

    ; Vis linjen
    lea rcx, [russian_dx_log_test_format]
    lea rdx, [russian_dx_log_buffer]
    call printf

    ; Er QSO'en 0 point?
    lea rcx, [russian_dx_log_buffer]
    lea rdx, [zero_point_text]
    call strstr

    test rax, rax
    jnz .zero_point_qso

    ; Find foerste QSO i brugerens Cabrillo
    mov rcx, [russian_dx_file]
    lea rdx, [russian_dx_qso_buffer]
    call read_first_qso

    test eax, eax
    jz .close_files

    ; Vis brugerens QSO
    lea rcx, [russian_dx_qso_test_format]
    lea rdx, [russian_dx_qso_buffer]
    call printf

    ; Find foerste QSO i facit Cabrillo
    mov rcx, [facit_russian_dx_file]
    lea rdx, [facit_qso_buffer]
    call read_first_qso

    test eax, eax
    jz .close_files

    ; Vis facit QSO
    lea rcx, [facit_qso_test_format]
    lea rdx, [facit_qso_buffer]
    call printf

    ; Sammenlign hele QSO-linjen med facit
    lea rcx, [russian_dx_qso_buffer]
    lea rdx, [facit_qso_buffer]
    call strcmp

    test eax, eax
    jnz .qso_error

    ; QSO er korrekt
    lea rcx, [qso_ok_text]
    call printf

        ; Hent point fra Russian DX-loglinjen
    lea rcx, [russian_dx_log_buffer]
    call get_russian_log_points

    add [russian_dx_real_points], eax


	
.check_mult:

    ; Er denne korrekte QSO en MULT?
    lea rcx, [russian_dx_log_buffer]
    lea rdx, [mult_text]
    call strstr

    test rax, rax
    jz .qso_done

    ; Godkendt multiplier
    inc dword [russian_dx_real_mults]

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
    mov rcx, [russian_dx_file]
    lea rdx, [russian_dx_qso_buffer]
    call read_first_qso

    test rax, rax
    jz .show_real_test

    ; Spring tilsvarende QSO over i facit Cabrillo
    mov rcx, [facit_russian_dx_file]
    lea rdx, [facit_qso_buffer]
    call read_first_qso

    test rax, rax
    jz .show_real_test

    
    ; Fortsaet med naeste log-QSO
    jmp .read_log_loop
	  
.show_real_test:

    lea rcx, [real_test_format]
    mov edx, [russian_dx_real_points]
    mov r8d, [russian_dx_real_mults]
    call printf

    ; Beregn Real score
    mov eax, [russian_dx_real_points]
    imul eax, [russian_dx_real_mults]
    mov [russian_dx_real_score], eax

    ; Vis Real score
    lea rcx, [real_score_format]
    mov edx, eax
    call printf

    ; Vis highscore-dato
    lea rcx, [date_test_format]
    lea rdx, [russian_dx_highscore_date]
    call printf

    ; Aabn russian_dx highscore-fil i append mode
    lea rcx, [russian_dx_highscore_filename]
    lea rdx, [append_mode]
    call fopen

    test rax, rax
    jz .close_files

    mov [russian_dx_highscore_file], rax

    ; Skriv highscore
    mov rcx, [russian_dx_highscore_file]
    lea rdx, [highscore_format]
    lea r8, [russian_dx_highscore_date]
    lea r9, [settings_callsign]

    ; 5. argument = Claimed score
    mov eax, [russian_dx_claimed_score]
    mov [rsp + 32], rax

    ; 6. argument = Real score
    mov eax, [russian_dx_real_score]
    mov [rsp + 40], rax

    ; 7. argument = CW-traeningstid
    mov eax, [cw_training_minutes]
    mov [rsp + 48], rax

    call fprintf

    ; Luk highscore-filen
    mov rcx, [russian_dx_highscore_file]
    call fclose

    jmp .close_files
	
.close_files:

    ; Luk brugerens russian_dx-log
    mov rcx, [russian_dx_log_file]
    call fclose
	
    ; Luk facit Cabrillo
    mov rcx, [facit_russian_dx_file]
    call fclose

.close_russian_dx:

    ; Luk brugerens Cabrillo
    mov rcx, [russian_dx_file]
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
    lea rcx, [russian_dx_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .not_found

    ; Find CLAIMED-SCORE:
    lea rcx, [russian_dx_buffer]
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
	
get_russian_log_points:

    ; RCX = Russian DX loglinje
    ; Finder point-feltet efter det 6. |
    ; Virker baade med:
    ; | 5
    ; | 10
    ; | 5 | MULT
    ; | 0 | DUPE

    mov rdx, rcx
    mov ecx, 6

.find_bar:
    cmp byte [rdx], 0
    je .not_found

    cmp byte [rdx], '|'
    je .bar_found

    inc rdx
    jmp .find_bar

.bar_found:
    dec ecx
    jz .point_field

    inc rdx
    jmp .find_bar

.point_field:
    inc rdx

.skip_spaces:
    cmp byte [rdx], ' '
    jne .read_point

    inc rdx
    jmp .skip_spaces

.read_point:
    movzx eax, byte [rdx]
    sub eax, '0'

    ; Er point 10?
    cmp byte [rdx], '1'
    jne .done

    cmp byte [rdx + 1], '0'
    jne .done

    mov eax, 10

.done:
    ret

.not_found:
    xor eax, eax
    ret