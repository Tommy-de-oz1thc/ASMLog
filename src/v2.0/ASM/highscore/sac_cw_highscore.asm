bits 64
default rel

global sac_cw_highscore_menu

extern atoi
extern fclose
extern fgets
extern fopen
extern printf
extern scanf
extern strcpy
extern strcspn
extern strstr

section .data

char_format db " %c", 0

highscore_menu_text db 10
                    db "=== CQWW DX Highscore ===", 10, 10
                    db "1. Sorter efter dato", 10
                    db "2. Sorter efter Real score", 10
                    db "0. Tilbage", 10, 10
                    db "Valg: ", 0


highscore_filename db "highscore/cqww_dx_highscore.txt", 0
read_mode          db "r", 0
real_text db "Real: ", 0

line_format db "%s", 10, 0
newline_chars db 13, 10, 0

section .bss


highscore_buffer resb 256
highscore_choice resb 1
highscore_count resd 1
highscore_dates resd 100         ; YYYYMMDD
highscore_file   resq 1
highscore_lines resb 25600       ; 100 linjer x 256 bytes
highscore_scores resd 100


section .text

sac_cw_highscore_menu:

    push rbx
    sub rsp, 32

.menu:

    lea rcx, [highscore_menu_text]
    call printf

    lea rcx, [char_format]
    lea rdx, [highscore_choice]
    call scanf

    cmp byte [highscore_choice], '1'
    je .sort_date

    cmp byte [highscore_choice], '2'
    je .sort_score

    cmp byte [highscore_choice], '0'
    je .done

    jmp .menu

  

.sort_date:

    mov dword [highscore_count], 0

    ; Aabn highscore-filen
    lea rcx, [highscore_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .menu

    mov [highscore_file], rax


.read_loop:

    lea rcx, [highscore_buffer]
    mov edx, 256
    mov r8, [highscore_file]
    call fgets

        test rax, rax
    jz .close_file

    ; Fjern CR/LF
    lea rcx, [highscore_buffer]
    lea rdx, [newline_chars]
    call strcspn

    lea rdx, [highscore_buffer]
    mov byte [rdx + rax], 0

    lea rcx, [line_format]
    lea rdx, [highscore_buffer]
    call printf

    jmp .read_loop

.close_file:

    mov rcx, [highscore_file]
    call fclose

    jmp .menu

.sort_score:

    mov dword [highscore_count], 0

    lea rcx, [highscore_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .menu

    mov [highscore_file], rax


.read_score_loop:

        lea rcx, [highscore_buffer]
    mov edx, 256
    mov r8, [highscore_file]
    call fgets

    test rax, rax
    jz .close_score_file

    ; Fjern CR/LF
    lea rcx, [highscore_buffer]
    lea rdx, [newline_chars]
    call strcspn

    lea rdx, [highscore_buffer]
    mov byte [rdx + rax], 0

    ; Gem hele highscore-linjen
    mov eax, [highscore_count]
    shl eax, 8

    lea rcx, [highscore_lines]
    add rcx, rax

    lea rdx, [highscore_buffer]
    call strcpy
    ; Find "Real: "
    lea rcx, [highscore_buffer]
    lea rdx, [real_text]
    call strstr

    test rax, rax
    jz .read_score_loop

    ; Spring "Real: " over
    add rax, 6

    ; Konverter Real score til tal
    mov rcx, rax
    call atoi

    ; Gem Real score
    mov ecx, [highscore_count]
    lea rdx, [highscore_scores]
    mov [rdx + rcx*4], eax

    inc dword [highscore_count]
    jmp .read_score_loop


.close_score_file:

    mov rcx, [highscore_file]
    call fclose


    ; --------------------------------
    ; Bubble sort - hoejeste Real foerst
    ; --------------------------------

    mov r10d, [highscore_count]

    cmp r10d, 1
    jbe .show_score_lines

    dec r10d


.score_outer:

    xor r11d, r11d
    xor r8d, r8d


.score_inner:

    cmp r11d, r10d
    jae .score_outer_done

    lea rdx, [highscore_scores]

    mov eax, [rdx + r11*4]
    mov ecx, [rdx + r11*4 + 4]

    cmp eax, ecx
    jae .score_no_swap

    ; Byt Real scores
    mov [rdx + r11*4], ecx
    mov [rdx + r11*4 + 4], eax

    ; Find de to tilhoerende highscore-linjer
    mov eax, r11d
    shl eax, 8

    lea rdx, [highscore_lines]
    add rdx, rax

    lea rcx, [rdx + 256]

    ; Byt alle 256 bytes
    xor eax, eax


    ; RDX = linje A
    ; RCX = linje B

       ; Byt alle 256 bytes
    xor eax, eax

.swap_line_loop:

    mov r9b, [rdx + rax]
    mov r8b, [rcx + rax]

    mov [rdx + rax], r8b
    mov [rcx + rax], r9b

    inc eax
    cmp eax, 256
    jb .swap_line_loop

    mov r8d, 1

.score_no_swap:

    inc r11d
    jmp .score_inner


.score_outer_done:

    test r8d, r8d
    jz .show_score_lines

    dec r10d
    jnz .score_outer


    ; --------------------------------
    ; Vis hele highscore-linjerne
    ; --------------------------------

.show_score_lines:

    xor ebx, ebx


.show_score_loop:

    cmp ebx, [highscore_count]
    jae .menu

    mov eax, ebx
    shl eax, 8

    lea rdx, [highscore_lines]
    add rdx, rax

    lea rcx, [line_format]
    call printf

    inc ebx
    jmp .show_score_loop


.done:

    add rsp, 32
	pop rbx
    ret