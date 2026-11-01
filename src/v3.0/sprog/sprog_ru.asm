
; ASMLog v3.0 - Russian language file
; Same text ID order as sprog_da.asm
; Encoding: UTF-8

bits 64
default rel

global ru_tabel

section .data

ru_tabel:
    dq ru_menu_title
    dq ru_menu_new_qso
    dq ru_menu_show_log
    dq ru_menu_search_call
    dq ru_menu_new_log
    dq ru_menu_print_log
    dq ru_menu_settings
    dq ru_menu_highscore
    dq ru_menu_back
	
	    ; Настройки (ID 9-18)
    dq ru_settings_title
    dq ru_settings_logtype
    dq ru_settings_callsign
    dq ru_settings_name
    dq ru_settings_email
    dq ru_settings_address
    dq ru_settings_postcode
    dq ru_settings_city
    dq ru_settings_power
    dq ru_settings_back

    ; Logtype-menu (ID 19-26)
    dq ru_logtype_title
    dq ru_logtype_wpx
    dq ru_logtype_hf
    dq ru_logtype_arrl_dx
    dq ru_logtype_russian_dx
    dq ru_logtype_cqww_dx
    dq ru_logtype_sac_cw
    dq ru_logtype_back

    ; Новая QSO (ID 27-38)
    dq ru_qso_title
    dq ru_qso_callsign
    dq ru_qso_band
    dq ru_qso_mode
    dq ru_qso_rst_sent
    dq ru_qso_rst_received
    dq ru_qso_exchange
    dq ru_qso_zone
    dq ru_qso_serial
    dq ru_qso_points
    dq ru_qso_save
    dq ru_qso_back

    ; Просмотр журнала QSO (ID 39-48)
    dq ru_show_log_title
    dq ru_show_log_date
    dq ru_show_log_time
    dq ru_show_log_callsign
    dq ru_show_log_band
    dq ru_show_log_mode
    dq ru_show_log_rst
    dq ru_show_log_exchange
    dq ru_show_log_points
    dq ru_show_log_back

    ; Поиск позывного (ID 49-54)
    dq ru_search_enter_call
    dq ru_search_you_entered
    dq ru_search_call_prompt
    dq ru_search_results
    dq ru_search_count
    dq ru_search_not_found

    ; Экспорт журнала (ID 55-60)
    dq ru_print_log_title
    dq ru_print_log_adif
    dq ru_print_log_cabrillo
    dq ru_print_log_main_menu
    dq ru_print_log_back
    dq ru_print_log_choice



    ; Mode-menu (ID 61-65)
    dq ru_mode_title
    dq ru_mode_radio
    dq ru_mode_cw
    dq ru_mode_cw_text
    dq ru_mode_text


    ; Sprogvalg (ID 66)
    dq ru_language_title


    ; Power-menu (ID 67-71)
    dq ru_power_title
    dq ru_power_qrp
    dq ru_power_low
    dq ru_power_high
    dq ru_power_arrl


    ; WPM-menu (ID 72)
    dq ru_wpm_title


    ; Сортировка рекордов (ID 73-74)
    dq ru_highscore_sort_date
    dq ru_highscore_sort_real


    ; Удаление рекордов (ID 75-85)
    dq ru_highscore_delete_title
    dq ru_highscore_delete_wpx
    dq ru_highscore_delete_hf
    dq ru_highscore_delete_arrl
    dq ru_highscore_delete_russian
    dq ru_highscore_delete_cqww
    dq ru_highscore_delete_sac
    dq ru_highscore_delete_all
    dq ru_highscore_delete_confirm
    dq ru_highscore_delete_done
    dq ru_highscore_delete_error


    ; Создание нового журнала (ID 86-87)
    dq ru_newlog_warning
    dq ru_newlog_prompt


    ; Настройки - дополнительные поля (ID 88-89)
    dq ru_settings_arrl_state_prompt
    dq ru_settings_wpm_prompt


    ; Настройки - ввод данных (ID 90-95)
    dq ru_settings_callsign_input
    dq ru_settings_name_input
    dq ru_settings_email_input
    dq ru_settings_address_input
    dq ru_settings_zip_input
    dq ru_settings_city_input

    ; Настройки - сохранено (ID 96-102)
    dq ru_settings_callsign_saved
    dq ru_settings_name_saved
    dq ru_settings_email_saved
    dq ru_settings_address_saved
    dq ru_settings_zip_saved
    dq ru_settings_city_saved
    dq ru_settings_power_saved

    dq ru_settings_arrl_power_input

    dq ru_cw_time_title
    dq ru_cw_time_5_min
    dq ru_cw_time_10_min
    dq ru_cw_time_15_min
    dq ru_cw_time_30_min
    dq ru_cw_time_60_min
    dq ru_cw_time_choose

    dq ru_exit_question
    dq ru_exit_message

    dq ru_error_invalid_choice
    dq ru_error_invalid_band
    dq ru_error_invalid_callsign
    dq ru_error_callsign_file
    dq ru_error_invalid_rst
    dq ru_error_invalid_qsonr
    dq ru_error_wpx_log_file

    dq ru_status_logtype_wpx
    dq ru_status_logtype_hf
    dq ru_status_logtype_arrl
    dq ru_status_logtype_russian
    dq ru_status_logtype_cqww
    dq ru_status_logtype_sac
    dq ru_status_mode_radio
    dq ru_status_mode_cw
    dq ru_status_mode_cw_text
    dq ru_status_mode_text

    dq ru_qso_saved_message
    dq ru_qso_dupe_warning
    dq ru_qso_count_format
    dq ru_qso_dupe_count_format
    dq ru_qso_points_format
    dq ru_qso_sent_text_format

    ; CTY-beskeder (ID 136-137)
    dq ru_cty_result_format
    dq ru_cty_file_error

    ; HF-beskeder (ID 138-157)
    dq ru_hf_call_correct
    dq ru_hf_call_wrong
    dq ru_hf_rst_correct
    dq ru_hf_rst_wrong
    dq ru_hf_name_correct
    dq ru_hf_name_wrong
    dq ru_hf_qth_correct
    dq ru_hf_qth_wrong
    dq ru_hf_result_header
    dq ru_hf_result_qso
    dq ru_hf_result_call
    dq ru_hf_result_rst
    dq ru_hf_result_name
    dq ru_hf_result_qth
    dq ru_hf_result_total
    dq ru_hf_result_wrong
    dq ru_hf_result_percent
    dq ru_hf_highscore_header
    dq ru_hf_highscore_empty
    dq ru_hf_log_header

    ; Fælles checkerbeskeder (ID 158-164)
    dq ru_checker_band_ok
    dq ru_checker_band_error
    dq ru_checker_qso_ok
    dq ru_checker_qso_error
    dq ru_checker_claimed_score
    dq ru_checker_real_score
    dq ru_checker_highscore_date

    ; Russian DX (ID 165-173)
    dq ru_russian_country_mult
    dq ru_russian_country_used
    dq ru_russian_oblast_mult
    dq ru_russian_oblast_used
    dq ru_russian_oblast_error
    dq ru_russian_log_empty
    dq ru_russian_station
    dq ru_russian_not_station
    dq ru_russian_new_log

    ; CQ WW DX (ID 174-179)
    dq ru_cqww_continent_error
    dq ru_cqww_continent_prompt
    dq ru_cqww_zone_error
    dq ru_cqww_zone_prompt
    dq ru_cqww_new_log_done
    dq ru_cqww_new_log_warning

    ; SAC CW (ID 180-187)
    dq ru_sac_new_log_done
    dq ru_sac_new_log_prompt
    dq ru_sac_scandinavian
    dq ru_sac_non_scandinavian
    dq ru_sac_serial_prompt
    dq ru_sac_serial_error
    dq ru_sac_qso_points
    dq ru_sac_dupe_message

    ; ARRL DX (ID 188-193)
    dq ru_arrl_new_log_done
    dq ru_arrl_new_log_prompt
    dq ru_arrl_log_empty
    dq ru_arrl_multipliers
    dq ru_arrl_score
    dq ru_arrl_qso_points

    dq ru_menu_delete_highscore    ; ID 194

    dq ru_settings_arrl_state_menu

    dq ru_wpx_highscore_title       ; 196
    dq ru_arrl_highscore_title      ; 197
    dq ru_russian_highscore_title   ; 198
    dq ru_cqww_highscore_title      ; 199
    dq ru_sac_highscore_title       ; 200
    dq ru_hf_highscore_title        ; 201
    dq ru_highscore_sort_date       ; 202
    dq ru_highscore_sort_real       ; 203

    dq ru_hf_highscore_accuracy    ; 204

    dq ru_delete_hs_title       ; 205
    dq ru_delete_hs_wpx         ; 206
    dq ru_delete_hs_hf          ; 207
    dq ru_delete_hs_arrl        ; 208
    dq ru_delete_hs_russian     ; 209
    dq ru_delete_hs_cqww        ; 210
    dq ru_delete_hs_sac         ; 211
    dq ru_delete_hs_all         ; 212

    dq ru_settings_language     ; 213
	
ru_menu_title:
    db "Главное меню", 0

ru_menu_new_qso:
    db "Новое QSO", 0

ru_menu_show_log:
    db "Показать журнал QSO", 0

ru_menu_search_call:
    db "Поиск позывного", 0

ru_menu_new_log:
    db "Начать новый журнал", 0

ru_menu_print_log:
    db "Печать журнала", 0

ru_menu_settings:
    db "Настройки", 0

ru_menu_highscore:
    db "Таблица рекордов", 0

ru_menu_back:
    db "Назад", 0






; ==========================================
; Настройки (ID 9-18)
; ==========================================

ru_settings_title:
    db "Настройки", 0

ru_settings_logtype:
    db "Тип соревнования", 0

ru_settings_callsign:
    db "Позывной", 0

ru_settings_name:
    db "Имя", 0

ru_settings_email:
    db "Электронная почта", 0

ru_settings_address:
    db "Адрес", 0

ru_settings_postcode:
    db "Почтовый индекс", 0

ru_settings_city:
    db "Город", 0

ru_settings_power:
    db "Мощность", 0

ru_settings_back:
    db "Назад", 0




; ==========================================
; Logtype-menu (ID 19-26)
; ==========================================

ru_logtype_title:
    db "Выберите тип соревнования", 0

ru_logtype_wpx:
    db "WPX", 0

ru_logtype_hf:
    db "HF", 0

ru_logtype_arrl_dx:
    db "ARRL DX CW", 0

ru_logtype_russian_dx:
    db "Russian DX", 0

ru_logtype_cqww_dx:
    db "CQ WW DX CW", 0

ru_logtype_sac_cw:
    db "SAC CW", 0

ru_logtype_back:
    db "Назад", 0





; ==========================================
; Новая QSO (ID 27-38)
; ==========================================

ru_qso_title:
    db "Новое QSO", 0

ru_qso_callsign:
    db "Позывной", 0

ru_qso_band:
    db "Диапазон", 0

ru_qso_mode:
    db "Вид работы", 0

ru_qso_rst_sent:
    db "Переданный RST", 0

ru_qso_rst_received:
    db "Принятый RST", 0

ru_qso_exchange:
    db "Контрольный номер", 0

ru_qso_zone:
    db "Зона", 0

ru_qso_serial:
    db "Порядковый номер", 0

ru_qso_points:
    db "Очки", 0

ru_qso_save:
    db "Сохранить QSO", 0

ru_qso_back:
    db "Назад", 0





; ==========================================
; Просмотр журнала QSO (ID 39-48)
; ==========================================

ru_show_log_title:
    db "Просмотр журнала QSO", 0

ru_show_log_date:
    db "Дата", 0

ru_show_log_time:
    db "Время", 0

ru_show_log_callsign:
    db "Позывной", 0

ru_show_log_band:
    db "Диапазон", 0

ru_show_log_mode:
    db "Вид работы", 0

ru_show_log_rst:
    db "RST", 0

ru_show_log_exchange:
    db "Контрольный номер", 0

ru_show_log_points:
    db "Очки", 0

ru_show_log_back:
    db "Назад", 0







; ==========================================
; Поиск позывного (ID 49-54)
; ==========================================

ru_search_enter_call:
    db "Введите позывной: ", 0

ru_search_you_entered:
    db "Вы искали: %s", 0

ru_search_call_prompt:
    db "Позывной для поиска: ", 0

ru_search_results:
    db "Найденные QSO:", 0

ru_search_count:
    db "Количество совпадений: %d", 0

ru_search_not_found:
    db "QSO не найдены.", 0

; ==========================================
; Экспорт журнала (ID 55-60)
; ==========================================

ru_print_log_title:
    db "Экспорт журнала", 0

ru_print_log_adif:
    db "ADIF - HF", 0

ru_print_log_cabrillo:
    db "Cabrillo", 0

ru_print_log_main_menu:
    db "Главное меню", 0

ru_print_log_back:
    db "Назад", 0

ru_print_log_choice:
    db "Выбор: ", 0



; ==========================================
; Mode-menu (ID 61-65)
; ==========================================

ru_mode_title:
    db "Режим работы", 0

ru_mode_radio:
    db "РАДИО", 0

ru_mode_cw:
    db "CW", 0

ru_mode_cw_text:
    db "CW + ТЕКСТ", 0

ru_mode_text:
    db "ТЕКСТ", 0


; ==========================================
; Sprogvalg (ID 66)
; ==========================================

ru_language_title:
    db "Выбор языка", 0


; ==========================================
; Power-menu (ID 67-71)
; ==========================================

ru_power_title:
    db "Мощность", 0

ru_power_qrp:
    db "QRP", 0

ru_power_low:
    db "LOW", 0

ru_power_high:
    db "HIGH", 0

ru_power_arrl:
    db "Мощность ARRL", 0


; ==========================================
; WPM-menu (ID 72)
; ==========================================

ru_wpm_title:
    db "Скорость CW (WPM)", 0


; ==========================================
; Сортировка рекордов (ID 73-74)
; ==========================================

ru_highscore_sort_date:
    db "Сортировать по дате", 0

ru_highscore_sort_real:
    db "Сортировать по реальному счёту", 0


; ==========================================
; Удаление рекордов (ID 75-85)
; ==========================================

ru_highscore_delete_title:
    db "Удалить рекорды", 0

ru_highscore_delete_wpx:
    db "Удалить рекорды WPX", 0

ru_highscore_delete_hf:
    db "Удалить рекорды HF", 0

ru_highscore_delete_arrl:
    db "Удалить рекорды ARRL DX", 0

ru_highscore_delete_russian:
    db "Удалить рекорды Russian DX", 0

ru_highscore_delete_cqww:
    db "Удалить рекорды CQ WW DX", 0

ru_highscore_delete_sac:
    db "Удалить рекорды SAC CW", 0

ru_highscore_delete_all:
    db "Удалить ВСЕ рекорды", 0

ru_highscore_delete_confirm:
    db "Вы уверены, что хотите удалить выбранные рекорды? (Y/N): ", 0

ru_highscore_delete_done:
    db "Рекорды удалены.", 0

ru_highscore_delete_error:
    db "ОШИБКА: Не удалось очистить файл рекордов.", 0


; ==========================================
; Создание нового журнала (ID 86-87)
; ==========================================

ru_newlog_warning:
    db "ПРЕДУПРЕЖДЕНИЕ: Весь текущий журнал будет удалён.", 0

ru_newlog_prompt:
    db "Начать новый журнал? (Y/N): ", 0


; ==========================================
; Настройки - дополнительные поля (ID 88-89)
; ==========================================

ru_settings_arrl_state_prompt:
    db "Введите штат/провинцию ARRL (например, ON или NY): ", 0

ru_settings_wpm_prompt:
    db "Скорость CW (WPM), например 10, 15, 20, 25: ", 0


; ==========================================
; Настройки - ввод данных (ID 90-95)
; ==========================================

ru_settings_callsign_input:
    db "Введите позывной: ", 0

ru_settings_name_input:
    db "Введите имя: ", 0

ru_settings_email_input:
    db "Введите адрес электронной почты: ", 0

ru_settings_address_input:
    db "Введите адрес: ", 0

ru_settings_zip_input:
    db "Введите почтовый индекс: ", 0

ru_settings_city_input:
    db "Введите город: ", 0

; ==========================================
; Настройки - сохранено (ID 96-102)
; ==========================================

ru_settings_callsign_saved:
    db "Позывной сохранён.", 10, 0

ru_settings_name_saved:
    db "Имя сохранено.", 10, 0

ru_settings_email_saved:
    db "Адрес электронной почты сохранён.", 10, 0

ru_settings_address_saved:
    db "Адрес сохранён.", 10, 0

ru_settings_zip_saved:
    db "Почтовый индекс сохранён.", 10, 0

ru_settings_city_saved:
    db "Город сохранён.", 10, 0

ru_settings_power_saved:
    db "Мощность передатчика сохранена.", 10, 0

ru_settings_arrl_power_input:
    db "Введите мощность ARRL в ваттах: ", 0
	
ru_cw_time_title:
    db "=== Время тренировки CW ===", 0

ru_cw_time_5_min:
    db "1.  5 минут", 0

ru_cw_time_10_min:
    db "2. 10 минут", 0

ru_cw_time_15_min:
    db "3. 15 минут", 0

ru_cw_time_30_min:
    db "4. 30 минут", 0

ru_cw_time_60_min:
    db "5. 60 минут", 0

ru_cw_time_choose:
    db "Выберите время тренировки: ", 0
	
ru_exit_question:
    db "Вы хотите выйти из программы? (Y/N): ", 0

ru_exit_message:
    db "Завершение работы ASMLog.", 0
	
ru_error_invalid_choice:
    db "Неверный выбор.", 0

ru_error_invalid_band:
    db "Недопустимый диапазон WPX. Используйте 160m, 80m, 40m, 20m, 15m или 10m.", 0

ru_error_invalid_callsign:
    db "Недопустимый позывной - должен содержать букву и цифру.", 0

ru_error_callsign_file:
    db "ОШИБКА: Файл позывных отсутствует или пуст.", 0

ru_error_invalid_rst:
    db "RST должен содержать ровно три цифры, например 599.", 0

ru_error_invalid_qsonr:
    db "QSONR должен содержать не более 5 цифр.", 0

ru_error_wpx_log_file:
    db "Не удалось открыть wpx_log.txt", 0
	
ru_status_logtype_wpx:
    db "Выбранный тип журнала: WPX", 0

ru_status_logtype_hf:
    db "Выбранный тип журнала: HF", 0

ru_status_logtype_arrl:
    db "Выбранный тип журнала: ARRL DX CW", 0

ru_status_logtype_russian:
    db "Выбранный тип журнала: Russian DX", 0

ru_status_logtype_cqww:
    db "Выбранный тип журнала: CQ WW DX CW", 0

ru_status_logtype_sac:
    db "Выбранный тип журнала: SAC CW", 0

ru_status_mode_radio:
    db "Выбранный режим QSO: RADIO", 0

ru_status_mode_cw:
    db "Выбранный режим QSO: CW", 0

ru_status_mode_cw_text:
    db "Выбранный режим QSO: CW + TEXT", 0

ru_status_mode_text:
    db "Выбранный режим QSO: TEXT", 0

ru_qso_saved_message:
    db "QSO сохранено.", 0

ru_qso_dupe_warning:
    db "ВНИМАНИЕ: Позывной уже записан на этом диапазоне.", 0

ru_qso_count_format:
    db "Количество QSO: %d", 0

ru_qso_dupe_count_format:
    db "Количество повторных QSO: %d", 0

ru_qso_points_format:
    db "Очки за QSO: %d", 0

ru_qso_sent_text_format:
    db "Передано: %s", 0
; ==========================================
; CTY-beskeder (ID 136-137)
; ==========================================

ru_cty_result_format:
    db "CTY найдено: %s / %s", 0

ru_cty_file_error:
    db "ОШИБКА: Не удалось открыть cty.dat.", 0	
	
; ==========================================
; HF-beskeder (ID 138-157)
; ==========================================

ru_hf_call_correct:
    db "CALL: ВЕРНО", 0

ru_hf_call_wrong:
    db "CALL: НЕВЕРНО", 0

ru_hf_rst_correct:
    db "RST: ВЕРНО", 0

ru_hf_rst_wrong:
    db "RST: НЕВЕРНО", 0

ru_hf_name_correct:
    db "NAME: ВЕРНО", 0

ru_hf_name_wrong:
    db "NAME: НЕВЕРНО", 0

ru_hf_qth_correct:
    db "QTH: ВЕРНО", 0

ru_hf_qth_wrong:
    db "QTH: НЕВЕРНО", 0

ru_hf_result_header:
    db "===== РЕЗУЛЬТАТЫ HF-ТРЕНИРОВКИ =====", 0

ru_hf_result_qso:
    db "Проверено QSO: %u", 0

ru_hf_result_call:
    db "Верных CALL: %u", 0

ru_hf_result_rst:
    db "Верных RST: %u", 0

ru_hf_result_name:
    db "Верных NAME: %u", 0

ru_hf_result_qth:
    db "Верных QTH: %u", 0

ru_hf_result_total:
    db "Верных полей: %u / %u", 0

ru_hf_result_wrong:
    db "Неверных полей: %u", 0

ru_hf_result_percent:
    db "Точность: %u.%02u %%", 0

ru_hf_highscore_header:
    db "=== Рекорды HF CW ===", 0

ru_hf_highscore_empty:
    db "Рекордов HF CW пока нет.", 0

ru_hf_log_header:
    db "=== Журнал HF QSO ===", 0
	
; ==========================================
; Общие сообщения проверки (ID 158-164)
; ==========================================

ru_checker_band_ok:
    db "ДИАПАЗОН: ВЕРНО", 0

ru_checker_band_error:
    db "ДИАПАЗОН: ОШИБКА", 0

ru_checker_qso_ok:
    db "QSO: ВЕРНО", 0

ru_checker_qso_error:
    db "QSO: ОШИБКА", 0

ru_checker_claimed_score:
    db "ЗАЯВЛЕННЫЕ ОЧКИ: ", 0

ru_checker_real_score:
    db "ФАКТИЧЕСКИЕ ОЧКИ: %d", 0

ru_checker_highscore_date:
    db "ДАТА РЕКОРДА: %s", 0
	
; ==========================================
; Сообщения Russian DX (ID 165-173)
; ==========================================

ru_russian_country_mult:
    db "Новый множитель по стране: %s на %s", 0

ru_russian_country_used:
    db "Множитель по стране уже учтён: %s", 0

ru_russian_oblast_mult:
    db "Новый множитель по области: %s на %s", 0

ru_russian_oblast_used:
    db "Множитель по области уже учтён: %s", 0

ru_russian_oblast_error:
    db "Неверный код области.", 0

ru_russian_log_empty:
    db "В журнале Russian DX нет QSO.", 0

ru_russian_station:
    db "Российская радиостанция.", 0

ru_russian_not_station:
    db "Иностранная радиостанция.", 0

ru_russian_new_log:
    db "Создан новый журнал Russian DX.", 0
	
; ==========================================
; Сообщения CQ WW DX (ID 174-179)
; ==========================================

ru_cqww_continent_error:
    db "Неверный континент. Используйте EU, AF, AS, NA, SA или OC.", 0

ru_cqww_continent_prompt:
    db "Континент (EU/AF/AS/NA/SA/OC): ", 0

ru_cqww_zone_error:
    db "Неверная зона CQ. Допустимые значения: 1-40.", 0

ru_cqww_zone_prompt:
    db "Зона CQ: ", 0

ru_cqww_new_log_done:
    db "Создан новый журнал CQ WW.", 0

ru_cqww_new_log_warning:
    db "ВНИМАНИЕ: Весь текущий журнал CQ WW будет удалён.", 0
	
; ==========================================
; Сообщения SAC CW (ID 180-187)
; ==========================================

ru_sac_new_log_done:
    db "Создан новый журнал SAC.", 0

ru_sac_new_log_prompt:
    db "Начать новый журнал? (Д/Н): ", 0

ru_sac_scandinavian:
    db "SAC: Скандинавская радиостанция", 0

ru_sac_non_scandinavian:
    db "SAC: Не скандинавская радиостанция", 0

ru_sac_serial_prompt:
    db "Порядковый номер: ", 0

ru_sac_serial_error:
    db "Неверный номер. Используйте только цифры, минимум 1.", 0

ru_sac_qso_points:
    db "Очки за QSO: %d", 0

ru_sac_dupe_message:
    db "DUPE - позывной уже записан на этом диапазоне.", 0
	
; ==========================================
; Сообщения ARRL DX (ID 188-193)
; ==========================================

ru_arrl_new_log_done:
    db "Создан новый журнал ARRL DX.", 0

ru_arrl_new_log_prompt:
    db "Начать новый журнал ARRL DX? (Д/Н): ", 0

ru_arrl_log_empty:
    db "В журнале ARRL DX нет QSO.", 0

ru_arrl_multipliers:
    db "Множители ARRL: %d", 0

ru_arrl_score:
    db "Очки ARRL: %d", 0

ru_arrl_qso_points:
    db "Очки за QSO: %d", 0
	
ru_menu_delete_highscore db "Удалить рекорды", 0
ru_settings_arrl_state_menu:
    db "Штат/провинция ARRL", 0
	
ru_wpx_highscore_title       db "=== WPX Highscore ===",0
ru_arrl_highscore_title      db "=== ARRL DX Highscore ===",0
ru_russian_highscore_title   db "=== Russian DX Highscore ===",0
ru_cqww_highscore_title      db "=== CQ WW DX Highscore ===",0
ru_sac_highscore_title       db "=== SAC CW Highscore ===",0
ru_hf_highscore_title        db "=== HF CW Highscore ===",0

ru_hf_highscore_accuracy db "Показать по точности",0
ru_delete_hs_title   db "=== УДАЛЕНИЕ РЕКОРДОВ ===",0
ru_delete_hs_wpx     db "Удалить рекорды WPX",0
ru_delete_hs_hf      db "Удалить рекорды HF",0
ru_delete_hs_arrl    db "Удалить рекорды ARRL DX",0
ru_delete_hs_russian db "Удалить рекорды Russian DX",0
ru_delete_hs_cqww    db "Удалить рекорды CQ WW DX",0
ru_delete_hs_sac     db "Удалить рекорды SAC CW",0
ru_delete_hs_all     db "Удалить ВСЕ рекорды",0
ru_settings_language:
    db "Язык", 0