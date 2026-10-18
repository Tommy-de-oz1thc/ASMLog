bits 64
default rel

global create_cabrillo_wpx_cw
global create_facit_cabrillo_wpx_cw

extern fclose
extern fgets
extern fopen
extern fprintf
extern printf
extern settings_address
extern settings_city
extern settings_email
extern settings_name
extern settings_power
extern settings_zip
extern strstr


section .data

cabrillo_address db "ADDRESS: %s", 10, 0

cabrillo_address_city db "ADDRESS-CITY: %s", 10, 0

cabrillo_address_postalcode db "ADDRESS-POSTALCODE: %s", 10, 0

cabrillo_assisted db "CATEGORY-ASSISTED: NON-ASSISTED", 10, 0

cabrillo_band db "CATEGORY-BAND: ALL", 10, 0

cabrillo_callsign db "CALLSIGN: %s", 10, 0

cabrillo_claimed_score db "CLAIMED-SCORE: %u", 10, 0

cabrillo_contest db "CONTEST: CQ-WPX-CW", 10, 0

cabrillo_created db "CREATED-BY: ASMLog WPX", 10, 0

cabrillo_end db "END-OF-LOG:", 10, 0

cabrillo_email db "EMAIL: %s", 10, 0

cabrillo_filename db "log/wpx.cbr", 0
facit_cabrillo_filename db "facit/facit_wpx.cbr", 0
facit_wpx_log_filename db "facit/facit_wpx_log.txt", 0
cabrillo_location db "LOCATION: DX", 10, 0

cabrillo_mode db "CATEGORY-MODE: CW", 10, 0

cabrillo_name db "NAME: %s", 10, 0

cabrillo_operator db "CATEGORY-OPERATOR: SINGLE-OP", 10, 0

cabrillo_overlay db "CATEGORY-OVERLAY: NONE", 10, 0

cabrillo_power db "CATEGORY-POWER: %s", 10, 0

cabrillo_qso_format db "QSO: %s %s %s %s %s %s %s %s 599 %s", 10, 0

cabrillo_saved db 10, "Cabrillo-log er oprettet.", 10
               db "Filen er gemt som: log/wpx.cbr", 10, 0

cabrillo_start db "START-OF-LOG: 3.0", 10, 0

cabrillo_transmitter db "CATEGORY-TRANSMITTER: ONE", 10, 0
facit_mult_text db "MULT", 0
facit_point_text db " point", 0
freq10 db "28000", 0
freq15 db "21000", 0
freq160 db "1800", 0
freq20 db "14000", 0
freq40 db "7000", 0
freq80 db "3500", 0

read_mode db "r", 0

test_freq db "Cabrillo-frekvens: %s", 10, 0

test_nr_recv3 db "Modtaget nr. Cabrillo: %s", 10, 0

write_mode db "w", 0

section .bss

cabrillo_band_text resb 8
cabrillo_buffer resb 256
cabrillo_call resb 32
cabrillo_date resb 11
cabrillo_freq resb 6
cabrillo_mode_text resb 8
cabrillo_nr_recv resb 8
cabrillo_nr_recv3 resb 8
cabrillo_nr_sent resb 8
cabrillo_rst_sent resb 8
cabrillo_score resd 1
cabrillo_time resb 5
facit_cabrillo_mult_count resd 1
facit_cabrillo_score resd 1

section .text

create_cabrillo_wpx_cw:

    push rbx
	push r12
	push r13
	push r14
	push rsi
	push rdi
	sub rsp, 88
	; R8D = WPX-score fra ASMLog.asm
    mov [cabrillo_score], r8d
	; RCX = eget kaldesignal
	; RDX = logfilens navn
	mov r12, rcx
	mov r13, rdx

    ; Opret/overskriv log/wpx.cbr
    lea rcx, [cabrillo_filename]
    lea rdx, [write_mode]
    call fopen

    ; Kunne filen ikke åbnes?
    test rax, rax
    jz cabrillo_done

    ; Gem fil-pointeren
    mov rbx, rax
	; Aabn den eksisterende QSO-log til laesning
	mov rcx, r13
	lea rdx, [read_mode]
	call fopen

	; Kunne logfilen ikke aabnes?
	test rax, rax
	jz cabrillo_close_output

	; Gem inputfilens fil-pointer
	mov r14, rax
   
   ; Skriv START-OF-LOG
	mov rcx, rbx
	lea rdx, [cabrillo_start]
	call fprintf

	; Skriv contest
	mov rcx, rbx
	lea rdx, [cabrillo_contest]
	call fprintf

    ; Skriv eget kaldesignal
    mov rcx, rbx
    lea rdx, [cabrillo_callsign]
    mov r8, r12
    call fprintf

    ; Skriv navn
    mov rcx, rbx
    lea rdx, [cabrillo_name]
    lea r8, [settings_name]
    call fprintf

    ; Skriv e-mail
    mov rcx, rbx
    lea rdx, [cabrillo_email]
    lea r8, [settings_email]
    call fprintf

    ; Skriv adresse
    mov rcx, rbx
    lea rdx, [cabrillo_address]
    lea r8, [settings_address]
    call fprintf
	
	; Skriv postnummer
    mov rcx, rbx
    lea rdx, [cabrillo_address_postalcode]
    lea r8, [settings_zip]
    call fprintf
	
	    ; Skriv by
    mov rcx, rbx
    lea rdx, [cabrillo_address_city]
    lea r8, [settings_city]
    call fprintf
	
	; Skriv location
	mov rcx, rbx
	lea rdx, [cabrillo_location]
	call fprintf

	; Skriv logger-program
	mov rcx, rbx
	lea rdx, [cabrillo_created]
	call fprintf

	; Skriv operator-kategori
	mov rcx, rbx
	lea rdx, [cabrillo_operator]
	call fprintf

	; Skriv assisted-kategori
	mov rcx, rbx
	lea rdx, [cabrillo_assisted]
	call fprintf

	; Skriv baand-kategori
	mov rcx, rbx
	lea rdx, [cabrillo_band]
	call fprintf

	; Skriv mode-kategori
	mov rcx, rbx
	lea rdx, [cabrillo_mode]
	call fprintf

	; Skriv effekt-kategori
	mov rcx, rbx
    lea rdx, [cabrillo_power]
    lea r8, [settings_power]
    call fprintf

	; Skriv transmitter-kategori
	mov rcx, rbx
	lea rdx, [cabrillo_transmitter]
	call fprintf

	; Skriv overlay-kategori
	mov rcx, rbx
	lea rdx, [cabrillo_overlay]
	call fprintf
	
	; Skriv CLAIMED-SCORE
    mov rcx, rbx
    lea rdx, [cabrillo_claimed_score]
    mov r8d, [cabrillo_score]
    call fprintf
	
cabrillo_read_loop:

	; Laes foerste linje fra log.txt
	lea rcx, [cabrillo_buffer]
	mov edx, 256
	mov r8, r14
	call fgets

; Hvis filen er tom, fortsaet uden QSO
	test rax, rax
	jz cabrillo_no_qso

	
; Konverter DD-MM-YYYY til YYYY-MM-DD

	mov al, [cabrillo_buffer + 6]
	mov [cabrillo_date + 0], al

	mov al, [cabrillo_buffer + 7]
	mov [cabrillo_date + 1], al

	mov al, [cabrillo_buffer + 8]
	mov [cabrillo_date + 2], al

	mov al, [cabrillo_buffer + 9]
	mov [cabrillo_date + 3], al

	mov byte [cabrillo_date + 4], '-'

	mov al, [cabrillo_buffer + 3]
	mov [cabrillo_date + 5], al

	mov al, [cabrillo_buffer + 4]
	mov [cabrillo_date + 6], al

	mov byte [cabrillo_date + 7], '-'

	mov al, [cabrillo_buffer + 0]
	mov [cabrillo_date + 8], al

	mov al, [cabrillo_buffer + 1]
	mov [cabrillo_date + 9], al

	mov byte [cabrillo_date + 10], 0

	

; Konverter HH:MM til HHMM

	mov al, [cabrillo_buffer + 11]
	mov [cabrillo_time + 0], al

	mov al, [cabrillo_buffer + 12]
	mov [cabrillo_time + 1], al

	mov al, [cabrillo_buffer + 14]
	mov [cabrillo_time + 2], al

	mov al, [cabrillo_buffer + 15]
	mov [cabrillo_time + 3], al

	mov byte [cabrillo_time + 4], 0

	

; Find foerste | efter dato/tid
lea rsi, [cabrillo_buffer]

find_first_bar:
    cmp byte [rsi], '|'
    je first_bar_found
    cmp byte [rsi], 0
    je cabrillo_no_qso
    inc rsi
    jmp find_first_bar

first_bar_found:
    inc rsi

    ; Spring mellemrum over
skip_band_spaces:
    cmp byte [rsi], ' '
    jne copy_band_start
    inc rsi
    jmp skip_band_spaces

copy_band_start:
    lea rdi, [cabrillo_band_text]

copy_band:
    mov al, [rsi]

    cmp al, '|'
    je band_finished

    cmp al, ' '
    je band_finished

    cmp al, 0
    je band_finished

    mov [rdi], al
    inc rdi
    inc rsi
    jmp copy_band

band_finished:
    mov byte [rdi], 0

    

	; Test den generelle feltfunktion med felt 2 = CW
	lea rcx, [cabrillo_buffer]
	mov edx, 2
	lea r8, [cabrillo_mode_text]
	call get_log_field

	

	; Felt 3 = modtaget kaldesignal
	lea rcx, [cabrillo_buffer]
	mov edx, 3
	lea r8, [cabrillo_call]
	call get_log_field

	

	; Felt 4 = sendt RST
	lea rcx, [cabrillo_buffer]
	mov edx, 4
	lea r8, [cabrillo_rst_sent]
	call get_log_field

	

	; Felt 5 = sendt serienummer
	lea rcx, [cabrillo_buffer]
	mov edx, 5
	lea r8, [cabrillo_nr_sent]
	call get_log_field

	

	; Felt 6 = modtaget serienummer
	lea rcx, [cabrillo_buffer]
	mov edx, 6
	lea r8, [cabrillo_nr_recv]
	call get_log_field

	; Normaliser modtaget serienummer til mindst 3 cifre

; 1 ciffer?
cmp byte [cabrillo_nr_recv + 1], 0
jne check_recv_two

; f.eks. 1 -> 001
mov byte [cabrillo_nr_recv3 + 0], '0'
mov byte [cabrillo_nr_recv3 + 1], '0'

mov al, [cabrillo_nr_recv + 0]
mov [cabrillo_nr_recv3 + 2], al

mov byte [cabrillo_nr_recv3 + 3], 0
jmp nr_recv_done


check_recv_two:

; 2 cifre?
cmp byte [cabrillo_nr_recv + 2], 0
jne recv_three_or_more

; f.eks. 12 -> 012
mov byte [cabrillo_nr_recv3 + 0], '0'

mov al, [cabrillo_nr_recv + 0]
mov [cabrillo_nr_recv3 + 1], al

mov al, [cabrillo_nr_recv + 1]
mov [cabrillo_nr_recv3 + 2], al

mov byte [cabrillo_nr_recv3 + 3], 0
jmp nr_recv_done


recv_three_or_more:

; 3 eller flere cifre: kopier hele nummeret
lea rsi, [cabrillo_nr_recv]
lea rdi, [cabrillo_nr_recv3]

copy_recv_number:
mov al, [rsi]
mov [rdi], al

inc rsi
inc rdi

test al, al
jnz copy_recv_number


nr_recv_done:

	
	; Konverter baand til Cabrillo-frekvens
	lea rcx, [cabrillo_band_text]
	lea rdx, [cabrillo_freq]
	call get_cabrillo_freq

	

	
	

	

	; Skriv foerste QSO som Cabrillo
	mov rcx, rbx
	lea rdx, [cabrillo_qso_format]
	lea r8,  [cabrillo_freq]
	lea r9,  [cabrillo_mode_text]

	lea rax, [cabrillo_date]
	mov [rsp + 32], rax

	lea rax, [cabrillo_time]
	mov [rsp + 40], rax

	mov [rsp + 48], r12

	lea rax, [cabrillo_rst_sent]
	mov [rsp + 56], rax

	lea rax, [cabrillo_nr_sent]
	mov [rsp + 64], rax

	lea rax, [cabrillo_call]
	mov [rsp + 72], rax

	lea rax, [cabrillo_nr_recv3]
	mov [rsp + 80], rax

	call fprintf
	
	jmp cabrillo_read_loop

cabrillo_no_qso:

    ; Skriv END-OF-LOG
    mov rcx, rbx
    lea rdx, [cabrillo_end]
    call fprintf

    ; Luk inputfilen log.txt
    mov rcx, r14
    call fclose

cabrillo_close_output:
    ; Luk Cabrillo-filen
    mov rcx, rbx
    call fclose

    ; Fortael brugeren at Cabrillo-loggen er gemt
    lea rcx, [cabrillo_saved]
    call printf

    jmp cabrillo_done



; ---------------------------------------------------------
; get_log_field
;
; RCX = adresse paa loglinjen
; EDX = feltnummer efter dato/tid
;       1 = baand
;       2 = mode
;       3 = kaldesignal
;       osv.
; R8  = adresse paa destinationsbuffer
; ---------------------------------------------------------

get_log_field:

    mov rsi, rcx
    mov ecx, edx

find_field_bar:
    cmp byte [rsi], 0
    je field_not_found

    cmp byte [rsi], '|'
    je field_bar_found

    inc rsi
    jmp find_field_bar

field_bar_found:
    dec ecx
    jz field_start

    inc rsi
    jmp find_field_bar

field_start:
    inc rsi

skip_field_spaces:
    cmp byte [rsi], ' '
    jne copy_field
    inc rsi
    jmp skip_field_spaces

copy_field:
    mov al, [rsi]

    cmp al, '|'
    je field_finished

    cmp al, 0
    je field_finished

    ; Stop ved mellemrummet lige foer |
    cmp al, ' '
    je field_finished

    mov [r8], al
    inc r8
    inc rsi
    jmp copy_field

field_finished:
    mov byte [r8], 0
    ret

field_not_found:
    mov byte [r8], 0
    ret	
	
; ---------------------------------------------------------
; get_cabrillo_freq
;
; RCX = adresse paa baandtekst, f.eks. "20m"
; RDX = adresse paa destinationsbuffer
; ---------------------------------------------------------

get_cabrillo_freq:

    ; 160m?
    cmp byte [rcx + 0], '1'
    jne check_80m
    cmp byte [rcx + 1], '6'
    jne check_10_or_15
    cmp byte [rcx + 2], '0'
    jne cabrillo_freq_not_found
    cmp byte [rcx + 3], 'm'
    jne cabrillo_freq_not_found
    cmp byte [rcx + 4], 0
    jne cabrillo_freq_not_found
    lea rsi, [freq160]
    jmp copy_cabrillo_freq

check_10_or_15:
    ; 10m?
    cmp byte [rcx + 1], '0'
    jne check_15m
    cmp byte [rcx + 2], 'm'
    jne cabrillo_freq_not_found
    cmp byte [rcx + 3], 0
    jne cabrillo_freq_not_found
    lea rsi, [freq10]
    jmp copy_cabrillo_freq

check_15m:
    ; 15m?
    cmp byte [rcx + 1], '5'
    jne cabrillo_freq_not_found
    cmp byte [rcx + 2], 'm'
    jne cabrillo_freq_not_found
    cmp byte [rcx + 3], 0
    jne cabrillo_freq_not_found
    lea rsi, [freq15]
    jmp copy_cabrillo_freq

check_80m:
    ; 80m?
    cmp byte [rcx + 0], '8'
    jne check_40m
    cmp byte [rcx + 1], '0'
    jne cabrillo_freq_not_found
    cmp byte [rcx + 2], 'm'
    jne cabrillo_freq_not_found
    cmp byte [rcx + 3], 0
    jne cabrillo_freq_not_found
    lea rsi, [freq80]
    jmp copy_cabrillo_freq

check_40m:
    ; 40m?
    cmp byte [rcx + 0], '4'
    jne check_20m
    cmp byte [rcx + 1], '0'
    jne cabrillo_freq_not_found
    cmp byte [rcx + 2], 'm'
    jne cabrillo_freq_not_found
    cmp byte [rcx + 3], 0
    jne cabrillo_freq_not_found
    lea rsi, [freq40]
    jmp copy_cabrillo_freq

check_20m:
    ; 20m?
    cmp byte [rcx + 0], '2'
    jne cabrillo_freq_not_found
    cmp byte [rcx + 1], '0'
    jne cabrillo_freq_not_found
    cmp byte [rcx + 2], 'm'
    jne cabrillo_freq_not_found
    cmp byte [rcx + 3], 0
    jne cabrillo_freq_not_found
    lea rsi, [freq20]

copy_cabrillo_freq:
    mov al, [rsi]
    mov [rdx], al
    inc rsi
    inc rdx
    test al, al
    jnz copy_cabrillo_freq
    ret

cabrillo_freq_not_found:
    mov byte [rdx], 0
    ret
	
cabrillo_done:
    
    add rsp, 88
    pop rdi
    pop rsi
    pop r14
    pop r13
    pop r12
    pop rbx
    ret
	
create_facit_cabrillo_wpx_cw:
    push rbx
    push r12
    push r14
    sub rsp, 96

    ; RCX = eget kaldesignal
    mov r12, rcx

    ; Beregn facit WPX-score
    call calculate_facit_wpx_score

    lea rcx, [facit_cabrillo_filename]
    lea rdx, [write_mode]
    call fopen

    test rax, rax
    jz .facit_done

    mov rbx, rax

    ; Aabn facit WPX-loggen til laesning
    lea rcx, [facit_wpx_log_filename]
    lea rdx, [read_mode]
    call fopen

    ; Hvis facitloggen ikke kunne aabnes
    test rax, rax
    jz .facit_close_output

    ; Gem inputfilens FILE*
    mov r14, rax

   	; Skriv START-OF-LOG
    mov rcx, rbx
    lea rdx, [cabrillo_start]
    call fprintf

	; Skriv contest
    mov rcx, rbx
    lea rdx, [cabrillo_contest]
    call fprintf

    ; Skriv eget kaldesignal
    mov rcx, rbx
    lea rdx, [cabrillo_callsign]
    mov r8, r12
    call fprintf

    ; Skriv navn
    mov rcx, rbx
    lea rdx, [cabrillo_name]
    lea r8, [settings_name]
    call fprintf
	
    ; Skriv e-mail
    mov rcx, rbx
    lea rdx, [cabrillo_email]
    lea r8, [settings_email]
    call fprintf
	
    ; Skriv adresse
    mov rcx, rbx
    lea rdx, [cabrillo_address]
    lea r8, [settings_address]
    call fprintf
	
	; Skriv postnummer
    mov rcx, rbx
    lea rdx, [cabrillo_address_postalcode]
    lea r8, [settings_zip]
    call fprintf
	
    ; Skriv by
    mov rcx, rbx
    lea rdx, [cabrillo_address_city]
    lea r8, [settings_city]
    call fprintf
	
    ; Skriv location
    mov rcx, rbx
    lea rdx, [cabrillo_location]
    call fprintf
	
    ; Skriv logger-program
    mov rcx, rbx
    lea rdx, [cabrillo_created]
    call fprintf
	
    ; Skriv operator-kategori
    mov rcx, rbx
    lea rdx, [cabrillo_operator]
    call fprintf
	
    ; Skriv assisted-kategori
    mov rcx, rbx
    lea rdx, [cabrillo_assisted]
    call fprintf
	
    ; Skriv mode-kategori
    mov rcx, rbx
    lea rdx, [cabrillo_mode]
    call fprintf
	
    ; Skriv effekt-kategori
    mov rcx, rbx
    lea rdx, [cabrillo_power]
    lea r8, [settings_power]
    call fprintf
	
    ; Skriv transmitter-kategori
    mov rcx, rbx
    lea rdx, [cabrillo_transmitter]
    call fprintf
	
    ; Skriv overlay-kategori
    mov rcx, rbx
    lea rdx, [cabrillo_overlay]
    call fprintf
	
    ; Skriv baand-kategori
    mov rcx, rbx
    lea rdx, [cabrillo_band]
    call fprintf

    ; Skriv facit CLAIMED-SCORE
    mov rcx, rbx
    lea rdx, [cabrillo_claimed_score]
    mov r8d, [facit_cabrillo_score]
    call fprintf

.facit_qso_read_loop:

    ; Laes naeste QSO fra facitloggen
    lea rcx, [cabrillo_buffer]
    mov edx, 256
    mov r8, r14
    call fgets

    ; Slut paa facitloggen?
    test rax, rax
    jz .facit_qso_done

    ; Hent baand
    lea rcx, [cabrillo_buffer]
    mov edx, 1
    lea r8, [cabrillo_band_text]
    call get_log_field

    ; Hent mode
    lea rcx, [cabrillo_buffer]
    mov edx, 2
    lea r8, [cabrillo_mode_text]
    call get_log_field

    ; Hent CALL
    lea rcx, [cabrillo_buffer]
    mov edx, 3
    lea r8, [cabrillo_call]
    call get_log_field

    ; Hent RST
    lea rcx, [cabrillo_buffer]
    mov edx, 4
    lea r8, [cabrillo_rst_sent]
    call get_log_field

    ; Hent sendt serienummer
    lea rcx, [cabrillo_buffer]
    mov edx, 5
    lea r8, [cabrillo_nr_sent]
    call get_log_field

    ; Hent modtaget serienummer
    lea rcx, [cabrillo_buffer]
    mov edx, 6
    lea r8, [cabrillo_nr_recv]
    call get_log_field

        ; Hent dato fra starten af loglinjen
    lea rsi, [cabrillo_buffer]
    lea rdi, [cabrillo_date]

    ; DD-MM-YYYY -> YYYY-MM-DD
    mov al, [rsi + 6]
    mov [rdi + 0], al
    mov al, [rsi + 7]
    mov [rdi + 1], al
    mov al, [rsi + 8]
    mov [rdi + 2], al
    mov al, [rsi + 9]
    mov [rdi + 3], al
    mov byte [rdi + 4], '-'

    mov al, [rsi + 3]
    mov [rdi + 5], al
    mov al, [rsi + 4]
    mov [rdi + 6], al
    mov byte [rdi + 7], '-'

    mov al, [rsi + 0]
    mov [rdi + 8], al
    mov al, [rsi + 1]
    mov [rdi + 9], al
    mov byte [rdi + 10], 0

    ; Hent tid HH:MM -> HHMM
    mov al, [rsi + 11]
    mov [cabrillo_time + 0], al
    mov al, [rsi + 12]
    mov [cabrillo_time + 1], al
    mov al, [rsi + 14]
    mov [cabrillo_time + 2], al
    mov al, [rsi + 15]
    mov [cabrillo_time + 3], al
    mov byte [cabrillo_time + 4], 0

    ; Konverter baand til Cabrillo-frekvens
    lea rcx, [cabrillo_band_text]
    lea rdx, [cabrillo_freq]
    call get_cabrillo_freq

    ; Gør modtaget serienummer til 3 cifre
    lea rcx, [cabrillo_nr_recv]
    lea rdx, [cabrillo_nr_recv3]

    mov al, [rcx]
    cmp byte [rcx + 1], 0
    jne .facit_check_two_digits

    ; 1 ciffer -> 00X
    mov byte [rdx + 0], '0'
    mov byte [rdx + 1], '0'
    mov [rdx + 2], al
    mov byte [rdx + 3], 0
    jmp .facit_write_qso

.facit_check_two_digits:
    cmp byte [rcx + 2], 0
    jne .facit_three_digits

    ; 2 cifre -> 0XX
    mov byte [rdx + 0], '0'
    mov al, [rcx]
    mov [rdx + 1], al
    mov al, [rcx + 1]
    mov [rdx + 2], al
    mov byte [rdx + 3], 0
    jmp .facit_write_qso

.facit_three_digits:
    ; 3 cifre
    mov al, [rcx]
    mov [rdx + 0], al
    mov al, [rcx + 1]
    mov [rdx + 1], al
    mov al, [rcx + 2]
    mov [rdx + 2], al
    mov byte [rdx + 3], 0

.facit_write_qso:

    ; Skriv QSO til facit Cabrillo
    mov rcx, rbx
    lea rdx, [cabrillo_qso_format]
    lea r8,  [cabrillo_freq]
    lea r9,  [cabrillo_mode_text]

    lea rax, [cabrillo_date]
    mov [rsp + 32], rax

    lea rax, [cabrillo_time]
    mov [rsp + 40], rax

    mov [rsp + 48], r12

    lea rax, [cabrillo_rst_sent]
    mov [rsp + 56], rax

    lea rax, [cabrillo_nr_sent]
    mov [rsp + 64], rax

    lea rax, [cabrillo_call]
    mov [rsp + 72], rax

    lea rax, [cabrillo_nr_recv3]
    mov [rsp + 80], rax

    call fprintf

    jmp .facit_qso_read_loop

.facit_qso_done:

 
       ; Skriv END-OF-LOG
    mov rcx, rbx
    lea rdx, [cabrillo_end]
    call fprintf

.facit_close_output:
    mov rcx, rbx
    call fclose

.facit_done:
    add rsp, 96
    pop r14
    pop r12
    pop rbx
    ret
	
calculate_facit_wpx_score:

    push rbx
    sub rsp, 32

    mov dword [facit_cabrillo_score], 0
	mov dword [facit_cabrillo_mult_count], 0
	
    ; Aabn facit WPX-loggen
    lea rcx, [facit_wpx_log_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .facit_score_done

    mov rbx, rax

.facit_score_read:

    lea rcx, [cabrillo_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .facit_score_close
	
    ; Er denne QSO en WPX-multiplier?
    lea rcx, [cabrillo_buffer]
    lea rdx, [facit_mult_text]
    call strstr

    test rax, rax
    jz .facit_not_mult

    inc dword [facit_cabrillo_mult_count]

.facit_not_mult:

    ; Find teksten " point" i facit-linjen
    lea rcx, [cabrillo_buffer]
    lea rdx, [facit_point_text]
    call strstr

    ; Hvis " point" ikke findes, laes naeste linje
    test rax, rax
    jz .facit_score_read

    ; Tegnet lige foer " point" er pointtallet
    movzx eax, byte [rax - 1]

    ; ASCII-ciffer til tal
    sub eax, '0'

    ; Laeg point til facit-totalen
    add dword [facit_cabrillo_score], eax

    jmp .facit_score_read

    jmp .facit_score_read

.facit_score_close:

    mov rcx, rbx
    call fclose

    ; Beregn facit WPX-score
    mov eax, [facit_cabrillo_score]
    imul eax, [facit_cabrillo_mult_count]
    mov [facit_cabrillo_score], eax

.facit_score_done:

    add rsp, 32
    pop rbx
    ret
