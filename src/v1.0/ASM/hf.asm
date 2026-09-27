bits 64
default rel
global hf_log
global new_hf_logfile
global search_hf_log
global show_hf_log

extern _strupr_s
extern fclose
extern fgets
extern fopen
extern fprintf
extern getchar
extern gets_s
extern gmtime
extern printf
extern strcmp
extern strftime
extern strstr
extern time

section .data
hf_append_mode db "a", 0

hf_band_10 db "10m", 0
hf_band_12 db "12m", 0
hf_band_15 db "15m", 0
hf_band_160 db "160m", 0
hf_band_17 db "17m", 0
hf_band_20 db "20m", 0
hf_band_30 db "30m", 0
hf_band_40 db "40m", 0
hf_band_60 db "60m", 0
hf_band_80 db "80m", 0

hf_band_error:
    db "Ugyldigt baand. Proev igen.", 10, 0

hf_band_format:
    db "Baand indtastet: %s", 10, 0

hf_band_prompt:
    db "Baand: ", 0

hf_call_error:
    db "Ugyldigt kaldesignal. Skal indeholde mindst et bogstav og et tal.", 10, 0

hf_call_format:
    db "Kaldesignal indtastet: %s", 10, 0

hf_call_prompt:
    db "Kaldesignal: ", 0

hf_file_format:
    db "%s | %s | CW | %s | %s | %s | %s | %s", 10, 0

hf_filename db "log/hf_log.txt", 0

hf_name_prompt:
    db "Navn (Enter = spring over): ", 0

hf_newlog_prompt:
    db "Start ny HF-log? (J/N): ", 0

hf_newlog_warning:
    db "ADVARSEL: Hele HF-loggen bliver slettet.", 10, 0

hf_qth_prompt:
    db "QTH (Enter = spring over): ", 0

hf_read_mode:
    db "r", 0

hf_rst_error:
    db "RST skal vaere praecis tre cifre, fx 599.", 10, 0

hf_rst_format:
    db "RST sendt: %s / RST modtaget: %s", 10, 0

hf_rst_recv_prompt:
    db "RST modtaget: ", 0

hf_rst_sent_prompt:
    db "RST sendt: ", 0

hf_search_found:
    db "Fundet: %s", 0

hf_search_not_found:
    db "Ingen QSO fundet med %s.", 10, 0

hf_search_prompt:
    db "Kaldesignal at soege efter: ", 0

hf_search_title:
    db 10, "=== Soeg HF-log ===", 10, 0

hf_show_format:
    db "%s", 0

hf_show_title:
    db 10, "=== HF QSO-log ===", 10, 0

hf_time_format:
    db "%d-%m-%Y %H:%M", 0

hf_time_test:
    db "UTC: %s", 10, 0

hf_title:
    db 10, "=== ASMLog HF ===", 10, 0

hf_write_mode:
    db "w", 0
	
section .bss

hf_band resb 16
hf_callsign resb 32
hf_name resb 64
hf_newlog_answer resb 8
hf_qth resb 64
hf_read_buffer resb 256
hf_rst_recv resb 8
hf_rst_sent resb 8
hf_search_call resb 32
hf_search_count resd 1
hf_time_text resb 32
hf_time_value resq 1

section .text

hf_log:
    push rbx
    sub rsp, 80

    ; Hent aktuel tid
    lea rcx, [hf_time_value]
    call time

    ; Konverter til UTC
    lea rcx, [hf_time_value]
    call gmtime

    ; RAX peger nu paa tm-strukturen
    mov r9, rax

    ; Lav teksten DD-MM-YYYY HH:MM
    lea rcx, [hf_time_text]
    mov edx, 32
    lea r8, [hf_time_format]
    call strftime

    ; Fjern Enter efter menuvalg
    call getchar

    ; Vis HF-overskrift
    lea rcx, [hf_title]
    call printf

    ; Vis UTC-tid
    lea rcx, [hf_time_test]
    lea rdx, [hf_time_text]
    call printf

    hf_read_call:
    ; Spoerg efter kaldesignal
    lea rcx, [hf_call_prompt]
    call printf

    ; Laes kaldesignal
    lea rcx, [hf_callsign]
    mov edx, 32
    call gets_s

    ; Lav det til store bogstaver
    lea rcx, [hf_callsign]
    mov edx, 32
    call _strupr_s

    ; Kontroller kaldesignal
    lea rcx, [hf_callsign]
    call is_hf_call

    test eax, eax
    jnz hf_call_ok

    lea rcx, [hf_call_error]
    call printf
    jmp hf_read_call

hf_call_ok:

    ; Vis det som test
    lea rcx, [hf_call_format]
    lea rdx, [hf_callsign]
    call printf
	
hf_ask_band:

    ; Spoerg efter baand
    lea rcx, [hf_band_prompt]
    call printf

    ; Laes baand
    lea rcx, [hf_band]
    mov edx, 16
    call gets_s

    ; Kontroller baandet
    lea rcx, [hf_band]
    call is_hf_band

    test eax, eax
    jnz hf_band_ok

    ; Ugyldigt baand
    lea rcx, [hf_band_error]
    call printf

    ; Proev igen
    jmp hf_ask_band

hf_band_ok:

    ; Vis baandet som test
    lea rcx, [hf_band_format]
    lea rdx, [hf_band]
    call printf

    hf_read_rst_sent:
    ; Spoerg efter RST sendt
    lea rcx, [hf_rst_sent_prompt]
    call printf

    lea rcx, [hf_rst_sent]
    mov edx, 8
    call gets_s

    ; Foerste tegn skal vaere et tal
    cmp byte [hf_rst_sent], '0'
    jb hf_bad_rst_sent
    cmp byte [hf_rst_sent], '9'
    ja hf_bad_rst_sent

    ; Andet tegn
    cmp byte [hf_rst_sent + 1], '0'
    jb hf_bad_rst_sent
    cmp byte [hf_rst_sent + 1], '9'
    ja hf_bad_rst_sent

    ; Tredje tegn
    cmp byte [hf_rst_sent + 2], '0'
    jb hf_bad_rst_sent
    cmp byte [hf_rst_sent + 2], '9'
    ja hf_bad_rst_sent

    ; Der maa ikke vaere et fjerde tegn
    cmp byte [hf_rst_sent + 3], 0
    jne hf_bad_rst_sent

    jmp hf_rst_sent_ok

hf_bad_rst_sent:
    lea rcx, [hf_rst_error]
    call printf
    jmp hf_read_rst_sent

hf_rst_sent_ok:

    hf_read_rst_recv:
    ; Spoerg efter RST modtaget
    lea rcx, [hf_rst_recv_prompt]
    call printf

    lea rcx, [hf_rst_recv]
    mov edx, 8
    call gets_s

    ; Foerste tegn
    cmp byte [hf_rst_recv], '0'
    jb hf_bad_rst_recv
    cmp byte [hf_rst_recv], '9'
    ja hf_bad_rst_recv

    ; Andet tegn
    cmp byte [hf_rst_recv + 1], '0'
    jb hf_bad_rst_recv
    cmp byte [hf_rst_recv + 1], '9'
    ja hf_bad_rst_recv

    ; Tredje tegn
    cmp byte [hf_rst_recv + 2], '0'
    jb hf_bad_rst_recv
    cmp byte [hf_rst_recv + 2], '9'
    ja hf_bad_rst_recv

    ; Der maa ikke vaere et fjerde tegn
    cmp byte [hf_rst_recv + 3], 0
    jne hf_bad_rst_recv

    jmp hf_rst_recv_ok

hf_bad_rst_recv:
    lea rcx, [hf_rst_error]
    call printf
    jmp hf_read_rst_recv

hf_rst_recv_ok:

    ; Valgfrit navn
    lea rcx, [hf_name_prompt]
    call printf

    lea rcx, [hf_name]
    mov edx, 64
    call gets_s
	
	    ; Hvis navn er tomt, behold det tomt
    cmp byte [hf_name], 0
    je hf_name_ok

    ; Hvis foerste tegn er a-z, lav det til A-Z
    cmp byte [hf_name], 'a'
    jb hf_name_ok
    cmp byte [hf_name], 'z'
    ja hf_name_ok

    sub byte [hf_name], 32

hf_name_ok:
    ; Valgfri QTH
    lea rcx, [hf_qth_prompt]
    call printf

    lea rcx, [hf_qth]
    mov edx, 64
    call gets_s

    ; Hvis QTH er tom, behold den tom
    cmp byte [hf_qth], 0
    je hf_qth_ok

    ; Hvis foerste tegn er a-z, lav det til A-Z
    cmp byte [hf_qth], 'a'
    jb hf_qth_ok
    cmp byte [hf_qth], 'z'
    ja hf_qth_ok

    sub byte [hf_qth], 32

hf_qth_ok:
    ; Aabn HF-loggen
    lea rcx, [hf_filename]
    lea rdx, [hf_append_mode]
    call fopen
    ; Kunne filen ikke aabnes?
    test rax, rax
    jz hf_done

    ; Gem filhaandtaget
    mov rbx, rax

    ; Skriv QSO
   mov rcx, rbx
	lea rdx, [hf_file_format]
	lea r8,  [hf_time_text]
	lea r9,  [hf_band]

	lea rax, [hf_callsign]
	mov [rsp + 32], rax

	lea rax, [hf_rst_sent]
	mov [rsp + 40], rax

	lea rax, [hf_rst_recv]
	mov [rsp + 48], rax

	lea rax, [hf_name]
mov [rsp + 56], rax

lea rax, [hf_qth]
mov [rsp + 64], rax

call fprintf

	

    ; Luk filen
    mov rcx, rbx
    call fclose

hf_done:

    ; Vis resultat som test
    lea rcx, [hf_rst_format]
    lea rdx, [hf_rst_sent]
    lea r8,  [hf_rst_recv]
    call printf

    add rsp, 80
    pop rbx
    ret
is_hf_band:
    
    
    ; RCX = adresse paa teksten
    ; Returnerer EAX = 1 hvis gyldigt, ellers 0

    push rbx
    sub rsp, 40

    mov rbx, rcx


    mov rcx, rbx
    lea rdx, [hf_band_160]
    call strcmp
    test eax, eax
    jz .valid

    mov rcx, rbx
    lea rdx, [hf_band_80]
    call strcmp
    test eax, eax
    jz .valid

    mov rcx, rbx
    lea rdx, [hf_band_60]
    call strcmp
    test eax, eax
    jz .valid

    mov rcx, rbx
    lea rdx, [hf_band_40]
    call strcmp
    test eax, eax
    jz .valid

    mov rcx, rbx
    lea rdx, [hf_band_30]
    call strcmp
    test eax, eax
    jz .valid

    mov rcx, rbx
    lea rdx, [hf_band_20]
    call strcmp
    test eax, eax
    jz .valid

    mov rcx, rbx
    lea rdx, [hf_band_17]
    call strcmp
    test eax, eax
    jz .valid

    mov rcx, rbx
    lea rdx, [hf_band_15]
    call strcmp
    test eax, eax
    jz .valid

    mov rcx, rbx
    lea rdx, [hf_band_12]
    call strcmp
    test eax, eax
    jz .valid

    mov rcx, rbx
    lea rdx, [hf_band_10]
    call strcmp
    test eax, eax
    jz .valid

    xor eax, eax
    jmp .done

.valid:
    mov eax, 1

.done:
    add rsp, 40
    pop rbx
    ret
	
is_hf_call:
    ; RCX = kaldesignal
    ; EAX = 1 hvis mindst et bogstav og et tal findes

    xor r8d, r8d        ; har bogstav?
    xor r9d, r9d        ; har tal?

.check_char:
    mov al, [rcx]

    test al, al
    jz .finished

    ; A-Z?
    cmp al, 'A'
    jb .check_digit
    cmp al, 'Z'
    ja .check_digit

    mov r8d, 1

.check_digit:
    cmp al, '0'
    jb .next_char
    cmp al, '9'
    ja .next_char

    mov r9d, 1

.next_char:
    inc rcx
    jmp .check_char

.finished:
    test r8d, r8d
    jz .invalid

    test r9d, r9d
    jz .invalid

    mov eax, 1
    ret

.invalid:
    xor eax, eax
    ret

show_hf_log:
    push rbx
    sub rsp, 32

    ; Vis overskrift
    lea rcx, [hf_show_title]
    call printf

    ; Aabn HF-loggen til laesning
    lea rcx, [hf_filename]
    lea rdx, [hf_read_mode]
    call fopen

    test rax, rax
    jz .done

    mov rbx, rax

.read_line:
    ; Laes en linje
    lea rcx, [hf_read_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .close_file

    ; Vis linjen
    lea rcx, [hf_show_format]
    lea rdx, [hf_read_buffer]
    call printf

    jmp .read_line

.close_file:
    mov rcx, rbx
    call fclose

.done:
    add rsp, 32
    pop rbx
    ret
	
search_hf_log:
    push rbx
    sub rsp, 32

    ; Fjern Enter efter menuvalg
    call getchar

    ; Nulstil antal fund
    mov dword [hf_search_count], 0

    ; Vis overskrift
    lea rcx, [hf_search_title]
    call printf

    ; Spoerg efter kaldesignal
    lea rcx, [hf_search_prompt]
    call printf

    lea rcx, [hf_search_call]
    mov edx, 32
    call gets_s

    ; Lav kaldesignalet til store bogstaver
    lea rcx, [hf_search_call]
    mov edx, 32
    call _strupr_s

    ; Aabn HF-loggen
    lea rcx, [hf_filename]
    lea rdx, [hf_read_mode]
    call fopen

    test rax, rax
    jz .not_found

    mov rbx, rax

.read_line:
    lea rcx, [hf_read_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .finished

    ; Find kaldesignalet i linjen
    lea rcx, [hf_read_buffer]
    lea rdx, [hf_search_call]
    call strstr

    test rax, rax
    jz .read_line

    ; Fundet
    inc dword [hf_search_count]

    ; Vis hele QSO-linjen
    lea rcx, [hf_search_found]
    lea rdx, [hf_read_buffer]
    call printf

    ; Fortsaet gennem resten af loggen
    jmp .read_line

.finished:
    mov rcx, rbx
    call fclose

    ; Blev mindst én QSO fundet?
    cmp dword [hf_search_count], 0
    je .not_found

    jmp .done

.not_found:
    lea rcx, [hf_search_not_found]
    lea rdx, [hf_search_call]
    call printf

.done:
    add rsp, 32
    pop rbx
    ret
	
new_hf_logfile:
    push rbx
    sub rsp, 32

    ; Fjern Enter efter menuvalg 4
    call getchar

    ; Advarsel
    lea rcx, [hf_newlog_warning]
    call printf

    lea rcx, [hf_newlog_prompt]
    call printf

    ; Laes J eller N
    lea rcx, [hf_newlog_answer]
    mov edx, 8
    call gets_s

    cmp byte [hf_newlog_answer], 'J'
    je .confirm

    cmp byte [hf_newlog_answer], 'j'
    je .confirm

    ; Alt andet = afbryd
    jmp .done

.confirm:
    ; "w" toer filen
    lea rcx, [hf_filename]
    lea rdx, [hf_write_mode]
    call fopen

    test rax, rax
    jz .done

    mov rbx, rax

    mov rcx, rbx
    call fclose

.done:
    add rsp, 32
    pop rbx
    ret