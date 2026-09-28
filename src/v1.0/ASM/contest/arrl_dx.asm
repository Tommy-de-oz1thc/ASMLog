bits 64
default rel

global arrl_dx_new_qso
global calculate_arrl_score
global check_arrl_dupe
global check_arrl_log_multiplier
global check_arrl_multiplier
global check_arrl_used_multiplier
global search_arrl_log
global show_arrl_log
global start_new_arrl_log

extern _strupr_s
extern fclose
extern fgets
extern fopen
extern fprintf
extern gets_s
extern gmtime
extern printf
extern settings_arrl_power
extern sprintf
extern strcmp
extern strftime
extern strstr
extern time

section .data

arrl_append_mode:
    db "a", 0

arrl_band_10:
    db "10m", 0

arrl_band_15:
    db "15m", 0

arrl_band_160:
    db "160m", 0

arrl_band_20:
    db "20m", 0

arrl_band_40:
    db "40m", 0

arrl_band_80:
    db "80m", 0

arrl_band_error:
    db "Ugyldigt baand. Brug 160m, 80m, 40m, 20m, 15m eller 10m.", 10, 0

arrl_band_prompt:
    db "Baand: ", 0

arrl_call_error:
    db "Ugyldigt kaldesignal. Det skal indeholde mindst et bogstav og et tal.", 10, 0

arrl_call_prompt:
    db "Kaldesignal: ", 0

arrl_display_format:
    db "%s", 0

arrl_dupe_text:
    db " | DUPE", 0

arrl_dupe_warning:
    db "DUPE - kaldesignalet er allerede logget paa dette baand.", 10, 0

arrl_dx_title:
    db 10, "=== ARRL DX CW ===", 10, 10, 0

arrl_field_pattern_format:
    db " | %s |", 0

arrl_log_filename:
    db "log/arrl_dx_log.txt", 0

arrl_mult_count_format:
    db "ARRL-multipliers: %d", 10, 0

arrl_mult_filename:
    db "data/arrl_dx_mult.txt", 0

arrl_mult_text:
    db "MULT", 0

arrl_new_log_done:
    db "Ny ARRL DX-log er startet.", 10, 0

arrl_new_log_prompt:
    db 10, "Start ny ARRL DX-log? (J/N): ", 0

arrl_no_results:
    db 10, "Ingen QSO'er i ARRL DX-loggen.", 10, 0

arrl_points_format:
    db 10, "QSO-point: %d", 10, 0

arrl_power_format:
    db "Power: %s W", 10, 0
	
arrl_power_prompt: db "Power: ", 0

arrl_qso_dupe_format:
    db "%s | %s | %s | CW | %s | %s | %s | %d | DUPE", 10, 0

arrl_qso_format:
    db "%s | %s | %s | CW | %s | %s | %s | %d", 10, 0

arrl_qso_mult_format:
    db "%s | %s | %s | CW | %s | %s | %s | %d | MULT", 10, 0

arrl_read_mode:
    db "r", 0

arrl_rst_error:
    db "RST skal vaere praecis tre cifre, fx 599.", 10, 0

arrl_rst_prompt:
    db "RST modtaget: ", 0

arrl_score_format:
    db "ARRL-score: %d", 10, 0

arrl_search_count_format:
    db 10, "Antal fund: %d", 10, 0

arrl_search_header:
    db 10, "Fundne QSO'er:", 10, 0

arrl_search_no_results:
    db 10, "Ingen QSO'er fundet.", 10, 0

arrl_search_prompt:
    db 10, "Kaldesignal at soege efter: ", 0

arrl_state_error:
    db "Ugyldig State/Province.", 10, 0

arrl_state_prompt:
    db "State/Province: ", 0

arrl_three_points_text:
    db " | 3", 0

arrl_time_format:
    db "%d-%m-%Y %H:%M", 0

arrl_write_mode:
    db "w", 0
section .bss

arrl_band:
    resb 16

arrl_band_pattern:
    resb 24

arrl_call:
    resb 32

arrl_call_pattern:
    resb 48

arrl_dupe_buffer:
    resb 256

arrl_dupe_flag:
    resd 1

arrl_mult_buffer:
    resb 16

arrl_mult_flag:
    resd 1

arrl_mult_log_buffer:
    resb 256

arrl_new_log_answer:
    resb 8

arrl_points:
    resd 1
	
arrl_power resb 8

arrl_read_buffer:
    resb 256

arrl_rst:
    resb 8

arrl_search_call:
    resb 32

arrl_search_count:
    resd 1

arrl_state:
    resb 8

arrl_state_pattern:
    resb 16

arrl_time_buffer:
    resb 64

arrl_time_value:
    resq 1

arrl_total_mults:
    resd 1

arrl_total_points:
    resd 1

arrl_used_mult_count:
    resd 1

arrl_used_mults:
    resb 16384
	
section .text


arrl_dx_new_qso:

    sub rsp, 40

    ; Denne QSO er ikke en ny multiplier fra starten
    mov dword [arrl_mult_flag], 0

    ; Hent aktuel tid
    lea rcx, [arrl_time_value]
    call time

    ; Konverter til UTC
    lea rcx, [arrl_time_value]
    call gmtime

    ; RAX peger paa tm-strukturen
    mov r9, rax

    ; Lav teksten DD-MM-YYYY HH:MM
    lea rcx, [arrl_time_buffer]
    mov edx, 64
    lea r8, [arrl_time_format]
    call strftime

    lea rcx, [arrl_dx_title]
    call printf

    read_arrl_call:

    lea rcx, [arrl_call_prompt]
    call printf

    lea rcx, [arrl_call]
    mov edx, 32
    call gets_s

    ; Lav kaldesignalet til store bogstaver
    lea rcx, [arrl_call]
    mov edx, 32
    call _strupr_s

    ; Kontroller kaldesignalet
    lea rcx, [arrl_call]
    call validate_arrl_call

    test eax, eax
    jnz arrl_call_ok

    lea rcx, [arrl_call_error]
    call printf
    jmp read_arrl_call


arrl_call_ok:


read_arrl_band:

    lea rcx, [arrl_band_prompt]
    call printf

    lea rcx, [arrl_band]
    mov edx, 16
    call gets_s

    lea rcx, [arrl_band]
    lea rdx, [arrl_band_160]
    call strcmp
    test eax, eax
    jz arrl_band_ok

    lea rcx, [arrl_band]
    lea rdx, [arrl_band_80]
    call strcmp
    test eax, eax
    jz arrl_band_ok

    lea rcx, [arrl_band]
    lea rdx, [arrl_band_40]
    call strcmp
    test eax, eax
    jz arrl_band_ok

    lea rcx, [arrl_band]
    lea rdx, [arrl_band_20]
    call strcmp
    test eax, eax
    jz arrl_band_ok

    lea rcx, [arrl_band]
    lea rdx, [arrl_band_15]
    call strcmp
    test eax, eax
    jz arrl_band_ok

    lea rcx, [arrl_band]
    lea rdx, [arrl_band_10]
    call strcmp
    test eax, eax
    jz arrl_band_ok

    ; Ingen af de seks baand passede
    lea rcx, [arrl_band_error]
    call printf
    jmp read_arrl_band


arrl_band_ok:

    ; Kontroller om samme kaldesignal allerede
    ; er logget paa dette baand
    call check_arrl_dupe

    mov dword [arrl_dupe_flag], eax

    test eax, eax
    jz read_arrl_rst

    ; Fortael brugeren at dette er en DUPE
    lea rcx, [arrl_dupe_warning]
    call printf
read_arrl_rst:

    lea rcx, [arrl_rst_prompt]
    call printf

    lea rcx, [arrl_rst]
    mov edx, 8
    call gets_s

    ; Foerste tegn skal vaere 0-9
    cmp byte [arrl_rst], '0'
    jb arrl_bad_rst
    cmp byte [arrl_rst], '9'
    ja arrl_bad_rst

    ; Andet tegn skal vaere 0-9
    cmp byte [arrl_rst + 1], '0'
    jb arrl_bad_rst
    cmp byte [arrl_rst + 1], '9'
    ja arrl_bad_rst

    ; Tredje tegn skal vaere 0-9
    cmp byte [arrl_rst + 2], '0'
    jb arrl_bad_rst
    cmp byte [arrl_rst + 2], '9'
    ja arrl_bad_rst

    ; Der maa ikke vaere flere tegn
    cmp byte [arrl_rst + 3], 0
    jne arrl_bad_rst

    jmp arrl_rst_ok


arrl_bad_rst:

    lea rcx, [arrl_rst_error]
    call printf
    jmp read_arrl_rst


arrl_rst_ok:

    ; Start med 0 point
    mov dword [arrl_points], 0

    ; En DUPE giver altid 0 point
    cmp dword [arrl_dupe_flag], 1
    je arrl_dupe_qso

    ; Kontroller om kaldesignalet er W/VE
    ; W/K/N = USA, VE = Canada

    cmp byte [arrl_call], 'W'
    je arrl_wve

    cmp byte [arrl_call], 'K'
    je arrl_wve

    cmp byte [arrl_call], 'N'
    je arrl_wve

    cmp byte [arrl_call], 'V'
    jne arrl_non_wve

    cmp byte [arrl_call + 1], 'E'
    jne arrl_non_wve

arrl_dupe_qso:

    ; DUPE giver 0 point
    mov dword [arrl_points], 0

    ; Behold State/Province-indtastning for W/VE,
    ; men multiplier maa senere ikke registreres
    jmp read_arrl_state
	
arrl_wve:

    ; Gyldig W/VE-kontakt giver 3 point
    mov dword [arrl_points], 3
    jmp read_arrl_state


arrl_non_wve:

    ; Ikke W/VE giver 0 point
    mov dword [arrl_points], 0

    ; State/Province skal vaere tom
    mov byte [arrl_state], 0
    jmp arrl_state_ok


read_arrl_state:
    lea rcx, [arrl_state_prompt]
    call printf

    lea rcx, [arrl_state]
    mov edx, 8
    call gets_s

    ; Lav koden til store bogstaver
    lea rcx, [arrl_state]
    mov edx, 8
    call _strupr_s

    ; Kontroller State/Province mod arrl_dx_mult.txt
    lea rcx, [arrl_state]
    call check_arrl_multiplier

    test eax, eax
    jnz arrl_state_ok

    ; Ikke fundet
    lea rcx, [arrl_state_error]
    call printf
    jmp read_arrl_state


arrl_state_ok:

    ; En DUPE maa aldrig give en multiplier
    cmp dword [arrl_dupe_flag], 1
    je arrl_multiplier_done

    ; Kun W/VE-QSO'er har State/Province
    cmp byte [arrl_state], 0
    je arrl_multiplier_done

    ; Kontroller foerst den eksisterende logfil.
    ; Det goer multiplier-kontrollen permanent efter genstart.
    lea rcx, [arrl_state]
    lea rdx, [arrl_band]
    call check_arrl_log_multiplier

    test eax, eax
    jnz arrl_multiplier_done

    ; Er denne State/Province allerede multiplier paa dette baand?
    lea rcx, [arrl_state]
    lea rdx, [arrl_band]
    call check_arrl_used_multiplier

    test eax, eax
    jnz arrl_multiplier_done

        ; Nej - registrer den som ny multiplier
    lea rcx, [arrl_state]
    lea rdx, [arrl_band]
    call add_arrl_used_multiplier

    ; Denne QSO gav en ny multiplier
    mov dword [arrl_mult_flag], 1

arrl_multiplier_done:

    ; Aabn ARRL DX-logfilen i append-mode
    lea rcx, [arrl_log_filename]
    lea rdx, [arrl_append_mode]
    call fopen

    ; Kunne filen ikke aabnes?
    test rax, rax
    jz arrl_log_done

    ; Gem FILE-pointeren
    mov [rsp + 32], rax

    ; fprintf(
    ;     file,
    ;     format,
    ;     tid,
    ;     callsign,
    ;     band,
    ;     RST,
    ;     State/Province,
    ;     Power
    ; )

    mov rcx, [rsp + 32]

	; Vaelg DUPE, MULT eller almindelig QSO

; DUPE har foerste prioritet
cmp dword [arrl_dupe_flag], 1
je arrl_use_dupe_format

; Ellers kontroller MULT
cmp dword [arrl_mult_flag], 1
je arrl_use_mult_format

; Almindelig QSO
lea rdx, [arrl_qso_format]
jmp arrl_format_ready

arrl_use_dupe_format:
    lea rdx, [arrl_qso_dupe_format]
    jmp arrl_format_ready

arrl_use_mult_format:
    lea rdx, [arrl_qso_mult_format]

arrl_format_ready:
    lea r8, [arrl_time_buffer]
    lea r9, [arrl_call]

    ; Ekstra argumenter til fprintf ligger paa stacken.
    sub rsp, 80

    lea rax, [arrl_band]
    mov [rsp + 32], rax

    lea rax, [arrl_rst]
    mov [rsp + 40], rax

    lea rax, [arrl_state]
    mov [rsp + 48], rax

    lea rax, [settings_arrl_power]
	mov [rsp + 56], rax

	; Point
	mov eax, [arrl_points]
	mov [rsp + 64], rax

	call fprintf

    add rsp, 80

    ; Luk logfilen
    mov rcx, [rsp + 32]
    call fclose


arrl_log_done:

    add rsp, 40
    ret

calculate_arrl_score:

    push rbx
    sub rsp, 32

    ; Nulstil scoretaellere
    mov dword [arrl_total_points], 0
    mov dword [arrl_total_mults], 0

    ; Aabn ARRL DX-loggen
    lea rcx, [arrl_log_filename]
    lea rdx, [arrl_read_mode]
    call fopen

    ; Ingen log = score 0
    test rax, rax
    jz .empty

    mov rbx, rax

.read_next:

    ; Laes naeste linje
    lea rcx, [arrl_read_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    ; Slut paa filen?
    test rax, rax
    jz .finished

    ; Kontroller om QSO'en giver 3 point
    lea rcx, [arrl_read_buffer]
    lea rdx, [arrl_three_points_text]
    call strstr

    test rax, rax
    jz .no_points

    add dword [arrl_total_points], 3

.no_points:

    ; Kontroller om QSO'en gav en multiplier
    lea rcx, [arrl_read_buffer]
    lea rdx, [arrl_mult_text]
    call strstr

    test rax, rax
    jz .no_mult

    inc dword [arrl_total_mults]

.no_mult:

    jmp .read_next

.finished:

    mov rcx, rbx
    call fclose

    ; Score = QSO-point * multipliers
    mov eax, [arrl_total_points]
    imul eax, [arrl_total_mults]

    add rsp, 32
    pop rbx
    ret

.empty:

    xor eax, eax

    add rsp, 32
    pop rbx
    ret

show_arrl_log:


    push rbx
    sub rsp, 32

    ; Nulstil scoretaellere
    mov dword [arrl_total_points], 0
    mov dword [arrl_total_mults], 0

    ; Aabn ARRL DX-loggen til laesning
    lea rcx, [arrl_log_filename]
    lea rdx, [arrl_read_mode]
    call fopen

    ; Findes loggen ikke?
    test rax, rax
    jz .empty

    mov rbx, rax


.read_next:

    ; Laes naeste linje
    lea rcx, [arrl_read_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    ; Slut paa filen?
    test rax, rax
    jz .finished

    ; Vis linjen
    lea rcx, [arrl_display_format]
    lea rdx, [arrl_read_buffer]
    call printf

    ; Kontroller om QSO'en giver 3 point
    lea rcx, [arrl_read_buffer]
    lea rdx, [arrl_three_points_text]
    call strstr

    test rax, rax
    jz .no_points

    add dword [arrl_total_points], 3

.no_points:

    ; Kontroller om QSO'en gav en multiplier
    lea rcx, [arrl_read_buffer]
    lea rdx, [arrl_mult_text]
    call strstr

    test rax, rax
    jz .no_mult

    inc dword [arrl_total_mults]

.no_mult:

    jmp .read_next


.finished:

    mov rcx, rbx
    call fclose

    ; Vis samlede QSO-point
    lea rcx, [arrl_points_format]
    mov edx, [arrl_total_points]
    call printf

    ; Vis antal multipliers
    lea rcx, [arrl_mult_count_format]
    mov edx, [arrl_total_mults]
    call printf

    ; Beregn score = QSO-point * multipliers
    mov eax, [arrl_total_points]
    imul eax, [arrl_total_mults]

    ; Vis samlet ARRL-score
    lea rcx, [arrl_score_format]
    mov edx, eax
    call printf

    add rsp, 32
    pop rbx
    ret


.empty:

    lea rcx, [arrl_no_results]
    call printf

    add rsp, 32
    pop rbx
    ret
search_arrl_log:

    push rbx
    sub rsp, 32

    ; Nulstil antal fund
    mov dword [arrl_search_count], 0

    ; Spoerg efter kaldesignal
    lea rcx, [arrl_search_prompt]
    call printf

    lea rcx, [arrl_search_call]
    mov edx, 32
    call gets_s

    ; Store bogstaver
    lea rcx, [arrl_search_call]
    mov edx, 32
    call _strupr_s

    ; Aabn ARRL DX-loggen
    lea rcx, [arrl_log_filename]
    lea rdx, [arrl_read_mode]
    call fopen

    test rax, rax
    jz .no_results

    mov rbx, rax

    ; Overskrift
    lea rcx, [arrl_search_header]
    call printf

.read_next:

    lea rcx, [arrl_read_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .finished

    ; Find kaldesignalet i linjen
    lea rcx, [arrl_read_buffer]
    lea rdx, [arrl_search_call]
    call strstr

    test rax, rax
    jz .read_next

    ; Vis fundet QSO
    lea rcx, [arrl_display_format]
    lea rdx, [arrl_read_buffer]
    call printf

    inc dword [arrl_search_count]
    jmp .read_next

.finished:

    mov rcx, rbx
    call fclose

    cmp dword [arrl_search_count], 0
    je .no_results

    lea rcx, [arrl_search_count_format]
    mov edx, [arrl_search_count]
    call printf

    jmp .done

.no_results:

    lea rcx, [arrl_search_no_results]
    call printf

.done:

    add rsp, 32
    pop rbx
    ret	

start_new_arrl_log:

    push rbx
    sub rsp, 32

    ; Spoerg om bekraeftelse
    lea rcx, [arrl_new_log_prompt]
    call printf

    lea rcx, [arrl_new_log_answer]
    mov edx, 8
    call gets_s

    ; Accepter baade J og j
    cmp byte [arrl_new_log_answer], 'J'
    je .create

    cmp byte [arrl_new_log_answer], 'j'
    je .create

    ; Alt andet betyder annuller
    jmp .done


.create:

    ; "w" opretter filen eller tømmer den eksisterende
    lea rcx, [arrl_log_filename]
    lea rdx, [arrl_write_mode]
    call fopen

    test rax, rax
    jz .done

    mov rbx, rax

    ; Luk den tomme logfil igen
    mov rcx, rbx
    call fclose

    ; Nulstil brugte multipliers for den nye log
    mov dword [arrl_used_mult_count], 0

    lea rcx, [arrl_new_log_done]
    call printf


.done:

    add rsp, 32
    pop rbx
    ret	

check_arrl_dupe:

    ; Kontroller om arrl_call allerede findes
    ; paa det aktuelle arrl_band.
    ;
    ; EAX = 1 hvis DUPE
    ; EAX = 0 hvis ikke DUPE

    push rbx
    sub rsp, 32
    ; Lav praecist callsign-moenster, fx " | W1ABC |"
    lea rcx, [arrl_call_pattern]
    lea rdx, [arrl_field_pattern_format]
    lea r8,  [arrl_call]
    call sprintf
    ; Aabn ARRL-loggen
    lea rcx, [arrl_log_filename]
    lea rdx, [arrl_read_mode]
    call fopen

    test rax, rax
    jz .not_dupe

    mov rbx, rax

.read_next:

    lea rcx, [arrl_dupe_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .close_not_dupe

    ; Find callsign i linjen
    lea rcx, [arrl_dupe_buffer]
    lea rdx, [arrl_call_pattern]
    call strstr

    test rax, rax
    jz .read_next

    ; Find ogsaa baandet i samme linje
    lea rcx, [arrl_dupe_buffer]
    lea rdx, [arrl_band]
    call strstr

    test rax, rax
    jz .read_next

    ; Begge blev fundet -> DUPE
    mov rcx, rbx
    call fclose

    mov eax, 1
    jmp .done

.close_not_dupe:

    mov rcx, rbx
    call fclose

.not_dupe:

    xor eax, eax

.done:

    add rsp, 32
    pop rbx
    ret
	
check_arrl_multiplier:

    ; RCX = State/Province som skal kontrolleres
    ; EAX = 1 hvis fundet
    ; EAX = 0 hvis ikke fundet

    push rbx
    push r12
    sub rsp, 40

    ; Gem State/Province
    mov r12, rcx

    ; Aabn arrl_dx_mult.txt
    lea rcx, [arrl_mult_filename]
    lea rdx, [arrl_read_mode]
    call fopen

    test rax, rax
    jz .not_found

    mov rbx, rax


.read_next:

    lea rcx, [arrl_mult_buffer]
    mov edx, 16
    mov r8, rbx
    call fgets

    test rax, rax
    jz .close_not_found

    ; Fjern CR/LF
    lea rax, [arrl_mult_buffer]


.remove_newline:

    cmp byte [rax], 0
    je .compare

    cmp byte [rax], 13
    je .terminate

    cmp byte [rax], 10
    je .terminate

    inc rax
    jmp .remove_newline


.terminate:

    mov byte [rax], 0


.compare:

    lea rcx, [arrl_mult_buffer]
    mov rdx, r12
    call strcmp

    test eax, eax
    jnz .read_next

    ; Fundet
    mov rcx, rbx
    call fclose

    mov eax, 1
    jmp .done


.close_not_found:

    mov rcx, rbx
    call fclose


.not_found:

    xor eax, eax


.done:

    add rsp, 40
    pop r12
    pop rbx
    ret

check_arrl_log_multiplier:

    ; RCX = State/Province
    ; RDX = baand
    ;
    ; EAX = 1 hvis kombinationen allerede findes
    ; EAX = 0 hvis den ikke findes

    push rbx
    push r12
    push r13
    sub rsp, 32

    mov r12, rcx
    mov r13, rdx

    ; Lav State/Province-moenster, fx " | MA |"
    lea rcx, [arrl_state_pattern]
    lea rdx, [arrl_field_pattern_format]
    mov r8, r12
    call sprintf

    ; Lav baand-moenster, fx " | 20m |"
    lea rcx, [arrl_band_pattern]
    lea rdx, [arrl_field_pattern_format]
    mov r8, r13
    call sprintf

    ; Aabn eksisterende ARRL-log
    lea rcx, [arrl_log_filename]
    lea rdx, [arrl_read_mode]
    call fopen

    test rax, rax
    jz .not_found

    mov rbx, rax

.read_next:

    lea rcx, [arrl_mult_log_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .close_not_found

    ; Find State/Province i linjen
    lea rcx, [arrl_mult_log_buffer]
    lea rdx, [arrl_state_pattern]
    call strstr

    test rax, rax
    jz .read_next

    ; Find ogsaa baandet i samme linje
    lea rcx, [arrl_mult_log_buffer]
    lea rdx, [arrl_band_pattern]
    call strstr

    test rax, rax
    jz .read_next

    ; Kombinationen findes allerede
    mov rcx, rbx
    call fclose

    mov eax, 1
    jmp .done

.close_not_found:

    mov rcx, rbx
    call fclose

.not_found:

    xor eax, eax

.done:

    add rsp, 32
    pop r13
    pop r12
    pop rbx
    ret

check_arrl_used_multiplier:

    ; RCX = State/Province
    ; RDX = baand
    ;
    ; EAX = 1 hvis kombinationen allerede er brugt
    ; EAX = 0 hvis den ikke er brugt

    push rbx
    push r12
    push r13
    sub rsp, 32

    ; Gem argumenterne
    mov r12, rcx
    mov r13, rdx

    ; Start ved foerste multiplier-post
    lea rbx, [arrl_used_mults]
    mov eax, [arrl_used_mult_count]

.check_next:

    test eax, eax
    jz .not_found

    ; Gem taelleren
    mov [rsp + 24], eax

    ; Sammenlign State/Province
    mov rcx, rbx
    mov rdx, r12
    call strcmp

    test eax, eax
    jnz .next

    ; Sammenlign baand
    lea rcx, [rbx + 16]
    mov rdx, r13
    call strcmp

    test eax, eax
    jz .found

.next:

    ; Hent taelleren igen
    mov eax, [rsp + 24]

    add rbx, 32
    dec eax
    jmp .check_next

.found:

    mov eax, 1
    jmp .done

.not_found:

    xor eax, eax

.done:

    add rsp, 32
    pop r13
    pop r12
    pop rbx
    ret

add_arrl_used_multiplier:

    ; RCX = State/Province
    ; RDX = baand

    push rbx
    push r12
    push r13
    sub rsp, 32

    mov r12, rcx
    mov r13, rdx

    ; Find pladsen til naeste post
    mov eax, [arrl_used_mult_count]
    imul eax, 32

    lea rbx, [arrl_used_mults]
    add rbx, rax

    ; Kopier State/Province manuelt
    xor eax, eax

.copy_state:

    cmp eax, 15
    jae .state_done

    mov dl, [r12 + rax]
    mov [rbx + rax], dl

    test dl, dl
    jz .state_done

    inc eax
    jmp .copy_state

.state_done:

    ; Sørg for afsluttende 0
    mov byte [rbx + 15], 0

    ; Kopier baand til byte 16-31
    xor eax, eax

.copy_band:

    cmp eax, 15
    jae .band_done

    mov dl, [r13 + rax]
    mov [rbx + rax + 16], dl

    test dl, dl
    jz .band_done

    inc eax
    jmp .copy_band

.band_done:

    mov byte [rbx + 31], 0

    ; En multiplier mere er registreret
    inc dword [arrl_used_mult_count]

    add rsp, 32
    pop r13
    pop r12
    pop rbx
    ret
	
validate_arrl_call:

    ; RCX = adresse paa kaldesignal
    ; EAX = 1 hvis mindst et bogstav og et tal findes
    ; EAX = 0 ellers

    xor r8d, r8d        ; Har fundet bogstav
    xor r9d, r9d        ; Har fundet tal


.check_next:

    mov al, [rcx]

    ; Slut paa teksten?
    test al, al
    jz .finished

    ; Er tegnet A-Z?
    cmp al, 'A'
    jb .check_digit

    cmp al, 'Z'
    ja .check_digit

    mov r8d, 1
    jmp .next


.check_digit:

    ; Er tegnet 0-9?
    cmp al, '0'
    jb .next

    cmp al, '9'
    ja .next

    mov r9d, 1


.next:

    inc rcx
    jmp .check_next


.finished:

    ; Vi skal have fundet baade bogstav og tal
    test r8d, r8d
    jz .invalid

    test r9d, r9d
    jz .invalid

    mov eax, 1
    ret


.invalid:

    xor eax, eax
    ret
