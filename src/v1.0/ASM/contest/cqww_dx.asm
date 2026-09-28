bits 64
default rel

global calculate_cqww_score
global cqww_dx_log_filename
global cqww_dx_new_log
global cqww_dx_new_qso
global cqww_dx_search_log
global cqww_dx_show_log

extern _strupr_s
extern cty_match_continent
extern cty_match_entity
extern fclose
extern fgets
extern fopen
extern fprintf
extern getchar
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
cqww_append_mode:
    db "a", 0

cqww_band_error:
    db "Ugyldigt baand. Brug 160m, 80m, 40m, 20m, 15m eller 10m.", 10, 0

cqww_band_prompt:
    db "Baand: ", 0

cqww_call_error:
    db "Ugyldigt kaldesignal - call skal indeholde bogstav og tal.", 10, 0

cqww_call_prompt:
    db "Skriv kaldesignal: ", 0

cqww_continent_af:
    db "AF", 0

cqww_continent_as:
    db "AS", 0

cqww_continent_eu:
    db "EU", 0

cqww_continent_na:
    db "NA", 0

cqww_continent_oc:
    db "OC", 0

cqww_continent_sa:
    db "SA", 0

cqww_country_mult_format:
    db "%s COUNTRY %s", 10, 0

cqww_country_test:
    db "CTY fundet: %s / %s", 10, 0

cqww_dupe_log_format:
    db "%s | %s | %s | %s | %s | %d | DUPE", 10, 0

cqww_dupe_warning:
    db "DUPE - kaldesignalet er allerede logget paa dette baand.", 10, 0

cqww_dx_log_filename:
    db "log/cqww_dx_log.txt", 0

cqww_entity_denmark:
    db "Denmark", 0

cqww_field_pattern_format:
    db "%s |", 0

cqww_log_format:
    db "%s | %s | %s | %s | %s | %d", 10, 0

cqww_mm_continent_error:
    db "Ugyldigt kontinent. Brug EU, AF, AS, NA, SA eller OC.", 10, 0

cqww_mm_continent_prompt:
    db "Kontinent (EU/AF/AS/NA/SA/OC): ", 0

cqww_mult_filename:
    db "data/cqww_dx_used_mult.txt", 0

cqww_newlog_done:
    db "Ny CQ WW-log startet.", 10, 0

cqww_newlog_prompt:
    db "Start ny log? (J/N): ", 0

cqww_newlog_warning:
    db 10, "ADVARSEL: Hele den nuvaerende CQ WW-log bliver slettet.", 10, 0

cqww_points_text:
    db "QSO-point: %d", 10, 0

cqww_read_mode:
    db "r", 0

cqww_rst_error:
    db "RST skal vaere praecis tre cifre, fx 599.", 10, 0

cqww_rst_prompt:
    db "RST: ", 0

cqww_score_point_format:
    db "%*[^|]|%*[^|]|%*[^|]|%*[^|]|%*[^|]| %d", 0

cqww_search_count_format:
    db 10, "Antal fund: %d", 10, 0

cqww_search_header:
    db 10, "Fundne QSO'er:", 10, 0

cqww_search_no_results:
    db 10, "Ingen QSO'er fundet.", 10, 0

cqww_search_prompt:
    db 10, "Kaldesignal at soege efter: ", 0

cqww_string_format:
    db "%s", 0

cqww_time_format:
    db "%d-%m-%Y %H:%M", 0

cqww_title:
    db 10
    db "=== ASMLog v0.3c CQ WW DX ===", 10
    db "CQ WW DX Contest - CW", 10
    db "Made by Tommy Clemmensen - OZ1THC", 10, 10
    db 0

cqww_write_mode:
    db "w", 0

cqww_zone_error:
    db "Ugyldig CQ Zone. Brug 1-40.", 10, 0

cqww_zone_mult_format:
    db "%s ZONE %s", 10, 0

cqww_zone_prompt:
    db "CQ Zone: ", 0
section .bss
cqww_band:
    resb 8

cqww_call:
    resb 32

cqww_call_pattern:
    resb 48

cqww_country_pattern:
    resb 128

cqww_dupe_buffer:
    resb 256

cqww_dupe_flag:
    resd 1

cqww_is_mm:
    resd 1

cqww_mm_continent:
    resb 8

cqww_mult_buffer:
    resb 256

cqww_newlog_choice:
    resb 4

cqww_qso_points:
    resd 1

cqww_rst:
    resb 8

cqww_score_buffer:
    resb 256

cqww_score_mults:
    resd 1

cqww_score_points:
    resd 1

cqww_score_value:
    resd 1

cqww_search_call:
    resb 32

cqww_search_count:
    resd 1

cqww_time_buffer:
    resb 64

cqww_time_value:
    resq 1

cqww_zone:
    resb 4

cqww_zone_pattern:
    resb 32
	
section .text
; ------------------------------------------------------------
; Beregn CQ WW DX score
; Score = samlede QSO-point * antal multipliers
; ------------------------------------------------------------

calculate_cqww_score:

    push rbx
    sub rsp, 32

    mov dword [cqww_score_points], 0
    mov dword [cqww_score_mults], 0

    ; Summer QSO-point
    lea rcx, [cqww_dx_log_filename]
    lea rdx, [cqww_read_mode]
    call fopen

    test rax, rax
    jz cqww_score_count_mults

    mov rbx, rax

cqww_score_read_qso:

    lea rcx, [cqww_score_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz cqww_score_close_log

    lea rcx, [cqww_score_buffer]
    lea rdx, [cqww_score_point_format]
    lea r8, [cqww_qso_points]
    call sscanf

    cmp eax, 1
    jne cqww_score_read_qso

    mov eax, [cqww_qso_points]
    add [cqww_score_points], eax

    jmp cqww_score_read_qso

cqww_score_close_log:

    mov rcx, rbx
    call fclose

    ; Tael multipliers
cqww_score_count_mults:

    lea rcx, [cqww_mult_filename]
    lea rdx, [cqww_read_mode]
    call fopen

    test rax, rax
    jz cqww_score_finished

    mov rbx, rax

cqww_score_read_mult:

    lea rcx, [cqww_score_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz cqww_score_close_mult

    inc dword [cqww_score_mults]
    jmp cqww_score_read_mult

cqww_score_close_mult:

    mov rcx, rbx
    call fclose

cqww_score_finished:

    mov eax, [cqww_score_points]
    imul eax, [cqww_score_mults]
    mov [cqww_score_value], eax

    add rsp, 32
    pop rbx
    ret

cqww_dx_new_qso:

    sub rsp, 72
	mov dword [cqww_dupe_flag], 0
	mov dword [cqww_is_mm], 0
    lea rcx, [cqww_title]
	call printf

	; Hent aktuel UTC dato og tid
	xor ecx, ecx
	call time

	mov [cqww_time_value], rax

	lea rcx, [cqww_time_value]
	call gmtime

	mov r9, rax
	lea rcx, [cqww_time_buffer]
	mov edx, 64
	lea r8, [cqww_time_format]
	call strftime

cqww_read_call:

    lea rcx, [cqww_call_prompt]
    call printf

    lea rcx, [cqww_call]
    mov rdx, 32
    call gets_s

    lea rcx, [cqww_call]
    mov rdx, 32
    call _strupr_s

	; Kaldesignalet skal indeholde mindst ét bogstav og ét tal
    lea rsi, [cqww_call]
    xor r8d, r8d            ; har bogstav
    xor r9d, r9d            ; har tal

cqww_validate_call:
    mov al, [rsi]
    test al, al
    jz cqww_validate_done

    cmp al, 'A'
    jb cqww_check_digit
    cmp al, 'Z'
    ja cqww_check_digit
    mov r8b, 1

    ; Kopier CQ WW-call til den eksisterende CTY-buffer
    lea rcx, [log_text]
    mov edx, 256
    lea r8, [cqww_call]
    call strcpy_s
   
   
   



cqww_check_digit:
    cmp al, '0'
    jb cqww_validate_next
    cmp al, '9'
    ja cqww_validate_next
    mov r9b, 1

cqww_validate_next:
    inc rsi
    jmp cqww_validate_call

cqww_validate_done:
    test r8b, r8b
    jz cqww_invalid_call

    test r9b, r9b
    jz cqww_invalid_call
    
	; Find land og kontinent i cty.dat
    call lookup_country
    ; Midlertidig test: vis land og kontinent
    lea rcx, [cqww_country_test]
    lea rdx, [cty_match_entity]
    lea r8, [cty_match_continent]
    call printf
	
	

    ; Kontroller om stationen er /MM
    call check_cqww_mm
mov [cqww_is_mm], eax

; Almindeligt kaldesignal gaar direkte til baand
cmp dword [cqww_is_mm], 1
jne cqww_read_band

cqww_read_mm_continent:

    lea rcx, [cqww_string_format]
    lea rdx, [cqww_mm_continent_prompt]
    call printf

    lea rcx, [cqww_mm_continent]
    mov edx, 8
    call gets_s

    ; Konverter til store bogstaver
    lea rcx, [cqww_mm_continent]
    mov edx, 8
    call _strupr_s
	
	    ; EU?
    lea rcx, [cqww_mm_continent]
    lea rdx, [cqww_continent_eu]
    call strcmp
    test eax, eax
    jz cqww_read_band

    ; AF?
    lea rcx, [cqww_mm_continent]
    lea rdx, [cqww_continent_af]
    call strcmp
    test eax, eax
    jz cqww_read_band

    ; AS?
    lea rcx, [cqww_mm_continent]
    lea rdx, [cqww_continent_as]
    call strcmp
    test eax, eax
    jz cqww_read_band

    ; NA?
    lea rcx, [cqww_mm_continent]
    lea rdx, [cqww_continent_na]
    call strcmp
    test eax, eax
    jz cqww_read_band

    ; SA?
    lea rcx, [cqww_mm_continent]
    lea rdx, [cqww_continent_sa]
    call strcmp
    test eax, eax
    jz cqww_read_band

    ; OC?
    lea rcx, [cqww_mm_continent]
    lea rdx, [cqww_continent_oc]
    call strcmp
    test eax, eax
    jz cqww_read_band

    ; Ugyldigt kontinent
    lea rcx, [cqww_string_format]
    lea rdx, [cqww_mm_continent_error]
    call printf

    jmp cqww_read_mm_continent

cqww_read_band:

    lea rcx, [cqww_band_prompt]
    call printf

    lea rcx, [cqww_band]
    mov rdx, 8
    call gets_s

    lea rcx, [cqww_band]
    mov rdx, 8
    call _strupr_s

    ; 160M
    cmp byte [cqww_band], '1'
    jne .check_80
    cmp byte [cqww_band + 1], '6'
    jne .check_15
    cmp byte [cqww_band + 2], '0'
    jne cqww_invalid_band
    cmp byte [cqww_band + 3], 'M'
    jne cqww_invalid_band
    cmp byte [cqww_band + 4], 0
    je cqww_band_ok

.check_80:
    cmp byte [cqww_band], '8'
    jne .check_40
    cmp byte [cqww_band + 1], '0'
    jne cqww_invalid_band
    cmp byte [cqww_band + 2], 'M'
    jne cqww_invalid_band
    cmp byte [cqww_band + 3], 0
    je cqww_band_ok

.check_40:
    cmp byte [cqww_band], '4'
    jne .check_20
    cmp byte [cqww_band + 1], '0'
    jne cqww_invalid_band
    cmp byte [cqww_band + 2], 'M'
    jne cqww_invalid_band
    cmp byte [cqww_band + 3], 0
    je cqww_band_ok

.check_20:
    cmp byte [cqww_band], '2'
    jne .check_15
    cmp byte [cqww_band + 1], '0'
    jne cqww_invalid_band
    cmp byte [cqww_band + 2], 'M'
    jne cqww_invalid_band
    cmp byte [cqww_band + 3], 0
    je cqww_band_ok

.check_15:
    cmp byte [cqww_band], '1'
    jne .check_10
    cmp byte [cqww_band + 1], '5'
    jne cqww_invalid_band
    cmp byte [cqww_band + 2], 'M'
    jne cqww_invalid_band
    cmp byte [cqww_band + 3], 0
    je cqww_band_ok

.check_10:
    cmp byte [cqww_band], '1'
    jne cqww_invalid_band
    cmp byte [cqww_band + 1], '0'
    jne cqww_invalid_band
    cmp byte [cqww_band + 2], 'M'
    jne cqww_invalid_band
    cmp byte [cqww_band + 3], 0
    jne cqww_invalid_band

cqww_band_ok:

    ; Kontroller DUPE nu hvor baade CALL og BAND er kendt
    call check_cqww_dupe
    test eax, eax
    jz cqww_not_dupe

        lea rcx, [cqww_string_format]
    lea rdx, [cqww_dupe_warning]
    call printf

    mov dword [cqww_dupe_flag], 1
    mov dword [cqww_qso_points], 0

    jmp cqww_read_rst

cqww_not_dupe:
    jmp cqww_read_rst
    jmp cqww_read_call
	
cqww_read_rst:

    lea rcx, [cqww_rst_prompt]
    call printf

    lea rcx, [cqww_rst]
    mov rdx, 8
    call gets_s

    ; RST skal vaere praecis 3 cifre
    cmp byte [cqww_rst], '0'
    jb cqww_invalid_rst
    cmp byte [cqww_rst], '9'
    ja cqww_invalid_rst

    cmp byte [cqww_rst + 1], '0'
    jb cqww_invalid_rst
    cmp byte [cqww_rst + 1], '9'
    ja cqww_invalid_rst

    cmp byte [cqww_rst + 2], '0'
    jb cqww_invalid_rst
    cmp byte [cqww_rst + 2], '9'
    ja cqww_invalid_rst

    cmp byte [cqww_rst + 3], 0
    jne cqww_invalid_rst

    ; Gyldigt RST
    jmp cqww_read_zone
	
	cqww_read_zone:

    lea rcx, [cqww_zone_prompt]
    call printf

    lea rcx, [cqww_zone]
    mov rdx, 4
    call gets_s

    ; Foerste tegn skal vaere et tal
    cmp byte [cqww_zone], '0'
    jb cqww_invalid_zone
    cmp byte [cqww_zone], '9'
    ja cqww_invalid_zone

    ; Enkeltciffer: 1-9
    cmp byte [cqww_zone + 1], 0
    je cqww_zone_one_digit

    ; Tocifret zone
    cmp byte [cqww_zone + 1], '0'
    jb cqww_invalid_zone
    cmp byte [cqww_zone + 1], '9'
    ja cqww_invalid_zone

    ; Der maa ikke vaere et tredje tegn
    cmp byte [cqww_zone + 2], 0
    jne cqww_invalid_zone

    ; 10-39 accepteres
    cmp byte [cqww_zone], '1'
    jb cqww_check_40
    cmp byte [cqww_zone], '3'
    jbe cqww_zone_ok

cqww_check_40:
    cmp byte [cqww_zone], '4'
    jne cqww_invalid_zone
    cmp byte [cqww_zone + 1], '0'
    jne cqww_invalid_zone
    jmp cqww_zone_ok

cqww_zone_one_digit:
    cmp byte [cqww_zone], '0'
    je cqww_invalid_zone

cqww_zone_ok:

    ; DUPE maa ikke give multipliers
    cmp dword [cqww_dupe_flag], 1
    je cqww_calculate_points

    ; Kontroller om zone allerede er brugt paa dette baand
    call check_cqww_zone_multiplier

    ; EAX = 1 betyder allerede brugt
    test eax, eax
    jnz cqww_check_country

    ; Ny zone paa dette baand - gem den
    call save_cqww_zone_multiplier

cqww_check_country:

    ; /MM giver kun zone multiplier - ikke country multiplier
    cmp dword [cqww_is_mm], 1
    je cqww_calculate_points

    ; Kontroller om landet allerede er brugt paa dette baand
    call check_cqww_country_multiplier
    ; EAX = 1 betyder allerede brugt
    test eax, eax
    jnz cqww_calculate_points

    ; Nyt land paa dette baand - gem det
    call save_cqww_country_multiplier

    jmp cqww_calculate_points

cqww_calculate_points:

    ; DUPE giver altid 0 point
    cmp dword [cqww_dupe_flag], 1
    jne cqww_calculate_normal_points

    mov dword [cqww_qso_points], 0
    jmp cqww_points_done

cqww_calculate_normal_points:

    ; /MM bruger det indtastede kontinent
    cmp dword [cqww_is_mm], 1
    jne cqww_normal_country_points

    ; /MM i Europa = 1 point for dansk operator
    lea rcx, [cqww_mm_continent]
    lea rdx, [cqww_continent_eu]
    call strcmp

    test eax, eax
jnz cqww_mm_3_points

; /MM i Europa = 1 point
mov dword [cqww_qso_points], 1
jmp cqww_points_done

cqww_mm_3_points:

    ; /MM uden for Europa = 3 point
    mov dword [cqww_qso_points], 3
    jmp cqww_points_done
cqww_normal_country_points:
    ; Samme land som OZ = 0 point
    lea rcx, [cty_match_entity]

    ; Samme land som OZ = 0 point
    lea rcx, [cty_match_entity]
    lea rdx, [cqww_entity_denmark]
    call strcmp

    test eax, eax
    jz cqww_points_same_country

    ; Samme kontinent (EU) = 1 point
    lea rcx, [cty_match_continent]
    lea rdx, [cqww_continent_eu]
    call strcmp

    test eax, eax
    jz cqww_points_same_continent

    ; Andet kontinent = 3 point
    mov dword [cqww_qso_points], 3
    jmp cqww_points_done

cqww_points_same_country:
    mov dword [cqww_qso_points], 0
    jmp cqww_points_done

cqww_points_same_continent:
    mov dword [cqww_qso_points], 1

cqww_points_done:

    lea rcx, [cqww_points_text]
    mov edx, [cqww_qso_points]
    call printf

    jmp cqww_write_log
	
cqww_write_log:

    ; Aabn CQ WW-loggen til tilfoejelse
    lea rcx, [cqww_dx_log_filename]
    lea rdx, [cqww_append_mode]
    call fopen

    test rax, rax
    jz cqww_log_done

    mov rbx, rax

    ; Vaelg normalt format eller DUPE-format
    cmp dword [cqww_dupe_flag], 1
    jne cqww_log_normal_format

    lea rdx, [cqww_dupe_log_format]
    jmp cqww_log_format_ready

cqww_log_normal_format:
    lea rdx, [cqww_log_format]

cqww_log_format_ready:

    mov rcx, rbx
    ; RDX indeholder allerede formatet

    ; 3. argument = DATO/TID
    lea r8, [cqww_time_buffer]

    ; 4. argument = CALL
    lea r9, [cqww_call]

    ; 5. argument = BAND
    lea rax, [cqww_band]
    mov [rsp + 32], rax

    ; 6. argument = RST
    lea rax, [cqww_rst]
    mov [rsp + 40], rax

    ; 7. argument = CQ ZONE
    lea rax, [cqww_zone]
    mov [rsp + 48], rax

    ; 8. argument = POINT
    mov eax, [cqww_qso_points]
    mov [rsp + 56], rax

    call fprintf

    mov rcx, rbx
    call fclose

cqww_log_done:

    add rsp, 72
    ret

cqww_invalid_zone:
    lea rcx, [cqww_zone_error]
    call printf
    jmp cqww_read_zone

cqww_invalid_rst:
    lea rcx, [cqww_rst_error]
    call printf
    jmp cqww_read_rst

cqww_invalid_band:
    lea rcx, [cqww_band_error]
    call printf
    jmp cqww_read_band

cqww_invalid_call:
    lea rcx, [cqww_call_error]
    call printf
    jmp cqww_read_call

    add rsp, 40
    ret
; ------------------------------------------------------------
; Kontroller om CALL allerede findes paa samme baand
; EAX = 1 hvis DUPE, ellers 0
; ------------------------------------------------------------

check_cqww_dupe:

    sub rsp, 40

    ; Byg fx "DL1ABC |"
    lea rcx, [cqww_call_pattern]
    lea rdx, [cqww_field_pattern_format]
    lea r8, [cqww_call]
    call sprintf

    ; Aabn CQ WW-loggen
    lea rcx, [cqww_dx_log_filename]
    lea rdx, [cqww_read_mode]
    call fopen

    test rax, rax
    jz cqww_dupe_no

    mov rbx, rax

cqww_dupe_next_line:

    lea rcx, [cqww_dupe_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz cqww_dupe_eof

    ; Find CALL i linjen
    lea rcx, [cqww_dupe_buffer]
    lea rdx, [cqww_call_pattern]
    call strstr

    test rax, rax
    jz cqww_dupe_next_line

    ; Find BAND i samme linje
    lea rcx, [cqww_dupe_buffer]
    lea rdx, [cqww_band]
    call strstr

    test rax, rax
    jz cqww_dupe_next_line

    ; Samme CALL + BAND
    mov rcx, rbx
    call fclose

    mov eax, 1
    add rsp, 40
    ret

cqww_dupe_eof:

    mov rcx, rbx
    call fclose

cqww_dupe_no:

    xor eax, eax
    add rsp, 40
    ret
	
; ------------------------------------------------------------
; Kontroller om CQ Zone allerede er multiplier paa dette baand
; EAX = 1 hvis allerede brugt
; EAX = 0 hvis ny multiplier
; ------------------------------------------------------------

check_cqww_zone_multiplier:

    sub rsp, 40

    ; Byg fx "20M ZONE 14"
    lea rcx, [cqww_zone_pattern]
    lea rdx, [cqww_zone_mult_format]
    lea r8, [cqww_band]
    lea r9, [cqww_zone]
    call sprintf

    ; Aabn multiplier-filen
    lea rcx, [cqww_mult_filename]
    lea rdx, [cqww_read_mode]
    call fopen

    test rax, rax
    jz cqww_zone_mult_new

    mov rbx, rax

cqww_zone_mult_next_line:

    lea rcx, [cqww_mult_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz cqww_zone_mult_eof

    ; Find fx "20M ZONE 14"
    lea rcx, [cqww_mult_buffer]
    lea rdx, [cqww_zone_pattern]
    call strstr

    test rax, rax
    jz cqww_zone_mult_next_line

    ; Allerede brugt
    mov rcx, rbx
    call fclose

    mov eax, 1
    add rsp, 40
    ret

cqww_zone_mult_eof:

    mov rcx, rbx
    call fclose

cqww_zone_mult_new:

    xor eax, eax
    add rsp, 40
    ret
	
	


; ------------------------------------------------------------
; Gem ny CQ Zone multiplier
; ------------------------------------------------------------

save_cqww_zone_multiplier:

    sub rsp, 40

    ; Aabn multiplier-filen til tilfoejelse
    lea rcx, [cqww_mult_filename]
    lea rdx, [cqww_append_mode]
    call fopen

    test rax, rax
    jz cqww_save_zone_done

    mov rbx, rax

    ; Skriv fx "20M ZONE 14"
    mov rcx, rbx
    lea rdx, [cqww_zone_mult_format]
    lea r8, [cqww_band]
    lea r9, [cqww_zone]
    call fprintf

    mov rcx, rbx
    call fclose

cqww_save_zone_done:

    add rsp, 40
    ret
	
; ------------------------------------------------------------
; Kontroller om land allerede er multiplier paa dette baand
; EAX = 1 hvis allerede brugt
; EAX = 0 hvis nyt land
; ------------------------------------------------------------

check_cqww_country_multiplier:

    sub rsp, 40

    ; Byg fx "20M COUNTRY Fed. Rep. of Germany"
    lea rcx, [cqww_country_pattern]
    lea rdx, [cqww_country_mult_format]
    lea r8, [cqww_band]
    lea r9, [cty_match_entity]
    call sprintf

    ; Aabn multiplier-filen
    lea rcx, [cqww_mult_filename]
    lea rdx, [cqww_read_mode]
    call fopen

    test rax, rax
    jz cqww_country_mult_new

    mov rbx, rax

cqww_country_mult_next_line:

    lea rcx, [cqww_mult_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz cqww_country_mult_eof

    lea rcx, [cqww_mult_buffer]
    lea rdx, [cqww_country_pattern]
    call strstr

    test rax, rax
    jz cqww_country_mult_next_line

    ; Landet er allerede brugt paa dette baand
    mov rcx, rbx
    call fclose

    mov eax, 1
    add rsp, 40
    ret

cqww_country_mult_eof:

    mov rcx, rbx
    call fclose

cqww_country_mult_new:

    xor eax, eax
    add rsp, 40
    ret
	
; ------------------------------------------------------------
; Gem nyt country multiplier
; ------------------------------------------------------------

save_cqww_country_multiplier:

    sub rsp, 40

    ; Aabn multiplier-filen til tilfoejelse
    lea rcx, [cqww_mult_filename]
    lea rdx, [cqww_append_mode]
    call fopen

    test rax, rax
    jz cqww_save_country_done

    mov rbx, rax

    ; Skriv fx "20M COUNTRY Fed. Rep. of Germany"
    mov rcx, rbx
    lea rdx, [cqww_country_mult_format]
    lea r8, [cqww_band]
    lea r9, [cty_match_entity]
    call fprintf

    mov rcx, rbx
    call fclose

cqww_save_country_done:

    add rsp, 40
    ret
	
; ------------------------------------------------------------
; Kontroller om kaldesignalet er /MM
; EAX = 1 hvis /MM, ellers 0
; ------------------------------------------------------------

check_cqww_mm:

    lea rsi, [cqww_call]

cqww_mm_scan:

    cmp byte [rsi], 0
    je cqww_mm_no

    cmp byte [rsi], '/'
    jne cqww_mm_next

    cmp byte [rsi + 1], 'M'
    jne cqww_mm_next

    cmp byte [rsi + 2], 'M'
    jne cqww_mm_next

    ; /MM skal vaere slutningen af kaldesignalet
    cmp byte [rsi + 3], 0
    jne cqww_mm_next

    mov eax, 1
    ret

cqww_mm_next:

    inc rsi
    jmp cqww_mm_scan

cqww_mm_no:

    xor eax, eax
    ret
; ------------------------------------------------------------
; Vis CQ WW QSO-log
; ------------------------------------------------------------

cqww_dx_show_log:

    sub rsp, 40

    ; Aabn CQ WW-loggen
    lea rcx, [cqww_dx_log_filename]
    lea rdx, [cqww_read_mode]
    call fopen

    test rax, rax
    jz cqww_show_log_done

    mov rbx, rax

cqww_show_log_next:

    lea rcx, [cqww_dupe_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz cqww_show_log_close

    ; Vis linjen
    lea rcx, [cqww_string_format]
    lea rdx, [cqww_dupe_buffer]
    call printf

    jmp cqww_show_log_next

cqww_show_log_close:

    mov rcx, rbx
    call fclose

cqww_show_log_done:

    add rsp, 40
    ret
; ------------------------------------------------------------
; Soeg i CQ WW QSO-log
; ------------------------------------------------------------

cqww_dx_search_log:

    sub rsp, 40

    ; Spoerg efter kaldesignal
    lea rcx, [cqww_search_prompt]
    call printf

    lea rcx, [cqww_search_call]
    mov edx, 32
    call gets_s

    ; Lav kaldesignalet til store bogstaver
    lea rcx, [cqww_search_call]
    mov edx, 32
    call _strupr_s

    ; Nulstil antal fund
    mov dword [cqww_search_count], 0

    ; Aabn CQ WW-loggen
    lea rcx, [cqww_dx_log_filename]
    lea rdx, [cqww_read_mode]
    call fopen

    test rax, rax
    jz cqww_search_no_match

    mov rbx, rax

cqww_search_next_line:

    lea rcx, [cqww_dupe_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz cqww_search_done

    lea rsi, [cqww_dupe_buffer]

cqww_search_find_separator:
    cmp byte [rsi], 0
    je cqww_search_next_line

    cmp byte [rsi], '|'
    je cqww_search_after_separator

    inc rsi
    jmp cqww_search_find_separator

cqww_search_after_separator:
    add rsi, 2

    ; Kaldesignalet skal staa praecist foerst i linjen
    lea rdi, [cqww_search_call]

cqww_search_compare_call:

    mov al, [rdi]

    ; Slut paa det soegte kaldesignal
    cmp al, 0
    je cqww_search_check_separator

    cmp al, [rsi]
    jne cqww_search_next_line

    inc rsi
    inc rdi
    jmp cqww_search_compare_call

cqww_search_check_separator:

    ; Efter kaldesignalet skal logformatets mellemrum komme.
    ; Dermed matcher DL1ABC ikke DL1ABC/MM.
    cmp byte [rsi], ' '
    jne cqww_search_next_line

    ; Vis overskrift kun ved foerste fund
    cmp dword [cqww_search_count], 0
    jne cqww_search_print_line

    lea rcx, [cqww_search_header]
    call printf

cqww_search_print_line:

    lea rcx, [cqww_string_format]
    lea rdx, [cqww_dupe_buffer]
    call printf

    inc dword [cqww_search_count]
    jmp cqww_search_next_line

cqww_search_done:

    mov rcx, rbx
    call fclose

    cmp dword [cqww_search_count], 0
    je cqww_search_no_match

    lea rcx, [cqww_search_count_format]
    mov edx, [cqww_search_count]
    call printf

    add rsp, 40
    ret

cqww_search_no_match:

    lea rcx, [cqww_search_no_results]
    call printf

    add rsp, 40
    ret
; ------------------------------------------------------------
; Start ny CQ WW-log
; ------------------------------------------------------------

cqww_dx_new_log:

    sub rsp, 40

    ; Advarsel
    lea rcx, [cqww_newlog_warning]
    call printf

    lea rcx, [cqww_newlog_prompt]
    call printf
	
	; Fjern eventuelt Enter fra menuvalget
	call getchar

    ; Laes J/N
    lea rcx, [cqww_newlog_choice]
    mov edx, 4
    call gets_s

    ; Accepter J eller j
    cmp byte [cqww_newlog_choice], 'J'
    je cqww_newlog_confirmed

    cmp byte [cqww_newlog_choice], 'j'
    je cqww_newlog_confirmed

    ; Alt andet = annuller
    add rsp, 40
    ret

cqww_newlog_confirmed:

    ; Toem QSO-loggen
    lea rcx, [cqww_dx_log_filename]
    lea rdx, [cqww_write_mode]
    call fopen

    test rax, rax
    jz cqww_newlog_reset_mult

    mov rcx, rax
    call fclose

cqww_newlog_reset_mult:

    ; Toem filen med brugte multipliers
    lea rcx, [cqww_mult_filename]
    lea rdx, [cqww_write_mode]
    call fopen

    test rax, rax
    jz cqww_newlog_done_label

    mov rcx, rax
    call fclose

cqww_newlog_done_label:

    lea rcx, [cqww_newlog_done]
    call printf

    add rsp, 40
    ret
