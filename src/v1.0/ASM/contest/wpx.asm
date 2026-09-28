default rel
global calculate_wpx_points
global calculate_wpx_score
global check_wpx_call
global check_wpx_multiplier
global count_wpx_multiplier
global get_wpx_mult_count
global is_wpx_band
global is_wpx_multiplier
global load_wpx_prefixes
global make_wpx_prefix
global reset_wpx_mult_count
global reset_wpx_multiplier
global reset_wpx_prefixes
global wpx_prefix
global wpx_prefix_count
global wpx_prefix_table


extern fclose
extern fgets
extern fopen
extern strcmp
extern strcpy_s
extern strstr


section .data
	band10 db "10m", 0
band15 db "15m", 0
band160 db "160m", 0
band20 db "20m", 0
band40 db "40m", 0
band80 db "80m", 0
mult_text db "MULT", 0
read_mode db "r", 0
	
section .bss

load_call resb 32
mult_count resd 1
wpx_is_multiplier resd 1
wpx_prefix resb 16
wpx_prefix_count resd 1
wpx_prefix_table resb 1600
wpx_read_buffer resb 256
	
section .text

load_wpx_prefixes:

    ; Bevar RBX
push rbx
sub rsp, 32

; RCX = adressen paa logfilens navn
mov rbx, rcx

; Start med en tom WPX-tabel
mov dword [wpx_prefix_count], 0

    ; Aabn log.txt
    mov rcx, rbx
	lea rdx, [read_mode]
	call fopen

    ; Hvis log.txt ikke findes, er der intet at indlaese
    test rax, rax
    jz load_wpx_done

    ; Gem filhaandtaget
    mov rbx, rax

load_wpx_next_line:

    ; Laes naeste linje
    lea rcx, [wpx_read_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    ; Slut paa filen?
    test rax, rax
    jz load_wpx_close

        ; Find MULT i loglinjen
    lea rcx, [wpx_read_buffer]
    lea rdx, [mult_text]
    call strstr

    ; Ingen MULT - laes naeste linje
    test rax, rax
    jz load_wpx_next_line

        ; MULT blev fundet.
    ; Find det tredje | i linjen.
    lea rax, [wpx_read_buffer]
    xor r10d, r10d

load_find_call_field:

    cmp byte [rax], 0
    je load_wpx_next_line

    cmp byte [rax], '|'
    jne load_find_next_char

    inc r10d
    cmp r10d, 3
    je load_call_start

load_find_next_char:
    inc rax
    jmp load_find_call_field


load_call_start:

    ; Gaa forbi | og eventuelle mellemrum
    inc rax

load_skip_call_spaces:

    cmp byte [rax], ' '
    jne load_copy_call

    inc rax
    jmp load_skip_call_spaces


load_copy_call:

    lea rdx, [load_call]

load_copy_call_char:

    mov cl, [rax]

    ; Mellemrum eller | afslutter kaldesignalet
    cmp cl, ' '
    je load_call_done

    cmp cl, '|'
    je load_call_done

    cmp cl, 0
    je load_call_done

    mov [rdx], cl
    inc rax
    inc rdx
    jmp load_copy_call_char


load_call_done:

    mov byte [rdx], 0
	
   

        ; Lav WPX-prefix direkte af det gamle call
    lea rcx, [load_call]
    call make_wpx_prefix


    ; Gem prefixet i WPX-tabellen
    mov eax, [wpx_prefix_count]

    ; Tabellen har plads til 100 prefixes
    cmp eax, 100
    jae load_wpx_next_line

    ; Hver plads er 16 bytes
    shl eax, 4

    lea rcx, [wpx_prefix_table]
    add rcx, rax

    ; Kopier prefixet til tabellen
    mov edx, 16
    lea r8, [wpx_prefix]
    call strcpy_s

    ; Et prefix mere er indlaest
    inc dword [wpx_prefix_count]

    
    jmp load_wpx_next_line


load_wpx_close:

    mov rcx, rbx
    call fclose


load_wpx_done:

    add rsp, 32
    pop rbx
    ret

make_wpx_prefix:

    ; Start med et tomt WPX-prefix
    mov byte [wpx_prefix], 0

    ; RAX = kaldesignalet
    mov rax, rcx

    ; RDX = hvor WPX-prefixet skal gemmes
    lea rdx, [wpx_prefix]

copy_wpx_char:

    mov cl, [rax]

    cmp cl, 0
    je wpx_done

    mov [rdx], cl
    inc rax
    inc rdx

    cmp cl, '0'
    jb copy_wpx_char

    cmp cl, '9'
    ja copy_wpx_char

wpx_done:
    mov byte [rdx], 0
    ret

check_wpx_multiplier:

    push r12
    sub rsp, 32

    ; Start ved prefix nummer 0
    xor r12d, r12d

check_wpx_table:

    ; Har vi kontrolleret alle gemte prefixes?
    cmp r12d, [wpx_prefix_count]
    jae wpx_is_new

    ; Find adressen paa prefix nummer R12D
    mov eax, r12d
    shl eax, 4

    lea rcx, [wpx_prefix_table]
    add rcx, rax

    ; Sammenlign med det nye prefix
    lea rdx, [wpx_prefix]
    call strcmp

    ; Samme prefix?
    test eax, eax
    jz wpx_already_exists

    inc r12d
    jmp check_wpx_table


wpx_is_new:

    ; Dette er et nyt WPX-prefix
    mov dword [wpx_is_multiplier], 1

    ; Tabellen har plads til 100 prefixes
    mov eax, [wpx_prefix_count]
    cmp eax, 100
    jae wpx_already_exists

    ; Find naeste ledige plads
    shl eax, 4

    lea rcx, [wpx_prefix_table]
    add rcx, rax

    ; Gem det nye prefix
    mov edx, 16
    lea r8, [wpx_prefix]
    call strcpy_s

    ; Et nyt unikt prefix er gemt
    inc dword [wpx_prefix_count]


wpx_already_exists:


    add rsp, 32
    pop r12
    
    ret

calculate_wpx_points:

    push r12
	push r13
	push r14
	push r15
	sub rsp, 40

	; RCX = band_text
	; RDX = cty_match_entity
	; R8  = cty_match_continent
	; R9  = denmark_entity
	mov r12, rcx
	mov r13, rdx
	mov r14, r8
	mov r15, r9

    ; Danmark = 1 point
	mov rcx, r13
	mov rdx, r15
	call strcmp

    test eax, eax
    jz wpx_one_point

   ; 20m?
mov rcx, r12
lea rdx, [band20]
call strcmp
test eax, eax
jz wpx_high_band

; 15m?
mov rcx, r12
lea rdx, [band15]
call strcmp
test eax, eax
jz wpx_high_band

; 10m?
mov rcx, r12
lea rdx, [band10]
call strcmp
test eax, eax
jz wpx_high_band

; 40m?
mov rcx, r12
lea rdx, [band40]
call strcmp
test eax, eax
jz wpx_low_band

; 80m?
mov rcx, r12
lea rdx, [band80]
call strcmp
test eax, eax
jz wpx_low_band

; 160m?
mov rcx, r12
lea rdx, [band160]
call strcmp
test eax, eax
jz wpx_low_band

    ; Ukendt baand = 0 point
    xor eax, eax
    jmp wpx_points_done


wpx_high_band:
    cmp byte [r14], 'E'
    jne wpx_three_points
    cmp byte [r14 + 1], 'U'
    jne wpx_three_points

    jmp wpx_one_point


wpx_low_band:
    cmp byte [r14], 'E'
    jne wpx_six_points
    cmp byte [r14 + 1], 'U'
    jne wpx_six_points

    mov eax, 2
    jmp wpx_points_done


wpx_three_points:

    mov eax, 3
    jmp wpx_points_done


wpx_six_points:

    mov eax, 6
    jmp wpx_points_done


wpx_one_point:

    mov eax, 1


wpx_points_done:
    add rsp, 40
    pop r15
    pop r14
    pop r13
    pop r12
    ret
	
reset_wpx_multiplier:

    mov dword [wpx_is_multiplier], 0
    ret
	
reset_wpx_prefixes:

    mov dword [wpx_prefix_count], 0
    ret
	
is_wpx_multiplier:

    mov eax, [wpx_is_multiplier]
    ret
	
calculate_wpx_score:
    mov eax, ecx
    imul eax, [mult_count]
    ret
	
count_wpx_multiplier:

    sub rsp, 40

    ; Se om denne loglinje er markeret som MULT
   
    lea rdx, [mult_text]
    call strstr

    ; Ingen MULT
    test rax, rax
    jz count_wpx_multiplier_done

    ; En WPX-multiplier mere
    inc dword [mult_count]

count_wpx_multiplier_done:

    add rsp, 40
    ret
	
reset_wpx_mult_count:

    mov dword [mult_count], 0
    ret
	
get_wpx_mult_count:
    mov eax, [mult_count]
    ret
	
is_wpx_band:

    push r12
    sub rsp, 32

    ; RCX indeholder adressen paa band_text
    mov r12, rcx

    mov rcx, r12
    lea rdx, [band160]
    call strcmp
    test eax, eax
    jz wpx_band_valid

    mov rcx, r12
    lea rdx, [band80]
    call strcmp
    test eax, eax
    jz wpx_band_valid

    mov rcx, r12
    lea rdx, [band40]
    call strcmp
    test eax, eax
    jz wpx_band_valid

    mov rcx, r12
    lea rdx, [band20]
    call strcmp
    test eax, eax
    jz wpx_band_valid

    mov rcx, r12
    lea rdx, [band15]
    call strcmp
    test eax, eax
    jz wpx_band_valid

    mov rcx, r12
    lea rdx, [band10]
    call strcmp
    test eax, eax
    jz wpx_band_valid

    ; Ugyldigt baand
    xor eax, eax
    jmp wpx_band_done

wpx_band_valid:
    mov eax, 1

wpx_band_done:
    add rsp, 32
    pop r12
    ret
	
check_wpx_call:
    sub rsp, 40

    call make_wpx_prefix
    call check_wpx_multiplier

    add rsp, 40
    ret
