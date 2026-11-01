
; ASMLog v3.0 - Archivo de idioma espanol
; Mismo orden de IDs que sprog_da.asm
; Encoding: UTF-8

bits 64
default rel

global es_tabel

section .data

es_tabel:
    dq es_menu_title
    dq es_menu_new_qso
    dq es_menu_show_log
    dq es_menu_search_call
    dq es_menu_new_log
    dq es_menu_print_log
    dq es_menu_settings
    dq es_menu_highscore
    dq es_menu_back
	
    ; Configuracion (ID 9-18)
    dq es_settings_title
    dq es_settings_logtype
    dq es_settings_callsign
    dq es_settings_name
    dq es_settings_email
    dq es_settings_address
    dq es_settings_postcode
    dq es_settings_city
    dq es_settings_power
    dq es_settings_back

    ; Menu de concursos (ID 19-26)
    dq es_logtype_title
    dq es_logtype_wpx
    dq es_logtype_hf
    dq es_logtype_arrl_dx
    dq es_logtype_russian_dx
    dq es_logtype_cqww_dx
    dq es_logtype_sac_cw
    dq es_logtype_back

    ; Nueva QSO (ID 27-38)
    dq es_qso_title
    dq es_qso_callsign
    dq es_qso_band
    dq es_qso_mode
    dq es_qso_rst_sent
    dq es_qso_rst_received
    dq es_qso_exchange
    dq es_qso_zone
    dq es_qso_serial
    dq es_qso_points
    dq es_qso_save
    dq es_qso_back

    ; Mostrar registro QSO (ID 39-48)
    dq es_show_log_title
    dq es_show_log_date
    dq es_show_log_time
    dq es_show_log_callsign
    dq es_show_log_band
    dq es_show_log_mode
    dq es_show_log_rst
    dq es_show_log_exchange
    dq es_show_log_points
    dq es_show_log_back

    ; Buscar indicativo (ID 49-54)
    dq es_search_enter_call
    dq es_search_you_entered
    dq es_search_call_prompt
    dq es_search_results
    dq es_search_count
    dq es_search_not_found

    ; Exportar registro (ID 55-60)
    dq es_print_log_title
    dq es_print_log_adif
    dq es_print_log_cabrillo
    dq es_print_log_main_menu
    dq es_print_log_back
    dq es_print_log_choice
	

    ; Menu de modo (ID 61-65)
    dq es_mode_title
    dq es_mode_radio
    dq es_mode_cw
    dq es_mode_cw_text
    dq es_mode_text


    ; Seleccion de idioma (ID 66)
    dq es_language_title


    ; Menu de potencia (ID 67-71)
    dq es_power_title
    dq es_power_qrp
    dq es_power_low
    dq es_power_high
    dq es_power_arrl


    ; Menu WPM (ID 72)
    dq es_wpm_title


    ; Ordenacion de puntuaciones (ID 73-74)
    dq es_highscore_sort_date
    dq es_highscore_sort_real


    ; Eliminar puntuaciones (ID 75-85)
    dq es_highscore_delete_title
    dq es_highscore_delete_wpx
    dq es_highscore_delete_hf
    dq es_highscore_delete_arrl
    dq es_highscore_delete_russian
    dq es_highscore_delete_cqww
    dq es_highscore_delete_sac
    dq es_highscore_delete_all
    dq es_highscore_delete_confirm
    dq es_highscore_delete_done
    dq es_highscore_delete_error


    ; Iniciar nuevo registro (ID 86-87)
    dq es_newlog_warning
    dq es_newlog_prompt


    ; Configuracion - campos adicionales (ID 88-89)
    dq es_settings_arrl_state_prompt
    dq es_settings_wpm_prompt


    ; Configuracion - entrada de datos (ID 90-95)
    dq es_settings_callsign_input
    dq es_settings_name_input
    dq es_settings_email_input
    dq es_settings_address_input
    dq es_settings_zip_input
    dq es_settings_city_input

    ; Configuracion - guardado (ID 96-102)
    dq es_settings_callsign_saved
    dq es_settings_name_saved
    dq es_settings_email_saved
    dq es_settings_address_saved
    dq es_settings_zip_saved
    dq es_settings_city_saved
    dq es_settings_power_saved

    dq es_settings_arrl_power_input

    dq es_cw_time_title
    dq es_cw_time_5_min
    dq es_cw_time_10_min
    dq es_cw_time_15_min
    dq es_cw_time_30_min
    dq es_cw_time_60_min
    dq es_cw_time_choose

    dq es_exit_question
    dq es_exit_message

    dq es_error_invalid_choice
    dq es_error_invalid_band
    dq es_error_invalid_callsign
    dq es_error_callsign_file
    dq es_error_invalid_rst
    dq es_error_invalid_qsonr
    dq es_error_wpx_log_file

    dq es_status_logtype_wpx
    dq es_status_logtype_hf
    dq es_status_logtype_arrl
    dq es_status_logtype_russian
    dq es_status_logtype_cqww
    dq es_status_logtype_sac
    dq es_status_mode_radio
    dq es_status_mode_cw
    dq es_status_mode_cw_text
    dq es_status_mode_text

    dq es_qso_saved_message
    dq es_qso_dupe_warning
    dq es_qso_count_format
    dq es_qso_dupe_count_format
    dq es_qso_points_format
    dq es_qso_sent_text_format

    ; CTY-beskeder (ID 136-137)
    dq es_cty_result_format
    dq es_cty_file_error

    ; HF-beskeder (ID 138-157)
    dq es_hf_call_correct
    dq es_hf_call_wrong
    dq es_hf_rst_correct
    dq es_hf_rst_wrong
    dq es_hf_name_correct
    dq es_hf_name_wrong
    dq es_hf_qth_correct
    dq es_hf_qth_wrong
    dq es_hf_result_header
    dq es_hf_result_qso
    dq es_hf_result_call
    dq es_hf_result_rst
    dq es_hf_result_name
    dq es_hf_result_qth
    dq es_hf_result_total
    dq es_hf_result_wrong
    dq es_hf_result_percent
    dq es_hf_highscore_header
    dq es_hf_highscore_empty
    dq es_hf_log_header

    ; Fælles checkerbeskeder (ID 158-164)
    dq es_checker_band_ok
    dq es_checker_band_error
    dq es_checker_qso_ok
    dq es_checker_qso_error
    dq es_checker_claimed_score
    dq es_checker_real_score
    dq es_checker_highscore_date

    ; Russian DX (ID 165-173)
    dq es_russian_country_mult
    dq es_russian_country_used
    dq es_russian_oblast_mult
    dq es_russian_oblast_used
    dq es_russian_oblast_error
    dq es_russian_log_empty
    dq es_russian_station
    dq es_russian_not_station
    dq es_russian_new_log

    ; CQ WW DX (ID 174-179)
    dq es_cqww_continent_error
    dq es_cqww_continent_prompt
    dq es_cqww_zone_error
    dq es_cqww_zone_prompt
    dq es_cqww_new_log_done
    dq es_cqww_new_log_warning

    ; SAC CW (ID 180-187)
    dq es_sac_new_log_done
    dq es_sac_new_log_prompt
    dq es_sac_scandinavian
    dq es_sac_non_scandinavian
    dq es_sac_serial_prompt
    dq es_sac_serial_error
    dq es_sac_qso_points
    dq es_sac_dupe_message

    ; ARRL DX (ID 188-193)
    dq es_arrl_new_log_done
    dq es_arrl_new_log_prompt
    dq es_arrl_log_empty
    dq es_arrl_multipliers
    dq es_arrl_score
    dq es_arrl_qso_points

    dq es_menu_delete_highscore    ; ID 194

    dq es_settings_arrl_state_menu

    dq es_wpx_highscore_title       ; 196
    dq es_arrl_highscore_title      ; 197
    dq es_russian_highscore_title   ; 198
    dq es_cqww_highscore_title      ; 199
    dq es_sac_highscore_title       ; 200
    dq es_hf_highscore_title        ; 201
    dq es_highscore_sort_date       ; 202
    dq es_highscore_sort_real       ; 203

    dq es_hf_highscore_accuracy    ; 204

    dq es_delete_hs_title       ; 205
    dq es_delete_hs_wpx         ; 206
    dq es_delete_hs_hf          ; 207
    dq es_delete_hs_arrl        ; 208
    dq es_delete_hs_russian     ; 209
    dq es_delete_hs_cqww        ; 210
    dq es_delete_hs_sac         ; 211
    dq es_delete_hs_all         ; 212

    dq es_settings_language     ; 213
	
es_menu_title:
    db "Menu principal", 0

es_menu_new_qso:
    db "Nuevo QSO", 0

es_menu_show_log:
    db "Mostrar registro QSO", 0

es_menu_search_call:
    db "Buscar indicativo", 0

es_menu_new_log:
    db "Iniciar nuevo registro", 0

es_menu_print_log:
    db "Imprimir registro", 0

es_menu_settings:
    db "Configuracion", 0

es_menu_highscore:
    db "Tabla de records", 0

es_menu_back:
    db "Volver", 0





; ==========================================
; Configuracion (ID 9-18)
; ==========================================

es_settings_title:
    db "Configuracion", 0

es_settings_logtype:
    db "Tipo de concurso", 0

es_settings_callsign:
    db "Indicativo", 0

es_settings_name:
    db "Nombre", 0

es_settings_email:
    db "Correo electronico", 0

es_settings_address:
    db "Direccion", 0

es_settings_postcode:
    db "Codigo postal", 0

es_settings_city:
    db "Ciudad", 0

es_settings_power:
    db "Potencia", 0

es_settings_back:
    db "Volver", 0





; ==========================================
; Menu de concursos (ID 19-26)
; ==========================================

es_logtype_title:
    db "Seleccionar tipo de concurso", 0

es_logtype_wpx:
    db "WPX", 0

es_logtype_hf:
    db "HF", 0

es_logtype_arrl_dx:
    db "ARRL DX CW", 0

es_logtype_russian_dx:
    db "Russian DX", 0

es_logtype_cqww_dx:
    db "CQ WW DX CW", 0

es_logtype_sac_cw:
    db "SAC CW", 0

es_logtype_back:
    db "Volver", 0





; ==========================================
; Nueva QSO (ID 27-38)
; ==========================================

es_qso_title:
    db "Nueva QSO", 0

es_qso_callsign:
    db "Indicativo", 0

es_qso_band:
    db "Banda", 0

es_qso_mode:
    db "Modo", 0

es_qso_rst_sent:
    db "RST enviado", 0

es_qso_rst_received:
    db "RST recibido", 0

es_qso_exchange:
    db "Intercambio", 0

es_qso_zone:
    db "Zona", 0

es_qso_serial:
    db "Numero de serie", 0

es_qso_points:
    db "Puntos", 0

es_qso_save:
    db "Guardar QSO", 0

es_qso_back:
    db "Volver", 0





; ==========================================
; Mostrar registro QSO (ID 39-48)
; ==========================================

es_show_log_title:
    db "Mostrar registro QSO", 0

es_show_log_date:
    db "Fecha", 0

es_show_log_time:
    db "Hora", 0

es_show_log_callsign:
    db "Indicativo", 0

es_show_log_band:
    db "Banda", 0

es_show_log_mode:
    db "Modo", 0

es_show_log_rst:
    db "RST", 0

es_show_log_exchange:
    db "Intercambio", 0

es_show_log_points:
    db "Puntos", 0

es_show_log_back:
    db "Volver", 0







; ==========================================
; Buscar indicativo (ID 49-54)
; ==========================================

es_search_enter_call:
    db "Introduzca el indicativo: ", 0

es_search_you_entered:
    db "Ha buscado: %s", 0

es_search_call_prompt:
    db "Indicativo a buscar: ", 0

es_search_results:
    db "QSO encontrados:", 0

es_search_count:
    db "Numero de resultados: %d", 0

es_search_not_found:
    db "No se encontraron QSO.", 0

; ==========================================
; Exportar registro (ID 55-60)
; ==========================================

es_print_log_title:
    db "Exportar registro", 0

es_print_log_adif:
    db "ADIF - HF", 0

es_print_log_cabrillo:
    db "Cabrillo", 0

es_print_log_main_menu:
    db "Menu principal", 0

es_print_log_back:
    db "Volver", 0

es_print_log_choice:
    db "Opcion: ", 0



; ==========================================
; Menu de modo (ID 61-65)
; ==========================================

es_mode_title:
    db "Modo de operacion", 0

es_mode_radio:
    db "RADIO", 0

es_mode_cw:
    db "CW", 0

es_mode_cw_text:
    db "CW + TEXTO", 0

es_mode_text:
    db "TEXTO", 0


; ==========================================
; Seleccion de idioma (ID 66)
; ==========================================

es_language_title:
    db "Seleccionar idioma", 0


; ==========================================
; Menu de potencia (ID 67-71)
; ==========================================

es_power_title:
    db "Potencia", 0

es_power_qrp:
    db "QRP", 0

es_power_low:
    db "LOW", 0

es_power_high:
    db "HIGH", 0

es_power_arrl:
    db "Potencia ARRL", 0


; ==========================================
; Menu WPM (ID 72)
; ==========================================

es_wpm_title:
    db "Velocidad CW (WPM)", 0


; ==========================================
; Ordenacion de puntuaciones (ID 73-74)
; ==========================================

es_highscore_sort_date:
    db "Ordenar por fecha", 0

es_highscore_sort_real:
    db "Ordenar por puntuacion real", 0


; ==========================================
; Eliminar puntuaciones (ID 75-85)
; ==========================================

es_highscore_delete_title:
    db "Eliminar puntuaciones", 0

es_highscore_delete_wpx:
    db "Eliminar puntuaciones WPX", 0

es_highscore_delete_hf:
    db "Eliminar puntuaciones HF", 0

es_highscore_delete_arrl:
    db "Eliminar puntuaciones ARRL DX", 0

es_highscore_delete_russian:
    db "Eliminar puntuaciones Russian DX", 0

es_highscore_delete_cqww:
    db "Eliminar puntuaciones CQ WW DX", 0

es_highscore_delete_sac:
    db "Eliminar puntuaciones SAC CW", 0

es_highscore_delete_all:
    db "Eliminar TODAS las puntuaciones", 0

es_highscore_delete_confirm:
    db "Seguro que desea eliminar las puntuaciones seleccionadas? (S/N): ", 0

es_highscore_delete_done:
    db "Puntuaciones eliminadas.", 0

es_highscore_delete_error:
    db "ERROR: No se pudo vaciar el archivo de puntuaciones.", 0


; ==========================================
; Iniciar nuevo registro (ID 86-87)
; ==========================================

es_newlog_warning:
    db "ADVERTENCIA: Se eliminara todo el registro actual.", 0

es_newlog_prompt:
    db "Iniciar un nuevo registro? (S/N): ", 0


; ==========================================
; Configuracion - campos adicionales (ID 88-89)
; ==========================================

es_settings_arrl_state_prompt:
    db "Introduzca el estado/provincia ARRL (p. ej. ON o NY): ", 0

es_settings_wpm_prompt:
    db "WPM (p. ej. 10, 15, 20, 25): ", 0


; ==========================================
; Configuracion - entrada de datos (ID 90-95)
; ==========================================

es_settings_callsign_input:
    db "Introduzca el indicativo: ", 0

es_settings_name_input:
    db "Introduzca el nombre: ", 0

es_settings_email_input:
    db "Introduzca el correo electronico: ", 0

es_settings_address_input:
    db "Introduzca la direccion: ", 0

es_settings_zip_input:
    db "Introduzca el codigo postal: ", 0

es_settings_city_input:
    db "Introduzca la ciudad: ", 0

; ==========================================
; Configuracion - guardado (ID 96-102)
; ==========================================

es_settings_callsign_saved:
    db "Indicativo guardado.", 10, 0

es_settings_name_saved:
    db "Nombre guardado.", 10, 0

es_settings_email_saved:
    db "Correo electronico guardado.", 10, 0

es_settings_address_saved:
    db "Direccion guardada.", 10, 0

es_settings_zip_saved:
    db "Codigo postal guardado.", 10, 0

es_settings_city_saved:
    db "Ciudad guardada.", 10, 0

es_settings_power_saved:
    db "Potencia guardada.", 10, 0

es_settings_arrl_power_input:
    db "Introduzca la potencia ARRL en vatios: ", 0
	
es_cw_time_title:
    db "=== Tiempo de entrenamiento CW ===", 0

es_cw_time_5_min:
    db "1.  5 minutos", 0

es_cw_time_10_min:
    db "2. 10 minutos", 0

es_cw_time_15_min:
    db "3. 15 minutos", 0

es_cw_time_30_min:
    db "4. 30 minutos", 0

es_cw_time_60_min:
    db "5. 60 minutos", 0

es_cw_time_choose:
    db "Seleccione el tiempo de entrenamiento: ", 0
	
es_exit_question:
    db "Desea salir del programa? (S/N): ", 0

es_exit_message:
    db "ASMLog se esta cerrando.", 0
	
es_error_invalid_choice:
    db "Opcion no valida.", 0

es_error_invalid_band:
    db "Banda WPX no valida. Use 160m, 80m, 40m, 20m, 15m o 10m.", 0

es_error_invalid_callsign:
    db "Indicativo no valido - debe contener una letra y un numero.", 0

es_error_callsign_file:
    db "ERROR: Falta el archivo de indicativos o esta vacio.", 0

es_error_invalid_rst:
    db "El RST debe contener exactamente tres digitos, por ejemplo 599.", 0

es_error_invalid_qsonr:
    db "QSONR debe contener como maximo 5 digitos.", 0

es_error_wpx_log_file:
    db "No se pudo abrir wpx_log.txt", 0
	
es_status_logtype_wpx:
    db "Tipo de registro seleccionado: WPX", 0

es_status_logtype_hf:
    db "Tipo de registro seleccionado: HF", 0

es_status_logtype_arrl:
    db "Tipo de registro seleccionado: ARRL DX CW", 0

es_status_logtype_russian:
    db "Tipo de registro seleccionado: Russian DX", 0

es_status_logtype_cqww:
    db "Tipo de registro seleccionado: CQ WW DX CW", 0

es_status_logtype_sac:
    db "Tipo de registro seleccionado: SAC CW", 0

es_status_mode_radio:
    db "Modo QSO seleccionado: RADIO", 0

es_status_mode_cw:
    db "Modo QSO seleccionado: CW", 0

es_status_mode_cw_text:
    db "Modo QSO seleccionado: CW + TEXT", 0

es_status_mode_text:
    db "Modo QSO seleccionado: TEXT", 0
	
es_qso_saved_message:
    db "QSO guardado.", 0

es_qso_dupe_warning:
    db "ADVERTENCIA: El indicativo ya esta registrado en esta banda.", 0

es_qso_count_format:
    db "Numero de QSO: %d", 0

es_qso_dupe_count_format:
    db "Numero de DUPES: %d", 0

es_qso_points_format:
    db "Puntos QSO: %d", 0

es_qso_sent_text_format:
    db "Enviado: %s", 0
	
; ==========================================
; CTY-beskeder (ID 136-137)
; ==========================================

es_cty_result_format:
    db "CTY encontrado: %s / %s", 0

es_cty_file_error:
    db "ERROR: No se pudo abrir cty.dat.", 0
	
; ==========================================
; Mensajes HF (ID 138-157)
; ==========================================

es_hf_call_correct:
    db "CALL: CORRECTO", 0

es_hf_call_wrong:
    db "CALL: INCORRECTO", 0

es_hf_rst_correct:
    db "RST: CORRECTO", 0

es_hf_rst_wrong:
    db "RST: INCORRECTO", 0

es_hf_name_correct:
    db "NAME: CORRECTO", 0

es_hf_name_wrong:
    db "NAME: INCORRECTO", 0

es_hf_qth_correct:
    db "QTH: CORRECTO", 0

es_hf_qth_wrong:
    db "QTH: INCORRECTO", 0

es_hf_result_header:
    db "===== RESULTADOS DEL ENTRENAMIENTO HF =====", 0

es_hf_result_qso:
    db "QSO comprobados: %u", 0

es_hf_result_call:
    db "CALL correctos: %u", 0

es_hf_result_rst:
    db "RST correctos: %u", 0

es_hf_result_name:
    db "NAME correctos: %u", 0

es_hf_result_qth:
    db "QTH correctos: %u", 0

es_hf_result_total:
    db "Campos correctos: %u / %u", 0

es_hf_result_wrong:
    db "Campos incorrectos: %u", 0

es_hf_result_percent:
    db "Precision: %u.%02u %%", 0

es_hf_highscore_header:
    db "=== Clasificacion HF CW ===", 0

es_hf_highscore_empty:
    db "Todavia no hay puntuaciones HF CW.", 0

es_hf_log_header:
    db "=== Registro de QSO HF ===", 0
	
; ==========================================
; Mensajes comunes del verificador (ID 158-164)
; ==========================================

es_checker_band_ok:
    db "BANDA CORRECTA", 0

es_checker_band_error:
    db "ERROR DE BANDA", 0

es_checker_qso_ok:
    db "QSO CORRECTO", 0

es_checker_qso_error:
    db "ERROR DE QSO", 0

es_checker_claimed_score:
    db "PUNTUACION DECLARADA: ", 0

es_checker_real_score:
    db "PUNTUACION REAL: %d", 0

es_checker_highscore_date:
    db "FECHA DEL RECORD: %s", 0
	
; ==========================================
; Mensajes Russian DX (ID 165-173)
; ==========================================

es_russian_country_mult:
    db "Nuevo multiplicador de pais: %s en %s", 0

es_russian_country_used:
    db "Multiplicador de pais ya contabilizado: %s", 0

es_russian_oblast_mult:
    db "Nuevo multiplicador de oblast: %s en %s", 0

es_russian_oblast_used:
    db "Multiplicador de oblast ya contabilizado: %s", 0

es_russian_oblast_error:
    db "Codigo de oblast no valido.", 0

es_russian_log_empty:
    db "No hay QSO en el registro Russian DX.", 0

es_russian_station:
    db "Estacion rusa.", 0

es_russian_not_station:
    db "Estacion no rusa.", 0

es_russian_new_log:
    db "Nuevo registro Russian DX iniciado.", 0
	
; ==========================================
; Mensajes CQ WW DX (ID 174-179)
; ==========================================

es_cqww_continent_error:
    db "Continente no valido. Use EU, AF, AS, NA, SA u OC.", 0

es_cqww_continent_prompt:
    db "Continente (EU/AF/AS/NA/SA/OC): ", 0

es_cqww_zone_error:
    db "Zona CQ no valida. Use valores de 1-40.", 0

es_cqww_zone_prompt:
    db "Zona CQ: ", 0

es_cqww_new_log_done:
    db "Nuevo registro CQ WW iniciado.", 0

es_cqww_new_log_warning:
    db "ADVERTENCIA: Se eliminara todo el registro CQ WW actual.", 0
	
; ==========================================
; Mensajes SAC CW (ID 180-187)
; ==========================================

es_sac_new_log_done:
    db "Nuevo registro SAC iniciado.", 0

es_sac_new_log_prompt:
    db "Iniciar un nuevo registro? (S/N): ", 0

es_sac_scandinavian:
    db "SAC: Estacion escandinava", 0

es_sac_non_scandinavian:
    db "SAC: Estacion no escandinava", 0

es_sac_serial_prompt:
    db "Numero de serie: ", 0

es_sac_serial_error:
    db "Numero de serie no valido. Solo digitos, minimo 1.", 0

es_sac_qso_points:
    db "Puntos QSO: %d", 0

es_sac_dupe_message:
    db "DUPE - indicativo ya registrado en esta banda.", 0
	
; ==========================================
; Mensajes ARRL DX (ID 188-193)
; ==========================================

es_arrl_new_log_done:
    db "Nuevo registro ARRL DX iniciado.", 0

es_arrl_new_log_prompt:
    db "Iniciar un nuevo registro ARRL DX? (S/N): ", 0

es_arrl_log_empty:
    db "No hay QSO en el registro ARRL DX.", 0

es_arrl_multipliers:
    db "Multiplicadores ARRL: %d", 0

es_arrl_score:
    db "Puntuacion ARRL: %d", 0

es_arrl_qso_points:
    db "Puntos QSO: %d", 0
	
es_menu_delete_highscore db "Eliminar puntuaciones", 0

es_settings_arrl_state_menu:
    db "Estado/provincia ARRL", 0
	
es_wpx_highscore_title       db "=== WPX Highscore ===",0
es_arrl_highscore_title      db "=== ARRL DX Highscore ===",0
es_russian_highscore_title   db "=== Russian DX Highscore ===",0
es_cqww_highscore_title      db "=== CQ WW DX Highscore ===",0
es_sac_highscore_title       db "=== SAC CW Highscore ===",0
es_hf_highscore_title        db "=== HF CW Highscore ===",0

es_hf_highscore_accuracy db "Mostrar por precisión",0

es_delete_hs_title   db "=== ELIMINAR RECORDS ===",0
es_delete_hs_wpx     db "Eliminar records de WPX",0
es_delete_hs_hf      db "Eliminar records de HF",0
es_delete_hs_arrl    db "Eliminar records de ARRL DX",0
es_delete_hs_russian db "Eliminar records de Russian DX",0
es_delete_hs_cqww    db "Eliminar records de CQ WW DX",0
es_delete_hs_sac     db "Eliminar records de SAC CW",0
es_delete_hs_all     db "Eliminar TODOS los records",0
es_settings_language:
    db "Idioma", 0