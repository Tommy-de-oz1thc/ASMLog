bits 64
default rel

global check_cqww_dx_cabrillo

extern atoi
extern cw_training_minutes

extern cty_match_entity
extern fclose
extern fgets
extern fprintf
extern fopen
extern lookup_country
extern log_text
extern memset
extern printf
extern rewind
extern settings_callsign
extern sscanf
extern strcmp
extern strcpy_s
extern strncmp


extern strstr




section .data

append_mode db "a", 0
band_ok_text db "BAND OK", 10, 0
band_error_text db "BAND FEJL", 10, 0
claimed_score_text db "CLAIMED-SCORE: ", 0
date_test_format db "HIGHSCORE DATO: %s", 10, 0
dupe_text db "DUPE", 0
facit_cqww_dx_cabrillo_filename db "facit/facit_cqww_dx.cbr", 0
facit_cqww_dx_log_filename:
    db "facit/facit_cqww_dx_log.txt", 0
facit_points_format db "%*[^|]|%*[^|]|%*[^|]|%*[^|]|%*[^|]| %d", 0
facit_qso_test_format db "FACIT: %s", 0
highscore_format db "%s | CQWW DX CW | %s | Claimed: %d | Real: %d | %d min", 10, 0
mm_suffix db "/MM", 0
point_text db " point", 0
read_mode db "r", 0
real_score_format db "REAL SCORE: %d", 10, 0
real_test_format db "REAL TEST: point=%d mult=%d", 10, 0
qso_error_text db "QSO FEJL", 10, 0
qso_ok_text db "QSO OK", 10, 0
qso_text db "QSO:", 0
cabrillo_qso_format db "QSO: %d %*s %*s %*s %*s %*s %*s %31s %*s %d", 0
cqww_dx_cabrillo_filename db "log/cqww_dx.cbr", 0

cqww_dx_highscore_filename db "highscore/cqww_dx_highscore.txt", 0
cqww_dx_log_filename db "log/cqww_dx_log.txt", 0
cqww_dx_log_test_format db "LOG:   %s", 0

cqww_dx_qso_test_format db "cqww_dx:   %s", 0



section .bss

cqww_dx_band     resd 1
cqww_dx_band_index resd 1
cqww_dx_buffer resb 256
cqww_dx_call     resb 32


cqww_dx_claimed_score resd 1
cqww_dx_country_mult_count resd 6
cqww_dx_country_mult_index resd 1

cqww_dx_country_mult_table resb 153600

cqww_dx_file resq 1
cqww_dx_highscore_date resb 11
cqww_dx_highscore_file resq 1
cqww_dx_log_buffer resb 256
cqww_dx_log_file resq 1
cqww_dx_real_mults resd 1
cqww_dx_real_points resd 1
cqww_dx_real_score resd 1
cqww_dx_qso_buffer resb 256
cqww_dx_zone     resd 1
cqww_dx_zone_mult_table resb 240
facit_band       resd 1
facit_call       resb 32
facit_zone       resd 1


facit_qso_buffer resb 256
facit_qso_points resd 1
facit_cqww_dx_file resq 1
facit_cqww_dx_log_buffer resb 256
facit_cqww_dx_log_file   resq 1
section .text

check_cqww_dx_cabrillo:

    push rbx
    sub rsp, 64

    ; Nulstil filhaandtag
    mov qword [cqww_dx_file], 0
    mov qword [cqww_dx_log_file], 0
    mov qword [facit_cqww_dx_file], 0
    mov qword [facit_cqww_dx_log_file], 0
    mov qword [cqww_dx_highscore_file], 0

    ; Nulstil Real score-data
    mov dword [cqww_dx_real_points], 0
    mov dword [cqww_dx_real_mults], 0
    mov byte [cqww_dx_highscore_date], 0

    ; Nulstil CQ-zone-multiplier-tabellen
    lea rcx, [cqww_dx_zone_mult_table]
    xor edx, edx
    mov r8d, 240
    call memset
	
    ; Nulstil DXCC-taellere for alle seks baand
    lea rcx, [cqww_dx_country_mult_count]
    xor edx, edx
    mov r8d, 24
    call memset

    lea rcx, [cqww_dx_country_mult_table]
    xor edx, edx
    mov r8d, 153600
    call memset

   
    ; Aabn brugerens cqww_dx Cabrillo
    lea rcx, [cqww_dx_cabrillo_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .done

    mov [cqww_dx_file], rax

    ; Laes claimed score fra brugerens Cabrillo
    mov rcx, [cqww_dx_file]
    call read_claimed_score
    mov [cqww_dx_claimed_score], eax
	
    ; Start forfra i brugerens Cabrillo
    mov rcx, [cqww_dx_file]
    call rewind


    ; Aabn facit cqww_dx Cabrillo
    lea rcx, [facit_cqww_dx_cabrillo_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .close_cqww_dx

    mov [facit_cqww_dx_file], rax

    ; Aabn CQ WW DX facit-tekstlog
    lea rcx, [facit_cqww_dx_log_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .close_files

    mov [facit_cqww_dx_log_file], rax

    ; Aabn brugerens cqww_dx-log
    lea rcx, [cqww_dx_log_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .show_real_test

    mov [cqww_dx_log_file], rax
	
.read_log_loop:

    ; Laes naeste QSO fra CQ WW DX facit-tekstlog
    lea rcx, [facit_cqww_dx_log_buffer]
    mov edx, 256
    mov r8, [facit_cqww_dx_log_file]
    call fgets

    test rax, rax
    jz .show_real_test

    ; Laes naeste linje fra brugerens cqww_dx-log
    lea rcx, [cqww_dx_log_buffer]
    mov edx, 256
    mov r8, [cqww_dx_log_file]
    call fgets

        test rax, rax
    jz .show_real_test

    ; Gem dato fra foerste loglinje
    cmp byte [cqww_dx_highscore_date], 0
    jne .date_done

    mov rax, [cqww_dx_log_buffer]
    mov [cqww_dx_highscore_date], rax

    mov ax, [cqww_dx_log_buffer + 8]
    mov [cqww_dx_highscore_date + 8], ax

    mov byte [cqww_dx_highscore_date + 10], 0

.date_done:

    ; Vis linjen
    lea rcx, [cqww_dx_log_test_format]
    lea rdx, [cqww_dx_log_buffer]
    call printf

   

    ; Find foerste QSO i brugerens Cabrillo
    mov rcx, [cqww_dx_file]
    lea rdx, [cqww_dx_qso_buffer]
    call read_first_qso

    test eax, eax
    jz .show_real_test

    ; Vis brugerens QSO
    lea rcx, [cqww_dx_qso_test_format]
    lea rdx, [cqww_dx_qso_buffer]
    call printf

    ; Find foerste QSO i facit Cabrillo
    mov rcx, [facit_cqww_dx_file]
    lea rdx, [facit_qso_buffer]
    call read_first_qso

    test eax, eax
    jz .show_real_test

    ; Vis facit QSO
    lea rcx, [facit_qso_test_format]
    lea rdx, [facit_qso_buffer]
    call printf
	
    ; Nulstil facits Cabrillo-felter
    mov dword [facit_band], 0
    mov byte [facit_call], 0
    mov dword [facit_zone], 0

    ; Laes frekvens, kaldesignal og CQ-zone fra facit
    lea rcx, [facit_qso_buffer]
    lea rdx, [cabrillo_qso_format]
    lea r8, [facit_band]
    lea r9, [facit_call]

    ; 5. argument: CQ-zone
    lea rax, [facit_zone]
    mov [rsp + 32], rax

    call sscanf

    ; Alle tre felter skal vaere laest
    cmp eax, 3
    jne .qso_error

    ; Nulstil brugerens Cabrillo-felter
    mov dword [cqww_dx_band], 0
    mov byte [cqww_dx_call], 0
    mov dword [cqww_dx_zone], 0

    ; Laes frekvens, kaldesignal og CQ-zone
    lea rcx, [cqww_dx_qso_buffer]
    lea rdx, [cabrillo_qso_format]
    lea r8, [cqww_dx_band]
    lea r9, [cqww_dx_call]

    ; 5. argument: CQ-zone
    lea rax, [cqww_dx_zone]
    mov [rsp + 32], rax

    call sscanf

    ; Alle tre felter skal vaere laest
    cmp eax, 3
    jne .qso_error

    ; Sammenlign frekvens
    mov eax, [cqww_dx_band]
    cmp eax, [facit_band]
    jne .qso_error

    ; Sammenlign kaldesignal
    lea rcx, [cqww_dx_call]
    lea rdx, [facit_call]
    call strcmp

    test eax, eax
    jne .qso_error

    ; Sammenlign CQ-zone
    mov eax, [cqww_dx_zone]
    cmp eax, [facit_zone]
    jne .qso_error

    ; QSO er korrekt
    lea rcx, [qso_ok_text]
    call printf

    ; DUPE i facit giver ingen point eller multipliers
    lea rcx, [facit_cqww_dx_log_buffer]
    lea rdx, [dupe_text]
    call strstr

    test rax, rax
    jnz .qso_done

    ; Nulstil point for denne QSO
    mov dword [facit_qso_points], 0

    ; Laes point fra facit-tekstloggen
    lea rcx, [facit_cqww_dx_log_buffer]
    lea rdx, [facit_points_format]
    lea r8, [facit_qso_points]
    call sscanf

    ; Der skal vaere laest praecis et tal
    cmp eax, 1
    jne .qso_done

    ; Kontroller gyldige CQ WW DX-point
    mov eax, [facit_qso_points]
    cmp eax, 0
    je .points_ok
    cmp eax, 1
    je .points_ok
    cmp eax, 3
    jne .qso_done

.points_ok:
    add [cqww_dx_real_points], eax
	
.check_mult:

    ; Find contestbaand ud fra Cabrillo-frekvens
    mov eax, [cqww_dx_band]

    cmp eax, 1800
    jb .qso_done
    cmp eax, 2000
    jb .band_160m

    cmp eax, 3500
    jb .qso_done
    cmp eax, 4000
    jb .band_80m

    cmp eax, 7000
    jb .qso_done
    cmp eax, 7300
    jb .band_40m

    cmp eax, 14000
    jb .qso_done
    cmp eax, 14350
    jb .band_20m

    cmp eax, 21000
    jb .qso_done
    cmp eax, 21450
    jb .band_15m

    cmp eax, 28000
    jb .qso_done
    cmp eax, 29700
    jb .band_10m

    jmp .qso_done

.band_160m:
    mov dword [cqww_dx_band_index], 0
    jmp .band_found

.band_80m:
    mov dword [cqww_dx_band_index], 1
    jmp .band_found

.band_40m:
    mov dword [cqww_dx_band_index], 2
    jmp .band_found

.band_20m:
    mov dword [cqww_dx_band_index], 3
    jmp .band_found

.band_15m:
    mov dword [cqww_dx_band_index], 4
    jmp .band_found

.band_10m:
    mov dword [cqww_dx_band_index], 5

.band_found:

    ; Kontroller gyldig CQ-zone (1-40)
    mov eax, [cqww_dx_zone]
    cmp eax, 1
    jb .qso_done
    cmp eax, 40
    ja .qso_done

    ; Beregn tabelindeks
    dec eax
    mov ecx, [cqww_dx_band_index]
    imul ecx, ecx, 40
    add ecx, eax

    ; Er zonen allerede registreret paa dette baand?
    lea rdx, [cqww_dx_zone_mult_table]
    cmp byte [rdx + rcx], 0
    jne .check_country_mult

    ; Registrer ny zone-multiplier
    mov byte [rdx + rcx], 1
    inc dword [cqww_dx_real_mults]

.check_country_mult:

    ; /MM giver ikke DXCC-multiplier
    lea rcx, [cqww_dx_call]
    lea rdx, [mm_suffix]
    call strstr

    test rax, rax
    jnz .qso_done

    ; Find DXCC-land via cty.dat
    lea rcx, [cqww_dx_call]
    call lookup_country

    ; Kontroller at landet blev fundet
    cmp byte [cty_match_entity], 0
    je .qso_done

    ; Start ved foerste land paa det aktuelle baand
    mov dword [cqww_dx_country_mult_index], 0

.country_search:

    ; Find antal registrerede lande paa baandet
    mov eax, [cqww_dx_band_index]
    lea rdx, [cqww_dx_country_mult_count]
    mov ecx, [rdx + rax * 4]

    ; Alle eksisterende lande er undersoegt
    mov eax, [cqww_dx_country_mult_index]
    cmp eax, ecx
    jae .country_new

    ; Beregn postnummer: baand * 400 + index
    mov eax, [cqww_dx_band_index]
    imul eax, eax, 400
    add eax, [cqww_dx_country_mult_index]

    ; Hver landepost fylder 64 bytes
    shl eax, 6
    lea rdx, [cqww_dx_country_mult_table]
    add rdx, rax

    ; Sammenlign DXCC-land
    lea rcx, [cty_match_entity]
    call strcmp

    ; Landet er allerede registreret paa baandet
    test eax, eax
    jz .qso_done

    ; Undersoeg naeste land
    inc dword [cqww_dx_country_mult_index]
    jmp .country_search

.country_new:

    ; Maksimalt 400 DXCC-lande pr. baand
    mov eax, [cqww_dx_band_index]
    lea rdx, [cqww_dx_country_mult_count]
    mov ecx, [rdx + rax * 4]

    cmp ecx, 400
    jae .qso_done

    ; Beregn postnummer: baand * 400 + antal lande
    imul eax, eax, 400
    add eax, ecx

    ; Hver post fylder 64 bytes
    shl eax, 6

    lea rdx, [cqww_dx_country_mult_table]
    add rdx, rax

    

    mov rcx, rdx
    mov edx, 64
    lea r8, [cty_match_entity]
    call strcpy_s

    ; Kontroller at kopieringen lykkedes
    test eax, eax
    jnz .qso_done

    ; Registrer landet paa det aktuelle baand
    mov eax, [cqww_dx_band_index]
    lea rdx, [cqww_dx_country_mult_count]
    inc dword [rdx + rax * 4]

    ; En ny DXCC-multiplier
    inc dword [cqww_dx_real_mults]

    jmp .qso_done
	
.qso_error:

    ; QSO afviger fra facit
    lea rcx, [qso_error_text]
    call printf

.qso_done:

    ; Fortsaet med naeste QSO
    jmp .read_log_loop
	
	  
.show_real_test:

    lea rcx, [real_test_format]
    mov edx, [cqww_dx_real_points]
    mov r8d, [cqww_dx_real_mults]
    call printf

    ; Beregn Real score
    mov eax, [cqww_dx_real_points]
    imul eax, [cqww_dx_real_mults]
    mov [cqww_dx_real_score], eax

    ; Vis Real score
    lea rcx, [real_score_format]
    mov edx, eax
    call printf

    ; Vis highscore-dato
    lea rcx, [date_test_format]
    lea rdx, [cqww_dx_highscore_date]
    call printf

    ; Aabn cqww_dx highscore-fil i append mode
    lea rcx, [cqww_dx_highscore_filename]
    lea rdx, [append_mode]
    call fopen

    test rax, rax
    jz .close_files

    mov [cqww_dx_highscore_file], rax

    ; Skriv highscore
    mov rcx, [cqww_dx_highscore_file]
    lea rdx, [highscore_format]
    lea r8, [cqww_dx_highscore_date]
    lea r9, [settings_callsign]

    ; 5. argument = Claimed score
    mov eax, [cqww_dx_claimed_score]
    mov [rsp + 32], rax

    ; 6. argument = Real score
    mov eax, [cqww_dx_real_score]
    mov [rsp + 40], rax

    ; 7. argument = CW-traeningstid
    mov eax, [cw_training_minutes]
    mov [rsp + 48], rax

    call fprintf
    ; Luk highscore-filen
    mov rcx, [cqww_dx_highscore_file]
    call fclose
    mov qword [cqww_dx_highscore_file], 0

    jmp .close_files
	
.close_files:

    ; Luk brugerens CQ WW DX-log, hvis den er aabnet
    mov rcx, [cqww_dx_log_file]
    test rcx, rcx
    jz .skip_cqww_log_close
    call fclose

.skip_cqww_log_close:
	
    ; Luk CQ WW DX facit-tekstlog
    mov rcx, [facit_cqww_dx_log_file]
    test rcx, rcx
    jz .skip_facit_log_close
    call fclose

.skip_facit_log_close:
	
    ; Luk facit Cabrillo
    mov rcx, [facit_cqww_dx_file]
    call fclose

.close_cqww_dx:

    ; Luk brugerens Cabrillo
    mov rcx, [cqww_dx_file]
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
    lea rcx, [cqww_dx_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .not_found

    ; Find CLAIMED-SCORE:
    lea rcx, [cqww_dx_buffer]
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