bits 64
default rel
global calculate_sac_score
global sac_cw_log_filename
global sac_cw_new_log
global sac_cw_new_qso
global sac_cw_search_log
global sac_cw_show_log

extern _strupr_s
extern cty_match_continent
extern cty_match_entity
extern fclose
extern fgets
extern fopen
extern fprintf
extern gets_s
extern gmtime
extern log_text
extern lookup_country
extern printf
extern sprintf
extern sscanf
extern strcmp
extern strcpy_s
extern strftime
extern strstr
extern time

section .data
sac_append_mode:
    db "a", 0

sac_band_10:
    db "10M", 0

sac_band_15:
    db "15M", 0

sac_band_20:
    db "20M", 0

sac_band_40:
    db "40M", 0

sac_band_80:
    db "80M", 0

sac_band_error:
    db "Ugyldigt baand. Brug 80m, 40m, 20m, 15m eller 10m.", 10, 0

sac_band_prompt:
    db "Baand: ", 0

sac_call_error:
    db "Ugyldigt kaldesignal - call skal indeholde bogstav og tal.", 10, 0

sac_call_prompt:
    db "Skriv kaldesignal: ", 0

sac_continent_eu:
    db "EU", 0

sac_country_mult_format:
    db "%s COUNTRY %s", 10, 0

sac_country_test:
    db "CTY fundet: %s / %s", 10, 0

sac_cw_log_filename:
    db "log/sac_cw_log.txt", 0

sac_dupe_warning:
    db "DUPE - kaldesignalet er allerede logget paa dette baand.", 10, 0

sac_field_pattern_format:
    db "%s |", 0

sac_log_dupe_format:
    db "%s | %s | %s | %s | %03d | %s | %d | DUPE", 10, 0

sac_log_format:
    db "%s | %s | %s | %s | %03d | %s | %d", 10, 0

sac_mult_filename:
    db "data/sac_cw_used_mult.txt", 0

sac_newlog_done_text:
    db "Ny SAC-log startet.", 10, 0

sac_newlog_prompt:
    db "Start ny log? (J/N): ", 0

sac_newlog_warning:
    db 10, "ADVARSEL: Hele den nuvaerende SAC-log bliver slettet.", 10, 0

sac_points_text:
    db "QSO-point: %d", 10, 0

sac_read_mode:
    db "r", 0

sac_rst_error:
    db "RST skal vaere praecis tre cifre, fx 599.", 10, 0

sac_rst_prompt:
    db "RST: ", 0

sac_scandinavian_no:
    db "SAC: Ikke-skandinavisk station", 10, 0

sac_scandinavian_yes:
    db "SAC: Skandinavisk station", 10, 0

sac_score_parse_format:
    db "%*s %*s | %*s | %*s | %*s | %*d | %*s | %d", 0

sac_search_count_format:
    db 10, "Antal fund: %d", 10, 0

sac_search_header:
    db 10, "Fundne QSO'er:", 10, 0

sac_search_no_results:
    db 10, "Ingen QSO'er fundet.", 10, 0

sac_search_prompt:
    db 10, "Kaldesignal at soege efter: ", 0

sac_serial_error:
    db "Ugyldigt serienummer. Brug kun cifre og mindst 1.", 10, 0

sac_serial_filename:
    db "data/sac_cw_serial.txt", 0

sac_serial_prompt:
    db "Serienummer: ", 0

sac_time_format:
    db "%d-%m-%Y %H:%M", 0

sac_write_mode:
    db "w", 0
	
section .bss

sac_band:
    resb 8

sac_call:
    resb 32

sac_call_pattern:
    resb 48

sac_country_pattern:
    resb 128

sac_dupe_buffer:
    resb 256

sac_dupe_flag:
    resd 1

sac_is_scandinavian_flag:
    resd 1

sac_log_qso_count:
    resd 1

sac_mult_buffer:
    resb 256

sac_newlog_choice:
    resb 8

sac_qso_points:
    resd 1

sac_rst:
    resb 8

sac_score_buffer:
    resb 256

sac_score_mults:
    resd 1

sac_score_points:
    resd 1

sac_search_call:
    resb 32

sac_search_count:
    resd 1

sac_sent_serial:
    resd 1

sac_serial:
    resb 8

sac_time_buffer:
    resb 64

sac_time_value:
    resq 1
	
section .text

sac_cw_new_qso:

    sub rsp, 40
	mov dword [sac_dupe_flag], 0
	mov dword [sac_is_scandinavian_flag], 0
	
	; Find vores sendte serienummer ud fra antal QSO'er i loggen
    call get_next_sac_serial
	
	; Hent aktuel UTC dato og tid
    xor ecx, ecx
    call time

    mov [sac_time_value], rax

    lea rcx, [sac_time_value]
    call gmtime

    mov r9, rax
    lea rcx, [sac_time_buffer]
    mov edx, 64
    lea r8, [sac_time_format]
    call strftime
	
sac_read_call:

    ; Laes kaldesignal
    lea rcx, [sac_call_prompt]
    call printf

    lea rcx, [sac_call]
    mov edx, 32
    call gets_s

    ; Lav kaldesignalet til store bogstaver
    lea rcx, [sac_call]
    mov edx, 32
    call _strupr_s

    ; Kaldesignalet skal indeholde mindst ét bogstav og ét tal
    lea rsi, [sac_call]
    xor r8d, r8d            ; har bogstav
    xor r9d, r9d            ; har tal

sac_validate_call:

    mov al, [rsi]
    test al, al
    jz sac_validate_done

    cmp al, 'A'
    jb sac_check_digit

    cmp al, 'Z'
    ja sac_check_digit

    mov r8b, 1

sac_check_digit:

    cmp al, '0'
    jb sac_validate_next

    cmp al, '9'
    ja sac_validate_next

    mov r9b, 1

sac_validate_next:

    inc rsi
    jmp sac_validate_call

sac_validate_done:

    test r8b, r8b
    jz sac_invalid_call

    test r9b, r9b
    jz sac_invalid_call

    ; Kopier SAC-call til CTY-buffer
    lea rcx, [log_text]
    mov edx, 256
    lea r8, [sac_call]
    call strcpy_s

    ; Find land og kontinent i cty.dat
    call lookup_country

    ; Vis fundet land og kontinent
    lea rcx, [sac_country_test]
    lea rdx, [cty_match_entity]
    lea r8, [cty_match_continent]
    call printf

        ; Test om stationen er skandinavisk
    call sac_is_scandinavian
    test eax, eax
    jz sac_test_non_scandinavian

    mov dword [sac_is_scandinavian_flag], 1

    lea rcx, [sac_scandinavian_yes]
    call printf
    jmp sac_test_done

sac_test_non_scandinavian:

    lea rcx, [sac_scandinavian_no]
    call printf

sac_test_done:

sac_read_band:

    lea rcx, [sac_band_prompt]
    call printf

    lea rcx, [sac_band]
    mov edx, 8
    call gets_s

    ; Lav input til store bogstaver
    lea rcx, [sac_band]
    mov edx, 8
    call _strupr_s

    ; 80M
    lea rcx, [sac_band]
    lea rdx, [sac_band_80]
    call strcmp
    test eax, eax
    jz sac_band_ok

    ; 40M
    lea rcx, [sac_band]
    lea rdx, [sac_band_40]
    call strcmp
    test eax, eax
    jz sac_band_ok

    ; 20M
    lea rcx, [sac_band]
    lea rdx, [sac_band_20]
    call strcmp
    test eax, eax
    jz sac_band_ok

    ; 15M
    lea rcx, [sac_band]
    lea rdx, [sac_band_15]
    call strcmp
    test eax, eax
    jz sac_band_ok

    ; 10M
    lea rcx, [sac_band]
    lea rdx, [sac_band_10]
    call strcmp
    test eax, eax
    jz sac_band_ok

    lea rcx, [sac_band_error]
    call printf
    jmp sac_read_band

sac_band_ok:

    ; Kontroller DUPE nu hvor CALL og BAND er kendt
    call check_sac_dupe
    test eax, eax
    jz sac_not_dupe

    lea rcx, [sac_dupe_warning]
    call printf

    mov dword [sac_dupe_flag], 1

sac_not_dupe:

	jmp sac_read_rst
	
sac_read_rst:

    lea rcx, [sac_rst_prompt]
    call printf

    lea rcx, [sac_rst]
    mov edx, 8
    call gets_s

    ; RST skal vaere praecis tre cifre
    cmp byte [sac_rst], '0'
    jb sac_invalid_rst
    cmp byte [sac_rst], '9'
    ja sac_invalid_rst

    cmp byte [sac_rst + 1], '0'
    jb sac_invalid_rst
    cmp byte [sac_rst + 1], '9'
    ja sac_invalid_rst

    cmp byte [sac_rst + 2], '0'
    jb sac_invalid_rst
    cmp byte [sac_rst + 2], '9'
    ja sac_invalid_rst

    ; Der maa ikke vaere et fjerde tegn
    cmp byte [sac_rst + 3], 0
    jne sac_invalid_rst

    ; Gyldigt RST
    jmp sac_read_serial

sac_read_serial:

    lea rcx, [sac_serial_prompt]
    call printf

    lea rcx, [sac_serial]
    mov edx, 8
    call gets_s

    ; Serienummer maa ikke vaere tomt
    cmp byte [sac_serial], 0
    je sac_invalid_serial

    ; Kontroller at alle tegn er cifre
    lea rsi, [sac_serial]

sac_validate_serial:

    mov al, [rsi]
    test al, al
    jz sac_serial_ok

    cmp al, '0'
    jb sac_invalid_serial
    cmp al, '9'
    ja sac_invalid_serial

    inc rsi
    jmp sac_validate_serial

sac_serial_ok:

    ; 000 er ikke et gyldigt serienummer
    lea rsi, [sac_serial]

sac_serial_nonzero_check:

    mov al, [rsi]
    test al, al
    jz sac_invalid_serial

    cmp al, '0'
    jne sac_serial_done

    inc rsi
    jmp sac_serial_nonzero_check

sac_serial_done:

    jmp sac_calculate_points

sac_calculate_points:

    ; DUPE giver altid 0 point
    cmp dword [sac_dupe_flag], 1
    je sac_points_zero

    ; Skandinavisk station giver 0 point
    cmp dword [sac_is_scandinavian_flag], 1
    je sac_points_zero

    ; Ikke-skandinavisk station i Europa giver 2 point
    lea rcx, [cty_match_continent]
    lea rdx, [sac_continent_eu]
    call strcmp

    test eax, eax
    jz sac_points_europe

    ; Ikke-skandinavisk station uden for Europa giver 3 point
    mov dword [sac_qso_points], 3
    jmp sac_points_done

sac_points_europe:

    mov dword [sac_qso_points], 2
    jmp sac_points_done

sac_points_zero:

    mov dword [sac_qso_points], 0

sac_points_done:

    lea rcx, [sac_points_text]
    mov edx, [sac_qso_points]
    call printf

    ; DUPE giver ingen multiplier
    cmp dword [sac_dupe_flag], 1
    je sac_qso_done

    ; Skandinavisk station giver ingen multiplier
    cmp dword [sac_is_scandinavian_flag], 1
    je sac_qso_done

    call check_sac_country_multiplier

    ; EAX = 1 betyder allerede brugt
    test eax, eax
    jnz sac_qso_done

    ; Nyt land paa dette baand
    call save_sac_country_multiplier

sac_qso_done:

    call save_sac_qso

    add rsp, 40
    ret

sac_invalid_serial:

    lea rcx, [sac_serial_error]
    call printf
    jmp sac_read_serial

sac_invalid_rst:

    lea rcx, [sac_rst_error]
    call printf
    jmp sac_read_rst

  
sac_invalid_call:

    lea rcx, [sac_call_error]
    call printf

    jmp sac_read_call
	
sac_is_scandinavian:

    lea rsi, [sac_call]

    ; JW / JX
    cmp byte [rsi], 'J'
    jne .check_5
    cmp byte [rsi+1], 'W'
    je .yes
    cmp byte [rsi+1], 'X'
    je .yes

.check_5:
    ; 5P / 5Q
    cmp byte [rsi], '5'
    jne .check_7
    cmp byte [rsi+1], 'P'
    je .yes
    cmp byte [rsi+1], 'Q'
    je .yes

.check_7:
    ; 7S
    cmp byte [rsi], '7'
    jne .check_8
    cmp byte [rsi+1], 'S'
    je .yes

.check_8:
    ; 8S
    cmp byte [rsi], '8'
    jne .check_l
    cmp byte [rsi+1], 'S'
    je .yes

.check_l:
    ; LA-LN
    cmp byte [rsi], 'L'
    jne .check_o
    cmp byte [rsi+1], 'A'
    jb .check_o
    cmp byte [rsi+1], 'N'
    jbe .yes

.check_o:
    cmp byte [rsi], 'O'
    jne .check_s

    ; OJ0 = Market Reef
    cmp byte [rsi+1], 'J'
    jne .check_of_oi
    cmp byte [rsi+2], '0'
    je .yes
    jmp .no

.check_of_oi:

    ; OF-OI
    cmp byte [rsi+1], 'F'
    jb .check_ou
    cmp byte [rsi+1], 'I'
    jbe .yes

.check_ou:

.check_ou:
    ; OU / OV / OW / OX / OY / OZ
    cmp byte [rsi+1], 'U'
    jb .no
    cmp byte [rsi+1], 'Z'
    jbe .yes
    jmp .no

.check_s:
    ; SA-SM
    cmp byte [rsi], 'S'
    jne .check_t
    cmp byte [rsi+1], 'A'
    jb .no
    cmp byte [rsi+1], 'M'
    jbe .yes
    jmp .no

.check_t:
    ; TF
    cmp byte [rsi], 'T'
    jne .check_x
    cmp byte [rsi+1], 'F'
    je .yes
    jmp .no

.check_x:
    ; XP
    cmp byte [rsi], 'X'
    jne .no
    cmp byte [rsi+1], 'P'
    je .yes

.no:
    xor eax, eax
    ret

.yes:
    mov eax, 1
    ret
	
; ------------------------------------------------------------
; Kontroller om CALL allerede findes paa samme baand
; EAX = 1 hvis DUPE, ellers 0
; ------------------------------------------------------------

check_sac_dupe:

    sub rsp, 40

    ; Byg fx "DL1ABC |"
    lea rcx, [sac_call_pattern]
    lea rdx, [sac_field_pattern_format]
    lea r8, [sac_call]
    call sprintf

    ; Aabn SAC-loggen
    lea rcx, [sac_cw_log_filename]
    lea rdx, [sac_read_mode]
    call fopen

    test rax, rax
    jz sac_dupe_no

    mov rbx, rax

sac_dupe_next_line:

    lea rcx, [sac_dupe_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz sac_dupe_eof

    ; Find CALL i linjen
    lea rcx, [sac_dupe_buffer]
    lea rdx, [sac_call_pattern]
    call strstr

    test rax, rax
    jz sac_dupe_next_line

    ; Find BAND i samme linje
    lea rcx, [sac_dupe_buffer]
    lea rdx, [sac_band]
    call strstr

    test rax, rax
    jz sac_dupe_next_line

    ; Samme CALL + BAND
    mov rcx, rbx
    call fclose

    mov eax, 1
    add rsp, 40
    ret

sac_dupe_eof:

    mov rcx, rbx
    call fclose

sac_dupe_no:

    xor eax, eax
    add rsp, 40
    ret
	
; ------------------------------------------------------------
; Kontroller country multiplier
; EAX = 1 hvis allerede brugt
; EAX = 0 hvis ny
; ------------------------------------------------------------

check_sac_country_multiplier:

    sub rsp, 40

    ; Byg fx "20M COUNTRY Fed. Rep. of Germany"
    lea rcx, [sac_country_pattern]
    lea rdx, [sac_country_mult_format]
    lea r8, [sac_band]
    lea r9, [cty_match_entity]
    call sprintf

    lea rcx, [sac_mult_filename]
    lea rdx, [sac_read_mode]
    call fopen

    test rax, rax
    jz sac_country_mult_new

    mov rbx, rax

sac_country_mult_next_line:

    lea rcx, [sac_mult_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz sac_country_mult_eof

    lea rcx, [sac_mult_buffer]
    lea rdx, [sac_country_pattern]
    call strstr

    test rax, rax
    jz sac_country_mult_next_line

    ; Multiplier findes allerede
    mov rcx, rbx
    call fclose

    mov eax, 1
    add rsp, 40
    ret

sac_country_mult_eof:

    mov rcx, rbx
    call fclose

sac_country_mult_new:

    xor eax, eax
    add rsp, 40
    ret


; ------------------------------------------------------------
; Gem ny country multiplier
; ------------------------------------------------------------

save_sac_country_multiplier:

    sub rsp, 40

    lea rcx, [sac_mult_filename]
    lea rdx, [sac_append_mode]
    call fopen

    test rax, rax
    jz sac_save_country_done

    mov rbx, rax

    mov rcx, rbx
    lea rdx, [sac_country_mult_format]
    lea r8, [sac_band]
    lea r9, [cty_match_entity]
    call fprintf

    mov rcx, rbx
    call fclose

sac_save_country_done:

    add rsp, 40
    ret

; ------------------------------------------------------------
; Find naeste sendte SAC-serienummer
; Antal QSO-linjer i loggen + 1
; ------------------------------------------------------------

get_next_sac_serial:

    sub rsp, 40

    mov dword [sac_log_qso_count], 0

    ; Aabn SAC-loggen
    lea rcx, [sac_cw_log_filename]
    lea rdx, [sac_read_mode]
    call fopen

    ; Ingen log endnu = foerste nummer er 001
    test rax, rax
    jz sac_serial_first

    mov rbx, rax

sac_serial_count_next:

    lea rcx, [sac_dupe_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz sac_serial_count_done

    inc dword [sac_log_qso_count]
    jmp sac_serial_count_next

sac_serial_count_done:

    mov rcx, rbx
    call fclose

    mov eax, [sac_log_qso_count]
    inc eax
    mov [sac_sent_serial], eax

    add rsp, 40
    ret

sac_serial_first:

    mov dword [sac_sent_serial], 1

    add rsp, 40
    ret	
; ------------------------------------------------------------
; Gem SAC QSO i logfil
; ------------------------------------------------------------

save_sac_qso:

    sub rsp, 88

    lea rcx, [sac_cw_log_filename]
    lea rdx, [sac_append_mode]
    call fopen

    test rax, rax
    jz sac_save_qso_done

    mov rbx, rax

    ; Vaelg normalt format eller DUPE-format
    cmp dword [sac_dupe_flag], 1
    je sac_save_qso_dupe

    mov rcx, rbx
    lea rdx, [sac_log_format]
    lea r8, [sac_time_buffer]
    lea r9, [sac_call]

    lea rax, [sac_band]
    mov [rsp + 32], rax

    lea rax, [sac_rst]
    mov [rsp + 40], rax

    mov eax, [sac_sent_serial]
    mov [rsp + 48], rax

    lea rax, [sac_serial]
    mov [rsp + 56], rax

    mov eax, [sac_qso_points]
    mov [rsp + 64], rax

    call fprintf
    jmp sac_save_qso_close

sac_save_qso_dupe:

    mov rcx, rbx
    lea rdx, [sac_log_dupe_format]
    lea r8, [sac_time_buffer]
    lea r9, [sac_call]

    lea rax, [sac_band]
    mov [rsp + 32], rax

    lea rax, [sac_rst]
    mov [rsp + 40], rax

    mov eax, [sac_sent_serial]
    mov [rsp + 48], rax

    lea rax, [sac_serial]
    mov [rsp + 56], rax

    mov eax, [sac_qso_points]
    mov [rsp + 64], rax
    call fprintf

sac_save_qso_close:

    mov rcx, rbx
    call fclose

sac_save_qso_done:

    add rsp, 88
    ret
	
; ------------------------------------------------------------
; Vis SAC QSO-log
; ------------------------------------------------------------

sac_cw_show_log:

    sub rsp, 40

    lea rcx, [sac_cw_log_filename]
    lea rdx, [sac_read_mode]
    call fopen

    test rax, rax
    jz sac_show_log_done

    mov rbx, rax

sac_show_log_next:

    lea rcx, [sac_dupe_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz sac_show_log_close

    lea rcx, [sac_dupe_buffer]
    call printf

    jmp sac_show_log_next

sac_show_log_close:

    mov rcx, rbx
    call fclose

sac_show_log_done:

    add rsp, 40
    ret
	
; ------------------------------------------------------------
; Soeg efter kaldesignal i SAC-log
; ------------------------------------------------------------

sac_cw_search_log:

    sub rsp, 40

    mov dword [sac_search_count], 0

    lea rcx, [sac_search_prompt]
    call printf

    lea rcx, [sac_search_call]
    mov edx, 32
    call gets_s

    ; Store bogstaver
    lea rcx, [sac_search_call]
    mov edx, 32
    call _strupr_s

    ; Aabn logfil
    lea rcx, [sac_cw_log_filename]
    lea rdx, [sac_read_mode]
    call fopen

    test rax, rax
    jz sac_search_no_match

    mov rbx, rax

sac_search_next_line:

    lea rcx, [sac_dupe_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz sac_search_eof

       ; Byg fx "OZ1THC |"
    lea rcx, [sac_call_pattern]
    lea rdx, [sac_field_pattern_format]
    lea r8, [sac_search_call]
    call sprintf

    ; Find kaldesignalet som et felt i loglinjen
    lea rcx, [sac_dupe_buffer]
    lea rdx, [sac_call_pattern]
    call strstr

    test rax, rax
    jz sac_search_next_line
    ; Foerste fund
    cmp dword [sac_search_count], 0
    jne sac_search_print_line

    lea rcx, [sac_search_header]
    call printf

sac_search_print_line:

    lea rcx, [sac_dupe_buffer]
    call printf

    inc dword [sac_search_count]
    jmp sac_search_next_line

sac_search_eof:

    mov rcx, rbx
    call fclose

    cmp dword [sac_search_count], 0
    je sac_search_no_match

    lea rcx, [sac_search_count_format]
    mov edx, [sac_search_count]
    call printf

    jmp sac_search_done

sac_search_no_match:

    lea rcx, [sac_search_no_results]
    call printf

sac_search_done:

    add rsp, 40
    ret
	
; ------------------------------------------------------------
; Start ny SAC-log
; ------------------------------------------------------------

sac_cw_new_log:

    sub rsp, 40

    lea rcx, [sac_newlog_warning]
    call printf

    lea rcx, [sac_newlog_prompt]
    call printf

    lea rcx, [sac_newlog_choice]
    mov edx, 8
    call gets_s

    ; Store bogstaver
    lea rcx, [sac_newlog_choice]
    mov edx, 8
    call _strupr_s

    ; Kun J starter ny log
    cmp byte [sac_newlog_choice], 'J'
    jne sac_newlog_done

    ; Nulstil QSO-log
    lea rcx, [sac_cw_log_filename]
    lea rdx, [sac_write_mode]
    call fopen

    test rax, rax
    jz sac_newlog_clear_mult

    mov rbx, rax
    mov rcx, rbx
    call fclose

sac_newlog_clear_mult:

    ; Nulstil multiplier-fil
    lea rcx, [sac_mult_filename]
    lea rdx, [sac_write_mode]
    call fopen

    test rax, rax
    jz sac_newlog_print_done

    mov rbx, rax
    mov rcx, rbx
    call fclose

sac_newlog_print_done:

    lea rcx, [sac_newlog_done_text]
    call printf

sac_newlog_done:

    add rsp, 40
    ret
	
; ------------------------------------------------------------
; Beregn SAC-score
; Returnerer score i EAX
; ------------------------------------------------------------

calculate_sac_score:

    sub rsp, 40

    mov dword [sac_score_points], 0
	mov dword [sac_score_mults], 0

    ; Aabn SAC QSO-log
    lea rcx, [sac_cw_log_filename]
    lea rdx, [sac_read_mode]
    call fopen

    test rax, rax
    jz sac_score_no_log

    mov rbx, rax

sac_score_read_qso:

    lea rcx, [sac_score_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz sac_score_qso_done

    ; Hent QSO-point fra sidste felt
    lea rcx, [sac_score_buffer]
    lea rdx, [sac_score_parse_format]
    lea r8, [sac_qso_points]
    call sscanf

    cmp eax, 1
    jne sac_score_read_qso

    mov eax, [sac_qso_points]
    add [sac_score_points], eax

    jmp sac_score_read_qso

sac_score_qso_done:

    mov rcx, rbx
    call fclose


    ; Aabn SAC multiplier-fil
    lea rcx, [sac_mult_filename]
    lea rdx, [sac_read_mode]
    call fopen

    test rax, rax
    jz sac_score_no_mults

    mov rbx, rax

sac_score_read_mult:

    lea rcx, [sac_score_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz sac_score_mult_done

    inc dword [sac_score_mults]
    jmp sac_score_read_mult

sac_score_mult_done:

    mov rcx, rbx
    call fclose

sac_score_no_mults:

sac_score_no_log:

        ; SAC-score = QSO-point * multipliers
    mov eax, [sac_score_points]
    imul eax, [sac_score_mults]

    add rsp, 40
    ret