bits 64
default rel

global sac_generated_continent
global qso_generate_sac_cw
global sac_generated_entity
global sac_generated_serial
global sac_exchange


extern cty_match_continent

extern cty_match_cq_zone
extern cty_match_entity



extern log_text
extern lookup_country
extern printf
extern rand
extern sprintf
extern strcpy_s

section .data

sac_call_format:
    db "SAC CALL: %s", 10, 0

sac_exchange_format:
    db "599 %03u", 0



sac_rst_format:
    db "SAC RST: 599", 10, 0

sac_serial_format:
    db "SAC SERIAL: %u", 10, 0



section .bss



sac_exchange:
    resb 16

sac_generated_continent: resb 4
sac_generated_entity:    resb 64

sac_generated_serial: resd 1

section .text

qso_generate_sac_cw:

    push rbx
    sub rsp, 48

    ; RCX = pointer til valgt CALL
    mov rbx, rcx
	
    ; Kopier simulatorens CALL til CTY-buffer
    lea rcx, [log_text]
    mov edx, 256
    mov r8, rbx
    call strcpy_s

    ; Find land og CQ-zone
    lea rcx, [log_text]
    call lookup_country

    ; Gem generatorens land
    lea rcx, [sac_generated_entity]
    mov edx, 64
    lea r8, [cty_match_entity]
    call strcpy_s

    ; Gem generatorens kontinent
    lea rcx, [sac_generated_continent]
    mov edx, 4
    lea r8, [cty_match_continent]
    call strcpy_s

	; Tilfaeldigt SAC-serienummer 001-999
	call rand

	xor edx, edx
	mov ecx, 999
	div ecx

	inc edx
	mov [sac_generated_serial], edx


   

    
.sac_state_copied:

   

    ; Byg samlet exchange "599 14"
    lea rcx, [sac_exchange]
	lea rdx, [sac_exchange_format]
	mov r8d, [sac_generated_serial]
	call sprintf

   

    ; Returner samme CALL-pointer
    mov rax, rbx

    add rsp, 48
    pop rbx
    ret