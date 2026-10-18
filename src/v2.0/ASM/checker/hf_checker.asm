bits 64
default rel

global hf_checker

extern _stricmp
extern cw_training_minutes
extern fclose
extern fgets
extern fopen
extern fprintf
extern settings_callsign
extern strcmp


extern printf

section .data

hf_append_mode        db "a", 0
hf_call_correct db "CALL: RIGTIG", 10, 0
hf_call_wrong   db "CALL: FORKERT", 10, 0
hf_debug_log db "HF LOG: %s", 0
hf_debug_facit db "HF FACIT: %s", 0

hf_highscore_filename db "highscore/hf_highscore.txt", 0
hf_highscore_format db "%s | HF CW | %s | %u QSO | %u/%u | %u.%02u %% | %u min", 10, 0
hf_log_filename db "log/hf_log.txt", 0
hf_facit_filename db "facit/facit_hf.txt", 0

hf_name_correct db "NAME: RIGTIG", 10, 0
hf_name_wrong   db "NAME: FORKERT", 10, 0

hf_read_mode db "r", 0

hf_result_header db 10, "===== HF TRAINING RESULTAT =====", 10, 0
hf_result_qso    db "QSO'er kontrolleret: %u", 10, 0
hf_result_call   db "CALL korrekt:        %u", 10, 0
hf_result_rst    db "RST korrekt:         %u", 10, 0
hf_result_name   db "NAME korrekt:        %u", 10, 0
hf_result_qth    db "QTH korrekt:         %u", 10, 0
hf_result_footer db "==============================", 10, 0

hf_result_total db "Korrekte felter:     %u / %u", 10, 0
hf_result_wrong db "Forkerte felter:     %u", 10, 0
hf_result_percent db "Noejagtighed:        %u.%02u %%", 10, 0

hf_qth_correct db "QTH: RIGTIG", 10, 0
hf_qth_wrong   db "QTH: FORKERT", 10, 0

hf_rst_correct db "RST: RIGTIG", 10, 0
hf_rst_wrong   db "RST: FORKERT", 10, 0

section .bss


hf_correct_call    resd 1
hf_correct_rst     resd 1
hf_correct_name    resd 1
hf_correct_qth     resd 1
hf_facit_call resb 32
hf_facit_line resb 256
hf_facit_name resb 64
hf_facit_qth resb 64
hf_facit_rst resb 8
hf_highscore_date resb 11
hf_highscore_file resq 1
hf_log_call   resb 32
hf_log_line resb 256
hf_log_name   resb 64
hf_log_qth   resb 64
hf_log_rst   resb 8
hf_period_correct_call resd 1
hf_period_correct_name resd 1
hf_period_correct_qth  resd 1
hf_period_correct_rst  resd 1
hf_period_correct_total resd 1
hf_period_percent_decimal resd 1
hf_period_percent_whole resd 1

hf_period_possible_total resd 1
hf_period_total_qso    resd 1


hf_total_qso       resd 1
section .text

hf_checker:
    push rbx
    push rsi
    sub rsp, 88
	
    mov dword [hf_total_qso], 0
    mov dword [hf_correct_call], 0
    mov dword [hf_correct_rst], 0
    mov dword [hf_correct_name], 0
    mov dword [hf_correct_qth], 0
    
	; Nulstil resultat for aktuel traeningsperiode
    mov dword [hf_period_correct_call], 0
    mov dword [hf_period_correct_name], 0
    mov dword [hf_period_correct_qth], 0
    mov dword [hf_period_correct_rst], 0
    mov dword [hf_period_total_qso], 0


    ; Aabn HF-log
    lea rcx, [hf_log_filename]
    lea rdx, [hf_read_mode]
    call fopen

    test rax, rax
    jz .done

    mov rbx, rax

    ; Aabn HF-facitlog
    lea rcx, [hf_facit_filename]
    lea rdx, [hf_read_mode]
    call fopen

    test rax, rax
    jz .close_log

    mov rsi, rax

.read_next:

   

    ; Laes naeste QSO fra HF-log
    lea rcx, [hf_log_line]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .show_result

    ; Laes tilsvarende QSO fra facit
    lea rcx, [hf_facit_line]
    mov edx, 256
    mov r8, rsi
    call fgets

    test rax, rax
    jz .show_result

    ; Begge QSO-linjer er laest
	; Gem datoen fra den seneste QSO
    lea r8, [hf_log_line]
    lea r9, [hf_highscore_date]
    mov ecx, 10

.copy_highscore_date:
    mov al, [r8]
    mov [r9], al
    inc r8
    inc r9
    dec ecx
    jnz .copy_highscore_date

    mov byte [r9], 0
    ; Nulstil periodens resultat foer naeste QSO
    mov dword [hf_period_correct_call], 0
    mov dword [hf_period_correct_rst], 0
    mov dword [hf_period_correct_name], 0
    mov dword [hf_period_correct_qth], 0
    mov dword [hf_period_total_qso], 0
    inc dword [hf_total_qso]
    inc dword [hf_period_total_qso]
	
    ; Vis begge linjer
    lea rcx, [hf_debug_log]
    lea rdx, [hf_log_line]
    call printf

    lea rcx, [hf_debug_facit]
    lea rdx, [hf_facit_line]
    call printf

    ; Find CALL-feltet i HF-loggen
    lea rcx, [hf_log_line]
    lea rdx, [hf_log_call]
    call hf_extract_call

    ; Find CALL-feltet i facitloggen
    lea rcx, [hf_facit_line]
    lea rdx, [hf_facit_call]
    call hf_extract_call

    ; Sammenlign CALL uden forskel paa store/smaa bogstaver
    lea rcx, [hf_log_call]
    lea rdx, [hf_facit_call]
    call _stricmp

    test eax, eax
    jnz .call_wrong

    inc dword [hf_correct_call]
	inc dword [hf_period_correct_call]
    lea rcx, [hf_call_correct]
    call printf
    jmp .check_rst

.call_wrong:
    lea rcx, [hf_call_wrong]
    call printf

.check_rst:
    ; Hent RST modtaget fra HF-log
    lea rcx, [hf_log_line]
    lea rdx, [hf_log_rst]
    call hf_extract_rst

    ; Hent RST modtaget fra facit
    lea rcx, [hf_facit_line]
    lea rdx, [hf_facit_rst]
    call hf_extract_rst

    ; Sammenlign RST
    lea rcx, [hf_log_rst]
    lea rdx, [hf_facit_rst]
    call strcmp

    test eax, eax
    jnz .rst_wrong

	inc dword [hf_correct_rst]
	inc dword [hf_period_correct_rst]
    lea rcx, [hf_rst_correct]
    call printf
    jmp .check_name

.rst_wrong:
    lea rcx, [hf_rst_wrong]
    call printf

.check_name:
    ; Hent NAME fra HF-log
    lea rcx, [hf_log_line]
    lea rdx, [hf_log_name]
    call hf_extract_name

    ; Hent NAME fra facitlog
    lea rcx, [hf_facit_line]
    lea rdx, [hf_facit_name]
    call hf_extract_name

    ; Sammenlign uden forskel paa store/smaa bogstaver
    lea rcx, [hf_log_name]
    lea rdx, [hf_facit_name]
    call _stricmp

    test eax, eax
    jnz .name_wrong

    inc dword [hf_correct_name]
	inc dword [hf_period_correct_name]	
    lea rcx, [hf_name_correct]
    call printf
    jmp .check_qth

.name_wrong:
    lea rcx, [hf_name_wrong]
    call printf

.check_qth:
    ; Hent QTH fra HF-log
    lea rcx, [hf_log_line]
    lea rdx, [hf_log_qth]
    call hf_extract_qth

    ; Hent QTH fra facitlog
    lea rcx, [hf_facit_line]
    lea rdx, [hf_facit_qth]
    call hf_extract_qth

    ; Sammenlign uden forskel paa store/smaa bogstaver
    lea rcx, [hf_log_qth]
    lea rdx, [hf_facit_qth]
    call _stricmp

    test eax, eax
    jnz .qth_wrong

    inc dword [hf_correct_qth]
	inc dword [hf_period_correct_qth]
    lea rcx, [hf_qth_correct]
    call printf
    jmp .read_next

.qth_wrong:
    lea rcx, [hf_qth_wrong]
    call printf
    jmp .read_next

.show_result:

    ; Beregn korrekte felter i traeningsperioden
    mov eax, [hf_period_correct_call]
    add eax, [hf_period_correct_rst]
    add eax, [hf_period_correct_name]
    add eax, [hf_period_correct_qth]
    mov [hf_period_correct_total], eax

    ; Beregn mulige felter i traeningsperioden
    mov eax, [hf_period_total_qso]
    shl eax, 2
    mov [hf_period_possible_total], eax

    ; Beregn periodens procent * 100
    mov eax, [hf_period_correct_total]
    imul eax, 10000
    xor edx, edx

    mov ecx, [hf_period_possible_total]
    test ecx, ecx
    jz .period_zero_percent

    div ecx
    jmp .period_split_percent

.period_zero_percent:
    xor eax, eax

.period_split_percent:
    ; Del procenten i heltal og decimaler
    xor edx, edx
    mov ecx, 100
    div ecx

    mov [hf_period_percent_whole], eax
    mov [hf_period_percent_decimal], edx

    lea rcx, [hf_result_header]
    call printf

    lea rcx, [hf_result_qso]
    mov edx, [hf_total_qso]
    call printf

    lea rcx, [hf_result_call]
    mov edx, [hf_correct_call]
    call printf

    lea rcx, [hf_result_rst]
    mov edx, [hf_correct_rst]
    call printf

    lea rcx, [hf_result_name]
    mov edx, [hf_correct_name]
    call printf

    lea rcx, [hf_result_qth]
    mov edx, [hf_correct_qth]
    call printf

    ; Samlet antal korrekte felter
    mov r10d, [hf_correct_call]
    add r10d, [hf_correct_rst]
    add r10d, [hf_correct_name]
    add r10d, [hf_correct_qth]

    ; Antal mulige felter = QSO * 4
    mov r11d, [hf_total_qso]
    shl r11d, 2

    ; Gem vaerdier paa stacken
    mov [rsp + 32], r10d

    ; Udskriv korrekte / mulige
    lea rcx, [hf_result_total]
    mov edx, r10d
    mov r8d, r11d
    call printf

    ; Forkerte felter
    mov eax, [hf_total_qso]
    shl eax, 2
    sub eax, [rsp + 32]

    lea rcx, [hf_result_wrong]
    mov edx, eax
    call printf

    ; Beregn procent * 100
    mov eax, [rsp + 32]
    imul eax, 10000
    xor edx, edx

    mov ecx, [hf_total_qso]
    shl ecx, 2
    test ecx, ecx
    jz .zero_percent

    div ecx
    jmp .print_percent

.zero_percent:
    xor eax, eax

.print_percent:
    ; EAX = procent * 100
    xor edx, edx
    mov ecx, 100
    div ecx

    ; EAX = heltal, EDX = decimaler
    lea rcx, [hf_result_percent]
    mov r8d, edx
    mov edx, eax
    call printf

    lea rcx, [hf_result_footer]
    call printf

    ; Gem kun hvis perioden indeholder en QSO
    cmp dword [hf_period_total_qso], 0
    je .close_both

    ; Aabn highscore i append mode
    lea rcx, [hf_highscore_filename]
    lea rdx, [hf_append_mode]
    call fopen

    test rax, rax
    jz .close_both

    mov [hf_highscore_file], rax

    ; Skriv periodens resultat
    mov rcx, [hf_highscore_file]
    lea rdx, [hf_highscore_format]
    lea r8, [hf_highscore_date]
    lea r9, [settings_callsign]

    mov eax, [hf_period_total_qso]
    mov [rsp + 32], rax

    mov eax, [hf_period_correct_total]
    mov [rsp + 40], rax

    mov eax, [hf_period_possible_total]
    mov [rsp + 48], rax

    mov eax, [hf_period_percent_whole]
    mov [rsp + 56], rax

    mov eax, [hf_period_percent_decimal]
    mov [rsp + 64], rax

    ; Valgt CW-traeningsperiode i minutter
    mov eax, [cw_training_minutes]
    mov [rsp + 72], rax

    call fprintf

    ; Luk highscore-filen
    mov rcx, [hf_highscore_file]
    call fclose

    mov qword [hf_highscore_file], 0

    jmp .close_both

.close_both:
    mov rcx, rsi
    call fclose

.close_log:
    mov rcx, rbx
    call fclose

.done:
    add rsp, 88
    pop rsi
    pop rbx
    ret
	
hf_extract_call:
    ; RCX = kildelinje
    ; RDX = destinationsbuffer paa 32 bytes
    ; CALL er felt nummer 4, adskilt med |

    xor r8d, r8d

.find_separator:
    mov al, [rcx]
    test al, al
    jz .empty

    cmp al, '|'
    jne .next_char

    inc r8d
    cmp r8d, 3
    je .found

.next_char:
    inc rcx
    jmp .find_separator

.found:
    inc rcx

.skip_spaces:
    cmp byte [rcx], ' '
    jne .copy
    inc rcx
    jmp .skip_spaces

.copy:
    xor r9d, r9d

.copy_loop:
    mov al, [rcx]
    test al, al
    jz .finish

    cmp al, ' '
    je .finish

    cmp al, '|'
    je .finish

    cmp r9d, 31
    jae .finish

    mov [rdx], al
    inc rcx
    inc rdx
    inc r9d
    jmp .copy_loop

.finish:
    mov byte [rdx], 0
    ret

.empty:
    mov byte [rdx], 0
    ret
	
hf_extract_rst:
    ; RCX = loglinje
    ; RDX = buffer paa 8 bytes
    ; RST modtaget er felt nummer 6

    xor r8d, r8d

.find_separator:
    mov al, [rcx]
    test al, al
    jz .empty

    cmp al, '|'
    jne .next_char

    inc r8d
    cmp r8d, 5
    je .found

.next_char:
    inc rcx
    jmp .find_separator

.found:
    inc rcx

.skip_spaces:
    cmp byte [rcx], ' '
    jne .copy
    inc rcx
    jmp .skip_spaces

.copy:
    xor r9d, r9d

.copy_loop:
    mov al, [rcx]
    test al, al
    jz .finish

    cmp al, ' '
    je .finish

    cmp al, '|'
    je .finish

    cmp r9d, 7
    jae .finish

    mov [rdx], al
    inc rcx
    inc rdx
    inc r9d
    jmp .copy_loop

.finish:
    mov byte [rdx], 0
    ret

.empty:
    mov byte [rdx], 0
    ret
	
hf_extract_name:
    ; RCX = loglinje
    ; RDX = buffer paa 64 bytes
    ; NAME er felt nummer 7

    xor r8d, r8d

.find_separator:
    mov al, [rcx]
    test al, al
    jz .empty

    cmp al, '|'
    jne .next_char

    inc r8d
    cmp r8d, 6
    je .found

.next_char:
    inc rcx
    jmp .find_separator

.found:
    inc rcx

.skip_spaces:
    cmp byte [rcx], ' '
    jne .copy
    inc rcx
    jmp .skip_spaces

.copy:
    xor r9d, r9d

.copy_loop:
    mov al, [rcx]
    test al, al
    jz .finish

    cmp al, '|'
    je .finish

    cmp al, 10
    je .finish

    cmp r9d, 63
    jae .finish

    mov [rdx], al
    inc rcx
    inc rdx
    inc r9d
    jmp .copy_loop

.finish:
    ; Fjern eventuelle mellemrum til sidst
.trim:
    cmp r9d, 0
    je .terminate

    cmp byte [rdx - 1], ' '
    jne .terminate

    dec rdx
    dec r9d
    jmp .trim

.terminate:
    mov byte [rdx], 0
    ret

.empty:
    mov byte [rdx], 0
    ret
	
hf_extract_qth:
    ; RCX = loglinje
    ; RDX = buffer paa 64 bytes
    ; QTH er felt nummer 8

    xor r8d, r8d

.find_separator:
    mov al, [rcx]
    test al, al
    jz .empty

    cmp al, '|'
    jne .next_char

    inc r8d
    cmp r8d, 7
    je .found

.next_char:
    inc rcx
    jmp .find_separator

.found:
    inc rcx

.skip_spaces:
    cmp byte [rcx], ' '
    jne .copy
    inc rcx
    jmp .skip_spaces

.copy:
    xor r9d, r9d

.copy_loop:
    mov al, [rcx]
    test al, al
    jz .finish

    cmp al, '|'
    je .finish

    cmp al, 10
    je .finish

    cmp al, 13
    je .finish

    cmp r9d, 63
    jae .finish

    mov [rdx], al
    inc rcx
    inc rdx
    inc r9d
    jmp .copy_loop

.finish:
    ; Fjern mellemrum til sidst
.trim:
    test r9d, r9d
    jz .terminate

    cmp byte [rdx - 1], ' '
    jne .terminate

    dec rdx
    dec r9d
    jmp .trim

.terminate:
    mov byte [rdx], 0
    ret

.empty:
    mov byte [rdx], 0
    ret