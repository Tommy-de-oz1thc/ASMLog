
; ASMLog v3.0 - Polski plik jezykowy
; Ta sama kolejnosc ID co w sprog_da.asm
; Encoding: UTF-8

bits 64
default rel

global pl_tabel

section .data

pl_tabel:
    dq pl_menu_title
    dq pl_menu_new_qso
    dq pl_menu_show_log
    dq pl_menu_search_call
    dq pl_menu_new_log
    dq pl_menu_print_log
    dq pl_menu_settings
    dq pl_menu_highscore
    dq pl_menu_back
	
    ; Ustawienia (ID 9-18)
    dq pl_settings_title
    dq pl_settings_logtype
    dq pl_settings_callsign
    dq pl_settings_name
    dq pl_settings_email
    dq pl_settings_address
    dq pl_settings_postcode
    dq pl_settings_city
    dq pl_settings_power
    dq pl_settings_back

    ; Menu rodzaju zawodow (ID 19-26)
    dq pl_logtype_title
    dq pl_logtype_wpx
    dq pl_logtype_hf
    dq pl_logtype_arrl_dx
    dq pl_logtype_russian_dx
    dq pl_logtype_cqww_dx
    dq pl_logtype_sac_cw
    dq pl_logtype_back

    ; Nowe QSO (ID 27-38)
    dq pl_qso_title
    dq pl_qso_callsign
    dq pl_qso_band
    dq pl_qso_mode
    dq pl_qso_rst_sent
    dq pl_qso_rst_received
    dq pl_qso_exchange
    dq pl_qso_zone
    dq pl_qso_serial
    dq pl_qso_points
    dq pl_qso_save
    dq pl_qso_back

    ; Wyswietl dziennik QSO (ID 39-48)
    dq pl_show_log_title
    dq pl_show_log_date
    dq pl_show_log_time
    dq pl_show_log_callsign
    dq pl_show_log_band
    dq pl_show_log_mode
    dq pl_show_log_rst
    dq pl_show_log_exchange
    dq pl_show_log_points
    dq pl_show_log_back

    ; Wyszukiwanie znaku (ID 49-54)
    dq pl_search_enter_call
    dq pl_search_you_entered
    dq pl_search_call_prompt
    dq pl_search_results
    dq pl_search_count
    dq pl_search_not_found

    ; Eksport dziennika (ID 55-60)
    dq pl_print_log_title
    dq pl_print_log_adif
    dq pl_print_log_cabrillo
    dq pl_print_log_main_menu
    dq pl_print_log_back
    dq pl_print_log_choice


    ; Menu trybu (ID 61-65)
    dq pl_mode_title
    dq pl_mode_radio
    dq pl_mode_cw
    dq pl_mode_cw_text
    dq pl_mode_text


    ; Wybor jezyka (ID 66)
    dq pl_language_title


    ; Menu mocy (ID 67-71)
    dq pl_power_title
    dq pl_power_qrp
    dq pl_power_low
    dq pl_power_high
    dq pl_power_arrl


    ; Menu WPM (ID 72)
    dq pl_wpm_title


    ; Sortowanie wynikow (ID 73-74)
    dq pl_highscore_sort_date
    dq pl_highscore_sort_real


    ; Usuwanie wynikow Highscore (ID 75-85)
    dq pl_highscore_delete_title
    dq pl_highscore_delete_wpx
    dq pl_highscore_delete_hf
    dq pl_highscore_delete_arrl
    dq pl_highscore_delete_russian
    dq pl_highscore_delete_cqww
    dq pl_highscore_delete_sac
    dq pl_highscore_delete_all
    dq pl_highscore_delete_confirm
    dq pl_highscore_delete_done
    dq pl_highscore_delete_error


    ; Rozpoczecie nowego dziennika (ID 86-87)
    dq pl_newlog_warning
    dq pl_newlog_prompt


    ; Ustawienia - dodatkowe pola (ID 88-89)
    dq pl_settings_arrl_state_prompt
    dq pl_settings_wpm_prompt


    ; Ustawienia - wprowadzanie danych (ID 90-95)
    dq pl_settings_callsign_input
    dq pl_settings_name_input
    dq pl_settings_email_input
    dq pl_settings_address_input
    dq pl_settings_zip_input
    dq pl_settings_city_input

    ; Ustawienia - zapisano (ID 96-102)
    dq pl_settings_callsign_saved
    dq pl_settings_name_saved
    dq pl_settings_email_saved
    dq pl_settings_address_saved
    dq pl_settings_zip_saved
    dq pl_settings_city_saved
    dq pl_settings_power_saved

    dq pl_settings_arrl_power_input

    dq pl_cw_time_title
    dq pl_cw_time_5_min
    dq pl_cw_time_10_min
    dq pl_cw_time_15_min
    dq pl_cw_time_30_min
    dq pl_cw_time_60_min
    dq pl_cw_time_choose

    dq pl_exit_question
    dq pl_exit_message

    dq pl_error_invalid_choice
    dq pl_error_invalid_band
    dq pl_error_invalid_callsign
    dq pl_error_callsign_file
    dq pl_error_invalid_rst
    dq pl_error_invalid_qsonr
    dq pl_error_wpx_log_file

    dq pl_status_logtype_wpx
    dq pl_status_logtype_hf
    dq pl_status_logtype_arrl
    dq pl_status_logtype_russian
    dq pl_status_logtype_cqww
    dq pl_status_logtype_sac
    dq pl_status_mode_radio
    dq pl_status_mode_cw
    dq pl_status_mode_cw_text
    dq pl_status_mode_text

    dq pl_qso_saved_message
    dq pl_qso_dupe_warning
    dq pl_qso_count_format
    dq pl_qso_dupe_count_format
    dq pl_qso_points_format
    dq pl_qso_sent_text_format

    ; CTY-beskeder (ID 136-137)
    dq pl_cty_result_format
    dq pl_cty_file_error

    ; HF-beskeder (ID 138-157)
    dq pl_hf_call_correct
    dq pl_hf_call_wrong
    dq pl_hf_rst_correct
    dq pl_hf_rst_wrong
    dq pl_hf_name_correct
    dq pl_hf_name_wrong
    dq pl_hf_qth_correct
    dq pl_hf_qth_wrong
    dq pl_hf_result_header
    dq pl_hf_result_qso
    dq pl_hf_result_call
    dq pl_hf_result_rst
    dq pl_hf_result_name
    dq pl_hf_result_qth
    dq pl_hf_result_total
    dq pl_hf_result_wrong
    dq pl_hf_result_percent
    dq pl_hf_highscore_header
    dq pl_hf_highscore_empty
    dq pl_hf_log_header

    ; Fælles checkerbeskeder (ID 158-164)
    dq pl_checker_band_ok
    dq pl_checker_band_error
    dq pl_checker_qso_ok
    dq pl_checker_qso_error
    dq pl_checker_claimed_score
    dq pl_checker_real_score
    dq pl_checker_highscore_date

    ; Russian DX (ID 165-173)
    dq pl_russian_country_mult
    dq pl_russian_country_used
    dq pl_russian_oblast_mult
    dq pl_russian_oblast_used
    dq pl_russian_oblast_error
    dq pl_russian_log_empty
    dq pl_russian_station
    dq pl_russian_not_station
    dq pl_russian_new_log

    ; CQ WW DX (ID 174-179)
    dq pl_cqww_continent_error
    dq pl_cqww_continent_prompt
    dq pl_cqww_zone_error
    dq pl_cqww_zone_prompt
    dq pl_cqww_new_log_done
    dq pl_cqww_new_log_warning

    ; SAC CW (ID 180-187)
    dq pl_sac_new_log_done
    dq pl_sac_new_log_prompt
    dq pl_sac_scandinavian
    dq pl_sac_non_scandinavian
    dq pl_sac_serial_prompt
    dq pl_sac_serial_error
    dq pl_sac_qso_points
    dq pl_sac_dupe_message

    ; ARRL DX (ID 188-193)
    dq pl_arrl_new_log_done
    dq pl_arrl_new_log_prompt
    dq pl_arrl_log_empty
    dq pl_arrl_multipliers
    dq pl_arrl_score
    dq pl_arrl_qso_points

    dq pl_menu_delete_highscore    ; ID 194

    dq pl_settings_arrl_state_menu

    dq pl_wpx_highscore_title       ; 196
    dq pl_arrl_highscore_title      ; 197
    dq pl_russian_highscore_title   ; 198
    dq pl_cqww_highscore_title      ; 199
    dq pl_sac_highscore_title       ; 200
    dq pl_hf_highscore_title        ; 201
    dq pl_highscore_sort_date       ; 202
    dq pl_highscore_sort_real       ; 203

    dq pl_hf_highscore_accuracy    ; 204

    dq pl_delete_hs_title       ; 205
    dq pl_delete_hs_wpx         ; 206
    dq pl_delete_hs_hf          ; 207
    dq pl_delete_hs_arrl        ; 208
    dq pl_delete_hs_russian     ; 209
    dq pl_delete_hs_cqww        ; 210
    dq pl_delete_hs_sac         ; 211
    dq pl_delete_hs_all         ; 212

    dq pl_settings_language     ; 213
	
pl_menu_title:
    db "Menu glowne", 0

pl_menu_new_qso:
    db "Nowe QSO", 0

pl_menu_show_log:
    db "Pokaz dziennik QSO", 0

pl_menu_search_call:
    db "Szukaj znaku wywolawczego", 0

pl_menu_new_log:
    db "Rozpocznij nowy dziennik", 0

pl_menu_print_log:
    db "Drukuj dziennik", 0

pl_menu_settings:
    db "Ustawienia", 0

pl_menu_highscore:
    db "Ranking", 0

pl_menu_back:
    db "Powrot", 0





; ==========================================
; Ustawienia (ID 9-18)
; ==========================================

pl_settings_title:
    db "Ustawienia", 0

pl_settings_logtype:
    db "Rodzaj zawodow", 0

pl_settings_callsign:
    db "Znak wywolawczy", 0

pl_settings_name:
    db "Imie i nazwisko", 0

pl_settings_email:
    db "E-mail", 0

pl_settings_address:
    db "Adres", 0

pl_settings_postcode:
    db "Kod pocztowy", 0

pl_settings_city:
    db "Miasto", 0

pl_settings_power:
    db "Moc nadawcza", 0

pl_settings_back:
    db "Powrot", 0






; ==========================================
; Menu rodzaju zawodow (ID 19-26)
; ==========================================

pl_logtype_title:
    db "Wybierz rodzaj zawodow", 0

pl_logtype_wpx:
    db "WPX", 0

pl_logtype_hf:
    db "HF", 0

pl_logtype_arrl_dx:
    db "ARRL DX CW", 0

pl_logtype_russian_dx:
    db "Russian DX", 0

pl_logtype_cqww_dx:
    db "CQ WW DX CW", 0

pl_logtype_sac_cw:
    db "SAC CW", 0

pl_logtype_back:
    db "Powrot", 0




; ==========================================
; Nowe QSO (ID 27-38)
; ==========================================

pl_qso_title:
    db "Nowe QSO", 0

pl_qso_callsign:
    db "Znak wywolawczy", 0

pl_qso_band:
    db "Pasmo", 0

pl_qso_mode:
    db "Emisja", 0

pl_qso_rst_sent:
    db "RST nadany", 0

pl_qso_rst_received:
    db "RST odebrany", 0

pl_qso_exchange:
    db "Raport konkursowy", 0

pl_qso_zone:
    db "Strefa", 0

pl_qso_serial:
    db "Numer kolejny", 0

pl_qso_points:
    db "Punkty", 0

pl_qso_save:
    db "Zapisz QSO", 0

pl_qso_back:
    db "Powrot", 0





; ==========================================
; Wyswietl dziennik QSO (ID 39-48)
; ==========================================

pl_show_log_title:
    db "Wyswietl dziennik QSO", 0

pl_show_log_date:
    db "Data", 0

pl_show_log_time:
    db "Czas", 0

pl_show_log_callsign:
    db "Znak wywolawczy", 0

pl_show_log_band:
    db "Pasmo", 0

pl_show_log_mode:
    db "Emisja", 0

pl_show_log_rst:
    db "RST", 0

pl_show_log_exchange:
    db "Raport konkursowy", 0

pl_show_log_points:
    db "Punkty", 0

pl_show_log_back:
    db "Powrot", 0







; ==========================================
; Wyszukiwanie znaku (ID 49-54)
; ==========================================

pl_search_enter_call:
    db "Wpisz znak wywolawczy: ", 0

pl_search_you_entered:
    db "Szukany znak: %s", 0

pl_search_call_prompt:
    db "Znak wywolawczy do wyszukania: ", 0

pl_search_results:
    db "Znalezione QSO:", 0

pl_search_count:
    db "Liczba wynikow: %d", 0

pl_search_not_found:
    db "Nie znaleziono QSO.", 0

; ==========================================
; Eksport dziennika (ID 55-60)
; ==========================================

pl_print_log_title:
    db "Eksport dziennika", 0

pl_print_log_adif:
    db "ADIF - HF", 0

pl_print_log_cabrillo:
    db "Cabrillo", 0

pl_print_log_main_menu:
    db "Menu glowne", 0

pl_print_log_back:
    db "Powrot", 0

pl_print_log_choice:
    db "Wybor: ", 0


; ==========================================
; Menu trybu (ID 61-65)
; ==========================================

pl_mode_title:
    db "Tryb pracy", 0

pl_mode_radio:
    db "RADIO", 0

pl_mode_cw:
    db "CW", 0

pl_mode_cw_text:
    db "CW + TEKST", 0

pl_mode_text:
    db "TEKST", 0


; ==========================================
; Wybor jezyka (ID 66)
; ==========================================

pl_language_title:
    db "Wybierz jezyk", 0


; ==========================================
; Menu mocy (ID 67-71)
; ==========================================

pl_power_title:
    db "Moc", 0

pl_power_qrp:
    db "QRP", 0

pl_power_low:
    db "LOW", 0

pl_power_high:
    db "HIGH", 0

pl_power_arrl:
    db "Moc ARRL", 0


; ==========================================
; Menu WPM (ID 72)
; ==========================================

pl_wpm_title:
    db "Predkosc CW (WPM)", 0


; ==========================================
; Sortowanie wynikow (ID 73-74)
; ==========================================

pl_highscore_sort_date:
    db "Sortuj wedlug daty", 0

pl_highscore_sort_real:
    db "Sortuj wedlug wyniku rzeczywistego", 0


; ==========================================
; Usuwanie wynikow Highscore (ID 75-85)
; ==========================================

pl_highscore_delete_title:
    db "Usun Highscore", 0

pl_highscore_delete_wpx:
    db "Usun Highscore WPX", 0

pl_highscore_delete_hf:
    db "Usun Highscore HF", 0

pl_highscore_delete_arrl:
    db "Usun Highscore ARRL DX", 0

pl_highscore_delete_russian:
    db "Usun Highscore Russian DX", 0

pl_highscore_delete_cqww:
    db "Usun Highscore CQ WW DX", 0

pl_highscore_delete_sac:
    db "Usun Highscore SAC CW", 0

pl_highscore_delete_all:
    db "Usun WSZYSTKIE wyniki Highscore", 0

pl_highscore_delete_confirm:
    db "Czy na pewno chcesz usunac wybrane wyniki Highscore? (T/N): ", 0

pl_highscore_delete_done:
    db "Wyniki Highscore usuniete.", 0

pl_highscore_delete_error:
    db "BLAD: Nie mozna wyczyscic pliku Highscore.", 0


; ==========================================
; Rozpoczecie nowego dziennika (ID 86-87)
; ==========================================

pl_newlog_warning:
    db "OSTRZEZENIE: Caly biezacy dziennik zostanie usuniety.", 0

pl_newlog_prompt:
    db "Rozpoczac nowy dziennik? (T/N): ", 0


; ==========================================
; Ustawienia - dodatkowe pola (ID 88-89)
; ==========================================

pl_settings_arrl_state_prompt:
    db "Podaj stan/prowincje ARRL (np. ON lub NY): ", 0

pl_settings_wpm_prompt:
    db "WPM (np. 10, 15, 20, 25): ", 0


; ==========================================
; Ustawienia - wprowadzanie danych (ID 90-95)
; ==========================================

pl_settings_callsign_input:
    db "Podaj znak wywolawczy: ", 0

pl_settings_name_input:
    db "Podaj imie: ", 0

pl_settings_email_input:
    db "Podaj adres e-mail: ", 0

pl_settings_address_input:
    db "Podaj adres: ", 0

pl_settings_zip_input:
    db "Podaj kod pocztowy: ", 0

pl_settings_city_input:
    db "Podaj miasto: ", 0

; ==========================================
; Ustawienia - zapisano (ID 96-102)
; ==========================================

pl_settings_callsign_saved:
    db "Znak wywolawczy zapisany.", 10, 0

pl_settings_name_saved:
    db "Imie zapisane.", 10, 0

pl_settings_email_saved:
    db "Adres e-mail zapisany.", 10, 0

pl_settings_address_saved:
    db "Adres zapisany.", 10, 0

pl_settings_zip_saved:
    db "Kod pocztowy zapisany.", 10, 0

pl_settings_city_saved:
    db "Miasto zapisane.", 10, 0

pl_settings_power_saved:
    db "Moc nadajnika zapisana.", 10, 0

pl_settings_arrl_power_input:
    db "Podaj moc ARRL w watach: ", 0
	
pl_cw_time_title:
    db "=== Czas treningu CW ===", 0

pl_cw_time_5_min:
    db "1.  5 minut", 0

pl_cw_time_10_min:
    db "2. 10 minut", 0

pl_cw_time_15_min:
    db "3. 15 minut", 0

pl_cw_time_30_min:
    db "4. 30 minut", 0

pl_cw_time_60_min:
    db "5. 60 minut", 0

pl_cw_time_choose:
    db "Wybierz czas treningu: ", 0
	
pl_exit_question:
    db "Czy chcesz zakonczyc program? (T/N): ", 0

pl_exit_message:
    db "Zamykanie ASMLog.", 0
	
pl_error_invalid_choice:
    db "Nieprawidlowy wybor.", 0

pl_error_invalid_band:
    db "Nieprawidlowe pasmo WPX. Uzyj 160m, 80m, 40m, 20m, 15m lub 10m.", 0

pl_error_invalid_callsign:
    db "Nieprawidlowy znak wywolawczy - musi zawierac litere i cyfre.", 0

pl_error_callsign_file:
    db "BLAD: Brak pliku znakow wywolawczych lub plik jest pusty.", 0

pl_error_invalid_rst:
    db "RST musi zawierac dokladnie trzy cyfry, np. 599.", 0

pl_error_invalid_qsonr:
    db "QSONR moze zawierac maksymalnie 5 cyfr.", 0

pl_error_wpx_log_file:
    db "Nie mozna otworzyc wpx_log.txt", 0
	
pl_status_logtype_wpx:
    db "Wybrany typ dziennika: WPX", 0

pl_status_logtype_hf:
    db "Wybrany typ dziennika: HF", 0

pl_status_logtype_arrl:
    db "Wybrany typ dziennika: ARRL DX CW", 0

pl_status_logtype_russian:
    db "Wybrany typ dziennika: Russian DX", 0

pl_status_logtype_cqww:
    db "Wybrany typ dziennika: CQ WW DX CW", 0

pl_status_logtype_sac:
    db "Wybrany typ dziennika: SAC CW", 0

pl_status_mode_radio:
    db "Wybrany tryb QSO: RADIO", 0

pl_status_mode_cw:
    db "Wybrany tryb QSO: CW", 0

pl_status_mode_cw_text:
    db "Wybrany tryb QSO: CW + TEXT", 0

pl_status_mode_text:
    db "Wybrany tryb QSO: TEXT", 0
	
; ==========================================
; QSO-beskeder (ID 130-135)
; ==========================================

pl_qso_saved_message:
    db "QSO zapisane.", 0

pl_qso_dupe_warning:
    db "UWAGA: Znak wywolawczy jest juz zapisany na tym pasmie.", 0

pl_qso_count_format:
    db "Liczba QSO: %d", 0

pl_qso_dupe_count_format:
    db "Liczba DUPES: %d", 0

pl_qso_points_format:
    db "Punkty QSO: %d", 0

pl_qso_sent_text_format:
    db "Nadano: %s", 0
	
; ==========================================
; CTY-beskeder (ID 136-137)
; ==========================================

pl_cty_result_format:
    db "Znaleziono CTY: %s / %s", 0

pl_cty_file_error:
    db "BLAD: Nie mozna otworzyc pliku cty.dat.", 0
	
; ==========================================
; Komunikaty HF (ID 138-157)
; ==========================================

pl_hf_call_correct:
    db "CALL: POPRAWNY", 0

pl_hf_call_wrong:
    db "CALL: BLEDNY", 0

pl_hf_rst_correct:
    db "RST: POPRAWNY", 0

pl_hf_rst_wrong:
    db "RST: BLEDNY", 0

pl_hf_name_correct:
    db "NAME: POPRAWNE", 0

pl_hf_name_wrong:
    db "NAME: BLEDNE", 0

pl_hf_qth_correct:
    db "QTH: POPRAWNE", 0

pl_hf_qth_wrong:
    db "QTH: BLEDNE", 0

pl_hf_result_header:
    db "===== WYNIKI TRENINGU HF =====", 0

pl_hf_result_qso:
    db "Sprawdzone QSO: %u", 0

pl_hf_result_call:
    db "Poprawne CALL: %u", 0

pl_hf_result_rst:
    db "Poprawne RST: %u", 0

pl_hf_result_name:
    db "Poprawne NAME: %u", 0

pl_hf_result_qth:
    db "Poprawne QTH: %u", 0

pl_hf_result_total:
    db "Poprawne pola: %u / %u", 0

pl_hf_result_wrong:
    db "Bledne pola: %u", 0

pl_hf_result_percent:
    db "Dokladnosc: %u.%02u %%", 0

pl_hf_highscore_header:
    db "=== Ranking HF CW ===", 0

pl_hf_highscore_empty:
    db "Brak wynikow HF CW.", 0

pl_hf_log_header:
    db "=== Dziennik QSO HF ===", 0
	
; ==========================================
; Wspolne komunikaty sprawdzania (ID 158-164)
; ==========================================

pl_checker_band_ok:
    db "PASMO POPRAWNE", 0

pl_checker_band_error:
    db "BLAD PASMA", 0

pl_checker_qso_ok:
    db "QSO POPRAWNE", 0

pl_checker_qso_error:
    db "BLAD QSO", 0

pl_checker_claimed_score:
    db "WYNIK DEKLAROWANY: ", 0

pl_checker_real_score:
    db "WYNIK RZECZYWISTY: %d", 0

pl_checker_highscore_date:
    db "DATA REKORDU: %s", 0
	
; ==========================================
; Komunikaty Russian DX (ID 165-173)
; ==========================================

pl_russian_country_mult:
    db "Nowy mnoznik kraju: %s na %s", 0

pl_russian_country_used:
    db "Mnoznik kraju juz zaliczony: %s", 0

pl_russian_oblast_mult:
    db "Nowy mnoznik obwodu: %s na %s", 0

pl_russian_oblast_used:
    db "Mnoznik obwodu juz zaliczony: %s", 0

pl_russian_oblast_error:
    db "Nieprawidlowy kod obwodu.", 0

pl_russian_log_empty:
    db "Brak QSO w dzienniku Russian DX.", 0

pl_russian_station:
    db "Stacja rosyjska.", 0

pl_russian_not_station:
    db "Stacja spoza Rosji.", 0

pl_russian_new_log:
    db "Rozpoczeto nowy dziennik Russian DX.", 0
	
; ==========================================
; Komunikaty CQ WW DX (ID 174-179)
; ==========================================

pl_cqww_continent_error:
    db "Nieprawidlowy kontynent. Uzyj EU, AF, AS, NA, SA lub OC.", 0

pl_cqww_continent_prompt:
    db "Kontynent (EU/AF/AS/NA/SA/OC): ", 0

pl_cqww_zone_error:
    db "Nieprawidlowa strefa CQ. Uzyj wartosci od 1 do 40.", 0

pl_cqww_zone_prompt:
    db "Strefa CQ: ", 0

pl_cqww_new_log_done:
    db "Rozpoczeto nowy dziennik CQ WW.", 0

pl_cqww_new_log_warning:
    db "UWAGA: Caly aktualny dziennik CQ WW zostanie usuniety.", 0
	
; ==========================================
; Komunikaty SAC CW (ID 180-187)
; ==========================================

pl_sac_new_log_done:
    db "Rozpoczeto nowy dziennik SAC.", 0

pl_sac_new_log_prompt:
    db "Rozpoczac nowy dziennik? (T/N): ", 0

pl_sac_scandinavian:
    db "SAC: Stacja skandynawska", 0

pl_sac_non_scandinavian:
    db "SAC: Stacja spoza Skandynawii", 0

pl_sac_serial_prompt:
    db "Numer kolejny: ", 0

pl_sac_serial_error:
    db "Nieprawidlowy numer. Tylko cyfry, minimum 1.", 0

pl_sac_qso_points:
    db "Punkty QSO: %d", 0

pl_sac_dupe_message:
    db "DUPE - znak juz zapisany na tym pasmie.", 0
	
; ==========================================
; Komunikaty ARRL DX (ID 188-193)
; ==========================================

pl_arrl_new_log_done:
    db "Rozpoczeto nowy dziennik ARRL DX.", 0

pl_arrl_new_log_prompt:
    db "Rozpoczac nowy dziennik ARRL DX? (T/N): ", 0

pl_arrl_log_empty:
    db "Brak QSO w dzienniku ARRL DX.", 0

pl_arrl_multipliers:
    db "Mnozniki ARRL: %d", 0

pl_arrl_score:
    db "Wynik ARRL: %d", 0

pl_arrl_qso_points:
    db "Punkty QSO: %d", 0
	
pl_menu_delete_highscore db "Usun wyniki", 0
pl_settings_arrl_state_menu:
    db "Stan/prowincja ARRL", 0
	
pl_wpx_highscore_title       db "=== WPX Highscore ===",0
pl_arrl_highscore_title      db "=== ARRL DX Highscore ===",0
pl_russian_highscore_title   db "=== Russian DX Highscore ===",0
pl_cqww_highscore_title      db "=== CQ WW DX Highscore ===",0
pl_sac_highscore_title       db "=== SAC CW Highscore ===",0
pl_hf_highscore_title        db "=== HF CW Highscore ===",0
	
pl_hf_highscore_accuracy db "Wyświetl według dokładności",0

pl_delete_hs_title   db "=== USUWANIE REKORDOW ===",0
pl_delete_hs_wpx     db "Usun rekordy WPX",0
pl_delete_hs_hf      db "Usun rekordy HF",0
pl_delete_hs_arrl    db "Usun rekordy ARRL DX",0
pl_delete_hs_russian db "Usun rekordy Russian DX",0
pl_delete_hs_cqww    db "Usun rekordy CQ WW DX",0
pl_delete_hs_sac     db "Usun rekordy SAC CW",0
pl_delete_hs_all     db "Usun WSZYSTKIE rekordy",0

pl_settings_language:
    db "Język", 0