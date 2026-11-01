
; ASMLog v3.0 - Dansk sprogfil
; Teksterne foelger ID'erne i sprog.asm

bits 64
default rel

global da_tabel

section .data

da_tabel:
    dq da_menu_title
    dq da_menu_new_qso
    dq da_menu_show_log
    dq da_menu_search_call
    dq da_menu_new_log
    dq da_menu_print_log
    dq da_menu_settings
    dq da_menu_highscore
    dq da_menu_back
	
	; Settings-menu (ID 9-18)
    dq da_settings_title
    dq da_settings_logtype
    dq da_settings_callsign
    dq da_settings_name
    dq da_settings_email
    dq da_settings_address
    dq da_settings_postcode
    dq da_settings_city
    dq da_settings_power
    dq da_settings_back


    ; Logtype-menu (ID 19-26)
    dq da_logtype_title
    dq da_logtype_wpx
    dq da_logtype_hf
    dq da_logtype_arrl_dx
    dq da_logtype_russian_dx
    dq da_logtype_cqww_dx
    dq da_logtype_sac_cw
    dq da_logtype_back

 ; Ny QSO (ID 27-38)
    dq da_qso_title
    dq da_qso_callsign
    dq da_qso_band
    dq da_qso_mode
    dq da_qso_rst_sent
    dq da_qso_rst_received
    dq da_qso_exchange
    dq da_qso_zone
    dq da_qso_serial
    dq da_qso_points
    dq da_qso_save
    dq da_qso_back

 ; Vis QSO-log (ID 39-48)
    dq da_show_log_title
    dq da_show_log_date
    dq da_show_log_time
    dq da_show_log_callsign
    dq da_show_log_band
    dq da_show_log_mode
    dq da_show_log_rst
    dq da_show_log_exchange
    dq da_show_log_points
    dq da_show_log_back



    ; Soegefunktion (ID 49-54)
    dq da_search_enter_call
    dq da_search_you_entered
    dq da_search_call_prompt
    dq da_search_results
    dq da_search_count
    dq da_search_not_found
	
	
    ; Udskriv log (ID 55-60)
    dq da_print_log_title
    dq da_print_log_adif
    dq da_print_log_cabrillo
    dq da_print_log_main_menu
    dq da_print_log_back
    dq da_print_log_choice


    ; Mode-menu (ID 61-65)
    dq da_mode_title
    dq da_mode_radio
    dq da_mode_cw
    dq da_mode_cw_text
    dq da_mode_text


    ; Sprogvalg (ID 66)
    dq da_language_title
	

    ; Power-menu (ID 67-71)
    dq da_power_title
    dq da_power_qrp
    dq da_power_low
    dq da_power_high
    dq da_power_arrl


    ; WPM-menu (ID 72)
    dq da_wpm_title


    ; Highscore sortering (ID 73-74)
    dq da_highscore_sort_date
    dq da_highscore_sort_real


    ; Slet Highscore (ID 75-85)
    dq da_highscore_delete_title
    dq da_highscore_delete_wpx
    dq da_highscore_delete_hf
    dq da_highscore_delete_arrl
    dq da_highscore_delete_russian
    dq da_highscore_delete_cqww
    dq da_highscore_delete_sac
    dq da_highscore_delete_all
    dq da_highscore_delete_confirm
    dq da_highscore_delete_done
    dq da_highscore_delete_error


    ; Start ny log (ID 86-87)
    dq da_newlog_warning
    dq da_newlog_prompt


    ; Settings - ekstra felter (ID 88-89)
    dq da_settings_arrl_state_prompt
    dq da_settings_wpm_prompt


    ; Settings - indtastning (ID 90-95)
    dq da_settings_callsign_input
    dq da_settings_name_input
    dq da_settings_email_input
    dq da_settings_address_input
    dq da_settings_zip_input
    dq da_settings_city_input

    ; Settings - gemt (ID 96-102)
    dq da_settings_callsign_saved
    dq da_settings_name_saved
    dq da_settings_email_saved
    dq da_settings_address_saved
    dq da_settings_zip_saved
    dq da_settings_city_saved
    dq da_settings_power_saved

    dq da_settings_arrl_power_input

    dq da_cw_time_title
    dq da_cw_time_5_min
    dq da_cw_time_10_min
    dq da_cw_time_15_min
    dq da_cw_time_30_min
    dq da_cw_time_60_min
    dq da_cw_time_choose

    dq da_exit_question
    dq da_exit_message	

    dq da_error_invalid_choice
    dq da_error_invalid_band
    dq da_error_invalid_callsign
    dq da_error_callsign_file
    dq da_error_invalid_rst
    dq da_error_invalid_qsonr
    dq da_error_wpx_log_file

    dq da_status_logtype_wpx
    dq da_status_logtype_hf
    dq da_status_logtype_arrl
    dq da_status_logtype_russian
    dq da_status_logtype_cqww
    dq da_status_logtype_sac
    dq da_status_mode_radio
    dq da_status_mode_cw
    dq da_status_mode_cw_text
    dq da_status_mode_text

    dq da_qso_saved_message
    dq da_qso_dupe_warning
    dq da_qso_count_format
    dq da_qso_dupe_count_format
    dq da_qso_points_format
    dq da_qso_sent_text_format

    ; CTY-beskeder (ID 136-137)
    dq da_cty_result_format
    dq da_cty_file_error

    ; HF-beskeder (ID 138-157)
    dq da_hf_call_correct
    dq da_hf_call_wrong
    dq da_hf_rst_correct
    dq da_hf_rst_wrong
    dq da_hf_name_correct
    dq da_hf_name_wrong
    dq da_hf_qth_correct
    dq da_hf_qth_wrong
    dq da_hf_result_header
    dq da_hf_result_qso
    dq da_hf_result_call
    dq da_hf_result_rst
    dq da_hf_result_name
    dq da_hf_result_qth
    dq da_hf_result_total
    dq da_hf_result_wrong
    dq da_hf_result_percent
    dq da_hf_highscore_header
    dq da_hf_highscore_empty
    dq da_hf_log_header

    ; Fælles checkerbeskeder (ID 158-164)
    dq da_checker_band_ok
    dq da_checker_band_error
    dq da_checker_qso_ok
    dq da_checker_qso_error
    dq da_checker_claimed_score
    dq da_checker_real_score
    dq da_checker_highscore_date

    ; Russian DX (ID 165-173)
    dq da_russian_country_mult
    dq da_russian_country_used
    dq da_russian_oblast_mult
    dq da_russian_oblast_used
    dq da_russian_oblast_error
    dq da_russian_log_empty
    dq da_russian_station
    dq da_russian_not_station
    dq da_russian_new_log

    ; CQ WW DX (ID 174-179)
    dq da_cqww_continent_error
    dq da_cqww_continent_prompt
    dq da_cqww_zone_error
    dq da_cqww_zone_prompt
    dq da_cqww_new_log_done
    dq da_cqww_new_log_warning

    ; SAC CW (ID 180-187)
    dq da_sac_new_log_done
    dq da_sac_new_log_prompt
    dq da_sac_scandinavian
    dq da_sac_non_scandinavian
    dq da_sac_serial_prompt
    dq da_sac_serial_error
    dq da_sac_qso_points
    dq da_sac_dupe_message

    ; ARRL DX (ID 188-193)
    dq da_arrl_new_log_done
    dq da_arrl_new_log_prompt
    dq da_arrl_log_empty
    dq da_arrl_multipliers
    dq da_arrl_score
    dq da_arrl_qso_points

    dq da_menu_delete_highscore    ; ID 194

    dq da_settings_arrl_state_menu

    dq da_wpx_highscore_title       ; 196
    dq da_arrl_highscore_title      ; 197
    dq da_russian_highscore_title   ; 198
    dq da_cqww_highscore_title      ; 199
    dq da_sac_highscore_title       ; 200
    dq da_hf_highscore_title        ; 201
    dq da_highscore_sort_date       ; 202
    dq da_highscore_sort_real       ; 203

    dq da_hf_highscore_accuracy    ; 204

    dq da_delete_hs_title       ; 205
    dq da_delete_hs_wpx         ; 206
    dq da_delete_hs_hf          ; 207
    dq da_delete_hs_arrl        ; 208
    dq da_delete_hs_russian     ; 209
    dq da_delete_hs_cqww        ; 210
    dq da_delete_hs_sac         ; 211
    dq da_delete_hs_all         ; 212

    dq da_settings_language     ; 213
	
da_menu_title:
    db "Hovedmenu", 0

da_menu_new_qso:
    db "Ny QSO", 0

da_menu_show_log:
    db "Vis QSO-log", 0

da_menu_search_call:
    db "Soeg kaldesignal", 0

da_menu_new_log:
    db "Start ny log", 0

da_menu_print_log:
    db "Udskriv log", 0

da_menu_settings:
    db "Settings", 0

da_menu_highscore:
    db "Highscore", 0

da_menu_back:
    db "Tilbage", 0



; ==========================================
; Settings-menu (ID 9-18)
; ==========================================

da_settings_title:
    db "Settings", 0

da_settings_logtype:
    db "Logtype", 0

da_settings_callsign:
    db "Kaldesignal", 0

da_settings_name:
    db "Navn", 0

da_settings_email:
    db "E-mail", 0

da_settings_address:
    db "Adresse", 0

da_settings_postcode:
    db "Postnr.", 0

da_settings_city:
    db "By", 0

da_settings_power:
    db "Power", 0

da_settings_back:
    db "Tilbage", 0

    

; ==========================================
; Logtype-menu (ID 19-26)
; ==========================================

da_logtype_title:
    db "Vaelg logtype", 0

da_logtype_wpx:
    db "WPX", 0

da_logtype_hf:
    db "HF", 0

da_logtype_arrl_dx:
    db "ARRL DX CW", 0

da_logtype_russian_dx:
    db "Russian DX", 0

da_logtype_cqww_dx:
    db "CQ WW DX CW", 0

da_logtype_sac_cw:
    db "SAC CW", 0

da_logtype_back:
    db "Tilbage", 0



   

; ==========================================
; Ny QSO (ID 27-38)
; ==========================================

da_qso_title:
    db "Ny QSO", 0

da_qso_callsign:
    db "Kaldesignal", 0

da_qso_band:
    db "Baand", 0

da_qso_mode:
    db "Mode", 0

da_qso_rst_sent:
    db "RST sendt", 0

da_qso_rst_received:
    db "RST modtaget", 0

da_qso_exchange:
    db "Exchange", 0

da_qso_zone:
    db "Zone", 0

da_qso_serial:
    db "Serienummer", 0

da_qso_points:
    db "Point", 0

da_qso_save:
    db "Gem QSO", 0

da_qso_back:
    db "Tilbage", 0



   


; ==========================================
; Vis QSO-log (ID 39-48)
; ==========================================

da_show_log_title:
    db "Vis QSO-log", 0

da_show_log_date:
    db "Dato", 0

da_show_log_time:
    db "Tid", 0

da_show_log_callsign:
    db "Kaldesignal", 0

da_show_log_band:
    db "Baand", 0

da_show_log_mode:
    db "Mode", 0

da_show_log_rst:
    db "RST", 0

da_show_log_exchange:
    db "Exchange", 0

da_show_log_points:
    db "Point", 0

da_show_log_back:
    db "Tilbage", 0




; ==========================================
; Soegefunktion (ID 49-54)
; ==========================================

da_search_enter_call:
    db "Skriv kaldesignal: ", 0

da_search_you_entered:
    db "Du soegte efter: %s", 0

da_search_call_prompt:
    db "Kaldesignal at soege efter: ", 0

da_search_results:
    db "Fundne QSO'er:", 0

da_search_count:
    db "Antal fund: %d", 0

da_search_not_found:
    db "Ingen QSO'er fundet.", 0



; ==========================================
; Udskriv log (ID 55-60)
; ==========================================

da_print_log_title:
    db "Udskriv log", 0

da_print_log_adif:
    db "ADIF - HF", 0

da_print_log_cabrillo:
    db "Cabrillo", 0

da_print_log_main_menu:
    db "Hovedmenu", 0

da_print_log_back:
    db "Tilbage", 0

da_print_log_choice:
    db "Valg: ", 0


; ==========================================
; Mode-menu (ID 61-65)
; ==========================================

da_mode_title:
    db "Mode", 0

da_mode_radio:
    db "RADIO", 0

da_mode_cw:
    db "CW", 0

da_mode_cw_text:
    db "CW + TEXT", 0

da_mode_text:
    db "TEXT", 0


; ==========================================
; Sprogvalg (ID 66)
; ==========================================

da_language_title:
    db "Vaelg sprog", 0


; ==========================================
; Power-menu (ID 67-71)
; ==========================================

da_power_title:
    db "Power", 0

da_power_qrp:
    db "QRP", 0

da_power_low:
    db "LOW", 0

da_power_high:
    db "HIGH", 0

da_power_arrl:
    db "ARRL Power", 0


; ==========================================
; WPM-menu (ID 72)
; ==========================================

da_wpm_title:
    db "WPM", 0


; ==========================================
; Highscore sortering (ID 73-74)
; ==========================================

da_highscore_sort_date:
    db "Sorter efter dato", 0

da_highscore_sort_real:
    db "Sorter efter Real score", 0


; ==========================================
; Slet Highscore (ID 75-85)
; ==========================================

da_highscore_delete_title:
    db "Slet Highscore", 0

da_highscore_delete_wpx:
    db "Slet WPX Highscore", 0

da_highscore_delete_hf:
    db "Slet HF Highscore", 0

da_highscore_delete_arrl:
    db "Slet ARRL DX Highscore", 0

da_highscore_delete_russian:
    db "Slet Russian DX Highscore", 0

da_highscore_delete_cqww:
    db "Slet CQ WW DX Highscore", 0

da_highscore_delete_sac:
    db "Slet SAC CW Highscore", 0

da_highscore_delete_all:
    db "Slet ALLE Highscores", 0

da_highscore_delete_confirm:
    db "Er du sikker paa at du vil slette den valgte highscore? (J/N): ", 0

da_highscore_delete_done:
    db "Highscore slettet.", 0

da_highscore_delete_error:
    db "FEJL: Kunne ikke toemme highscore-filen.", 0


; ==========================================
; Start ny log (ID 86-87)
; ==========================================

da_newlog_warning:
    db "ADVARSEL: Hele den nuvaerende log bliver slettet.", 0

da_newlog_prompt:
    db "Start ny log? (J/N): ", 0


; ==========================================
; Settings - ekstra felter (ID 88-89)
; ==========================================

da_settings_arrl_state_prompt:
    db "Indtast ARRL State/Province (fx ON eller NY): ", 0

da_settings_wpm_prompt:
    db "WPM (f.eks. 10, 15, 20, 25): ", 0


; ==========================================
; Settings - indtastning (ID 90-95)
; ==========================================

da_settings_callsign_input:
    db "Skriv kaldesignal: ", 0

da_settings_name_input:
    db "Skriv navn: ", 0

da_settings_email_input:
    db "Skriv e-mail: ", 0

da_settings_address_input:
    db "Skriv adresse: ", 0

da_settings_zip_input:
    db "Skriv postnr.: ", 0

da_settings_city_input:
    db "Skriv by: ", 0

; ==========================================
; Settings - gemt (ID 96-102)
; ==========================================

da_settings_callsign_saved:
    db "Kaldesignal gemt.", 10, 0

da_settings_name_saved:
    db "Navn gemt.", 10, 0

da_settings_email_saved:
    db "E-mail gemt.", 10, 0

da_settings_address_saved:
    db "Adresse gemt.", 10, 0

da_settings_zip_saved:
    db "Postnr. gemt.", 10, 0

da_settings_city_saved:
    db "By gemt.", 10, 0

da_settings_power_saved:
    db "Power gemt.", 10, 0
	
da_settings_arrl_power_input:
    db "Indtast ARRL Power i watt: ", 0

da_cw_time_title:
    db "=== CW Traeningstid ===", 0

da_cw_time_5_min:
    db "1.  5 minutter", 0

da_cw_time_10_min:
    db "2. 10 minutter", 0

da_cw_time_15_min:
    db "3. 15 minutter", 0

da_cw_time_30_min:
    db "4. 30 minutter", 0

da_cw_time_60_min:
    db "5. 60 minutter", 0

da_cw_time_choose:
    db "Vaelg traeningstid: ", 0
	
da_exit_question:
    db "Vil du afslutte programmet? (J/N): ", 0

da_exit_message:
    db "ASMLog afsluttes.", 0
	
da_error_invalid_choice:
    db "Ugyldigt valg.", 0

da_error_invalid_band:
    db "Ugyldigt WPX-baand. Brug 160m, 80m, 40m, 20m, 15m eller 10m.", 0

da_error_invalid_callsign:
    db "Ugyldigt kaldesignal - call skal indeholde bogstav og tal.", 0

da_error_callsign_file:
    db "FEJL: Kaldesignalfilen mangler eller er tom.", 0

da_error_invalid_rst:
    db "RST skal vaere praecis tre cifre, fx 599.", 0

da_error_invalid_qsonr:
    db "QSONR maa hoejst indeholde 5 cifre.", 0

da_error_wpx_log_file:
    db "Kunne ikke aabne wpx_log.txt", 0
	
da_status_logtype_wpx:
    db "Valgt logtype: WPX", 0

da_status_logtype_hf:
    db "Valgt logtype: HF", 0

da_status_logtype_arrl:
    db "Valgt logtype: ARRL DX CW", 0

da_status_logtype_russian:
    db "Valgt logtype: Russian DX", 0

da_status_logtype_cqww:
    db "Valgt logtype: CQ WW DX CW", 0

da_status_logtype_sac:
    db "Valgt logtype: SAC CW", 0

da_status_mode_radio:
    db "Valgt QSO-mode: RADIO", 0

da_status_mode_cw:
    db "Valgt QSO-mode: CW", 0

da_status_mode_cw_text:
    db "Valgt QSO-mode: CW + TEXT", 0

da_status_mode_text:
    db "Valgt QSO-mode: TEXT", 0
	
da_qso_saved_message:
    db "QSO gemt.", 0

da_qso_dupe_warning:
    db "ADVARSEL: Kaldesignalet er allerede logget paa dette baand.", 0

da_qso_count_format:
    db "Antal QSO'er: %d", 0

da_qso_dupe_count_format:
    db "Antal DUPE'er: %d", 0

da_qso_points_format:
    db "QSO-point: %d", 0

da_qso_sent_text_format:
    db "Sendt: %s", 0
	
; ==========================================
; CTY-beskeder (ID 136-137)
; ==========================================

da_cty_result_format:
    db "CTY fundet: %s / %s", 0

da_cty_file_error:
    db "FEJL: Kunne ikke aabne cty.dat.", 0
	
; ==========================================
; HF-beskeder (ID 138-157)
; ==========================================

da_hf_call_correct:
    db "CALL: RIGTIG", 0

da_hf_call_wrong:
    db "CALL: FORKERT", 0

da_hf_rst_correct:
    db "RST: RIGTIG", 0

da_hf_rst_wrong:
    db "RST: FORKERT", 0

da_hf_name_correct:
    db "NAME: RIGTIG", 0

da_hf_name_wrong:
    db "NAME: FORKERT", 0

da_hf_qth_correct:
    db "QTH: RIGTIG", 0

da_hf_qth_wrong:
    db "QTH: FORKERT", 0

da_hf_result_header:
    db "===== HF TRAENINGSRESULTAT =====", 0

da_hf_result_qso:
    db "QSO'er kontrolleret: %u", 0

da_hf_result_call:
    db "CALL korrekt: %u", 0

da_hf_result_rst:
    db "RST korrekt: %u", 0

da_hf_result_name:
    db "NAME korrekt: %u", 0

da_hf_result_qth:
    db "QTH korrekt: %u", 0

da_hf_result_total:
    db "Korrekte felter: %u / %u", 0

da_hf_result_wrong:
    db "Forkerte felter: %u", 0

da_hf_result_percent:
    db "Noejagtighed: %u.%02u %%", 0

da_hf_highscore_header:
    db "=== HF CW Highscore ===", 0

da_hf_highscore_empty:
    db "Ingen HF CW-highscores endnu.", 0

da_hf_log_header:
    db "=== HF QSO-log ===", 0
	
; ==========================================
; Fælles checkerbeskeder (ID 158-164)
; ==========================================

da_checker_band_ok:
    db "BAND OK", 0

da_checker_band_error:
    db "BAND FEJL", 0

da_checker_qso_ok:
    db "QSO OK", 0

da_checker_qso_error:
    db "QSO FEJL", 0

da_checker_claimed_score:
    db "CLAIMED-SCORE: ", 0

da_checker_real_score:
    db "REAL SCORE: %d", 0

da_checker_highscore_date:
    db "HIGHSCORE DATO: %s", 0
	
; ==========================================
; Russian DX (ID 165-173)
; ==========================================

da_russian_country_mult:
    db "Ny land-multiplier: %s paa %s", 0

da_russian_country_used:
    db "Land-multiplier allerede brugt: %s", 0

da_russian_oblast_mult:
    db "Ny oblast-multiplier: %s paa %s", 0

da_russian_oblast_used:
    db "Oblast-multiplier allerede brugt: %s", 0

da_russian_oblast_error:
    db "Ugyldig oblastkode.", 0

da_russian_log_empty:
    db "Ingen QSO'er i Russian DX-loggen.", 0

da_russian_station:
    db "Russisk station.", 0

da_russian_not_station:
    db "Ikke-russisk station.", 0

da_russian_new_log:
    db "Ny Russian DX-log startet.", 0
	
; ==========================================
; CQ WW DX (ID 174-179)
; ==========================================

da_cqww_continent_error:
    db "Ugyldigt kontinent. Brug EU, AF, AS, NA, SA eller OC.", 0

da_cqww_continent_prompt:
    db "Kontinent (EU/AF/AS/NA/SA/OC): ", 0

da_cqww_zone_error:
    db "Ugyldig CQ-zone. Brug 1-40.", 0

da_cqww_zone_prompt:
    db "CQ-zone: ", 0

da_cqww_new_log_done:
    db "Ny CQ WW-log startet.", 0

da_cqww_new_log_warning:
    db "ADVARSEL: Hele den nuvaerende CQ WW-log bliver slettet.", 0
	
; ==========================================
; SAC CW (ID 180-187)
; ==========================================

da_sac_new_log_done:
    db "Ny SAC-log startet.", 0

da_sac_new_log_prompt:
    db "Start ny log? (J/N): ", 0

da_sac_scandinavian:
    db "SAC: Skandinavisk station", 0

da_sac_non_scandinavian:
    db "SAC: Ikke-skandinavisk station", 0

da_sac_serial_prompt:
    db "Serienummer: ", 0

da_sac_serial_error:
    db "Ugyldigt serienummer. Brug kun cifre og mindst 1.", 0

da_sac_qso_points:
    db "QSO-point: %d", 0

da_sac_dupe_message:
    db "DUPE - kaldesignalet er allerede logget paa dette baand.", 0
	
; ==========================================
; ARRL DX (ID 188-193)
; ==========================================

da_arrl_new_log_done:
    db "Ny ARRL DX-log er startet.", 0

da_arrl_new_log_prompt:
    db "Start ny ARRL DX-log? (J/N): ", 0

da_arrl_log_empty:
    db "Ingen QSO'er i ARRL DX-loggen.", 0

da_arrl_multipliers:
    db "ARRL-multipliers: %d", 0

da_arrl_score:
    db "ARRL-score: %d", 0

da_arrl_qso_points:
    db "QSO-point: %d", 0
	
da_menu_delete_highscore db "Slet Highscore", 0

da_settings_arrl_state_menu:
    db "ARRL-stat/provins", 0
	
; 196 - WPX Highscore
da_wpx_highscore_title db "=== WPX Highscore ===",0

; 197 - ARRL DX Highscore
da_arrl_highscore_title db "=== ARRL DX Highscore ===",0

; 198 - Russian DX Highscore
da_russian_highscore_title db "=== Russian DX Highscore ===",0

; 199 - CQ WW DX Highscore
da_cqww_highscore_title db "=== CQ WW DX Highscore ===",0

; 200 - SAC Highscore
da_sac_highscore_title db "=== SAC CW Highscore ===",0

; 201 - HF Highscore
da_hf_highscore_title db "=== HF Highscore ===",0

da_hf_highscore_accuracy db "Vis efter noejagtighed",0

da_delete_hs_title   db "=== SLET HIGHSCORE ===",0
da_delete_hs_wpx     db "Slet WPX Highscore",0
da_delete_hs_hf      db "Slet HF Highscore",0
da_delete_hs_arrl    db "Slet ARRL DX Highscore",0
da_delete_hs_russian db "Slet Russian DX Highscore",0
da_delete_hs_cqww    db "Slet CQ WW DX Highscore",0
da_delete_hs_sac     db "Slet SAC CW Highscore",0
da_delete_hs_all     db "Slet ALLE Highscores",0

da_settings_language:
    db "Sprog", 0