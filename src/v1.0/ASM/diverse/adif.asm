bits 64
default rel

global create_adif

extern fclose
extern fgets
extern fopen
extern fprintf
extern strlen

section .data

adif_datetime_format:
    db "<QSO_DATE:8>%s <TIME_ON:4>%s <BAND:%llu>%s <MODE:2>CW <CALL:%llu>%s <RST_SENT:3>%s <RST_RCVD:3>%s <NAME:%llu>%s <QTH:%llu>%s <EOR>", 10, 0
	
adif_eof:
    db "<EOF>", 10, 0

adif_filename:
    db "log/hf_log.adi", 0

adif_format:
    db "%s", 0

adif_header:
    db "<ADIF_VER:5>3.1.6", 10
    db "<PROGRAMID:6>ASMLog", 10
    db "<EOH>", 10, 0

adif_read_mode:
    db "r", 0

adif_write_mode:
    db "w", 0

hf_input_filename:
    db "log/hf_log.txt", 0
	
section .bss

adif_band:
    resb 5

adif_band_length:
    resq 1

adif_call:
    resb 32

adif_call_length:
    resq 1

adif_date:
    resb 9

adif_line:
    resb 256
	
adif_name:
    resb 64
	
adif_name_length:
    resq 1

adif_qth:
    resb 64
	
adif_qth_length:
    resq 1

adif_rst_recv:
    resb 4

adif_rst_sent:
    resb 4

adif_time:
    resb 5
	
section .text

create_adif:
    push rbx
    push r12
    sub rsp, 120

    ; Opret / overskriv hf_log.adi
    lea rcx, [adif_filename]
    lea rdx, [adif_write_mode]
    call fopen

    test rax, rax
    jz .done

    mov rbx, rax

    ; Skriv ADIF-header
    mov rcx, rbx
    lea rdx, [adif_format]
    lea r8, [adif_header]
    call fprintf
; Aabn HF-loggen
lea rcx, [hf_input_filename]
lea rdx, [adif_read_mode]
call fopen

test rax, rax
jz .close_output

mov r12, rax

; Laes naeste QSO
.read_next_qso:

lea rcx, [adif_line]
mov edx, 256
mov r8, r12
call fgets

test rax, rax
jz .close_input



; Byg ADIF-dato: YYYYMMDD

mov al, [adif_line + 6]
mov [adif_date + 0], al

mov al, [adif_line + 7]
mov [adif_date + 1], al

mov al, [adif_line + 8]
mov [adif_date + 2], al

mov al, [adif_line + 9]
mov [adif_date + 3], al

mov al, [adif_line + 3]
mov [adif_date + 4], al

mov al, [adif_line + 4]
mov [adif_date + 5], al

mov al, [adif_line + 0]
mov [adif_date + 6], al

mov al, [adif_line + 1]
mov [adif_date + 7], al

mov byte [adif_date + 8], 0


; Byg ADIF-tid: HHMM

mov al, [adif_line + 11]
mov [adif_time + 0], al

mov al, [adif_line + 12]
mov [adif_time + 1], al

mov al, [adif_line + 14]
mov [adif_time + 2], al

mov al, [adif_line + 15]
mov [adif_time + 3], al

mov byte [adif_time + 4], 0





; Hent baand dynamisk
lea rdx, [adif_line + 19]
lea r8, [adif_band]
xor ecx, ecx

.copy_band:
    mov al, [rdx + rcx]

    ; Stop ved mellemrum efter baandet
    cmp al, ' '
    je .band_done

    ; Stop ogsaa hvis linjen mod forventning slutter
    cmp al, 0
    je .band_done

    mov [r8 + rcx], al
    inc rcx
    jmp .copy_band

.band_done:
    mov byte [r8 + rcx], 0
    ; Kontroller at baandet slutter med 'm'
    test rcx, rcx
    jz .read_next_qso

    cmp byte [r8 + rcx - 1], 'm'
    jne .read_next_qso	


; Find laengden af baandet
lea rcx, [adif_band]
call strlen

mov [adif_band_length], rax



; Find starten paa kaldesignalet dynamisk
lea rdx, [adif_line + 19]

; Find | efter baandet
.find_band_separator:
    mov al, [rdx]

    cmp al, '|'
    je .band_separator_found

    cmp al, 0
    je .rst_done

    inc rdx
    jmp .find_band_separator

.band_separator_found:
    ; Nu staar vi ved | efter baandet.
    ; Find naeste |, som kommer efter CW.
    inc rdx

.find_mode_separator:
    mov al, [rdx]

    cmp al, '|'
    je .mode_separator_found

    cmp al, 0
    je .rst_done

    inc rdx
    jmp .find_mode_separator

.mode_separator_found:
    ; Efter "| " begynder kaldesignalet
    add rdx, 2

    lea r8, [adif_call]
    xor ecx, ecx

.copy_call:
    mov al, [rdx + rcx]

    ; Stop ved mellemrum eller slut paa linjen
    cmp al, ' '
    je .call_done

    cmp al, 0
    je .call_done

    mov [r8 + rcx], al
    inc rcx
    jmp .copy_call


.call_done:
    mov byte [r8 + rcx], 0

    ; Gaa videre efter kaldesignalet
    add rdx, rcx

.find_rst_sent:
    mov al, [rdx]

    cmp al, '|'
    je .rst_separator_found

    cmp al, 0
    je .rst_done

    inc rdx
    jmp .find_rst_sent

.rst_separator_found:
    ; Formatet er "| 579 | 589"
    ; Spring "| " over
    add rdx, 2

    ; RST sendt
    mov al, [rdx]
    mov [adif_rst_sent + 0], al

    mov al, [rdx + 1]
    mov [adif_rst_sent + 1], al

    mov al, [rdx + 2]
    mov [adif_rst_sent + 2], al

    mov byte [adif_rst_sent + 3], 0

    ; RST modtaget ligger efter "579 | "
    mov al, [rdx + 6]
    mov [adif_rst_recv + 0], al

    mov al, [rdx + 7]
    mov [adif_rst_recv + 1], al

    mov al, [rdx + 8]
    mov [adif_rst_recv + 2], al

    mov byte [adif_rst_recv + 3], 0

    ; Find NAME efter RST modtaget
    add rdx, 9

.find_name_separator:
    mov al, [rdx]

    cmp al, '|'
    je .name_separator_found

    cmp al, 0
    je .rst_done

    inc rdx
    jmp .find_name_separator

.name_separator_found:
    add rdx, 2

    lea r8, [adif_name]
    xor ecx, ecx

.copy_name:
    mov al, [rdx + rcx]

    cmp al, '|'
    je .name_done

    cmp al, 13
    je .name_done

    cmp al, 10
    je .name_done

    cmp al, 0
    je .name_done

    mov [r8 + rcx], al
    inc rcx
    jmp .copy_name

.name_done:
    ; Fjern mellemrum før næste |
    test rcx, rcx
    jz .name_terminated

    cmp byte [r8 + rcx - 1], ' '
    jne .name_terminated

    dec rcx

.name_terminated:
    mov byte [r8 + rcx], 0 
	
    ; Gaa videre til QTH
    add rdx, rcx

.find_qth_separator:
    mov al, [rdx]

    cmp al, '|'
    je .qth_separator_found

    cmp al, 0
    je .rst_done

    inc rdx
    jmp .find_qth_separator

.qth_separator_found:
    add rdx, 2

    lea r8, [adif_qth]
    xor ecx, ecx

.copy_qth:
    mov al, [rdx + rcx]

    cmp al, 13
    je .qth_done

    cmp al, 10
    je .qth_done

    cmp al, 0
    je .qth_done

    mov [r8 + rcx], al
    inc rcx
    jmp .copy_qth

.qth_done:
    mov byte [r8 + rcx], 0
     
.rst_done:

	; Find laengden af kaldesignalet
	lea rcx, [adif_call]
	call strlen

	mov [adif_call_length], rax

    lea rcx, [adif_name]
    call strlen
    mov [adif_name_length], rax

    lea rcx, [adif_qth]
    call strlen
    mov [adif_qth_length], rax

	; Skriv QSO til ADIF-filen
	mov rcx, rbx
	lea rdx, [adif_datetime_format]
	lea r8, [adif_date]
	lea r9, [adif_time]

	; BAND laengde
	mov rax, [adif_band_length]
	mov [rsp + 32], rax

	; BAND
	lea rax, [adif_band]
	mov [rsp + 40], rax

	; CALL laengde
	mov rax, [adif_call_length]
	mov [rsp + 48], rax

	; CALL
	lea rax, [adif_call]
	mov [rsp + 56], rax

	; RST sendt
	lea rax, [adif_rst_sent]
	mov [rsp + 64], rax

	; RST modtaget
	lea rax, [adif_rst_recv]
	mov [rsp + 72], rax

    ; NAME laengde
    mov rax, [adif_name_length]
    mov [rsp + 80], rax

    ; NAME
    lea rax, [adif_name]
    mov [rsp + 88], rax

    ; QTH laengde
    mov rax, [adif_qth_length]
    mov [rsp + 96], rax

    ; QTH
    lea rax, [adif_qth]
    mov [rsp + 104], rax
	
	call fprintf
	jmp .read_next_qso
	
.close_input:
    ; Skriv afslutning paa ADIF-filen
    mov rcx, rbx
    lea rdx, [adif_format]
    lea r8, [adif_eof]
    call fprintf

    mov rcx, r12
    call fclose

.close_output:
    mov rcx, rbx
    call fclose

.done:
    add rsp, 120
    pop r12
    pop rbx
    ret
