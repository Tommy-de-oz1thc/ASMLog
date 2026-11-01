
; ASMLog v3.0 - Deutsche Sprachdatei
; Gleiche Text-ID-Reihenfolge wie sprog_da.asm

bits 64
default rel

global de_tabel

section .data

de_tabel:
    dq de_menu_title
    dq de_menu_new_qso
    dq de_menu_show_log
    dq de_menu_search_call
    dq de_menu_new_log
    dq de_menu_print_log
    dq de_menu_settings
    dq de_menu_highscore
    dq de_menu_back
	
    ; Einstellungen (ID 9-18)
    dq de_settings_title
    dq de_settings_logtype
    dq de_settings_callsign
    dq de_settings_name
    dq de_settings_email
    dq de_settings_address
    dq de_settings_postcode
    dq de_settings_city
    dq de_settings_power
    dq de_settings_back

    ; Logtyp-Menue (ID 19-26)
    dq de_logtype_title
    dq de_logtype_wpx
    dq de_logtype_hf
    dq de_logtype_arrl_dx
    dq de_logtype_russian_dx
    dq de_logtype_cqww_dx
    dq de_logtype_sac_cw
    dq de_logtype_back


    ; Neue QSO (ID 27-38)
    dq de_qso_title
    dq de_qso_callsign
    dq de_qso_band
    dq de_qso_mode
    dq de_qso_rst_sent
    dq de_qso_rst_received
    dq de_qso_exchange
    dq de_qso_zone
    dq de_qso_serial
    dq de_qso_points
    dq de_qso_save
    dq de_qso_back

    ; QSO-Log anzeigen (ID 39-48)
    dq de_show_log_title
    dq de_show_log_date
    dq de_show_log_time
    dq de_show_log_callsign
    dq de_show_log_band
    dq de_show_log_mode
    dq de_show_log_rst
    dq de_show_log_exchange
    dq de_show_log_points
    dq de_show_log_back

    ; Rufzeichen suchen (ID 49-54)
    dq de_search_enter_call
    dq de_search_you_entered
    dq de_search_call_prompt
    dq de_search_results
    dq de_search_count
    dq de_search_not_found

    ; Log exportieren (ID 55-60)
    dq de_print_log_title
    dq de_print_log_adif
    dq de_print_log_cabrillo
    dq de_print_log_main_menu
    dq de_print_log_back
    dq de_print_log_choice


    ; Mode-Menue (ID 61-65)
    dq de_mode_title
    dq de_mode_radio
    dq de_mode_cw
    dq de_mode_cw_text
    dq de_mode_text


    ; Sprachauswahl (ID 66)
    dq de_language_title


    ; Power-Menue (ID 67-71)
    dq de_power_title
    dq de_power_qrp
    dq de_power_low
    dq de_power_high
    dq de_power_arrl


    ; WPM-Menue (ID 72)
    dq de_wpm_title


    ; Highscore-Sortierung (ID 73-74)
    dq de_highscore_sort_date
    dq de_highscore_sort_real


    ; Highscore loeschen (ID 75-85)
    dq de_highscore_delete_title
    dq de_highscore_delete_wpx
    dq de_highscore_delete_hf
    dq de_highscore_delete_arrl
    dq de_highscore_delete_russian
    dq de_highscore_delete_cqww
    dq de_highscore_delete_sac
    dq de_highscore_delete_all
    dq de_highscore_delete_confirm
    dq de_highscore_delete_done
    dq de_highscore_delete_error


    ; Neues Log starten (ID 86-87)
    dq de_newlog_warning
    dq de_newlog_prompt


    ; Settings - zusaetzliche Felder (ID 88-89)
    dq de_settings_arrl_state_prompt
    dq de_settings_wpm_prompt


    ; Settings - Eingabe (ID 90-95)
    dq de_settings_callsign_input
    dq de_settings_name_input
    dq de_settings_email_input
    dq de_settings_address_input
    dq de_settings_zip_input
    dq de_settings_city_input

    ; Settings - gespeichert (ID 96-102)
    dq de_settings_callsign_saved
    dq de_settings_name_saved
    dq de_settings_email_saved
    dq de_settings_address_saved
    dq de_settings_zip_saved
    dq de_settings_city_saved
    dq de_settings_power_saved

    dq de_settings_arrl_power_input

    dq de_cw_time_title
    dq de_cw_time_5_min
    dq de_cw_time_10_min
    dq de_cw_time_15_min
    dq de_cw_time_30_min
    dq de_cw_time_60_min
    dq de_cw_time_choose

    dq de_exit_question
    dq de_exit_message

    dq de_error_invalid_choice
    dq de_error_invalid_band
    dq de_error_invalid_callsign
    dq de_error_callsign_file
    dq de_error_invalid_rst
    dq de_error_invalid_qsonr
    dq de_error_wpx_log_file

    dq de_status_logtype_wpx
    dq de_status_logtype_hf
    dq de_status_logtype_arrl
    dq de_status_logtype_russian
    dq de_status_logtype_cqww
    dq de_status_logtype_sac
    dq de_status_mode_radio
    dq de_status_mode_cw
    dq de_status_mode_cw_text
    dq de_status_mode_text

    dq de_qso_saved_message
    dq de_qso_dupe_warning
    dq de_qso_count_format
    dq de_qso_dupe_count_format
    dq de_qso_points_format
    dq de_qso_sent_text_format

    ; CTY-beskeder (ID 136-137)
    dq de_cty_result_format
    dq de_cty_file_error

    ; HF-beskeder (ID 138-157)
    dq de_hf_call_correct
    dq de_hf_call_wrong
    dq de_hf_rst_correct
    dq de_hf_rst_wrong
    dq de_hf_name_correct
    dq de_hf_name_wrong
    dq de_hf_qth_correct
    dq de_hf_qth_wrong
    dq de_hf_result_header
    dq de_hf_result_qso
    dq de_hf_result_call
    dq de_hf_result_rst
    dq de_hf_result_name
    dq de_hf_result_qth
    dq de_hf_result_total
    dq de_hf_result_wrong
    dq de_hf_result_percent
    dq de_hf_highscore_header
    dq de_hf_highscore_empty
    dq de_hf_log_header

    ; Fælles checkerbeskeder (ID 158-164)
    dq de_checker_band_ok
    dq de_checker_band_error
    dq de_checker_qso_ok
    dq de_checker_qso_error
    dq de_checker_claimed_score
    dq de_checker_real_score
    dq de_checker_highscore_date

    ; Russian DX (ID 165-173)
    dq de_russian_country_mult
    dq de_russian_country_used
    dq de_russian_oblast_mult
    dq de_russian_oblast_used
    dq de_russian_oblast_error
    dq de_russian_log_empty
    dq de_russian_station
    dq de_russian_not_station
    dq de_russian_new_log

    ; CQ WW DX (ID 174-179)
    dq de_cqww_continent_error
    dq de_cqww_continent_prompt
    dq de_cqww_zone_error
    dq de_cqww_zone_prompt
    dq de_cqww_new_log_done
    dq de_cqww_new_log_warning

    ; SAC CW (ID 180-187)
    dq de_sac_new_log_done
    dq de_sac_new_log_prompt
    dq de_sac_scandinavian
    dq de_sac_non_scandinavian
    dq de_sac_serial_prompt
    dq de_sac_serial_error
    dq de_sac_qso_points
    dq de_sac_dupe_message

    ; ARRL DX (ID 188-193)
    dq de_arrl_new_log_done
    dq de_arrl_new_log_prompt
    dq de_arrl_log_empty
    dq de_arrl_multipliers
    dq de_arrl_score
    dq de_arrl_qso_points

    dq de_menu_delete_highscore    ; ID 194

    dq de_settings_arrl_state_menu

    dq de_wpx_highscore_title       ; 196
    dq de_arrl_highscore_title      ; 197
    dq de_russian_highscore_title   ; 198
    dq de_cqww_highscore_title      ; 199
    dq de_sac_highscore_title       ; 200
    dq de_hf_highscore_title        ; 201
    dq de_highscore_sort_date       ; 202
    dq de_highscore_sort_real       ; 203

    dq de_hf_highscore_accuracy    ; 204

    dq de_delete_hs_title       ; 205
    dq de_delete_hs_wpx         ; 206
    dq de_delete_hs_hf          ; 207
    dq de_delete_hs_arrl        ; 208
    dq de_delete_hs_russian     ; 209
    dq de_delete_hs_cqww        ; 210
    dq de_delete_hs_sac         ; 211
    dq de_delete_hs_all         ; 212

    dq de_settings_language     ; 213
	
de_menu_title:
    db "Hauptmenue", 0

de_menu_new_qso:
    db "Neues QSO", 0

de_menu_show_log:
    db "QSO-Log anzeigen", 0

de_menu_search_call:
    db "Rufzeichen suchen", 0

de_menu_new_log:
    db "Neues Log starten", 0

de_menu_print_log:
    db "Log drucken", 0

de_menu_settings:
    db "Einstellungen", 0

de_menu_highscore:
    db "Bestenliste", 0

de_menu_back:
    db "Zurueck", 0





; ==========================================
; Einstellungen (ID 9-18)
; ==========================================

de_settings_title:
    db "Einstellungen", 0

de_settings_logtype:
    db "Wettbewerbstyp", 0

de_settings_callsign:
    db "Rufzeichen", 0

de_settings_name:
    db "Name", 0

de_settings_email:
    db "E-Mail", 0

de_settings_address:
    db "Adresse", 0

de_settings_postcode:
    db "Postleitzahl", 0

de_settings_city:
    db "Stadt", 0

de_settings_power:
    db "Sendeleistung", 0

de_settings_back:
    db "Zurueck", 0





; ==========================================
; Logtyp-Menue (ID 19-26)
; ==========================================

de_logtype_title:
    db "Wettbewerbstyp waehlen", 0

de_logtype_wpx:
    db "WPX", 0

de_logtype_hf:
    db "HF", 0

de_logtype_arrl_dx:
    db "ARRL DX CW", 0

de_logtype_russian_dx:
    db "Russian DX", 0

de_logtype_cqww_dx:
    db "CQ WW DX CW", 0

de_logtype_sac_cw:
    db "SAC CW", 0

de_logtype_back:
    db "Zurueck", 0




; ==========================================
; Neue QSO (ID 27-38)
; ==========================================

de_qso_title:
    db "Neues QSO", 0

de_qso_callsign:
    db "Rufzeichen", 0

de_qso_band:
    db "Band", 0

de_qso_mode:
    db "Betriebsart", 0

de_qso_rst_sent:
    db "RST gesendet", 0

de_qso_rst_received:
    db "RST empfangen", 0

de_qso_exchange:
    db "Austausch", 0

de_qso_zone:
    db "Zone", 0

de_qso_serial:
    db "Laufende Nummer", 0

de_qso_points:
    db "Punkte", 0

de_qso_save:
    db "QSO speichern", 0

de_qso_back:
    db "Zurueck", 0





; ==========================================
; QSO-Log anzeigen (ID 39-48)
; ==========================================

de_show_log_title:
    db "QSO-Log anzeigen", 0

de_show_log_date:
    db "Datum", 0

de_show_log_time:
    db "Uhrzeit", 0

de_show_log_callsign:
    db "Rufzeichen", 0

de_show_log_band:
    db "Band", 0

de_show_log_mode:
    db "Betriebsart", 0

de_show_log_rst:
    db "RST", 0

de_show_log_exchange:
    db "Austausch", 0

de_show_log_points:
    db "Punkte", 0

de_show_log_back:
    db "Zurueck", 0



   



; ==========================================
; Rufzeichen suchen (ID 49-54)
; ==========================================

de_search_enter_call:
    db "Rufzeichen eingeben: ", 0

de_search_you_entered:
    db "Gesuchtes Rufzeichen: %s", 0

de_search_call_prompt:
    db "Rufzeichen suchen: ", 0

de_search_results:
    db "Gefundene QSOs:", 0

de_search_count:
    db "Anzahl Treffer: %d", 0

de_search_not_found:
    db "Keine QSOs gefunden.", 0

; ==========================================
; Log exportieren (ID 55-60)
; ==========================================

de_print_log_title:
    db "Log exportieren", 0

de_print_log_adif:
    db "ADIF - HF", 0

de_print_log_cabrillo:
    db "Cabrillo", 0

de_print_log_main_menu:
    db "Hauptmenue", 0

de_print_log_back:
    db "Zurueck", 0

de_print_log_choice:
    db "Auswahl: ", 0



; ==========================================
; Mode-Menue (ID 61-65)
; ==========================================

de_mode_title:
    db "Betriebsart", 0

de_mode_radio:
    db "RADIO", 0

de_mode_cw:
    db "CW", 0

de_mode_cw_text:
    db "CW + TEXT", 0

de_mode_text:
    db "TEXT", 0


; ==========================================
; Sprachauswahl (ID 66)
; ==========================================

de_language_title:
    db "Sprache waehlen", 0


; ==========================================
; Power-Menue (ID 67-71)
; ==========================================

de_power_title:
    db "Leistung", 0

de_power_qrp:
    db "QRP", 0

de_power_low:
    db "LOW", 0

de_power_high:
    db "HIGH", 0

de_power_arrl:
    db "ARRL Leistung", 0


; ==========================================
; WPM-Menue (ID 72)
; ==========================================

de_wpm_title:
    db "WPM", 0


; ==========================================
; Highscore-Sortierung (ID 73-74)
; ==========================================

de_highscore_sort_date:
    db "Nach Datum sortieren", 0

de_highscore_sort_real:
    db "Nach Real Score sortieren", 0


; ==========================================
; Highscore loeschen (ID 75-85)
; ==========================================

de_highscore_delete_title:
    db "Highscore loeschen", 0

de_highscore_delete_wpx:
    db "WPX Highscore loeschen", 0

de_highscore_delete_hf:
    db "HF Highscore loeschen", 0

de_highscore_delete_arrl:
    db "ARRL DX Highscore loeschen", 0

de_highscore_delete_russian:
    db "Russian DX Highscore loeschen", 0

de_highscore_delete_cqww:
    db "CQ WW DX Highscore loeschen", 0

de_highscore_delete_sac:
    db "SAC CW Highscore loeschen", 0

de_highscore_delete_all:
    db "ALLE Highscores loeschen", 0

de_highscore_delete_confirm:
    db "Moechten Sie den ausgewaehlten Highscore wirklich loeschen? (J/N): ", 0

de_highscore_delete_done:
    db "Highscore geloescht.", 0

de_highscore_delete_error:
    db "FEHLER: Highscore-Datei konnte nicht geleert werden.", 0


; ==========================================
; Neues Log starten (ID 86-87)
; ==========================================

de_newlog_warning:
    db "WARNUNG: Das gesamte aktuelle Log wird geloescht.", 0

de_newlog_prompt:
    db "Neues Log starten? (J/N): ", 0


; ==========================================
; Settings - zusaetzliche Felder (ID 88-89)
; ==========================================

de_settings_arrl_state_prompt:
    db "ARRL Bundesstaat/Provinz eingeben (z.B. ON oder NY): ", 0

de_settings_wpm_prompt:
    db "WPM (z.B. 10, 15, 20, 25): ", 0


; ==========================================
; Settings - Eingabe (ID 90-95)
; ==========================================

de_settings_callsign_input:
    db "Rufzeichen eingeben: ", 0

de_settings_name_input:
    db "Name eingeben: ", 0

de_settings_email_input:
    db "E-Mail eingeben: ", 0

de_settings_address_input:
    db "Adresse eingeben: ", 0

de_settings_zip_input:
    db "Postleitzahl eingeben: ", 0

de_settings_city_input:
    db "Stadt eingeben: ", 0

; ==========================================
; Settings - gespeichert (ID 96-102)
; ==========================================

de_settings_callsign_saved:
    db "Rufzeichen gespeichert.", 10, 0

de_settings_name_saved:
    db "Name gespeichert.", 10, 0

de_settings_email_saved:
    db "E-Mail gespeichert.", 10, 0

de_settings_address_saved:
    db "Adresse gespeichert.", 10, 0

de_settings_zip_saved:
    db "Postleitzahl gespeichert.", 10, 0

de_settings_city_saved:
    db "Stadt gespeichert.", 10, 0

de_settings_power_saved:
    db "Sendeleistung gespeichert.", 10, 0
	
de_settings_arrl_power_input:
    db "ARRL Power in Watt eingeben: ", 0

de_cw_time_title:
    db "=== CW-Trainingszeit ===", 0

de_cw_time_5_min:
    db "1.  5 Minuten", 0

de_cw_time_10_min:
    db "2. 10 Minuten", 0

de_cw_time_15_min:
    db "3. 15 Minuten", 0

de_cw_time_30_min:
    db "4. 30 Minuten", 0

de_cw_time_60_min:
    db "5. 60 Minuten", 0

de_cw_time_choose:
    db "Trainingszeit waehlen: ", 0
	
de_exit_question:
    db "Moechten Sie das Programm beenden? (J/N): ", 0

de_exit_message:
    db "ASMLog wird beendet.", 0
	
de_error_invalid_choice:
    db "Ungueltige Auswahl.", 0

de_error_invalid_band:
    db "Ungueltiges WPX-Band. Verwenden Sie 160m, 80m, 40m, 20m, 15m oder 10m.", 0

de_error_invalid_callsign:
    db "Ungueltiges Rufzeichen - muss einen Buchstaben und eine Ziffer enthalten.", 0

de_error_callsign_file:
    db "FEHLER: Rufzeichendatei fehlt oder ist leer.", 0

de_error_invalid_rst:
    db "RST muss genau drei Ziffern enthalten, z.B. 599.", 0

de_error_invalid_qsonr:
    db "QSONR darf hoechstens 5 Ziffern enthalten.", 0

de_error_wpx_log_file:
    db "wpx_log.txt konnte nicht geoeffnet werden.", 0
	
de_status_logtype_wpx:
    db "Gewaehlter Logtyp: WPX", 0

de_status_logtype_hf:
    db "Gewaehlter Logtyp: HF", 0

de_status_logtype_arrl:
    db "Gewaehlter Logtyp: ARRL DX CW", 0

de_status_logtype_russian:
    db "Gewaehlter Logtyp: Russian DX", 0

de_status_logtype_cqww:
    db "Gewaehlter Logtyp: CQ WW DX CW", 0

de_status_logtype_sac:
    db "Gewaehlter Logtyp: SAC CW", 0

de_status_mode_radio:
    db "Gewaehlter QSO-Modus: RADIO", 0

de_status_mode_cw:
    db "Gewaehlter QSO-Modus: CW", 0

de_status_mode_cw_text:
    db "Gewaehlter QSO-Modus: CW + TEXT", 0

de_status_mode_text:
    db "Gewaehlter QSO-Modus: TEXT", 0
	
de_qso_saved_message:
    db "QSO gespeichert.", 0

de_qso_dupe_warning:
    db "WARNUNG: Rufzeichen wurde auf diesem Band bereits geloggt.", 0

de_qso_count_format:
    db "Anzahl QSOs: %d", 0

de_qso_dupe_count_format:
    db "Anzahl DUPES: %d", 0

de_qso_points_format:
    db "QSO-Punkte: %d", 0

de_qso_sent_text_format:
    db "Gesendet: %s", 0
	
; ==========================================
; CTY-beskeder (ID 136-137)
; ==========================================

de_cty_result_format:
    db "CTY gefunden: %s / %s", 0

de_cty_file_error:
    db "FEHLER: cty.dat konnte nicht geoeffnet werden.", 0
	
; ==========================================
; HF-Meldungen (ID 138-157)
; ==========================================

de_hf_call_correct:
    db "CALL: RICHTIG", 0

de_hf_call_wrong:
    db "CALL: FALSCH", 0

de_hf_rst_correct:
    db "RST: RICHTIG", 0

de_hf_rst_wrong:
    db "RST: FALSCH", 0

de_hf_name_correct:
    db "NAME: RICHTIG", 0

de_hf_name_wrong:
    db "NAME: FALSCH", 0

de_hf_qth_correct:
    db "QTH: RICHTIG", 0

de_hf_qth_wrong:
    db "QTH: FALSCH", 0

de_hf_result_header:
    db "===== HF-TRAININGSERGEBNISSE =====", 0

de_hf_result_qso:
    db "Gepruefte QSOs: %u", 0

de_hf_result_call:
    db "CALL richtig: %u", 0

de_hf_result_rst:
    db "RST richtig: %u", 0

de_hf_result_name:
    db "NAME richtig: %u", 0

de_hf_result_qth:
    db "QTH richtig: %u", 0

de_hf_result_total:
    db "Richtige Felder: %u / %u", 0

de_hf_result_wrong:
    db "Falsche Felder: %u", 0

de_hf_result_percent:
    db "Genauigkeit: %u.%02u %%", 0

de_hf_highscore_header:
    db "=== HF CW Highscore ===", 0

de_hf_highscore_empty:
    db "Noch keine HF CW-Highscores vorhanden.", 0

de_hf_log_header:
    db "=== HF QSO-Log ===", 0
	
; ==========================================
; Gemeinsame Pruefmeldungen (ID 158-164)
; ==========================================

de_checker_band_ok:
    db "BAND OK", 0

de_checker_band_error:
    db "BAND FEHLER", 0

de_checker_qso_ok:
    db "QSO OK", 0

de_checker_qso_error:
    db "QSO FEHLER", 0

de_checker_claimed_score:
    db "GEMELDETE PUNKTZAHL: ", 0

de_checker_real_score:
    db "TATSAECHLICHE PUNKTZAHL: %d", 0

de_checker_highscore_date:
    db "HIGHSCORE-DATUM: %s", 0
	
; ==========================================
; Russian DX Meldungen (ID 165-173)
; ==========================================

de_russian_country_mult:
    db "Neuer Laendermultiplikator: %s auf %s", 0

de_russian_country_used:
    db "Laendermultiplikator bereits gewertet: %s", 0

de_russian_oblast_mult:
    db "Neuer Oblast-Multiplikator: %s auf %s", 0

de_russian_oblast_used:
    db "Oblast-Multiplikator bereits gewertet: %s", 0

de_russian_oblast_error:
    db "Ungueltiger Oblast-Code.", 0

de_russian_log_empty:
    db "Keine QSOs im Russian DX Log.", 0

de_russian_station:
    db "Russische Station.", 0

de_russian_not_station:
    db "Nicht-russische Station.", 0

de_russian_new_log:
    db "Neues Russian DX Log gestartet.", 0
	
; ==========================================
; CQ WW DX Meldungen (ID 174-179)
; ==========================================

de_cqww_continent_error:
    db "Ungueltiger Kontinent. EU, AF, AS, NA, SA oder OC verwenden.", 0

de_cqww_continent_prompt:
    db "Kontinent (EU/AF/AS/NA/SA/OC): ", 0

de_cqww_zone_error:
    db "Ungueltige CQ-Zone. Werte von 1-40 verwenden.", 0

de_cqww_zone_prompt:
    db "CQ-Zone: ", 0

de_cqww_new_log_done:
    db "Neues CQ WW Log gestartet.", 0

de_cqww_new_log_warning:
    db "WARNUNG: Das gesamte aktuelle CQ WW Log wird geloescht.", 0
	
; ==========================================
; SAC CW Meldungen (ID 180-187)
; ==========================================

de_sac_new_log_done:
    db "Neues SAC-Log gestartet.", 0

de_sac_new_log_prompt:
    db "Neues Log starten? (J/N): ", 0

de_sac_scandinavian:
    db "SAC: Skandinavische Station", 0

de_sac_non_scandinavian:
    db "SAC: Nicht-skandinavische Station", 0

de_sac_serial_prompt:
    db "Seriennummer: ", 0

de_sac_serial_error:
    db "Ungueltige Seriennummer. Nur Ziffern, mindestens 1.", 0

de_sac_qso_points:
    db "QSO-Punkte: %d", 0

de_sac_dupe_message:
    db "DUPE - Rufzeichen auf diesem Band bereits geloggt.", 0
	
; ==========================================
; ARRL DX Meldungen (ID 188-193)
; ==========================================

de_arrl_new_log_done:
    db "Neues ARRL DX Log gestartet.", 0

de_arrl_new_log_prompt:
    db "Neues ARRL DX Log starten? (J/N): ", 0

de_arrl_log_empty:
    db "Keine QSOs im ARRL DX Log.", 0

de_arrl_multipliers:
    db "ARRL-Multiplikatoren: %d", 0

de_arrl_score:
    db "ARRL-Punktzahl: %d", 0

de_arrl_qso_points:
    db "QSO-Punkte: %d", 0
	
de_menu_delete_highscore db "Highscore loeschen", 0
de_settings_arrl_state_menu:
    db "ARRL-Bundesstaat/Provinz", 0
	
de_wpx_highscore_title       db "=== WPX Highscore ===",0
de_arrl_highscore_title      db "=== ARRL DX Highscore ===",0
de_russian_highscore_title   db "=== Russian DX Highscore ===",0
de_cqww_highscore_title      db "=== CQ WW DX Highscore ===",0
de_sac_highscore_title       db "=== SAC CW Highscore ===",0
de_hf_highscore_title        db "=== HF CW Highscore ===",0

de_hf_highscore_accuracy db "Nach Genauigkeit anzeigen",0
de_delete_hs_title   db "=== HIGHSCORE LOESCHEN ===",0
de_delete_hs_wpx     db "WPX Highscore loeschen",0
de_delete_hs_hf      db "HF Highscore loeschen",0
de_delete_hs_arrl    db "ARRL DX Highscore loeschen",0
de_delete_hs_russian db "Russian DX Highscore loeschen",0
de_delete_hs_cqww    db "CQ WW DX Highscore loeschen",0
de_delete_hs_sac     db "SAC CW Highscore loeschen",0
de_delete_hs_all     db "ALLE Highscores loeschen",0

de_settings_language:
    db "Sprache", 0