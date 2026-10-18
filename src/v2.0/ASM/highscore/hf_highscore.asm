bits 64
default rel

global hf_highscore_menu

extern fclose
extern fgets
extern fopen
extern printf
extern scanf
extern strcspn

section .data
char_format db " %c", 0
highscore_menu_text db 10, "=== HF CW Highscore ===", 10, 10
                    db "1. Vis efter dato", 10
                    db "2. Vis efter noejagtighed", 10
                    db "0. Tilbage", 10, 10
                    db "Valg: ", 0
highscore_filename db "highscore/hf_highscore.txt", 0
read_mode db "r", 0
line_format db "%s", 10, 0
empty_text db "Ingen HF CW-highscores endnu.", 10, 0
newline_chars db 13, 10, 0

section .bss
highscore_buffer resb 256
highscore_choice resb 1
highscore_count resd 1
highscore_file resq 1
highscore_lines resb 25600
highscore_scores resd 100

section .text
hf_highscore_menu:
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
    lea rcx, [highscore_filename]
    lea rdx, [read_mode]
    call fopen
    test rax, rax
    jz .empty
    mov [highscore_file], rax
.date_loop:
    lea rcx, [highscore_buffer]
    mov edx, 256
    mov r8, [highscore_file]
    call fgets
    test rax, rax
    jz .date_close
    lea rcx, [highscore_buffer]
    lea rdx, [newline_chars]
    call strcspn
    lea rdx, [highscore_buffer]
    mov byte [rdx + rax], 0
    lea rcx, [line_format]
    lea rdx, [highscore_buffer]
    call printf
    jmp .date_loop
.date_close:
    mov rcx, [highscore_file]
    call fclose
    jmp .menu
.sort_score:
    mov dword [highscore_count], 0
    lea rcx, [highscore_filename]
    lea rdx, [read_mode]
    call fopen
    test rax, rax
    jz .empty
    mov [highscore_file], rax
.score_read:
    lea rcx, [highscore_buffer]
    mov edx, 256
    mov r8, [highscore_file]
    call fgets
    test rax, rax
    jz .score_close
    mov ebx, [highscore_count]
    cmp ebx, 100
    jae .score_close
    lea rcx, [highscore_buffer]
    lea rdx, [newline_chars]
    call strcspn
    lea rdx, [highscore_buffer]
    mov byte [rdx + rax], 0
    mov eax, ebx
    shl eax, 8
    lea rdx, [highscore_lines]
    add rdx, rax
    lea rcx, [highscore_buffer]
.copy_line:
    mov al, [rcx]
    mov [rdx], al
    inc rcx
    inc rdx
    test al, al
    jnz .copy_line
    ; Find sidste '|' og parse procent som hundrededele.
    lea rcx, [highscore_buffer]
    xor r9d, r9d
.find_bar:
    mov al, [rcx]
    test al, al
    jz .parse_score
    cmp al, '|'
    jne .next_bar
    lea r9, [rcx + 1]
.next_bar:
    inc rcx
    jmp .find_bar
.parse_score:
    xor eax, eax
    test r9, r9
    jz .store_score
.skip_space:
    cmp byte [r9], ' '
    jne .whole
    inc r9
    jmp .skip_space
.whole:
    movzx ecx, byte [r9]
    cmp ecx, '0'
    jb .decimal
    cmp ecx, '9'
    ja .decimal
    imul eax, eax, 10
    sub ecx, '0'
    add eax, ecx
    inc r9
    jmp .whole
.decimal:
    imul eax, eax, 100
    cmp byte [r9], '.'
    jne .store_score
    inc r9
    movzx ecx, byte [r9]
    cmp ecx, '0'
    jb .store_score
    cmp ecx, '9'
    ja .store_score
    sub ecx, '0'
    imul ecx, ecx, 10
    add eax, ecx
    inc r9
    movzx ecx, byte [r9]
    cmp ecx, '0'
    jb .store_score
    cmp ecx, '9'
    ja .store_score
    sub ecx, '0'
    add eax, ecx
.store_score:
    mov [highscore_scores + rbx*4], eax
    inc dword [highscore_count]
    jmp .score_read
.score_close:
    mov rcx, [highscore_file]
    call fclose
    ; Selection sort: hoejeste procent foerst.
    xor ebx, ebx
.outer:
    cmp ebx, [highscore_count]
    jae .show_lines
    mov r10d, ebx
    lea r11d, [rbx + 1]
.inner:
    cmp r11d, [highscore_count]
    jae .swap
    mov eax, [highscore_scores + r11*4]
    cmp eax, [highscore_scores + r10*4]
    jbe .next_inner
    mov r10d, r11d
.next_inner:
    inc r11d
    jmp .inner
.swap:
    cmp r10d, ebx
    je .next_outer
    mov eax, [highscore_scores + rbx*4]
    mov ecx, [highscore_scores + r10*4]
    mov [highscore_scores + rbx*4], ecx
    mov [highscore_scores + r10*4], eax
    mov eax, ebx
    shl eax, 8
    lea rdx, [highscore_lines]
    add rdx, rax
    mov eax, r10d
    shl eax, 8
    lea rcx, [highscore_lines]
    add rcx, rax
    xor r8d, r8d
.swap_bytes:
    mov al, [rdx + r8]
    mov r9b, [rcx + r8]
    mov [rdx + r8], r9b
    mov [rcx + r8], al
    inc r8d
    cmp r8d, 256
    jb .swap_bytes
.next_outer:
    inc ebx
    jmp .outer
.show_lines:
    xor ebx, ebx
.show_loop:
    cmp ebx, [highscore_count]
    jae .menu
    mov eax, ebx
    shl eax, 8
    lea rdx, [highscore_lines]
    add rdx, rax
    lea rcx, [line_format]
    call printf
    inc ebx
    jmp .show_loop
.empty:
    lea rcx, [empty_text]
    call printf
    jmp .menu
.done:
    add rsp, 32
    pop rbx
    ret
