bits 64
default rel
global calculate_sac_score
global sac_cw_log_filename
global sac_cw_new_log
global sac_cw_new_qso
global sac_cw_search_log
global sac_cw_show_log
global sac_init_operator
global sac_operator_scandinavian

extern _strupr_s
extern callsign_buffer

extern create_facit_cabrillo_sac
extern cty_match_continent
extern cty_match_entity
extern cw_send_text
extern cw_text_call_format
extern fclose
extern fgets
extern fopen
extern fprintf
extern fputs
extern gets_s
extern gmtime
extern log_text
extern lookup_country
extern printf
extern sac_exchange
extern sac_generated_continent
extern sac_generated_serial
extern settings_callsign
extern sprintf
extern sprog_print
extern sscanf
extern strcmp
extern strcpy_s
extern strftime
extern strstr
extern time
extern qso_mode

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
    db "Invalid band. Use 80m, 40m, 20m, 15m or 10m.", 10, 0

sac_band_prompt:
    db "Band: ", 0

sac_call_error:
    db "Invalid callsign - callsign must contain a letter and a digit.", 10, 0

sac_call_prompt:
    db "Enter callsign: ", 0

sac_continent_eu:
    db "EU", 0

sac_country_mult_format:
    db "%s COUNTRY %s", 10, 0

sac_country_test:
    db "CTY found: %s / %s", 10, 0

sac_cw_log_filename:
    db "log/sac_cw_log.txt", 0

sac_dupe_warning:
    db "DUPE - callsign already logged on this band.", 10, 0

sac_dx_mult_format:
    db "%s AREA %s", 10, 0

sac_exchange_text_format:
    db "Sent: %s", 10, 0

sac_facit_dupe_format:
    db "%s | %s | %s | 599 | %03u | %03u | %u | DUPE", 10, 0

sac_facit_filename:
    db "facit/facit_sac_cw_log.txt", 0

sac_facit_format:
    db "%s | %s | %s | 599 | %03u | %03u | %u", 10, 0

sac_facit_mult_filename:
    db "facit/sac_cw_facit_mult.txt", 0

sac_facit_mult_format:
    db "%s | %s | %s | 599 | %03u | %03u | %u | MULT", 10, 0

sac_facit_pattern_format:
    db "| %s | %s |", 0

sac_field_pattern_format:
    db "%s |", 0

sac_log_dupe_format:
    db "%s | %s | %s | %s | %03d | %s | %d | DUPE", 10, 0

sac_log_format:
    db "%s | %s | %s | %s | %03d | %s | %d", 10, 0

sac_mult_filename:
    db "data/sac_cw_used_mult.txt", 0

sac_log_mult_format:
    db "%s | %s | %s | %s | %03d | %s | %d | MULT", 10, 0

sac_newlog_done_text:
    db "New SAC log started.", 10, 0

sac_newlog_prompt:
    db "Start new log? (Y/N): ", 0

sac_newlog_warning:
    db 10, "WARNING: The entire current SAC log will be deleted.", 10, 0

sac_operator_country_error:
    db "Error: Callsign from Settings not found in CTY.", 10, 0

sac_points_text:
    db "QSO Points: %d", 10, 0

sac_read_mode:
    db "r", 0

sac_rst_error:
    db "RST must be exactly three digits, e.g. 599.", 10, 0

sac_rst_prompt:
    db "RST: ", 0

sac_scandinavian_no:
    db "SAC: Non-Scandinavian station", 10, 0

sac_scandinavian_yes:
    db "SAC: Scandinavian station", 10, 0

sac_score_parse_format:
    db "%*s %*s | %*s | %*s | %*s | %*d | %*s | %d", 0

sac_search_count_format:
    db 10, "Number found: %d", 10, 0

sac_search_header:
    db 10, "Found QSOs:", 10, 0

sac_search_no_results:
    db 10, "No QSOs found.", 10, 0

sac_search_prompt:
    db 10, "Callsign to search for: ", 0

sac_serial_error:
    db "Invalid serial number. Use digits only and a minimum value of 1.", 10, 0

sac_serial_filename:
    db "data/sac_cw_serial.txt", 0

sac_serial_prompt:
    db "Serial number: ", 0

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

sac_dx_area:
    resb 16

sac_dx_pattern:
    resb 64
	
sac_facit_dupe_buffer:
    resb 256

sac_facit_dupe_flag:
    resd 1

sac_facit_dupe_pattern:
    resb 64

sac_facit_mult_flag: resd 1

sac_facit_points:
    resd 1

sac_is_scandinavian_flag:
    resd 1

sac_log_mult_flag: resd 1

sac_log_qso_count:
    resd 1

sac_mult_buffer:
    resb 256

sac_newlog_choice:
    resb 8
sac_operator_non_eu resd 1	
sac_operator_scandinavian resd 1

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

sac_init_operator:
    lea rsi, [settings_callsign]
    call sac_check_scandinavian_prefix
    mov [sac_operator_scandinavian], eax
    ret
	
sac_cw_new_qso:

    sub rsp, 72
	mov dword [sac_log_mult_flag], 0
	 mov dword [sac_facit_mult_flag], 0
	mov dword [sac_dupe_flag], 0
	mov dword [sac_is_scandinavian_flag], 0
	
    ; Find operatoertype fra Settings
    lea rsi, [settings_callsign]
    call sac_check_scandinavian_prefix

    mov [sac_operator_scandinavian], eax
	; Standard: operatoer uden for Europa = nej
    mov dword [sac_operator_non_eu], 0

    ; Find vores eget kontinent
    lea rcx, [settings_callsign]
    call lookup_country
   
   ; Intet kontinent fundet?
    cmp byte [cty_match_continent], 0
    je sac_operator_country_unknown
    
	; Sammenlign med Europa
    lea rcx, [cty_match_continent]
    lea rdx, [sac_continent_eu]
    call strcmp

    test eax, eax
    jz .operator_continent_done

    ; Ikke-europaeisk operatoer
    mov dword [sac_operator_non_eu], 1

.operator_continent_done:
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


    ; MODE 2 = CW
    cmp byte [qso_mode], 2
    je .sac_send_call_cw

    ; MODE 3 = CW + TEXT
    cmp byte [qso_mode], 3
    je .sac_send_call_cw_text

    ; MODE 4 = TEXT
    cmp byte [qso_mode], 4
    je .sac_show_call_text

    ; MODE 1 = RADIO
    jmp .sac_call_done

.sac_send_call_cw_text:
    lea rcx, [cw_text_call_format]
    lea rdx, [callsign_buffer]
    call printf

.sac_send_call_cw:
    lea rcx, [callsign_buffer]
    call cw_send_text
    jmp .sac_call_done

.sac_show_call_text:
    lea rcx, [cw_text_call_format]
    lea rdx, [callsign_buffer]
    call printf

.sac_call_done:

    ; Laes kaldesignal
    lea rcx, [sac_call_prompt]
    call printf

    lea rcx, [sac_call]
    mov edx, 32
    call gets_s

    ; Empty CALL i RADIO, CW + TEXT og TEXT
    cmp byte [qso_mode], 1
    je sac_check_empty
	
	cmp byte [qso_mode], 2
    je sac_check_empty

    cmp byte [qso_mode], 3
    je sac_check_empty

    cmp byte [qso_mode], 4
    jne sac_continue_call

sac_check_empty:
    cmp byte [sac_call], 0
    je sac_empty_call

sac_continue_call:

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
	lea rcx, [log_text]
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

    ; RADIO = ingen simulator
    cmp byte [qso_mode], 1
    je .sac_exchange_done

    ; CW = kun morselyd
    cmp byte [qso_mode], 2
    je .sac_exchange_cw

    ; CW + TEXT
    cmp byte [qso_mode], 3
    je .sac_exchange_text_cw

    ; TEXT
    cmp byte [qso_mode], 4
    je .sac_exchange_text

    jmp .sac_exchange_done

.sac_exchange_text_cw:
    lea rcx, [sac_exchange_text_format]
    lea rdx, [sac_exchange]
    call printf

.sac_exchange_cw:
    lea rcx, [sac_exchange]
    call cw_send_text
    jmp .sac_exchange_done

.sac_exchange_text:
    lea rcx, [sac_exchange_text_format]
    lea rdx, [sac_exchange]
    call printf

.sac_exchange_done:

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

    ; Vaelg operatoertype
    cmp dword [sac_operator_scandinavian], 1
    jne sac_dx_calculate_points

sac_scandinavian_calculate_points:

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

sac_dx_calculate_points:

    ; Kun skandinaviske modstationer giver point
    cmp dword [sac_is_scandinavian_flag], 1
    jne sac_points_zero

    ; Standard: 1 point
    mov dword [sac_qso_points], 1

    ; Europaeisk DX-operatoer: altid 1 point
    cmp dword [sac_operator_non_eu], 1
    jne sac_points_done

    ; Ikke-europaeisk DX-operatoer:
    ; 3 point paa 80m og 40m
    lea rcx, [sac_band]
    lea rdx, [sac_band_80]
    call strcmp
    test eax, eax
    jz sac_dx_three_points

    lea rcx, [sac_band]
    lea rdx, [sac_band_40]
    call strcmp
    test eax, eax
    jz sac_dx_three_points

    jmp sac_points_done

sac_dx_three_points:

    mov dword [sac_qso_points], 3
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

    ; DX-operatoer bruger separat multiplierberegning
    cmp dword [sac_operator_scandinavian], 1
    jne sac_dx_multiplier

    ; Skandinavisk station giver ingen multiplier
    cmp dword [sac_is_scandinavian_flag], 1
    je sac_qso_done

    call check_sac_country_multiplier

    ; EAX = 1 betyder allerede brugt
    test eax, eax
    jnz sac_qso_done

    ; Nyt land paa dette baand
    call save_sac_country_multiplier
    jmp sac_qso_done
	
; ------------------------------------------------------------
; SAC CW - DX multiplier
; ------------------------------------------------------------

sac_dx_multiplier:

    ; Kun skandinaviske stationer giver DX multipliers
    cmp dword [sac_is_scandinavian_flag], 1
    jne sac_qso_done

    ; Udtraek call area fra modstationen
    lea rsi, [sac_call]
    call sac_extract_dx_area

    ; Opbyg multipliernoegle: BAND AREA CALLAREA
    lea rcx, [sac_dx_pattern]
    lea rdx, [sac_dx_mult_format]
    lea r8, [sac_band]
    lea r9, [sac_dx_area]
    call sprintf


    ; Kontroller om DX multiplier allerede findes
    call check_sac_dx_multiplier

    ; EAX = 1 betyder allerede brugt
    test eax, eax
    jnz sac_qso_done

    ; Gem ny DX multiplier
    call save_sac_dx_multiplier
    mov dword [sac_log_mult_flag], 1
    jmp sac_qso_done

; ------------------------------------------------------------
; SAC CW - Udtraek DX call area
; Input:  RSI = kaldesignal
; Output: sac_dx_area
; ------------------------------------------------------------

; ------------------------------------------------------------
; SAC CW - Udtraek DX call area
; Input:  RSI = kaldesignal
; Output: sac_dx_area (maks. 15 tegn + NULL)
; ------------------------------------------------------------

sac_extract_dx_area:

    push rsi
    push rdi

    lea rdi, [sac_dx_area]
    mov ecx, 15

    ; 5P skal normaliseres til OZ
    cmp byte [rsi], '5'
    jne .check_7s
    cmp byte [rsi+1], 'P'
    jne .check_7s

    mov byte [rdi], 'O'
    mov byte [rdi+1], 'Z'
    add rdi, 2
    add rsi, 2
    sub ecx, 2
    jmp .next_char

.check_7s:
    ; 7S skal normaliseres til SM
    cmp byte [rsi], '7'
    jne .next_char
    cmp byte [rsi+1], 'S'
    jne .next_char

    mov byte [rdi], 'S'
    mov byte [rdi+1], 'M'
    add rdi, 2
    add rsi, 2
    sub ecx, 2

.next_char:
    test ecx, ecx
    jz .done

    mov al, [rsi]
    test al, al
    jz .done

    ; Er tegnet et tal?
    cmp al, '0'
    jb .copy_char

    cmp al, '9'
    ja .copy_char

    ; Kopier tallet og afslut
    mov [rdi], al
    inc rdi
    jmp .done

.copy_char:
    mov [rdi], al
    inc rdi
    inc rsi
    dec ecx
    jmp .next_char

.done:
    mov byte [rdi], 0
	pop rdi
    pop rsi
    ret

sac_qso_done:
    call save_sac_qso

    ; Facitlog kun i ren CW-mode
    cmp byte [qso_mode], 2
    jne .sac_qso_finished
	
    ; Nulstil facits DUPE-flag for hver ny QSO
    mov dword [sac_facit_dupe_flag], 0

    ; Opbyg søgemønster: | CALL | BAND |
    lea rcx, [sac_facit_dupe_pattern]
    lea rdx, [sac_facit_pattern_format]
    lea r8, [callsign_buffer]
    lea r9, [sac_band]
    call sprintf
	
	; Åbn facitloggen for at kontrollere DUPE
    lea rcx, [sac_facit_filename]
    lea rdx, [sac_read_mode]
    call fopen

    test rax, rax
    jz .sac_facit_dupe_check_done

    mov rbx, rax

.sac_facit_dupe_read_loop:
    lea rcx, [sac_facit_dupe_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .sac_facit_dupe_close

    ; Søg efter generatorens CALL og BAND
    lea rcx, [sac_facit_dupe_buffer]
    lea rdx, [sac_facit_dupe_pattern]
    call strstr

    test rax, rax
    jz .sac_facit_dupe_read_loop

    ; Samme CALL og BAND findes allerede
    mov dword [sac_facit_dupe_flag], 1

.sac_facit_dupe_close:
    mov rcx, rbx
    call fclose

.sac_facit_dupe_check_done:
	
    ; Facits point beregnes ud fra generatorens data
    ; Standard: 3 point uden for Europa
    mov dword [sac_facit_points], 3

    ; Europaeisk station: 2 point
    lea rcx, [sac_generated_continent]
    lea rdx, [sac_continent_eu]
    call strcmp

    test eax, eax
    jnz .sac_facit_points_done

    mov dword [sac_facit_points], 2

.sac_facit_points_done:

    ; Skandinaviske stationer giver 0 point
    call sac_is_scandinavian_generated

    test eax, eax
    jz .sac_facit_scandinavian_done

    mov dword [sac_facit_points], 0

.sac_facit_scandinavian_done:

    ; Facit-DUPE giver altid 0 point
    cmp dword [sac_facit_dupe_flag], 1
    jne .sac_facit_not_dupe

    mov dword [sac_facit_points], 0

.sac_facit_not_dupe:

    ; Facit DX multiplier kun for DX-operatoer
    cmp dword [sac_operator_scandinavian], 1
    je .sac_facit_mult_done

    ; DUPE giver ingen ny multiplier
    cmp dword [sac_facit_dupe_flag], 1
    je .sac_facit_mult_done

    ; Kun skandinaviske stationer
    call sac_is_scandinavian_generated
    test eax, eax
    jz .sac_facit_mult_done

    ; Udtraek omraade fra simulatorens kaldesignal
    lea rsi, [callsign_buffer]
    call sac_extract_dx_area

    ; Opbyg facit-multiplier
    lea rcx, [sac_dx_pattern]
    lea rdx, [sac_dx_mult_format]
    lea r8, [sac_band]
    lea r9, [sac_dx_area]
    call sprintf

    call check_sac_facit_dx_multiplier
    test eax, eax
    jnz .sac_facit_mult_done

    call save_sac_facit_dx_multiplier
    mov dword [sac_facit_mult_flag], 1
 
.sac_facit_mult_done:

    ; Aabn SAC facitlog til tilfoejelse
    lea rcx, [sac_facit_filename]
    lea rdx, [sac_append_mode]
    call fopen

    test rax, rax
    jz .sac_qso_finished

    mov rbx, rax

    ; Skriv generatorens korrekte data
    mov rcx, rbx

    ; Vaelg format ud fra facits DUPE-flag
    cmp dword [sac_facit_dupe_flag], 1
    jne .sac_facit_normal_format

    lea rdx, [sac_facit_dupe_format]
    jmp .sac_facit_format_ready

.sac_facit_normal_format:
    cmp dword [sac_facit_mult_flag], 1
    jne .sac_facit_no_mult

    lea rdx, [sac_facit_mult_format]
    jmp .sac_facit_format_ready

.sac_facit_no_mult:
    lea rdx, [sac_facit_format]

.sac_facit_format_ready:
    lea r8, [sac_time_buffer]
    lea r9, [callsign_buffer]

        ; BAND
    lea rax, [sac_band]
    mov [rsp + 32], rax

    ; Sendt serienummer
    mov eax, [sac_sent_serial]
    mov [rsp + 40], rax

    ; Generatorens modtagne serienummer
    mov eax, [sac_generated_serial]
    mov [rsp + 48], rax

    ; Facits egne QSO-point
    mov eax, [sac_facit_points]
    mov [rsp + 56], rax

    call fprintf


    ; Luk facitloggen igen
    mov rcx, rbx
    call fclose
	
; Opret SAC facit-Cabrillo
    call create_facit_cabrillo_sac

.sac_qso_finished:
    mov eax, 1
    add rsp, 72
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
    jmp sac_check_scandinavian_prefix

sac_is_scandinavian_generated:

    lea rsi, [callsign_buffer]

sac_check_scandinavian_prefix:

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
; SAC CW - Check DX multiplier
; EAX = 1: allerede brugt
; EAX = 0: ny multiplier
; ------------------------------------------------------------

check_sac_dx_multiplier:

    push rbx
    sub rsp, 32

    lea rcx, [sac_mult_filename]
    lea rdx, [sac_read_mode]
    call fopen

    test rax, rax
    jz .new_multiplier

    mov rbx, rax

.next_line:
    lea rcx, [sac_mult_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .close_new

    lea rcx, [sac_mult_buffer]
    lea rdx, [sac_dx_pattern]
    call strcmp

    test eax, eax
    jnz .next_line

    mov rcx, rbx
    call fclose

    mov eax, 1
    jmp .done

.close_new:
    mov rcx, rbx
    call fclose

.new_multiplier:
    xor eax, eax

.done:
    add rsp, 32
    pop rbx
    ret

; ------------------------------------------------------------
; SAC CW - Check facit DX multiplier
; EAX = 1: allerede brugt
; EAX = 0: ny multiplier
; ------------------------------------------------------------

check_sac_facit_dx_multiplier:

    push rbx
    sub rsp, 32

    lea rcx, [sac_facit_mult_filename]
    lea rdx, [sac_read_mode]
    call fopen

    test rax, rax
    jz .new_multiplier

    mov rbx, rax

.next_line:
    lea rcx, [sac_mult_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .close_new

    lea rcx, [sac_mult_buffer]
    lea rdx, [sac_dx_pattern]
    call strcmp

    test eax, eax
    jnz .next_line

    mov rcx, rbx
    call fclose

    mov eax, 1
    jmp .done

.close_new:
    mov rcx, rbx
    call fclose

.new_multiplier:
    xor eax, eax

.done:
    add rsp, 32
    pop rbx
    ret

; ------------------------------------------------------------
; SAC CW - Save facit DX multiplier
; ------------------------------------------------------------

save_sac_facit_dx_multiplier:

    push rbx
    sub rsp, 32

    lea rcx, [sac_facit_mult_filename]
    lea rdx, [sac_append_mode]
    call fopen

    test rax, rax
    jz .done

    mov rbx, rax

    lea rcx, [sac_dx_pattern]
    mov rdx, rbx
    call fputs

    mov rcx, rbx
    call fclose

.done:
    add rsp, 32
    pop rbx
    ret
	
; ------------------------------------------------------------
; Kontroller country multiplier
; EAX = 1 hvis allerede brugt
; EAX = 0 hvis ny
; ------------------------------------------------------------

check_sac_country_multiplier:

    push rbx
    sub rsp, 32

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
    add rsp, 32
    pop rbx
    ret

sac_country_mult_eof:

    mov rcx, rbx
    call fclose

sac_country_mult_new:

    xor eax, eax
    add rsp, 32
    pop rbx
    ret


; ------------------------------------------------------------
; SAC CW - Save DX multiplier
; ------------------------------------------------------------

save_sac_dx_multiplier:

    push rbx
    sub rsp, 32

    ; Aabn multiplierfil til tilfoejelse
    lea rcx, [sac_mult_filename]
    lea rdx, [sac_append_mode]
    call fopen

    test rax, rax
    jz .done

    mov rbx, rax

    ; Gem den faerdige multiplierlinje
    lea rcx, [sac_dx_pattern]
    mov rdx, rbx
    call fputs

    ; Luk filen
    mov rcx, rbx
    call fclose

.done:
    add rsp, 32
    pop rbx
    ret

; ------------------------------------------------------------
; Gem ny country multiplier
; ------------------------------------------------------------

save_sac_country_multiplier:

    push rbx
    sub rsp, 32

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

    add rsp, 32
    pop rbx
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

    ; Vaelg MULT-format ved ny multiplier
    cmp dword [sac_log_mult_flag], 1
    jne .normal_format

    lea rdx, [sac_log_mult_format]
    jmp .format_ready

.normal_format:
    lea rdx, [sac_log_format]

.format_ready:
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
	
    
    ; Advarsel paa valgt sprog
    mov ecx, 86
    call sprog_print

    lea rcx, [sac_newlog_prompt]
    call printf

    lea rcx, [sac_newlog_choice]
    mov edx, 8
    call gets_s

    ; Store bogstaver
    lea rcx, [sac_newlog_choice]
    mov edx, 8
    call _strupr_s

    ; Kun Y starter ny log
    cmp byte [sac_newlog_choice], 'Y'
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

    ; Nulstil SAC facitlog
    lea rcx, [sac_facit_filename]
    lea rdx, [sac_write_mode]
    call fopen

    test rax, rax
    jz .sac_facit_reset_done

    mov rbx, rax
    mov rcx, rbx
    call fclose

.sac_facit_reset_done:

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
	
sac_empty_call:
    xor eax, eax
    add rsp, 72
    ret
	
sac_operator_country_unknown:
    lea rcx, [sac_operator_country_error]
    call printf

    add rsp, 72
    ret