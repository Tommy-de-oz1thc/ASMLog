bits 64
default rel

global hf_generated_continent
global qso_generate_hf
global hf_generated_entity
global hf_generated_name
global hf_generated_qth
global hf_generated_rst




extern cty_match_continent


extern cty_match_entity


extern fopen
extern fclose
extern fgets
extern log_text
extern lookup_country
extern printf

extern rand
extern strcpy_s

section .data


	
hf_cities_filename db "data/hf_cities.txt", 0

hf_default_name:
    db "TOMMY", 0

hf_default_qth:
    db "NYBORG", 0




	
hf_names_filename db "data/hf_names.txt", 0
	

	
hf_read_mode      db "r", 0


   

hf_rst_599 db "599", 0
hf_rst_589 db "589", 0
hf_rst_579 db "579", 0
hf_rst_569 db "569", 0
hf_rst_559 db "559", 0



section .bss

hf_cities_file:  resq 1
hf_city_line:    resb 128
hf_city_count:   resd 1
hf_generated_continent: resb 4
hf_generated_entity:    resb 64
hf_generated_name: resb 32
hf_generated_qth:  resb 64
hf_generated_rst: resb 4
hf_names_file:       resq 1
hf_name_line:        resb 128
hf_name_count:       resd 1

section .text

qso_generate_hf:

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
    lea rcx, [hf_generated_entity]
    mov edx, 64
    lea r8, [cty_match_entity]
    call strcpy_s

    ; Gem generatorens kontinent
    lea rcx, [hf_generated_continent]
    mov edx, 4
    lea r8, [cty_match_continent]
    call strcpy_s

	
	


   

    ; Tilfaeldig RST: 70 / 15 / 8 / 5 / 2 procent
    call rand
    xor edx, edx
    mov ecx, 100
    div ecx                 ; EDX = 0..99

    lea r8, [hf_rst_599]
    cmp edx, 70
    jb .hf_rst_selected

    lea r8, [hf_rst_589]
    cmp edx, 85
    jb .hf_rst_selected

    lea r8, [hf_rst_579]
    cmp edx, 93
    jb .hf_rst_selected

    lea r8, [hf_rst_569]
    cmp edx, 98
    jb .hf_rst_selected

    lea r8, [hf_rst_559]

.hf_rst_selected:
    lea rcx, [hf_generated_rst]
    mov edx, 4
    call strcpy_s

   
    ; Standardnavn hvis filen mangler eller er tom
    lea rcx, [hf_generated_name]
    mov edx, 32
    lea r8, [hf_default_name]
    call strcpy_s

    ; Aabn navnefil
    lea rcx, [hf_names_filename]
    lea rdx, [hf_read_mode]
    call fopen
    test rax, rax
    jz .hf_names_done

    mov [hf_names_file], rax
    mov dword [hf_name_count], 0

.hf_names_read:
    lea rcx, [hf_name_line]
    mov edx, 128
    mov r8, [hf_names_file]
    call fgets
    test rax, rax
    jz .hf_names_close

    ; Fjern CR/LF og afkort til bufferstoerrelsen
    lea r10, [hf_name_line]
    xor r11d, r11d

.hf_name_trim:
    cmp r11d, 31
    jae .hf_name_terminate

    mov al, [r10 + r11]
    test al, al
    jz .hf_name_trim_done
    cmp al, 10
    je .hf_name_terminate
    cmp al, 13
    je .hf_name_terminate

    inc r11d
    jmp .hf_name_trim

.hf_name_terminate:
    mov byte [r10 + r11], 0

.hf_name_trim_done:
    cmp byte [hf_name_line], 0
    je .hf_names_read

    ; Reservoir sampling: vaelg med 1/N sandsynlighed
    inc dword [hf_name_count]

    call rand
    xor edx, edx
    div dword [hf_name_count]

    test edx, edx
    jnz .hf_names_read

    lea rcx, [hf_generated_name]
    mov edx, 32
    lea r8, [hf_name_line]
    call strcpy_s

    jmp .hf_names_read

.hf_names_close:
    mov rcx, [hf_names_file]
    call fclose

.hf_names_done:
	
    ; Standard-QTH hvis filen mangler eller er tom
    lea rcx, [hf_generated_qth]
    mov edx, 64
    lea r8, [hf_default_qth]
    call strcpy_s

    ; Aabn byfil
    lea rcx, [hf_cities_filename]
    lea rdx, [hf_read_mode]
    call fopen
    test rax, rax
    jz .hf_cities_done

    mov [hf_cities_file], rax
    mov dword [hf_city_count], 0

.hf_cities_read:
    lea rcx, [hf_city_line]
    mov edx, 128
    mov r8, [hf_cities_file]
    call fgets
    test rax, rax
    jz .hf_cities_close

    ; Fjern CR/LF og afkort til QTH-buffer
    lea r10, [hf_city_line]
    xor r11d, r11d

.hf_city_trim:
    cmp r11d, 63
    jae .hf_city_terminate

    mov al, [r10 + r11]
    test al, al
    jz .hf_city_trim_done
    cmp al, 10
    je .hf_city_terminate
    cmp al, 13
    je .hf_city_terminate

    inc r11d
    jmp .hf_city_trim

.hf_city_terminate:
    mov byte [r10 + r11], 0

.hf_city_trim_done:
    cmp byte [hf_city_line], 0
    je .hf_cities_read

    ; Reservoir sampling: vaelg med 1/N sandsynlighed
    inc dword [hf_city_count]

    call rand
    xor edx, edx
    div dword [hf_city_count]

    test edx, edx
    jnz .hf_cities_read

    lea rcx, [hf_generated_qth]
    mov edx, 64
    lea r8, [hf_city_line]
    call strcpy_s

    jmp .hf_cities_read

.hf_cities_close:
    mov rcx, [hf_cities_file]
    call fclose

.hf_cities_done:
    
   



   	

   
    

    ; Returner samme CALL-pointer
    mov rax, rbx

    add rsp, 48
    pop rbx
    ret