
; ASMLog v3.0 - English language file
; Same text ID order as sprog_da.asm

bits 64
default rel

global en_tabel

section .data

en_tabel:
    dq en_menu_title
    dq en_menu_new_qso
    dq en_menu_show_log
    dq en_menu_search_call
    dq en_menu_new_log
    dq en_menu_print_log
    dq en_menu_settings
    dq en_menu_highscore
    dq en_menu_back
	
    ; Settings menu (ID 9-18)
    dq en_settings_title
    dq en_settings_logtype
    dq en_settings_callsign
    dq en_settings_name
    dq en_settings_email
    dq en_settings_address
    dq en_settings_postcode
    dq en_settings_city
    dq en_settings_power
    dq en_settings_back

    ; Contest Type menu (ID 19-26)
    dq en_logtype_title
    dq en_logtype_wpx
    dq en_logtype_hf
    dq en_logtype_arrl_dx
    dq en_logtype_russian_dx
    dq en_logtype_cqww_dx
    dq en_logtype_sac_cw
    dq en_logtype_back

    ; New QSO (ID 27-38)
    dq en_qso_title
    dq en_qso_callsign
    dq en_qso_band
    dq en_qso_mode
    dq en_qso_rst_sent
    dq en_qso_rst_received
    dq en_qso_exchange
    dq en_qso_zone
    dq en_qso_serial
    dq en_qso_points
    dq en_qso_save
    dq en_qso_back

    ; Show QSO Log (ID 39-48)
    dq en_show_log_title
    dq en_show_log_date
    dq en_show_log_time
    dq en_show_log_callsign
    dq en_show_log_band
    dq en_show_log_mode
    dq en_show_log_rst
    dq en_show_log_exchange
    dq en_show_log_points
    dq en_show_log_back

    ; Search callsign (ID 49-54)
    dq en_search_enter_call
    dq en_search_you_entered
    dq en_search_call_prompt
    dq en_search_results
    dq en_search_count
    dq en_search_not_found

    ; Print log (ID 55-60)
    dq en_print_log_title
    dq en_print_log_adif
    dq en_print_log_cabrillo
    dq en_print_log_main_menu
    dq en_print_log_back
    dq en_print_log_choice


    ; Mode menu (ID 61-65)
    dq en_mode_title
    dq en_mode_radio
    dq en_mode_cw
    dq en_mode_cw_text
    dq en_mode_text


    ; Language selection (ID 66)
    dq en_language_title


    ; Power menu (ID 67-71)
    dq en_power_title
    dq en_power_qrp
    dq en_power_low
    dq en_power_high
    dq en_power_arrl


    ; WPM menu (ID 72)
    dq en_wpm_title


    ; Highscore sorting (ID 73-74)
    dq en_highscore_sort_date
    dq en_highscore_sort_real


    ; Delete Highscore (ID 75-85)
    dq en_highscore_delete_title
    dq en_highscore_delete_wpx
    dq en_highscore_delete_hf
    dq en_highscore_delete_arrl
    dq en_highscore_delete_russian
    dq en_highscore_delete_cqww
    dq en_highscore_delete_sac
    dq en_highscore_delete_all
    dq en_highscore_delete_confirm
    dq en_highscore_delete_done
    dq en_highscore_delete_error


    ; Start new log (ID 86-87)
    dq en_newlog_warning
    dq en_newlog_prompt


    ; Settings - additional fields (ID 88-89)
    dq en_settings_arrl_state_prompt
    dq en_settings_wpm_prompt


    ; Settings - input (ID 90-95)
    dq en_settings_callsign_input
    dq en_settings_name_input
    dq en_settings_email_input
    dq en_settings_address_input
    dq en_settings_zip_input
    dq en_settings_city_input

    ; Settings - saved (ID 96-102)
    dq en_settings_callsign_saved
    dq en_settings_name_saved
    dq en_settings_email_saved
    dq en_settings_address_saved
    dq en_settings_zip_saved
    dq en_settings_city_saved
    dq en_settings_power_saved

    dq en_settings_arrl_power_input

    dq en_cw_time_title
    dq en_cw_time_5_min
    dq en_cw_time_10_min
    dq en_cw_time_15_min
    dq en_cw_time_30_min
    dq en_cw_time_60_min
    dq en_cw_time_choose

    dq en_exit_question
    dq en_exit_message

    dq en_error_invalid_choice
    dq en_error_invalid_band
    dq en_error_invalid_callsign
    dq en_error_callsign_file
    dq en_error_invalid_rst
    dq en_error_invalid_qsonr
    dq en_error_wpx_log_file

    dq en_status_logtype_wpx
    dq en_status_logtype_hf
    dq en_status_logtype_arrl
    dq en_status_logtype_russian
    dq en_status_logtype_cqww
    dq en_status_logtype_sac
    dq en_status_mode_radio
    dq en_status_mode_cw
    dq en_status_mode_cw_text
    dq en_status_mode_text

    dq en_qso_saved_message
    dq en_qso_dupe_warning
    dq en_qso_count_format
    dq en_qso_dupe_count_format
    dq en_qso_points_format
    dq en_qso_sent_text_format

    ; CTY-beskeder (ID 136-137)
    dq en_cty_result_format
    dq en_cty_file_error

    ; HF-beskeder (ID 138-157)
    dq en_hf_call_correct
    dq en_hf_call_wrong
    dq en_hf_rst_correct
    dq en_hf_rst_wrong
    dq en_hf_name_correct
    dq en_hf_name_wrong
    dq en_hf_qth_correct
    dq en_hf_qth_wrong
    dq en_hf_result_header
    dq en_hf_result_qso
    dq en_hf_result_call
    dq en_hf_result_rst
    dq en_hf_result_name
    dq en_hf_result_qth
    dq en_hf_result_total
    dq en_hf_result_wrong
    dq en_hf_result_percent
    dq en_hf_highscore_header
    dq en_hf_highscore_empty
    dq en_hf_log_header

    ; Fælles checkerbeskeder (ID 158-164)
    dq en_checker_band_ok
    dq en_checker_band_error
    dq en_checker_qso_ok
    dq en_checker_qso_error
    dq en_checker_claimed_score
    dq en_checker_real_score
    dq en_checker_highscore_date

    ; Russian DX (ID 165-173)
    dq en_russian_country_mult
    dq en_russian_country_used
    dq en_russian_oblast_mult
    dq en_russian_oblast_used
    dq en_russian_oblast_error
    dq en_russian_log_empty
    dq en_russian_station
    dq en_russian_not_station
    dq en_russian_new_log

    ; CQ WW DX (ID 174-179)
    dq en_cqww_continent_error
    dq en_cqww_continent_prompt
    dq en_cqww_zone_error
    dq en_cqww_zone_prompt
    dq en_cqww_new_log_done
    dq en_cqww_new_log_warning

    ; SAC CW (ID 180-187)
    dq en_sac_new_log_done
    dq en_sac_new_log_prompt
    dq en_sac_scandinavian
    dq en_sac_non_scandinavian
    dq en_sac_serial_prompt
    dq en_sac_serial_error
    dq en_sac_qso_points
    dq en_sac_dupe_message

    ; ARRL DX (ID 188-193)
    dq en_arrl_new_log_done
    dq en_arrl_new_log_prompt
    dq en_arrl_log_empty
    dq en_arrl_multipliers
    dq en_arrl_score
    dq en_arrl_qso_points

    dq en_menu_delete_highscore    ; ID 194

    dq en_settings_arrl_state_menu

    dq en_wpx_highscore_title       ; 196
    dq en_arrl_highscore_title      ; 197
    dq en_russian_highscore_title   ; 198
    dq en_cqww_highscore_title      ; 199
    dq en_sac_highscore_title       ; 200
    dq en_hf_highscore_title        ; 201
    dq en_highscore_sort_date       ; 202
    dq en_highscore_sort_real       ; 203

    dq en_hf_highscore_accuracy    ; 204

    dq en_delete_hs_title       ; 205
    dq en_delete_hs_wpx         ; 206
    dq en_delete_hs_hf          ; 207
    dq en_delete_hs_arrl        ; 208
    dq en_delete_hs_russian     ; 209
    dq en_delete_hs_cqww        ; 210
    dq en_delete_hs_sac         ; 211
    dq en_delete_hs_all         ; 212

    dq en_settings_language     ; 213
	
en_menu_title:
    db "Main Menu", 0

en_menu_new_qso:
    db "New QSO", 0

en_menu_show_log:
    db "Show QSO Log", 0

en_menu_search_call:
    db "Search Callsign", 0

en_menu_new_log:
    db "Start New Log", 0

en_menu_print_log:
    db "Print Log", 0

en_menu_settings:
    db "Settings", 0

en_menu_highscore:
    db "Highscore", 0

en_menu_back:
    db "Back", 0




; ==========================================
; Settings menu (ID 9-18)
; ==========================================

en_settings_title:
    db "Settings", 0

en_settings_logtype:
    db "Contest Type", 0

en_settings_callsign:
    db "Callsign", 0

en_settings_name:
    db "Name", 0

en_settings_email:
    db "E-mail", 0

en_settings_address:
    db "Address", 0

en_settings_postcode:
    db "Postal Code", 0

en_settings_city:
    db "City", 0

en_settings_power:
    db "Power", 0

en_settings_back:
    db "Back", 0





; ==========================================
; Contest Type menu (ID 19-26)
; ==========================================

en_logtype_title:
    db "Select Contest Type", 0

en_logtype_wpx:
    db "WPX", 0

en_logtype_hf:
    db "HF", 0

en_logtype_arrl_dx:
    db "ARRL DX CW", 0

en_logtype_russian_dx:
    db "Russian DX", 0

en_logtype_cqww_dx:
    db "CQ WW DX CW", 0

en_logtype_sac_cw:
    db "SAC CW", 0

en_logtype_back:
    db "Back", 0





; ==========================================
; New QSO (ID 27-38)
; ==========================================

en_qso_title:
    db "New QSO", 0

en_qso_callsign:
    db "Callsign", 0

en_qso_band:
    db "Band", 0

en_qso_mode:
    db "Mode", 0

en_qso_rst_sent:
    db "RST Sent", 0

en_qso_rst_received:
    db "RST Received", 0

en_qso_exchange:
    db "Exchange", 0

en_qso_zone:
    db "Zone", 0

en_qso_serial:
    db "Serial Number", 0

en_qso_points:
    db "Points", 0

en_qso_save:
    db "Save QSO", 0

en_qso_back:
    db "Back", 0





; ==========================================
; Show QSO Log (ID 39-48)
; ==========================================

en_show_log_title:
    db "Show QSO Log", 0

en_show_log_date:
    db "Date", 0

en_show_log_time:
    db "Time", 0

en_show_log_callsign:
    db "Callsign", 0

en_show_log_band:
    db "Band", 0

en_show_log_mode:
    db "Mode", 0

en_show_log_rst:
    db "RST", 0

en_show_log_exchange:
    db "Exchange", 0

en_show_log_points:
    db "Points", 0

en_show_log_back:
    db "Back", 0







; ==========================================
; Search callsign (ID 49-54)
; ==========================================

en_search_enter_call:
    db "Enter callsign: ", 0

en_search_you_entered:
    db "You searched for: %s", 0

en_search_call_prompt:
    db "Callsign to search for: ", 0

en_search_results:
    db "QSOs found:", 0

en_search_count:
    db "Number of matches: %d", 0

en_search_not_found:
    db "No QSOs found.", 0

; ==========================================
; Print log (ID 55-60)
; ==========================================

en_print_log_title:
    db "Print log", 0

en_print_log_adif:
    db "ADIF - HF", 0

en_print_log_cabrillo:
    db "Cabrillo", 0

en_print_log_main_menu:
    db "Main Menu", 0

en_print_log_back:
    db "Back", 0

en_print_log_choice:
    db "Choice: ", 0


; ==========================================
; Mode menu (ID 61-65)
; ==========================================

en_mode_title:
    db "Mode", 0

en_mode_radio:
    db "RADIO", 0

en_mode_cw:
    db "CW", 0

en_mode_cw_text:
    db "CW + TEXT", 0

en_mode_text:
    db "TEXT", 0


; ==========================================
; Language selection (ID 66)
; ==========================================

en_language_title:
    db "Select language", 0


; ==========================================
; Power menu (ID 67-71)
; ==========================================

en_power_title:
    db "Power", 0

en_power_qrp:
    db "QRP", 0

en_power_low:
    db "LOW", 0

en_power_high:
    db "HIGH", 0

en_power_arrl:
    db "ARRL Power", 0


; ==========================================
; WPM menu (ID 72)
; ==========================================

en_wpm_title:
    db "WPM", 0


; ==========================================
; Highscore sorting (ID 73-74)
; ==========================================

en_highscore_sort_date:
    db "Sort by date", 0

en_highscore_sort_real:
    db "Sort by Real score", 0


; ==========================================
; Delete Highscore (ID 75-85)
; ==========================================

en_highscore_delete_title:
    db "Delete Highscore", 0

en_highscore_delete_wpx:
    db "Delete WPX Highscore", 0

en_highscore_delete_hf:
    db "Delete HF Highscore", 0

en_highscore_delete_arrl:
    db "Delete ARRL DX Highscore", 0

en_highscore_delete_russian:
    db "Delete Russian DX Highscore", 0

en_highscore_delete_cqww:
    db "Delete CQ WW DX Highscore", 0

en_highscore_delete_sac:
    db "Delete SAC CW Highscore", 0

en_highscore_delete_all:
    db "Delete ALL Highscores", 0

en_highscore_delete_confirm:
    db "Are you sure you want to delete the selected highscore? (Y/N): ", 0

en_highscore_delete_done:
    db "Highscore deleted.", 0

en_highscore_delete_error:
    db "ERROR: Could not clear the highscore file.", 0


; ==========================================
; Start new log (ID 86-87)
; ==========================================

en_newlog_warning:
    db "WARNING: The entire current log will be deleted.", 0

en_newlog_prompt:
    db "Start a new log? (Y/N): ", 0


; ==========================================
; Settings - additional fields (ID 88-89)
; ==========================================

en_settings_arrl_state_prompt:
    db "Enter ARRL State/Province (e.g. ON or NY): ", 0

en_settings_wpm_prompt:
    db "WPM (e.g. 10, 15, 20, 25): ", 0


; ==========================================
; Settings - input (ID 90-95)
; ==========================================

en_settings_callsign_input:
    db "Enter callsign: ", 0

en_settings_name_input:
    db "Enter name: ", 0

en_settings_email_input:
    db "Enter e-mail: ", 0

en_settings_address_input:
    db "Enter address: ", 0

en_settings_zip_input:
    db "Enter postal code: ", 0

en_settings_city_input:
    db "Enter city: ", 0

; ==========================================
; Settings - saved (ID 96-102)
; ==========================================

en_settings_callsign_saved:
    db "Callsign saved.", 10, 0

en_settings_name_saved:
    db "Name saved.", 10, 0

en_settings_email_saved:
    db "E-mail saved.", 10, 0

en_settings_address_saved:
    db "Address saved.", 10, 0

en_settings_zip_saved:
    db "Postal code saved.", 10, 0

en_settings_city_saved:
    db "City saved.", 10, 0

en_settings_power_saved:
    db "Power saved.", 10, 0

en_settings_arrl_power_input:
    db "Enter ARRL Power in watts: ", 0
	
en_cw_time_title:
    db "=== CW Training Time ===", 0

en_cw_time_5_min:
    db "1.  5 minutes", 0

en_cw_time_10_min:
    db "2. 10 minutes", 0

en_cw_time_15_min:
    db "3. 15 minutes", 0

en_cw_time_30_min:
    db "4. 30 minutes", 0

en_cw_time_60_min:
    db "5. 60 minutes", 0

en_cw_time_choose:
    db "Select training time: ", 0
	
en_exit_question:
    db "Do you want to exit the program? (Y/N): ", 0

en_exit_message:
    db "ASMLog is closing.", 0

en_error_invalid_choice:
    db "Invalid choice.", 0

en_error_invalid_band:
    db "Invalid WPX band. Use 160m, 80m, 40m, 20m, 15m or 10m.", 0

en_error_invalid_callsign:
    db "Invalid callsign - must contain a letter and a digit.", 0

en_error_callsign_file:
    db "ERROR: Callsign file is missing or empty.", 0

en_error_invalid_rst:
    db "RST must contain exactly three digits, e.g. 599.", 0

en_error_invalid_qsonr:
    db "QSONR must contain no more than 5 digits.", 0

en_error_wpx_log_file:
    db "Could not open wpx_log.txt", 0

en_status_logtype_wpx:
    db "Selected log type: WPX", 0

en_status_logtype_hf:
    db "Selected log type: HF", 0

en_status_logtype_arrl:
    db "Selected log type: ARRL DX CW", 0

en_status_logtype_russian:
    db "Selected log type: Russian DX", 0

en_status_logtype_cqww:
    db "Selected log type: CQ WW DX CW", 0

en_status_logtype_sac:
    db "Selected log type: SAC CW", 0

en_status_mode_radio:
    db "Selected QSO mode: RADIO", 0

en_status_mode_cw:
    db "Selected QSO mode: CW", 0

en_status_mode_cw_text:
    db "Selected QSO mode: CW + TEXT", 0

en_status_mode_text:
    db "Selected QSO mode: TEXT", 0	
	
en_qso_saved_message:
    db "QSO saved.", 0

en_qso_dupe_warning:
    db "WARNING: Callsign already logged on this band.", 0

en_qso_count_format:
    db "Number of QSOs: %d", 0

en_qso_dupe_count_format:
    db "Number of DUPES: %d", 0

en_qso_points_format:
    db "QSO points: %d", 0

en_qso_sent_text_format:
    db "Sent: %s", 0
	
; ==========================================
; CTY-beskeder (ID 136-137)
; ==========================================

en_cty_result_format:
    db "CTY found: %s / %s", 0

en_cty_file_error:
    db "ERROR: Could not open cty.dat.", 0
	
; ==========================================
; HF messages (ID 138-157)
; ==========================================

en_hf_call_correct:
    db "CALL: CORRECT", 0

en_hf_call_wrong:
    db "CALL: INCORRECT", 0

en_hf_rst_correct:
    db "RST: CORRECT", 0

en_hf_rst_wrong:
    db "RST: INCORRECT", 0

en_hf_name_correct:
    db "NAME: CORRECT", 0

en_hf_name_wrong:
    db "NAME: INCORRECT", 0

en_hf_qth_correct:
    db "QTH: CORRECT", 0

en_hf_qth_wrong:
    db "QTH: INCORRECT", 0

en_hf_result_header:
    db "===== HF TRAINING RESULTS =====", 0

en_hf_result_qso:
    db "QSOs checked: %u", 0

en_hf_result_call:
    db "CALL correct: %u", 0

en_hf_result_rst:
    db "RST correct: %u", 0

en_hf_result_name:
    db "NAME correct: %u", 0

en_hf_result_qth:
    db "QTH correct: %u", 0

en_hf_result_total:
    db "Correct fields: %u / %u", 0

en_hf_result_wrong:
    db "Incorrect fields: %u", 0

en_hf_result_percent:
    db "Accuracy: %u.%02u %%", 0

en_hf_highscore_header:
    db "=== HF CW Highscore ===", 0

en_hf_highscore_empty:
    db "No HF CW highscores yet.", 0

en_hf_log_header:
    db "=== HF QSO Log ===", 0
	
; ==========================================
; Common checker messages (ID 158-164)
; ==========================================

en_checker_band_ok:
    db "BAND OK", 0

en_checker_band_error:
    db "BAND ERROR", 0

en_checker_qso_ok:
    db "QSO OK", 0

en_checker_qso_error:
    db "QSO ERROR", 0

en_checker_claimed_score:
    db "CLAIMED SCORE: ", 0

en_checker_real_score:
    db "REAL SCORE: %d", 0

en_checker_highscore_date:
    db "HIGHSCORE DATE: %s", 0
	
; ==========================================
; Russian DX messages (ID 165-173)
; ==========================================

en_russian_country_mult:
    db "New country multiplier: %s on %s", 0

en_russian_country_used:
    db "Country multiplier already worked: %s", 0

en_russian_oblast_mult:
    db "New oblast multiplier: %s on %s", 0

en_russian_oblast_used:
    db "Oblast multiplier already worked: %s", 0

en_russian_oblast_error:
    db "Invalid oblast code.", 0

en_russian_log_empty:
    db "No QSOs in the Russian DX log.", 0

en_russian_station:
    db "Russian station.", 0

en_russian_not_station:
    db "Non-Russian station.", 0

en_russian_new_log:
    db "New Russian DX log started.", 0

; ==========================================
; CQ WW DX messages (ID 174-179)
; ==========================================

en_cqww_continent_error:
    db "Invalid continent. Use EU, AF, AS, NA, SA or OC.", 0

en_cqww_continent_prompt:
    db "Continent (EU/AF/AS/NA/SA/OC): ", 0

en_cqww_zone_error:
    db "Invalid CQ zone. Use 1-40.", 0

en_cqww_zone_prompt:
    db "CQ zone: ", 0

en_cqww_new_log_done:
    db "New CQ WW log started.", 0

en_cqww_new_log_warning:
    db "WARNING: The entire current CQ WW log will be deleted.", 0
	
; ==========================================
; SAC CW messages (ID 180-187)
; ==========================================

en_sac_new_log_done:
    db "New SAC log started.", 0

en_sac_new_log_prompt:
    db "Start a new log? (Y/N): ", 0

en_sac_scandinavian:
    db "SAC: Scandinavian station", 0

en_sac_non_scandinavian:
    db "SAC: Non-Scandinavian station", 0

en_sac_serial_prompt:
    db "Serial number: ", 0

en_sac_serial_error:
    db "Invalid serial number. Use digits only, minimum 1.", 0

en_sac_qso_points:
    db "QSO points: %d", 0

en_sac_dupe_message:
    db "DUPE - callsign already logged on this band.", 0
	
; ==========================================
; ARRL DX messages (ID 188-193)
; ==========================================

en_arrl_new_log_done:
    db "New ARRL DX log started.", 0

en_arrl_new_log_prompt:
    db "Start a new ARRL DX log? (Y/N): ", 0

en_arrl_log_empty:
    db "No QSOs in the ARRL DX log.", 0

en_arrl_multipliers:
    db "ARRL multipliers: %d", 0

en_arrl_score:
    db "ARRL score: %d", 0

en_arrl_qso_points:
    db "QSO points: %d", 0
	
en_menu_delete_highscore db "Delete Highscore", 0
en_settings_arrl_state_menu:
    db "ARRL State/Province", 0
	
en_wpx_highscore_title       db "=== WPX Highscore ===",0
en_arrl_highscore_title      db "=== ARRL DX Highscore ===",0
en_russian_highscore_title   db "=== Russian DX Highscore ===",0
en_cqww_highscore_title      db "=== CQ WW DX Highscore ===",0
en_sac_highscore_title       db "=== SAC CW Highscore ===",0
en_hf_highscore_title        db "=== HF CW Highscore ===",0

en_hf_highscore_accuracy db "Show by accuracy",0
en_delete_hs_title   db "=== DELETE HIGHSCORE ===",0
en_delete_hs_wpx     db "Delete WPX Highscore",0
en_delete_hs_hf      db "Delete HF Highscore",0
en_delete_hs_arrl    db "Delete ARRL DX Highscore",0
en_delete_hs_russian db "Delete Russian DX Highscore",0
en_delete_hs_cqww    db "Delete CQ WW DX Highscore",0
en_delete_hs_sac     db "Delete SAC CW Highscore",0
en_delete_hs_all     db "Delete ALL Highscores",0
en_settings_language:
    db "Language", 0