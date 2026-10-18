default rel

extern settings_wpm
extern Sleep
extern waveOutClose
extern waveOutOpen
extern waveOutPrepareHeader
extern waveOutUnprepareHeader
extern waveOutWrite

section .data



; WAVEFORMATEX
cw_wave_format:
    dw 1            ; PCM
    dw 1            ; Mono
    dd 8000         ; Samples/sekund
    dd 8000         ; Bytes/sekund
    dw 1            ; Block align
    dw 8            ; Bits/sample
    dw 0            ; cbSize

cw_sine_table:
    db 128, 168, 197, 208, 197, 168
    db 128, 88, 59, 48, 59, 88


section .bss

cw_dash_buffer resb 1920
cw_dash_samples  resd 1
cw_dot_buffer    resb 640
cw_dot_samples   resd 1
cw_element_ms    resd 1
cw_letter_ms     resd 1
cw_wave_handle   resq 1
cw_wave_header   resb 48

section .text

global cw_send_text

extern printf

cw_send_text:
    push rbx
    sub rsp, 32

	; RCX peger paa teksten fra ASMLog.asm
    mov rbx, rcx

	; Indstil CW-timing efter valgt WPM
    call cw_set_wpm

        ; Indstil CW-timing efter valgt WPM
    call cw_set_wpm

    ; Generer tonebufferne
    call cw_generate_dot
    call cw_generate_dash

    ; Aabn waveOut én gang
    call cw_wave_open

    

.next_char:
    mov al, [rbx]

    cmp al, 'a'
    jb .uppercase_done

    cmp al, 'z'
    ja .uppercase_done

    sub al, 32

.uppercase_done:

    ; 0 = slut paa tekst
    test al, al
    jz .done

    cmp al, 'A'
    je .send_a

    cmp al, 'B'
    je .send_b

    cmp al, 'C'
    je .send_c
	
	cmp al, 'D'
    je .send_d

    cmp al, 'E'
    je .send_e
	
    cmp al, 'F'
    je .send_f

    cmp al, 'G'
    je .send_g

    cmp al, 'H'
    je .send_h

    cmp al, 'I'
    je .send_i

    cmp al, 'J'
    je .send_j

    cmp al, 'K'
    je .send_k

    cmp al, 'L'
    je .send_l
	
    cmp al, 'M'
    je .send_m

    cmp al, 'N'
    je .send_n
	
    cmp al, 'O'
    je .send_o
	
    cmp al, 'P'
    je .send_p

    cmp al, 'Q'
    je .send_q

    cmp al, 'R'
    je .send_r

    cmp al, 'S'
    je .send_s
	
	cmp al, 'T'
    je .send_t

    cmp al, 'U'
    je .send_u

    cmp al, 'V'
    je .send_v
	
    cmp al, 'W'
    je .send_w

    cmp al, 'X'
    je .send_x
	
    cmp al, 'Y'
    je .send_y
	
    cmp al, 'Z'
    je .send_z

    cmp al, '0'
    je .send_0

	cmp al, '1'
    je .send_1
	
    cmp al, '2'
    je .send_2

    cmp al, '3'
    je .send_3

    cmp al, '4'
    je .send_4

    cmp al, '5'
    je .send_5

    cmp al, '6'
    je .send_6
	
    cmp al, '7'
    je .send_7

    cmp al, '8'
    je .send_8
	
    cmp al, '9'
    je .send_9

    cmp al, '/'
    je .send_slash

    ; Ukendt tegn - spring over
    jmp .next
	
.send_a:
    call cw_send_a
    jmp .next

.send_b:
    call cw_send_b
    jmp .next
	
.send_c:
    call cw_send_c
    jmp .next

.send_d:
    call cw_send_d
    jmp .next

.send_e:
    call cw_send_e
    jmp .next

.send_f:
    call cw_send_f
    jmp .next

.send_g:
    call cw_send_g
    jmp .next

.send_h:
    call cw_send_h
    jmp .next

.send_i:
    call cw_send_i
    jmp .next

.send_j:
    call cw_send_j
    jmp .next

.send_k:
    call cw_send_k
    jmp .next

.send_l:
    call cw_send_l
    jmp .next
	
.send_m:
    call cw_send_m
    jmp .next

.send_n:
    call cw_send_n
    jmp .next
	
.send_o:
    call cw_send_o
    jmp .next
	
.send_p:
    call cw_send_p
    jmp .next

.send_q:
    call cw_send_q
    jmp .next

.send_r:
    call cw_send_r
    jmp .next

.send_s:
    call cw_send_s
    jmp .next
	
.send_t:
    call cw_send_t
    jmp .next

.send_u:
    call cw_send_u
    jmp .next

.send_v:
    call cw_send_v
    jmp .next

.send_w:
    call cw_send_w
    jmp .next

.send_x:
    call cw_send_x
    jmp .next

.send_y:
    call cw_send_y
    jmp .next
	
.send_z:
    call cw_send_z
	jmp .next

.send_0:
    call cw_send_0
    jmp .next

.send_1:
    call cw_send_1
    jmp .next

.send_2:
    call cw_send_2
    jmp .next	

.send_3:
    call cw_send_3
    jmp .next

.send_4:
    call cw_send_4
    jmp .next

.send_5:
    call cw_send_5
    jmp .next

.send_6:
    call cw_send_6
    jmp .next

.send_7:
    call cw_send_7
    jmp .next

.send_8:
    call cw_send_8
    jmp .next

.send_9:
    call cw_send_9
    jmp .next

.send_slash:
    call cw_send_slash
    jmp .next
	
.next:
    inc rbx

    ; Er naeste tegn slutningen?
    cmp byte [rbx], 0
    je .next_char

    ; Pause mellem bogstaver
    call cw_letter_pause

    jmp .next_char

.done:

	; Kort pause efter sidste tegn
    call cw_letter_pause

    ; Luk waveOut efter hele teksten
    call cw_wave_close
	
    add rsp, 32
    pop rbx
    ret

cw_set_wpm:

    cmp dword [settings_wpm], 15
    je .wpm_15

    cmp dword [settings_wpm], 25
    je .wpm_25

    cmp dword [settings_wpm], 30
    je .wpm_30

    cmp dword [settings_wpm], 35
    je .wpm_35

    ; 20 WPM er standard
.wpm_20:
    mov dword [cw_dot_samples], 480
    mov dword [cw_dash_samples], 1440
    mov dword [cw_element_ms], 60
    mov dword [cw_letter_ms], 180
    ret

.wpm_15:
    mov dword [cw_dot_samples], 640
    mov dword [cw_dash_samples], 1920
    mov dword [cw_element_ms], 80
    mov dword [cw_letter_ms], 240
    ret

.wpm_25:
    mov dword [cw_dot_samples], 384
    mov dword [cw_dash_samples], 1152
    mov dword [cw_element_ms], 48
    mov dword [cw_letter_ms], 144
    ret

.wpm_30:
    mov dword [cw_dot_samples], 320
    mov dword [cw_dash_samples], 960
    mov dword [cw_element_ms], 40
    mov dword [cw_letter_ms], 120
    ret

.wpm_35:
    mov dword [cw_dot_samples], 276
    mov dword [cw_dash_samples], 828
    mov dword [cw_element_ms], 34
    mov dword [cw_letter_ms], 103
    ret

; ------------------------------------------------------------
; Generer prik
; 20 WPM = 60 ms = 480 samples
; ------------------------------------------------------------

cw_generate_dot:
    lea r9, [cw_dot_buffer]
    lea r10, [cw_sine_table]
    xor ecx, ecx
    xor edx, edx

.generate_loop:
    mov al, [r10 + rdx]
    mov [r9 + rcx], al

    inc edx
    cmp edx, 12
    jb .next_sample

    xor edx, edx

.next_sample:
    inc ecx
    cmp ecx, [cw_dot_samples]
    jb .generate_loop

    ret

    ret

; ------------------------------------------------------------
; Generer streg
; 20 WPM = 180 ms = 1440 samples
; ------------------------------------------------------------

cw_generate_dash:
    lea r9, [cw_dash_buffer]
    lea r10, [cw_sine_table]
    xor ecx, ecx
    xor edx, edx

.generate_loop:
    mov al, [r10 + rdx]
    mov [r9 + rcx], al

    inc edx
    cmp edx, 12
    jb .next_sample

    xor edx, edx

.next_sample:
    inc ecx
    cmp ecx, [cw_dash_samples]
    jb .generate_loop

    ret
	
cw_wave_open:
    sub rsp, 56

    ; waveOutOpen(&handle, WAVE_MAPPER, &format, 0, 0, 0)
    lea rcx, [cw_wave_handle]
    mov edx, -1
    lea r8, [cw_wave_format]
    xor r9d, r9d
    mov qword [rsp + 32], 0
    mov dword [rsp + 40], 0
    call waveOutOpen

    add rsp, 56
    ret

cw_wave_close:
    sub rsp, 40

    mov rcx, [cw_wave_handle]
    call waveOutClose

    add rsp, 40
    ret	
; ------------------------------------------------------------
; Afspil PCM-buffer med waveOut
; ------------------------------------------------------------

cw_play_dot:
    sub rsp, 56

    
    ; WAVEHDR
    lea rax, [cw_dot_buffer]
    mov [cw_wave_header], rax

    mov eax, [cw_dot_samples]
    mov dword [cw_wave_header + 8], eax
    mov dword [cw_wave_header + 12], 0
    mov qword [cw_wave_header + 16], 0
    mov dword [cw_wave_header + 24], 0
    mov dword [cw_wave_header + 28], 0
    mov qword [cw_wave_header + 32], 0
    mov qword [cw_wave_header + 40], 0

    ; Prepare
    mov rcx, [cw_wave_handle]
    lea rdx, [cw_wave_header]
    mov r8d, 48
    call waveOutPrepareHeader

    test eax, eax
    jnz .close

    ; Play
    mov rcx, [cw_wave_handle]
    lea rdx, [cw_wave_header]
    mov r8d, 48
    call waveOutWrite

    test eax, eax
    jnz .unprepare

    ; Testbufferen varer 100 ms.
    ; Vent lidt længere så den bliver færdig.
    mov ecx, 100
    .wait_done:
    test dword [cw_wave_header + 24], 1    ; WHDR_DONE
    jnz .unprepare

    mov ecx, 1
    call Sleep
    jmp .wait_done

.unprepare:
    mov rcx, [cw_wave_handle]
    lea rdx, [cw_wave_header]
    mov r8d, 48
    call waveOutUnprepareHeader

.close:
   
.done:
    add rsp, 56
    ret

cw_play_dash:
    sub rsp, 56

   
    ; WAVEHDR
    lea rax, [cw_dash_buffer]
    mov [cw_wave_header], rax

    mov eax, [cw_dash_samples]
	mov dword [cw_wave_header + 8], eax
    mov dword [cw_wave_header + 12], 0
    mov qword [cw_wave_header + 16], 0
    mov dword [cw_wave_header + 24], 0
    mov dword [cw_wave_header + 28], 0
    mov qword [cw_wave_header + 32], 0
    mov qword [cw_wave_header + 40], 0

    ; Prepare
    mov rcx, [cw_wave_handle]
    lea rdx, [cw_wave_header]
    mov r8d, 48
    call waveOutPrepareHeader

    test eax, eax
    jnz .close

    ; Play
    mov rcx, [cw_wave_handle]
    lea rdx, [cw_wave_header]
    mov r8d, 48
    call waveOutWrite

    test eax, eax
    jnz .unprepare

    ; Testbufferen varer 100 ms.
    ; Vent lidt længere så den bliver færdig.
    mov ecx, 220
    .wait_done:
    test dword [cw_wave_header + 24], 1    ; WHDR_DONE
    jnz .unprepare

    mov ecx, 1
    call Sleep
    jmp .wait_done

.unprepare:
    mov rcx, [cw_wave_handle]
    lea rdx, [cw_wave_header]
    mov r8d, 48
    call waveOutUnprepareHeader

.close:
  

.done:
    add rsp, 56
    ret

;Morse Alfabetet
cw_element_pause:
    sub rsp, 40

    mov ecx, [cw_element_ms]
    call Sleep

    add rsp, 40
    ret
cw_letter_pause:
    sub rsp, 40

    mov ecx, [cw_letter_ms]
    call Sleep

    add rsp, 40
    ret
cw_send_a:
    sub rsp, 40

    ; A = .-
    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret


cw_send_b:
    sub rsp, 40

    ; B = -...
    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    mov ecx, 60
    call Sleep

    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret

cw_send_c:
    sub rsp, 40

    ; C = -.-.

    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret

cw_send_d:
    sub rsp, 40

    ; D = -..
    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret


cw_send_e:
    sub rsp, 40

    ; E = .
    call cw_play_dot

    add rsp, 40
    ret

cw_send_f:
    sub rsp, 40

    ; F = ..-.
    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret


cw_send_g:
    sub rsp, 40

    ; G = --.
    call cw_play_dash

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret

cw_send_h:
    sub rsp, 40

    ; H = ....

    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret	

cw_send_i:
    sub rsp, 40

    ; I = ..
    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret


cw_send_j:
    sub rsp, 40

    ; J = .---
    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dash

    mov ecx, 60
    call Sleep

    call cw_play_dash

    add rsp, 40
    ret
cw_send_k:
    sub rsp, 40

    ; K = -.-
    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret


cw_send_l:
    sub rsp, 40

    ; L = .-..
    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret

cw_send_m:
    sub rsp, 40

    ; M = --
    call cw_play_dash

    call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret


cw_send_n:
    sub rsp, 40

    ; N = -.
    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret
	
cw_send_o:
    sub rsp, 40

    call cw_play_dash

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret
cw_send_p:
    sub rsp, 40

    ; P = .--.
    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret


cw_send_q:
    sub rsp, 40

    ; Q = --.-
    call cw_play_dash

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret

cw_send_r:
    sub rsp, 40

    ; R = .-.
    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret


cw_send_s:
    sub rsp, 40

    ; S = ...
    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret
	
cw_send_t:
    sub rsp, 40

    ; T = -
    call cw_play_dash

    add rsp, 40
    ret

cw_send_u:
    sub rsp, 40

    ; U = ..-
    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret


cw_send_v:
    sub rsp, 40

    ; V = ...-
    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret

cw_send_w:
    sub rsp, 40

    ; W = .--
    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret


cw_send_x:
    sub rsp, 40

    ; X = -..-
    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret
cw_send_y:
    sub rsp, 40

    ; Y = -.--
    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret
	
cw_send_z:
    sub rsp, 40

    ; Z = --..

    call cw_play_dash

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dot

    call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret

cw_send_0:
    sub rsp, 40

    ; 0 = -----
    call cw_play_dash
	
    call cw_element_pause

    call cw_play_dash
	
    call cw_element_pause

    call cw_play_dash
	
    call cw_element_pause

    call cw_play_dash
	
    call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret

cw_send_1:
    sub rsp, 40

    ; 1 = .----

    call cw_play_dot

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dash

    call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret	


cw_send_2:
    sub rsp, 40

    ; 2 = ..---
    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret

cw_send_3:
    sub rsp, 40

    ; 3 = ...--
    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret


cw_send_4:
    sub rsp, 40

    ; 4 = ....-
    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dash

    add rsp, 40
    ret
	
cw_send_5:
    sub rsp, 40

    ; 5 = .....
    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret


cw_send_6:
    sub rsp, 40

    ; 6 = -....
    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret
	
cw_send_7:
    sub rsp, 40

    ; 7 = --...
    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret


cw_send_8:
    sub rsp, 40

    ; 8 = ---..
    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret
	
cw_send_9:
    sub rsp, 40

    ; 9 = ----.
    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret


cw_send_slash:
    sub rsp, 40

    ; / = -..-.
    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dot
    
	call cw_element_pause

    call cw_play_dash
    
	call cw_element_pause

    call cw_play_dot

    add rsp, 40
    ret