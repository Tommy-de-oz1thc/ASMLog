
; ASMLog v3.0 - File di lingua italiana
; Stesso ordine degli ID di sprog_da.asm
; Encoding: UTF-8

bits 64
default rel

global it_tabel

section .data

it_tabel:
    dq it_menu_title
    dq it_menu_new_qso
    dq it_menu_show_log
    dq it_menu_search_call
    dq it_menu_new_log
    dq it_menu_print_log
    dq it_menu_settings
    dq it_menu_highscore
    dq it_menu_back
	
    ; Impostazioni (ID 9-18)
    dq it_settings_title
    dq it_settings_logtype
    dq it_settings_callsign
    dq it_settings_name
    dq it_settings_email
    dq it_settings_address
    dq it_settings_postcode
    dq it_settings_city
    dq it_settings_power
    dq it_settings_back

    ; Menu tipo di contest (ID 19-26)
    dq it_logtype_title
    dq it_logtype_wpx
    dq it_logtype_hf
    dq it_logtype_arrl_dx
    dq it_logtype_russian_dx
    dq it_logtype_cqww_dx
    dq it_logtype_sac_cw
    dq it_logtype_back

    ; Nuovo QSO (ID 27-38)
    dq it_qso_title
    dq it_qso_callsign
    dq it_qso_band
    dq it_qso_mode
    dq it_qso_rst_sent
    dq it_qso_rst_received
    dq it_qso_exchange
    dq it_qso_zone
    dq it_qso_serial
    dq it_qso_points
    dq it_qso_save
    dq it_qso_back

    ; Visualizza registro QSO (ID 39-48)
    dq it_show_log_title
    dq it_show_log_date
    dq it_show_log_time
    dq it_show_log_callsign
    dq it_show_log_band
    dq it_show_log_mode
    dq it_show_log_rst
    dq it_show_log_exchange
    dq it_show_log_points
    dq it_show_log_back

    ; Ricerca nominativo (ID 49-54)
    dq it_search_enter_call
    dq it_search_you_entered
    dq it_search_call_prompt
    dq it_search_results
    dq it_search_count
    dq it_search_not_found

    ; Esporta log (ID 55-60)
    dq it_print_log_title
    dq it_print_log_adif
    dq it_print_log_cabrillo
    dq it_print_log_main_menu
    dq it_print_log_back
    dq it_print_log_choice


    ; Menu modalita (ID 61-65)
    dq it_mode_title
    dq it_mode_radio
    dq it_mode_cw
    dq it_mode_cw_text
    dq it_mode_text


    ; Selezione lingua (ID 66)
    dq it_language_title


    ; Menu potenza (ID 67-71)
    dq it_power_title
    dq it_power_qrp
    dq it_power_low
    dq it_power_high
    dq it_power_arrl


    ; Menu WPM (ID 72)
    dq it_wpm_title


    ; Ordinamento Highscore (ID 73-74)
    dq it_highscore_sort_date
    dq it_highscore_sort_real


    ; Eliminazione Highscore (ID 75-85)
    dq it_highscore_delete_title
    dq it_highscore_delete_wpx
    dq it_highscore_delete_hf
    dq it_highscore_delete_arrl
    dq it_highscore_delete_russian
    dq it_highscore_delete_cqww
    dq it_highscore_delete_sac
    dq it_highscore_delete_all
    dq it_highscore_delete_confirm
    dq it_highscore_delete_done
    dq it_highscore_delete_error


    ; Avvia nuovo registro (ID 86-87)
    dq it_newlog_warning
    dq it_newlog_prompt


    ; Impostazioni - campi aggiuntivi (ID 88-89)
    dq it_settings_arrl_state_prompt
    dq it_settings_wpm_prompt


    ; Impostazioni - inserimento dati (ID 90-95)
    dq it_settings_callsign_input
    dq it_settings_name_input
    dq it_settings_email_input
    dq it_settings_address_input
    dq it_settings_zip_input
    dq it_settings_city_input

    ; Impostazioni - salvato (ID 96-102)
    dq it_settings_callsign_saved
    dq it_settings_name_saved
    dq it_settings_email_saved
    dq it_settings_address_saved
    dq it_settings_zip_saved
    dq it_settings_city_saved
    dq it_settings_power_saved

    dq it_settings_arrl_power_input

    dq it_cw_time_title
    dq it_cw_time_5_min
    dq it_cw_time_10_min
    dq it_cw_time_15_min
    dq it_cw_time_30_min
    dq it_cw_time_60_min
    dq it_cw_time_choose

    dq it_exit_question
    dq it_exit_message

    dq it_error_invalid_choice
    dq it_error_invalid_band
    dq it_error_invalid_callsign
    dq it_error_callsign_file
    dq it_error_invalid_rst
    dq it_error_invalid_qsonr
    dq it_error_wpx_log_file

    dq it_status_logtype_wpx
    dq it_status_logtype_hf
    dq it_status_logtype_arrl
    dq it_status_logtype_russian
    dq it_status_logtype_cqww
    dq it_status_logtype_sac
    dq it_status_mode_radio
    dq it_status_mode_cw
    dq it_status_mode_cw_text
    dq it_status_mode_text

    dq it_qso_saved_message
    dq it_qso_dupe_warning
    dq it_qso_count_format
    dq it_qso_dupe_count_format
    dq it_qso_points_format
    dq it_qso_sent_text_format

    ; CTY-beskeder (ID 136-137)
    dq it_cty_result_format
    dq it_cty_file_error

    ; HF-beskeder (ID 138-157)
    dq it_hf_call_correct
    dq it_hf_call_wrong
    dq it_hf_rst_correct
    dq it_hf_rst_wrong
    dq it_hf_name_correct
    dq it_hf_name_wrong
    dq it_hf_qth_correct
    dq it_hf_qth_wrong
    dq it_hf_result_header
    dq it_hf_result_qso
    dq it_hf_result_call
    dq it_hf_result_rst
    dq it_hf_result_name
    dq it_hf_result_qth
    dq it_hf_result_total
    dq it_hf_result_wrong
    dq it_hf_result_percent
    dq it_hf_highscore_header
    dq it_hf_highscore_empty
    dq it_hf_log_header

    ; Fælles checkerbeskeder (ID 158-164)
    dq it_checker_band_ok
    dq it_checker_band_error
    dq it_checker_qso_ok
    dq it_checker_qso_error
    dq it_checker_claimed_score
    dq it_checker_real_score
    dq it_checker_highscore_date

    ; Russian DX (ID 165-173)
    dq it_russian_country_mult
    dq it_russian_country_used
    dq it_russian_oblast_mult
    dq it_russian_oblast_used
    dq it_russian_oblast_error
    dq it_russian_log_empty
    dq it_russian_station
    dq it_russian_not_station
    dq it_russian_new_log

    ; CQ WW DX (ID 174-179)
    dq it_cqww_continent_error
    dq it_cqww_continent_prompt
    dq it_cqww_zone_error
    dq it_cqww_zone_prompt
    dq it_cqww_new_log_done
    dq it_cqww_new_log_warning

    ; SAC CW (ID 180-187)
    dq it_sac_new_log_done
    dq it_sac_new_log_prompt
    dq it_sac_scandinavian
    dq it_sac_non_scandinavian
    dq it_sac_serial_prompt
    dq it_sac_serial_error
    dq it_sac_qso_points
    dq it_sac_dupe_message

    ; ARRL DX (ID 188-193)
    dq it_arrl_new_log_done
    dq it_arrl_new_log_prompt
    dq it_arrl_log_empty
    dq it_arrl_multipliers
    dq it_arrl_score
    dq it_arrl_qso_points

    dq it_menu_delete_highscore    ; ID 194

    dq it_settings_arrl_state_menu

    dq it_wpx_highscore_title       ; 196
    dq it_arrl_highscore_title      ; 197
    dq it_russian_highscore_title   ; 198
    dq it_cqww_highscore_title      ; 199
    dq it_sac_highscore_title       ; 200
    dq it_hf_highscore_title        ; 201
    dq it_highscore_sort_date       ; 202
    dq it_highscore_sort_real       ; 203

    dq it_hf_highscore_accuracy    ; 204

    dq it_delete_hs_title       ; 205
    dq it_delete_hs_wpx         ; 206
    dq it_delete_hs_hf          ; 207
    dq it_delete_hs_arrl        ; 208
    dq it_delete_hs_russian     ; 209
    dq it_delete_hs_cqww        ; 210
    dq it_delete_hs_sac         ; 211
    dq it_delete_hs_all         ; 212

    dq it_settings_language     ; 213
	
it_menu_title:
    db "Menu principale", 0

it_menu_new_qso:
    db "Nuovo QSO", 0

it_menu_show_log:
    db "Mostra registro QSO", 0

it_menu_search_call:
    db "Cerca nominativo", 0

it_menu_new_log:
    db "Inizia nuovo registro", 0

it_menu_print_log:
    db "Stampa registro", 0

it_menu_settings:
    db "Impostazioni", 0

it_menu_highscore:
    db "Classifica", 0

it_menu_back:
    db "Indietro", 0





; ==========================================
; Impostazioni (ID 9-18)
; ==========================================

it_settings_title:
    db "Impostazioni", 0

it_settings_logtype:
    db "Tipo di contest", 0

it_settings_callsign:
    db "Nominativo", 0

it_settings_name:
    db "Nome", 0

it_settings_email:
    db "E-mail", 0

it_settings_address:
    db "Indirizzo", 0

it_settings_postcode:
    db "Codice postale", 0

it_settings_city:
    db "Citta", 0

it_settings_power:
    db "Potenza", 0

it_settings_back:
    db "Indietro", 0





; ==========================================
; Menu tipo di contest (ID 19-26)
; ==========================================

it_logtype_title:
    db "Seleziona tipo di contest", 0

it_logtype_wpx:
    db "WPX", 0

it_logtype_hf:
    db "HF", 0

it_logtype_arrl_dx:
    db "ARRL DX CW", 0

it_logtype_russian_dx:
    db "Russian DX", 0

it_logtype_cqww_dx:
    db "CQ WW DX CW", 0

it_logtype_sac_cw:
    db "SAC CW", 0

it_logtype_back:
    db "Indietro", 0





; ==========================================
; Nuovo QSO (ID 27-38)
; ==========================================

it_qso_title:
    db "Nuovo QSO", 0

it_qso_callsign:
    db "Nominativo", 0

it_qso_band:
    db "Banda", 0

it_qso_mode:
    db "Modo", 0

it_qso_rst_sent:
    db "RST inviato", 0

it_qso_rst_received:
    db "RST ricevuto", 0

it_qso_exchange:
    db "Scambio", 0

it_qso_zone:
    db "Zona", 0

it_qso_serial:
    db "Numero progressivo", 0

it_qso_points:
    db "Punti", 0

it_qso_save:
    db "Salva QSO", 0

it_qso_back:
    db "Indietro", 0





; ==========================================
; Visualizza registro QSO (ID 39-48)
; ==========================================

it_show_log_title:
    db "Visualizza registro QSO", 0

it_show_log_date:
    db "Data", 0

it_show_log_time:
    db "Ora", 0

it_show_log_callsign:
    db "Nominativo", 0

it_show_log_band:
    db "Banda", 0

it_show_log_mode:
    db "Modo", 0

it_show_log_rst:
    db "RST", 0

it_show_log_exchange:
    db "Scambio", 0

it_show_log_points:
    db "Punti", 0

it_show_log_back:
    db "Indietro", 0







; ==========================================
; Ricerca nominativo (ID 49-54)
; ==========================================

it_search_enter_call:
    db "Inserisci il nominativo: ", 0

it_search_you_entered:
    db "Hai cercato: %s", 0

it_search_call_prompt:
    db "Nominativo da cercare: ", 0

it_search_results:
    db "QSO trovati:", 0

it_search_count:
    db "Numero di risultati: %d", 0

it_search_not_found:
    db "Nessun QSO trovato.", 0

; ==========================================
; Esporta log (ID 55-60)
; ==========================================

it_print_log_title:
    db "Esporta log", 0

it_print_log_adif:
    db "ADIF - HF", 0

it_print_log_cabrillo:
    db "Cabrillo", 0

it_print_log_main_menu:
    db "Menu principale", 0

it_print_log_back:
    db "Indietro", 0

it_print_log_choice:
    db "Scelta: ", 0


; ==========================================
; Menu modalita (ID 61-65)
; ==========================================

it_mode_title:
    db "Modalita operativa", 0

it_mode_radio:
    db "RADIO", 0

it_mode_cw:
    db "CW", 0

it_mode_cw_text:
    db "CW + TESTO", 0

it_mode_text:
    db "TESTO", 0


; ==========================================
; Selezione lingua (ID 66)
; ==========================================

it_language_title:
    db "Seleziona lingua", 0


; ==========================================
; Menu potenza (ID 67-71)
; ==========================================

it_power_title:
    db "Potenza", 0

it_power_qrp:
    db "QRP", 0

it_power_low:
    db "LOW", 0

it_power_high:
    db "HIGH", 0

it_power_arrl:
    db "Potenza ARRL", 0


; ==========================================
; Menu WPM (ID 72)
; ==========================================

it_wpm_title:
    db "Velocita CW (WPM)", 0


; ==========================================
; Ordinamento Highscore (ID 73-74)
; ==========================================

it_highscore_sort_date:
    db "Ordina per data", 0

it_highscore_sort_real:
    db "Ordina per punteggio reale", 0


; ==========================================
; Eliminazione Highscore (ID 75-85)
; ==========================================

it_highscore_delete_title:
    db "Elimina Highscore", 0

it_highscore_delete_wpx:
    db "Elimina Highscore WPX", 0

it_highscore_delete_hf:
    db "Elimina Highscore HF", 0

it_highscore_delete_arrl:
    db "Elimina Highscore ARRL DX", 0

it_highscore_delete_russian:
    db "Elimina Highscore Russian DX", 0

it_highscore_delete_cqww:
    db "Elimina Highscore CQ WW DX", 0

it_highscore_delete_sac:
    db "Elimina Highscore SAC CW", 0

it_highscore_delete_all:
    db "Elimina TUTTI gli Highscore", 0

it_highscore_delete_confirm:
    db "Sei sicuro di voler eliminare gli Highscore selezionati? (S/N): ", 0

it_highscore_delete_done:
    db "Highscore eliminati.", 0

it_highscore_delete_error:
    db "ERRORE: Impossibile svuotare il file Highscore.", 0


; ==========================================
; Avvia nuovo registro (ID 86-87)
; ==========================================

it_newlog_warning:
    db "ATTENZIONE: L'intero registro attuale verra eliminato.", 0

it_newlog_prompt:
    db "Avviare un nuovo registro? (S/N): ", 0


; ==========================================
; Impostazioni - campi aggiuntivi (ID 88-89)
; ==========================================

it_settings_arrl_state_prompt:
    db "Inserire lo stato/provincia ARRL (es. ON o NY): ", 0

it_settings_wpm_prompt:
    db "WPM (es. 10, 15, 20, 25): ", 0


; ==========================================
; Impostazioni - inserimento dati (ID 90-95)
; ==========================================

it_settings_callsign_input:
    db "Inserire il nominativo: ", 0

it_settings_name_input:
    db "Inserire il nome: ", 0

it_settings_email_input:
    db "Inserire l'e-mail: ", 0

it_settings_address_input:
    db "Inserire l'indirizzo: ", 0

it_settings_zip_input:
    db "Inserire il codice postale: ", 0

it_settings_city_input:
    db "Inserire la citta: ", 0

; ==========================================
; Impostazioni - salvato (ID 96-102)
; ==========================================

it_settings_callsign_saved:
    db "Nominativo salvato.", 10, 0

it_settings_name_saved:
    db "Nome salvato.", 10, 0

it_settings_email_saved:
    db "E-mail salvata.", 10, 0

it_settings_address_saved:
    db "Indirizzo salvato.", 10, 0

it_settings_zip_saved:
    db "Codice postale salvato.", 10, 0

it_settings_city_saved:
    db "Citta salvata.", 10, 0

it_settings_power_saved:
    db "Potenza salvata.", 10, 0

it_settings_arrl_power_input:
    db "Inserire la potenza ARRL in watt: ", 0
	
it_cw_time_title:
    db "=== Durata allenamento CW ===", 0

it_cw_time_5_min:
    db "1.  5 minuti", 0

it_cw_time_10_min:
    db "2. 10 minuti", 0

it_cw_time_15_min:
    db "3. 15 minuti", 0

it_cw_time_30_min:
    db "4. 30 minuti", 0

it_cw_time_60_min:
    db "5. 60 minuti", 0

it_cw_time_choose:
    db "Seleziona la durata dell'allenamento: ", 0
	
it_exit_question:
    db "Vuoi uscire dal programma? (S/N): ", 0

it_exit_message:
    db "Chiusura di ASMLog.", 0
	
it_error_invalid_choice:
    db "Scelta non valida.", 0

it_error_invalid_band:
    db "Banda WPX non valida. Usare 160m, 80m, 40m, 20m, 15m o 10m.", 0

it_error_invalid_callsign:
    db "Nominativo non valido - deve contenere una lettera e una cifra.", 0

it_error_callsign_file:
    db "ERRORE: Il file dei nominativi manca o e' vuoto.", 0

it_error_invalid_rst:
    db "RST deve contenere esattamente tre cifre, ad esempio 599.", 0

it_error_invalid_qsonr:
    db "QSONR deve contenere al massimo 5 cifre.", 0

it_error_wpx_log_file:
    db "Impossibile aprire wpx_log.txt", 0
	
it_status_logtype_wpx:
    db "Tipo di log selezionato: WPX", 0

it_status_logtype_hf:
    db "Tipo di log selezionato: HF", 0

it_status_logtype_arrl:
    db "Tipo di log selezionato: ARRL DX CW", 0

it_status_logtype_russian:
    db "Tipo di log selezionato: Russian DX", 0

it_status_logtype_cqww:
    db "Tipo di log selezionato: CQ WW DX CW", 0

it_status_logtype_sac:
    db "Tipo di log selezionato: SAC CW", 0

it_status_mode_radio:
    db "Modalita QSO selezionata: RADIO", 0

it_status_mode_cw:
    db "Modalita QSO selezionata: CW", 0

it_status_mode_cw_text:
    db "Modalita QSO selezionata: CW + TEXT", 0

it_status_mode_text:
    db "Modalita QSO selezionata: TEXT", 0
	
it_qso_saved_message:
    db "QSO salvato.", 0

it_qso_dupe_warning:
    db "ATTENZIONE: Il nominativo e' gia' registrato su questa banda.", 0

it_qso_count_format:
    db "Numero di QSO: %d", 0

it_qso_dupe_count_format:
    db "Numero di DUPES: %d", 0

it_qso_points_format:
    db "Punti QSO: %d", 0

it_qso_sent_text_format:
    db "Trasmesso: %s", 0
	
; ==========================================
; CTY-beskeder (ID 136-137)
; ==========================================

it_cty_result_format:
    db "CTY trovato: %s / %s", 0

it_cty_file_error:
    db "ERRORE: Impossibile aprire cty.dat.", 0
	
; ==========================================
; Messaggi HF (ID 138-157)
; ==========================================

it_hf_call_correct:
    db "CALL: CORRETTO", 0

it_hf_call_wrong:
    db "CALL: ERRATO", 0

it_hf_rst_correct:
    db "RST: CORRETTO", 0

it_hf_rst_wrong:
    db "RST: ERRATO", 0

it_hf_name_correct:
    db "NAME: CORRETTO", 0

it_hf_name_wrong:
    db "NAME: ERRATO", 0

it_hf_qth_correct:
    db "QTH: CORRETTO", 0

it_hf_qth_wrong:
    db "QTH: ERRATO", 0

it_hf_result_header:
    db "===== RISULTATI ALLENAMENTO HF =====", 0

it_hf_result_qso:
    db "QSO verificati: %u", 0

it_hf_result_call:
    db "CALL corretti: %u", 0

it_hf_result_rst:
    db "RST corretti: %u", 0

it_hf_result_name:
    db "NAME corretti: %u", 0

it_hf_result_qth:
    db "QTH corretti: %u", 0

it_hf_result_total:
    db "Campi corretti: %u / %u", 0

it_hf_result_wrong:
    db "Campi errati: %u", 0

it_hf_result_percent:
    db "Precisione: %u.%02u %%", 0

it_hf_highscore_header:
    db "=== Classifica HF CW ===", 0

it_hf_highscore_empty:
    db "Nessun punteggio HF CW disponibile.", 0

it_hf_log_header:
    db "=== Registro QSO HF ===", 0
	
; ==========================================
; Messaggi comuni del controllo (ID 158-164)
; ==========================================

it_checker_band_ok:
    db "BANDA CORRETTA", 0

it_checker_band_error:
    db "ERRORE DI BANDA", 0

it_checker_qso_ok:
    db "QSO CORRETTO", 0

it_checker_qso_error:
    db "ERRORE QSO", 0

it_checker_claimed_score:
    db "PUNTEGGIO DICHIARATO: ", 0

it_checker_real_score:
    db "PUNTEGGIO REALE: %d", 0

it_checker_highscore_date:
    db "DATA DEL RECORD: %s", 0
	
; ==========================================
; Messaggi Russian DX (ID 165-173)
; ==========================================

it_russian_country_mult:
    db "Nuovo moltiplicatore paese: %s su %s", 0

it_russian_country_used:
    db "Moltiplicatore paese gia conteggiato: %s", 0

it_russian_oblast_mult:
    db "Nuovo moltiplicatore oblast: %s su %s", 0

it_russian_oblast_used:
    db "Moltiplicatore oblast gia conteggiato: %s", 0

it_russian_oblast_error:
    db "Codice oblast non valido.", 0

it_russian_log_empty:
    db "Nessun QSO nel registro Russian DX.", 0

it_russian_station:
    db "Stazione russa.", 0

it_russian_not_station:
    db "Stazione non russa.", 0

it_russian_new_log:
    db "Nuovo registro Russian DX avviato.", 0
	
; ==========================================
; Messaggi CQ WW DX (ID 174-179)
; ==========================================

it_cqww_continent_error:
    db "Continente non valido. Usare EU, AF, AS, NA, SA o OC.", 0

it_cqww_continent_prompt:
    db "Continente (EU/AF/AS/NA/SA/OC): ", 0

it_cqww_zone_error:
    db "Zona CQ non valida. Usare valori da 1 a 40.", 0

it_cqww_zone_prompt:
    db "Zona CQ: ", 0

it_cqww_new_log_done:
    db "Nuovo registro CQ WW avviato.", 0

it_cqww_new_log_warning:
    db "ATTENZIONE: L'intero registro CQ WW attuale verra eliminato.", 0
	
; ==========================================
; Messaggi SAC CW (ID 180-187)
; ==========================================

it_sac_new_log_done:
    db "Nuovo registro SAC avviato.", 0

it_sac_new_log_prompt:
    db "Avviare un nuovo registro? (S/N): ", 0

it_sac_scandinavian:
    db "SAC: Stazione scandinava", 0

it_sac_non_scandinavian:
    db "SAC: Stazione non scandinava", 0

it_sac_serial_prompt:
    db "Numero progressivo: ", 0

it_sac_serial_error:
    db "Numero progressivo non valido. Solo cifre, minimo 1.", 0

it_sac_qso_points:
    db "Punti QSO: %d", 0

it_sac_dupe_message:
    db "DUPE - nominativo gia registrato su questa banda.", 0
	
; ==========================================
; Messaggi ARRL DX (ID 188-193)
; ==========================================

it_arrl_new_log_done:
    db "Nuovo registro ARRL DX avviato.", 0

it_arrl_new_log_prompt:
    db "Avviare un nuovo registro ARRL DX? (S/N): ", 0

it_arrl_log_empty:
    db "Nessun QSO nel registro ARRL DX.", 0

it_arrl_multipliers:
    db "Moltiplicatori ARRL: %d", 0

it_arrl_score:
    db "Punteggio ARRL: %d", 0

it_arrl_qso_points:
    db "Punti QSO: %d", 0
	
it_menu_delete_highscore db "Elimina punteggi", 0
it_settings_arrl_state_menu:
    db "Stato/provincia ARRL", 0
	
it_wpx_highscore_title       db "=== WPX Highscore ===",0
it_arrl_highscore_title      db "=== ARRL DX Highscore ===",0
it_russian_highscore_title   db "=== Russian DX Highscore ===",0
it_cqww_highscore_title      db "=== CQ WW DX Highscore ===",0
it_sac_highscore_title       db "=== SAC CW Highscore ===",0
it_hf_highscore_title        db "=== HF CW Highscore ===",0

it_hf_highscore_accuracy db "Mostra per precisione",0

it_delete_hs_title   db "=== ELIMINA HIGHSCORE ===",0
it_delete_hs_wpx     db "Elimina Highscore WPX",0
it_delete_hs_hf      db "Elimina Highscore HF",0
it_delete_hs_arrl    db "Elimina Highscore ARRL DX",0
it_delete_hs_russian db "Elimina Highscore Russian DX",0
it_delete_hs_cqww    db "Elimina Highscore CQ WW DX",0
it_delete_hs_sac     db "Elimina Highscore SAC CW",0
it_delete_hs_all     db "Elimina TUTTI gli Highscore",0
it_settings_language:
    db "Lingua", 0