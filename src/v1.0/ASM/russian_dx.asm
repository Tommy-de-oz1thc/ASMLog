bits 64
default rel

global calculate_russian_score
global russian_dx_new_log
global russian_dx_new_qso
global russian_dx_search_log
global russian_dx_show_log

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
extern sprintf_s
extern sscanf
extern strcmp
extern strcpy_s
extern strftime
extern strstr
extern time

section .data
russian_append_mode:
    db "a", 0

russian_band_10:
    db "10m", 0

russian_band_15:
    db "15m", 0

russian_band_160:
    db "160m", 0

russian_band_20:
    db "20m", 0

russian_band_40:
    db "40m", 0

russian_band_80:
    db "80m", 0

russian_band_error:
    db "Ugyldigt baand. Brug 160m, 80m, 40m, 20m, 15m eller 10m.", 10, 0

russian_band_prompt:
    db "Baand: ", 0

russian_call_error:
    db "Ugyldigt kaldesignal - call skal indeholde bogstav og tal.", 10, 0

russian_call_prompt:
    db "Skriv kaldesignal: ", 0

russian_continent_eu:
    db "EU", 0

russian_country_key_format:
    db "%s COUNTRY %s", 0

russian_country_mult_text:
    db "Ny land-multiplier: %s paa %s", 10, 0

russian_country_not_new_text:
    db "Land-multiplier allerede brugt: %s", 10, 0

russian_country_test:
    db "CTY fundet: %s / %s", 10, 0

russian_dupe_log_format:
    db "%s | %s | %s | %s | %s | %s | %d | DUPE", 10, 0

russian_dupe_warning:
    db "DUPE - kaldesignalet er allerede logget paa dette baand.", 10, 0

russian_dx_station_text:
    db "Ikke-russisk station.", 10, 0

russian_entity_asia:
    db "Asiatic Russia", 0

russian_entity_denmark:
    db "Denmark", 0

russian_entity_europe:
    db "European Russia", 0

russian_entity_kaliningrad:
    db "Kaliningrad", 0

russian_field_pattern_format:
    db "%s |", 0

russian_line_format:
    db "%s", 0

russian_log_empty_text:
    db "Ingen QSO'er i Russian DX-loggen.", 10, 0

russian_log_filename:
    db "log/russian_dx_log.txt", 0

russian_log_format:
    db "%s | %s | %s | %s | %s | %s | %d", 10, 0

russian_mult_filename:
    db "data/russian_dx_mult.txt", 0

russian_mult_key_format:
    db "%s OBLAST %s", 0

russian_mult_key_test:
    db "Multiplier-noegle: %s", 10, 0

russian_mult_not_new_text:
    db "Oblast-multiplier allerede brugt: %s", 10, 0

russian_newlog_done:
    db "Ny Russian DX-log startet.", 10, 0

russian_newlog_prompt:
    db "Start ny log? (J/N): ", 0

russian_newlog_warning:
    db 10, "ADVARSEL: Hele den nuvaerende Russian DX-log bliver slettet.", 10, 0

russian_oblast_error:
    db "Ugyldig oblastkode.", 10, 0

russian_oblast_mult_text:
    db "Ny oblast-multiplier: %s paa %s", 10, 0

russian_oblast_prompt:
    db "Oblast: ", 0

russian_oblast_ri1an:
    db "RI1AN", 0

russian_oblast_ri1fj:
    db "RI1FJ", 0

russian_oblast_ua2f:
    db "UA2F", 0

russian_points_text:
    db "QSO-point: %d", 10, 0

russian_qso_number_format:
    db "%03d", 0

russian_read_mode:
    db "r", 0

russian_rst_error:
    db "RST skal vaere praecis tre cifre, fx 599.", 10, 0

russian_rst_prompt:
    db "RST: ", 0

russian_score_point_format:
    db "%*[^|]|%*[^|]|%*[^|]|%*[^|]|%*[^|]|%*[^|]| %d", 0

russian_search_count_format:
    db 10, "Antal fund: %d", 10, 0

russian_search_header:
    db 10, "Fundne QSO'er:", 10, 0

russian_search_no_results:
    db 10, "Ingen QSO'er fundet.", 10, 0

russian_search_prompt:
    db 10, "Kaldesignal at soege efter: ", 0

russian_serial_error:
    db "QSONR skal kun indeholde tal.", 10, 0

russian_serial_prompt:
    db "QSONR modtaget: ", 0

russian_show_log_title:
    db 10, "=== Russian DX QSO-log ===", 10, 0

russian_special_ri1an:
    db "RI1AN", 0

russian_special_ri1fj:
    db "RI1FJ", 0

russian_special_ua2f:
    db "UA2F", 0

russian_station_text:
    db "Russisk station.", 10, 0

russian_time_format:
    db "%d-%m-%Y %H:%M", 0

russian_title:
    db 10
    db "=== ASMLog v0.3b Russian DX ===", 10
    db "Russian DX Contest - CW", 10
    db "Made by Tommy Clemmensen - OZ1THC", 10, 10
    db 0

russian_used_mult_filename:
    db "data/russian_dx_used_mult.txt", 0

russian_used_mult_write_format:
    db "%s", 10, 0

russian_write_mode:
    db "w", 0
	
section .bss

russian_band resb 16

russian_call resb 32

russian_call_pattern:
    resb 48

russian_country_key resb 128

russian_dupe_buffer:
    resb 256

russian_dupe_flag:
    resd 1

russian_exchange resb 16

russian_log_buffer:
    resb 256

russian_mult_buffer resb 16

russian_mult_key resb 32

russian_newlog_choice:
    resb 4

russian_oblast_mult_flag resd 1

russian_qso_number resd 1
russian_qso_number_text resb 16
russian_qso_points resd 1

russian_rst resb 8

russian_score_mults resd 1
russian_score_points resd 1
russian_score_value resd 1

russian_search_call:
    resb 32

russian_search_count:
    resd 1

russian_time_buffer:
    resb 64

russian_time_value:
    resq 1

russian_used_mult_buffer resb 128

section .text
; ------------------------------------------------------------
; Beregn Russian DX score
; Score = samlede QSO-point * antal multipliers
; ------------------------------------------------------------

calculate_russian_score:

    push rbx
    sub rsp, 32

    mov dword [russian_score_points], 0
    mov dword [russian_score_mults], 0

    ; --------------------------------------------------------
    ; 1. Summer point fra QSO-loggen
    ; --------------------------------------------------------

    lea rcx, [russian_log_filename]
    lea rdx, [russian_read_mode]
    call fopen

    test rax, rax
    jz russian_score_count_mults

    mov rbx, rax

russian_score_read_qso:

    lea rcx, [russian_log_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz russian_score_close_log

    ; Hent pointfeltet fra loglinjen
    lea rcx, [russian_log_buffer]
    lea rdx, [russian_score_point_format]
    lea r8, [russian_qso_points]
    call sscanf

    cmp eax, 1
    jne russian_score_read_qso

    mov eax, [russian_qso_points]
    add [russian_score_points], eax

    jmp russian_score_read_qso

russian_score_close_log:

    mov rcx, rbx
    call fclose

    ; --------------------------------------------------------
    ; 2. Tael multipliers
    ; --------------------------------------------------------

russian_score_count_mults:

    lea rcx, [russian_used_mult_filename]
    lea rdx, [russian_read_mode]
    call fopen

    test rax, rax
    jz russian_score_finished

    mov rbx, rax

russian_score_read_mult:

    lea rcx, [russian_used_mult_buffer]
    mov edx, 128
    mov r8, rbx
    call fgets

    test rax, rax
    jz russian_score_close_mult

    inc dword [russian_score_mults]

    jmp russian_score_read_mult

russian_score_close_mult:

    mov rcx, rbx
    call fclose

russian_score_finished:

    mov eax, [russian_score_points]
    imul eax, [russian_score_mults]

    mov [russian_score_value], eax

    add rsp, 32
    pop rbx
    ret
; ------------------------------------------------------------
; Hent nuvaerende QSO-nummer fra Russian DX-loggen
; En linje = en tidligere QSO
; ------------------------------------------------------------

russian_load_qso_number:

    push rbx
    sub rsp, 32

    ; Start ved 0
    mov dword [russian_qso_number], 0

    ; Aabn eksisterende log
    lea rcx, [russian_log_filename]
    lea rdx, [russian_read_mode]
    call fopen

    test rax, rax
    jz russian_load_qso_done

    mov rbx, rax

russian_load_qso_next:

    lea rcx, [russian_log_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz russian_load_qso_close

    ; En loglinje = en QSO
    inc dword [russian_qso_number]

    jmp russian_load_qso_next

russian_load_qso_close:

    mov rcx, rbx
    call fclose

russian_load_qso_done:

    add rsp, 32
    pop rbx
    ret

russian_dx_new_qso:

    sub rsp, 88
	
	; Fortsaet QSO-nummer fra eksisterende log
    call russian_load_qso_number
	
	; Hent aktuel tid
    lea rcx, [russian_time_value]
    call time

    ; Konverter til UTC
    lea rcx, [russian_time_value]
    call gmtime

    ; RAX peger paa tm-strukturen
    mov r9, rax

    ; Lav teksten DD-MM-YYYY HH:MM
    lea rcx, [russian_time_buffer]
    mov edx, 64
    lea r8, [russian_time_format]
    call strftime

	mov dword [russian_oblast_mult_flag], 0
    mov dword [russian_dupe_flag], 0
	
    lea rcx, [russian_title]
    call printf

russian_read_call:

    lea rcx, [russian_call_prompt]
    call printf

    lea rcx, [russian_call]
    mov edx, 32
    call gets_s

    ; Start ved foerste tegn
    lea rax, [russian_call]

    ; 0 = endnu ikke fundet
    xor r10d, r10d        ; bogstav
    xor r11d, r11d        ; tal

russian_check_call_char:

    cmp byte [rax], 0
    je russian_check_call_result

    ; Test 0-9
    cmp byte [rax], '0'
    jb russian_check_letter

    cmp byte [rax], '9'
    ja russian_check_letter

    mov r11b, 1
    jmp russian_next_call_char

russian_check_letter:

    ; Test A-Z
    cmp byte [rax], 'A'
    jb russian_check_lowercase

    cmp byte [rax], 'Z'
    jbe russian_found_letter

russian_check_lowercase:

    ; Test a-z
    cmp byte [rax], 'a'
    jb russian_next_call_char

    cmp byte [rax], 'z'
    ja russian_next_call_char

russian_found_letter:
    mov r10b, 1

russian_next_call_char:
    inc rax
    jmp russian_check_call_char

russian_check_call_result:

    cmp r10b, 1
    jne russian_bad_call

    cmp r11b, 1
    jne russian_bad_call

    ; Gyldigt call - lav det til store bogstaver
    lea rcx, [russian_call]
    mov edx, 32
    call _strupr_s

    ; Kopier Russian DX-call til den eksisterende CTY-buffer
    lea rcx, [log_text]
    mov edx, 256
    lea r8, [russian_call]
    call strcpy_s

    ; Brug den eksisterende CTY-rutine
    call lookup_country

    ; Vis resultatet som test
    lea rcx, [russian_country_test]
    lea rdx, [cty_match_entity]
    lea r8, [cty_match_continent]
    call printf

    call russian_is_russian
    test eax, eax
    jz russian_not_russian_test

    lea rcx, [russian_station_text]
    call printf
    jmp russian_country_test_done

russian_not_russian_test:
    lea rcx, [russian_dx_station_text]
    call printf

russian_country_test_done:

russian_read_band:

    lea rcx, [russian_band_prompt]
    call printf

    lea rcx, [russian_band]
    mov edx, 16
    call gets_s

    ; 160m
    lea rcx, [russian_band]
    lea rdx, [russian_band_160]
    call strcmp
    test eax, eax
    jz russian_band_ok

    ; 80m
    lea rcx, [russian_band]
    lea rdx, [russian_band_80]
    call strcmp
    test eax, eax
    jz russian_band_ok

    ; 40m
    lea rcx, [russian_band]
    lea rdx, [russian_band_40]
    call strcmp
    test eax, eax
    jz russian_band_ok

    ; 20m
    lea rcx, [russian_band]
    lea rdx, [russian_band_20]
    call strcmp
    test eax, eax
    jz russian_band_ok

    ; 15m
    lea rcx, [russian_band]
    lea rdx, [russian_band_15]
    call strcmp
    test eax, eax
    jz russian_band_ok

    ; 10m
    lea rcx, [russian_band]
    lea rdx, [russian_band_10]
    call strcmp
    test eax, eax
    jz russian_band_ok

    ; Ikke et gyldigt baand
    lea rcx, [russian_band_error]
    call printf
    jmp russian_read_band


russian_band_ok:

    ; Kontroller om CALL allerede er logget paa dette baand
    call check_russian_dupe
    test eax, eax
    jz russian_read_rst

    ; DUPE
    lea rcx, [russian_dupe_warning]
    call printf

    mov dword [russian_dupe_flag], 1


russian_read_rst:

    lea rcx, [russian_rst_prompt]
    call printf

    lea rcx, [russian_rst]
    mov edx, 8
    call gets_s

    ; Foerste tegn skal vaere et tal
    cmp byte [russian_rst], '0'
    jb russian_bad_rst
    cmp byte [russian_rst], '9'
    ja russian_bad_rst

    ; Andet tegn
    cmp byte [russian_rst + 1], '0'
    jb russian_bad_rst
    cmp byte [russian_rst + 1], '9'
    ja russian_bad_rst

    ; Tredje tegn
    cmp byte [russian_rst + 2], '0'
    jb russian_bad_rst
    cmp byte [russian_rst + 2], '9'
    ja russian_bad_rst

    ; Der maa ikke vaere flere tegn
    cmp byte [russian_rst + 3], 0
    jne russian_bad_rst

    ; /MM skal bruge serienummer og maa ikke behandles som russisk oblast
	call russian_is_mm
	test eax, eax
	jnz russian_read_serial

	call russian_is_russian
	test eax, eax
	jz russian_read_serial

russian_read_oblast:

    ; Specialtilfaelde: UA2F
    cmp byte [russian_call], 'U'
    jne russian_check_ri1fj
    cmp byte [russian_call + 1], 'A'
    jne russian_read_normal_oblast
    cmp byte [russian_call + 2], '2'
    jne russian_read_normal_oblast
    cmp byte [russian_call + 3], 'F'
    jne russian_read_normal_oblast

    ; Brug UA2F som oblastkode
    lea rcx, [russian_exchange]
    mov edx, 16
    lea r8, [russian_oblast_ua2f]
    call strcpy_s

    ; Spring normal oblast-input og validering over
    jmp russian_oblast_ready

russian_check_ri1fj:

    ; Specialtilfaelde: RI1FJ
    cmp byte [russian_call], 'R'
    jne russian_check_ri1an
    cmp byte [russian_call + 1], 'I'
    jne russian_read_normal_oblast
    cmp byte [russian_call + 2], '1'
    jne russian_read_normal_oblast
    cmp byte [russian_call + 3], 'F'
    jne russian_check_ri1an
    cmp byte [russian_call + 4], 'J'
    jne russian_read_normal_oblast

    lea rcx, [russian_exchange]
    mov edx, 16
    lea r8, [russian_oblast_ri1fj]
    call strcpy_s

    jmp russian_oblast_ready

russian_check_ri1an:

    ; Specialtilfaelde: RI1AN
    cmp byte [russian_call], 'R'
    jne russian_read_normal_oblast
    cmp byte [russian_call + 1], 'I'
    jne russian_read_normal_oblast
    cmp byte [russian_call + 2], '1'
    jne russian_read_normal_oblast
    cmp byte [russian_call + 3], 'A'
    jne russian_read_normal_oblast
    cmp byte [russian_call + 4], 'N'
    jne russian_read_normal_oblast

    lea rcx, [russian_exchange]
    mov edx, 16
    lea r8, [russian_oblast_ri1an]
    call strcpy_s

    jmp russian_oblast_ready

russian_read_normal_oblast:

    lea rcx, [russian_oblast_prompt]
    call printf

    lea rcx, [russian_exchange]
    mov edx, 16
    call gets_s

    ; Lav oblastkode til store bogstaver
    lea rcx, [russian_exchange]
    mov edx, 16
    call _strupr_s

    
    ; Skal vaere praecis to bogstaver
    cmp byte [russian_exchange], 'A'
    jb russian_bad_oblast
    cmp byte [russian_exchange], 'Z'
    ja russian_bad_oblast

    cmp byte [russian_exchange + 1], 'A'
    jb russian_bad_oblast
    cmp byte [russian_exchange + 1], 'Z'
    ja russian_bad_oblast

    cmp byte [russian_exchange + 2], 0
    jne russian_bad_oblast

    ; Aabn listen over gyldige oblastkoder
    lea rcx, [russian_mult_filename]
    lea rdx, [russian_read_mode]
    call fopen

    test rax, rax
    jz russian_bad_oblast

    mov rbx, rax

russian_oblast_next:

    lea rcx, [russian_mult_buffer]
    mov edx, 16
    mov r8, rbx
    call fgets

    test rax, rax
    jz russian_oblast_not_found

    ; Fjern linjeskift fra filens to-bogstavskode
    mov byte [russian_mult_buffer + 2], 0

    lea rcx, [russian_exchange]
    lea rdx, [russian_mult_buffer]
    call strcmp

    test eax, eax
    jz russian_oblast_found

    jmp russian_oblast_next

russian_oblast_found:

    mov rcx, rbx
    call fclose

russian_oblast_ready:
	
    ; DUPE maa ikke give oblast-multiplier
    cmp dword [russian_dupe_flag], 1
	
    je russian_exchange_done
	
    ; Byg noeglen: fx "20m MO"
    lea rcx, [russian_mult_key]
    mov edx, 32
    lea r8, [russian_mult_key_format]
    lea r9, [russian_band]

    ; 5. argument til sprintf_s ligger paa stacken
    lea rax, [russian_exchange]
    mov [rsp + 32], rax

    call sprintf_s

    ; Midlertidig kontrol
    lea rcx, [russian_mult_key_test]
    lea rdx, [russian_mult_key]
    call printf

    ; Aabn fil med allerede brugte multipliers
    lea rcx, [russian_used_mult_filename]
    lea rdx, [russian_read_mode]
    call fopen

    test rax, rax
    jz russian_oblast_is_new

    mov rbx, rax

russian_check_used_mult:

    lea rcx, [russian_used_mult_buffer]
    mov edx, 32
    mov r8, rbx
    call fgets

    test rax, rax
    jz russian_used_mult_not_found

    ; Fjern CR/LF fra den laeste linje
    lea rax, [russian_used_mult_buffer]

russian_remove_mult_newline:

    cmp byte [rax], 0
    je russian_compare_used_mult

    cmp byte [rax], 13
    je russian_terminate_used_mult

    cmp byte [rax], 10
    je russian_terminate_used_mult

    inc rax
    jmp russian_remove_mult_newline

russian_terminate_used_mult:

    mov byte [rax], 0

russian_compare_used_mult:

    lea rcx, [russian_mult_key]
    lea rdx, [russian_used_mult_buffer]
    call strcmp

    test eax, eax
    jz russian_used_mult_found

    jmp russian_check_used_mult

russian_used_mult_found:

    mov rcx, rbx
    call fclose

    mov dword [russian_oblast_mult_flag], 0

    lea rcx, [russian_mult_not_new_text]
    lea rdx, [russian_mult_key]
    call printf

    jmp russian_country_multiplier_test

russian_used_mult_not_found:

    mov rcx, rbx
    call fclose

russian_oblast_is_new:


    ; Gem den nye band/oblast-kombination
    lea rcx, [russian_used_mult_filename]
    lea rdx, [russian_append_mode]
    call fopen

    test rax, rax
    jz russian_oblast_mult_write_done

    mov rbx, rax

    mov rcx, rbx
    lea rdx, [russian_used_mult_write_format]
    lea r8, [russian_mult_key]
    call fprintf

    mov rcx, rbx
    call fclose

russian_oblast_mult_write_done:

    mov dword [russian_oblast_mult_flag], 1

    lea rcx, [russian_oblast_mult_text]
    lea rdx, [russian_exchange]
    lea r8, [russian_band]
    call printf

    jmp russian_country_multiplier_test
    

russian_oblast_not_found:

    mov rcx, rbx
    call fclose

russian_bad_oblast:

    lea rcx, [russian_oblast_error]
    call printf

    jmp russian_read_oblast

russian_read_serial:

    lea rcx, [russian_serial_prompt]
    call printf

    lea rcx, [russian_exchange]
    mov edx, 16
    call gets_s

    ; Tomt serienummer er ikke tilladt
    cmp byte [russian_exchange], 0
    je russian_bad_serial

    lea rax, [russian_exchange]

russian_check_serial:

    ; Slut paa teksten = gyldigt
    cmp byte [rax], 0
    je russian_serial_ok

    ; Skal vaere 0-9
    cmp byte [rax], '0'
    jb russian_bad_serial

    cmp byte [rax], '9'
    ja russian_bad_serial

    inc rax
    jmp russian_check_serial

russian_serial_ok:

    ; /MM giver ingen country-multiplier
    call russian_is_mm
    test eax, eax
    jnz russian_exchange_done

    ; Almindelig station gaar videre til country-multiplier
    jmp russian_country_multiplier_test

russian_bad_serial:

    lea rcx, [russian_serial_error]
    call printf

    jmp russian_read_serial

russian_country_multiplier_test:

    ; DUPE maa ikke give en ny multiplier
    cmp dword [russian_dupe_flag], 1
    je russian_exchange_done

    ; Byg fx "20m COUNTRY Fed. Rep. of Germany"
	lea rcx, [russian_country_key]
    mov edx, 128
    lea r8, [russian_country_key_format]
    lea r9, [russian_band]

    ; 5. argument = landet fra cty.dat
    lea rax, [cty_match_entity]
    mov [rsp + 32], rax

    call sprintf_s

    ; Midlertidig test
    lea rcx, [russian_mult_key_test]
    lea rdx, [russian_country_key]
    call printf

        ; Aabn fil med allerede brugte multipliers
    lea rcx, [russian_used_mult_filename]
    lea rdx, [russian_read_mode]
    call fopen

    test rax, rax
    jz russian_country_not_found

    mov rbx, rax

russian_country_check_next:

    lea rcx, [russian_used_mult_buffer]
    mov edx, 128
    mov r8, rbx
    call fgets

    test rax, rax
    jz russian_country_eof

    ; Fjern CR/LF
    lea rax, [russian_used_mult_buffer]

russian_country_remove_newline:

    cmp byte [rax], 0
    je russian_country_compare

    cmp byte [rax], 13
    je russian_country_terminate

    cmp byte [rax], 10
    je russian_country_terminate

    inc rax
    jmp russian_country_remove_newline

russian_country_terminate:

    mov byte [rax], 0

russian_country_compare:

    lea rcx, [russian_country_key]
    lea rdx, [russian_used_mult_buffer]
    call strcmp

    test eax, eax
    jz russian_country_found

    jmp russian_country_check_next

russian_country_found:

    mov rcx, rbx
    call fclose

    lea rcx, [russian_country_not_new_text]
    lea rdx, [russian_country_key]
    call printf

    jmp russian_exchange_done

russian_country_eof:

    mov rcx, rbx
    call fclose

russian_country_not_found:

    ; Gem den nye band/country-kombination
    lea rcx, [russian_used_mult_filename]
    lea rdx, [russian_append_mode]
    call fopen

    test rax, rax
    jz russian_country_write_done

    mov rbx, rax

    mov rcx, rbx
    lea rdx, [russian_used_mult_write_format]
    lea r8, [russian_country_key]
    call fprintf

    mov rcx, rbx
    call fclose

russian_country_write_done:

    lea rcx, [russian_country_mult_text]
    lea rdx, [cty_match_entity]
    lea r8, [russian_band]
    call printf

    jmp russian_exchange_done


russian_exchange_done:

    ; Nulstil point for denne QSO
    mov dword [russian_qso_points], 0

    ; DUPE giver altid 0 point
    cmp dword [russian_dupe_flag], 1
    je russian_points_done

    ; Maritime Mobile giver 5 point
    call russian_is_mm
	
	test eax, eax
	jz russian_check_russia

	mov dword [russian_qso_points], 5
	jmp russian_points_done

russian_check_russia:

; Russisk station giver 10 point
call russian_is_russian
    test eax, eax
    jz russian_check_denmark

    ; Russisk station
    mov dword [russian_qso_points], 10
    jmp russian_points_done

russian_check_denmark:

    lea rcx, [cty_match_entity]
    lea rdx, [russian_entity_denmark]
    call strcmp

        test eax, eax
    jnz russian_check_europe

    ; Dansk station
    mov dword [russian_qso_points], 2
    jmp russian_points_done

russian_check_europe:

    lea rcx, [cty_match_continent]
    lea rdx, [russian_continent_eu]
    call strcmp

        test eax, eax
    jnz russian_other_continent

    ; Andet europaeisk land
    mov dword [russian_qso_points], 3
    jmp russian_points_done

russian_other_continent:

    ; Andet kontinent
    mov dword [russian_qso_points], 5

russian_points_done:

    ; Naeste sendte QSO-nummer
    inc dword [russian_qso_number]

    ; Lav nummeret som 001, 002, 003 osv.
    lea rcx, [russian_qso_number_text]
    lea rdx, [russian_qso_number_format]
    mov r8d, [russian_qso_number]
    call sprintf

    ; Midlertidig testvisning
    lea rcx, [russian_points_text]
    mov edx, [russian_qso_points]
    call printf

    ; Aabn Russian DX-loggen
    lea rcx, [russian_log_filename]
    lea rdx, [russian_append_mode]
    call fopen

    test rax, rax
    jz russian_log_done

    mov rbx, rax

        ; CALL | BAND | RST | EXCHANGE | POINT
    mov rcx, rbx

    ; Vaelg normalt format eller DUPE-format
    cmp dword [russian_dupe_flag], 1
    jne russian_log_normal_format

    lea rdx, [russian_dupe_log_format]
    jmp russian_log_format_ready

russian_log_normal_format:
    lea rdx, [russian_log_format]

russian_log_format_ready:
    ; 3. argument = DATE/TIME
    lea r8, [russian_time_buffer]

    ; 4. argument = CALL
    lea r9, [russian_call]

    ; 5. argument = BAND
    lea rax, [russian_band]
    mov [rsp + 32], rax

    ; 6. argument = RST
    lea rax, [russian_rst]
    mov [rsp + 40], rax

        ; 7. argument = SENDT QSO-NUMMER
    lea rax, [russian_qso_number_text]
    mov [rsp + 48], rax

    ; 8. argument = MODTAGET EXCHANGE
    lea rax, [russian_exchange]
    mov [rsp + 56], rax

    ; 9. argument = POINT
    mov eax, [russian_qso_points]
    mov [rsp + 64], rax

    call fprintf

    mov rcx, rbx
    call fclose

russian_log_done:

    add rsp, 88
    ret

russian_bad_rst:

    lea rcx, [russian_rst_error]
    call printf
    jmp russian_read_rst

russian_bad_call:

    lea rcx, [russian_call_error]
    call printf

    jmp russian_read_call


russian_is_russian:
    sub rsp, 40

    ; European Russia?
    lea rcx, [cty_match_entity]
    lea rdx, [russian_entity_europe]
    call strcmp
    test eax, eax
    jz .yes

    ; Kaliningrad?
    lea rcx, [cty_match_entity]
    lea rdx, [russian_entity_kaliningrad]
    call strcmp
    test eax, eax
    jz .yes

    ; Asiatic Russia?
    lea rcx, [cty_match_entity]
    lea rdx, [russian_entity_asia]
    call strcmp
    test eax, eax
    jz .yes

    ; Ikke Rusland
    xor eax, eax
    add rsp, 40
    ret

.yes:
    mov eax, 1
    add rsp, 40
    ret

; ------------------------------------------------------------
; Kontroller om callsign slutter med /MM
; EAX = 1 hvis /MM, ellers 0
; ------------------------------------------------------------
	
russian_is_mm:

    lea rax, [russian_call]

russian_mm_find_end:

    cmp byte [rax], 0
    je russian_mm_at_end

    inc rax
    jmp russian_mm_find_end

russian_mm_at_end:

    ; RAX peger allerede paa nul-tegnet efter callsignet.
    ; Der skal mindst vaere tre tegn: /MM
    lea rdx, [russian_call]
    mov rcx, rax
    sub rcx, rdx
    cmp rcx, 3
    jb russian_mm_no

    ; Gaa tre tegn tilbage fra slutningen
    sub rax, 3

    cmp byte [rax], '/'
    jne russian_mm_no

    cmp byte [rax + 1], 'M'
    jne russian_mm_no

    cmp byte [rax + 2], 'M'
    jne russian_mm_no

    mov eax, 1
    ret

russian_mm_no:

    xor eax, eax
    ret
	
; ------------------------------------------------------------
; Kontroller om CALL allerede findes paa samme baand
; EAX = 1 hvis DUPE, ellers 0
; ------------------------------------------------------------

check_russian_dupe:

    sub rsp, 40

    ; Byg fx "DL7GTH |"
    lea rcx, [russian_call_pattern]
    lea rdx, [russian_field_pattern_format]
    lea r8, [russian_call]
    call sprintf

    ; Aabn Russian DX-loggen
    lea rcx, [russian_log_filename]
    lea rdx, [russian_read_mode]
    call fopen

    test rax, rax
    jz russian_dupe_no

    mov rbx, rax

russian_dupe_next_line:

    lea rcx, [russian_dupe_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz russian_dupe_eof

    ; Find CALL i linjen
    lea rcx, [russian_dupe_buffer]
    lea rdx, [russian_call_pattern]
    call strstr

    test rax, rax
    jz russian_dupe_next_line

    ; Find BAND i samme linje
    lea rcx, [russian_dupe_buffer]
    lea rdx, [russian_band]
    call strstr

    test rax, rax
    jz russian_dupe_next_line

    ; Samme CALL + BAND
    mov rcx, rbx
    call fclose

    mov eax, 1
    add rsp, 40
    ret

russian_dupe_eof:

    mov rcx, rbx
    call fclose

russian_dupe_no:

    xor eax, eax
    add rsp, 40
    ret
	
; ------------------------------------------------------------
; Vis Russian DX QSO-log
; ------------------------------------------------------------

russian_dx_show_log:

    sub rsp, 40

    lea rcx, [russian_show_log_title]
    call printf

    ; Aabn Russian DX-loggen
    lea rcx, [russian_log_filename]
    lea rdx, [russian_read_mode]
    call fopen

    test rax, rax
    jz russian_show_log_empty

    mov rbx, rax

russian_show_log_next:

    lea rcx, [russian_log_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz russian_show_log_done

    ; Vis linjen
    lea rcx, [russian_line_format]
    lea rdx, [russian_log_buffer]
    call printf

    jmp russian_show_log_next

russian_show_log_done:

    mov rcx, rbx
    call fclose

    add rsp, 40
    ret

russian_show_log_empty:

    lea rcx, [russian_log_empty_text]
    call printf

    add rsp, 40
    ret
; ------------------------------------------------------------
; Soeg i Russian DX QSO-log
; ------------------------------------------------------------

russian_dx_search_log:

    sub rsp, 40

    ; Spoerg efter kaldesignal
    lea rcx, [russian_search_prompt]
    call printf

    lea rcx, [russian_search_call]
    mov edx, 32
    call gets_s

    ; Lav kaldesignalet til store bogstaver
    lea rcx, [russian_search_call]
    mov edx, 32
    call _strupr_s

    ; Nulstil antal fund
    mov dword [russian_search_count], 0

    ; Aabn Russian DX-loggen
    lea rcx, [russian_log_filename]
    lea rdx, [russian_read_mode]
    call fopen

    test rax, rax
    jz russian_search_no_match

    mov rbx, rax

russian_search_next_line:

    lea rcx, [russian_log_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz russian_search_done

    ; Find kaldesignalet i linjen
    lea rcx, [russian_log_buffer]
    lea rdx, [russian_search_call]
    call strstr

    test rax, rax
    jz russian_search_next_line

    ; Vis overskrift kun ved foerste fund
    cmp dword [russian_search_count], 0
    jne russian_search_print_line

    lea rcx, [russian_search_header]
    call printf

russian_search_print_line:

    lea rcx, [russian_line_format]
    lea rdx, [russian_log_buffer]
    call printf

    inc dword [russian_search_count]
    jmp russian_search_next_line

russian_search_done:

    mov rcx, rbx
    call fclose

    cmp dword [russian_search_count], 0
    je russian_search_no_match

    lea rcx, [russian_search_count_format]
    mov edx, [russian_search_count]
    call printf

    add rsp, 40
    ret

russian_search_no_match:

    lea rcx, [russian_search_no_results]
    call printf

    add rsp, 40
    ret
	
; ------------------------------------------------------------
; Start ny Russian DX-log
; ------------------------------------------------------------

russian_dx_new_log:

    sub rsp, 40

    ; Advarsel
    lea rcx, [russian_newlog_warning]
    call printf

    lea rcx, [russian_newlog_prompt]
    call printf

    ; Laes J/N
    lea rcx, [russian_newlog_choice]
    mov edx, 4
    call gets_s

    ; Accepter J eller j
    cmp byte [russian_newlog_choice], 'J'
    je russian_newlog_confirmed

    cmp byte [russian_newlog_choice], 'j'
    je russian_newlog_confirmed

    ; Alt andet = annuller
    add rsp, 40
    ret

russian_newlog_confirmed:

    ; Toem QSO-loggen
    lea rcx, [russian_log_filename]
    lea rdx, [russian_write_mode]
    call fopen

    test rax, rax
    jz russian_newlog_reset_mult

    mov rcx, rax
    call fclose

    ; Nulstil sendt QSO-nummer
    mov dword [russian_qso_number], 0

russian_newlog_reset_mult:

    ; Toem filen med brugte multipliers
    lea rcx, [russian_used_mult_filename]
    lea rdx, [russian_write_mode]
    call fopen

    test rax, rax
    jz russian_newlog_done_label

    mov rcx, rax
    call fclose

russian_newlog_done_label:

    lea rcx, [russian_newlog_done]
    call printf

    add rsp, 40
    ret
	