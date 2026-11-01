
; ASMLog v3.0 - Fichier de langue francaise
; Meme ordre des ID que sprog_da.asm
; Encoding: UTF-8

bits 64
default rel

global fr_tabel

section .data

fr_tabel:
    dq fr_menu_title
    dq fr_menu_new_qso
    dq fr_menu_show_log
    dq fr_menu_search_call
    dq fr_menu_new_log
    dq fr_menu_print_log
    dq fr_menu_settings
    dq fr_menu_highscore
    dq fr_menu_back
	
    ; Parametres (ID 9-18)
    dq fr_settings_title
    dq fr_settings_logtype
    dq fr_settings_callsign
    dq fr_settings_name
    dq fr_settings_email
    dq fr_settings_address
    dq fr_settings_postcode
    dq fr_settings_city
    dq fr_settings_power
    dq fr_settings_back

    ; Menu type de concours (ID 19-26)
    dq fr_logtype_title
    dq fr_logtype_wpx
    dq fr_logtype_hf
    dq fr_logtype_arrl_dx
    dq fr_logtype_russian_dx
    dq fr_logtype_cqww_dx
    dq fr_logtype_sac_cw
    dq fr_logtype_back

    ; Nouveau QSO (ID 27-38)
    dq fr_qso_title
    dq fr_qso_callsign
    dq fr_qso_band
    dq fr_qso_mode
    dq fr_qso_rst_sent
    dq fr_qso_rst_received
    dq fr_qso_exchange
    dq fr_qso_zone
    dq fr_qso_serial
    dq fr_qso_points
    dq fr_qso_save
    dq fr_qso_back

    ; Afficher le journal QSO (ID 39-48)
    dq fr_show_log_title
    dq fr_show_log_date
    dq fr_show_log_time
    dq fr_show_log_callsign
    dq fr_show_log_band
    dq fr_show_log_mode
    dq fr_show_log_rst
    dq fr_show_log_exchange
    dq fr_show_log_points
    dq fr_show_log_back

    ; Rechercher un indicatif (ID 49-54)
    dq fr_search_enter_call
    dq fr_search_you_entered
    dq fr_search_call_prompt
    dq fr_search_results
    dq fr_search_count
    dq fr_search_not_found

    ; Exporter le journal (ID 55-60)
    dq fr_print_log_title
    dq fr_print_log_adif
    dq fr_print_log_cabrillo
    dq fr_print_log_main_menu
    dq fr_print_log_back
    dq fr_print_log_choice


    ; Menu mode (ID 61-65)
    dq fr_mode_title
    dq fr_mode_radio
    dq fr_mode_cw
    dq fr_mode_cw_text
    dq fr_mode_text


    ; Choix de langue (ID 66)
    dq fr_language_title


    ; Menu puissance (ID 67-71)
    dq fr_power_title
    dq fr_power_qrp
    dq fr_power_low
    dq fr_power_high
    dq fr_power_arrl


    ; Menu WPM (ID 72)
    dq fr_wpm_title


    ; Tri des meilleurs scores (ID 73-74)
    dq fr_highscore_sort_date
    dq fr_highscore_sort_real


    ; Suppression des Highscores (ID 75-85)
    dq fr_highscore_delete_title
    dq fr_highscore_delete_wpx
    dq fr_highscore_delete_hf
    dq fr_highscore_delete_arrl
    dq fr_highscore_delete_russian
    dq fr_highscore_delete_cqww
    dq fr_highscore_delete_sac
    dq fr_highscore_delete_all
    dq fr_highscore_delete_confirm
    dq fr_highscore_delete_done
    dq fr_highscore_delete_error


    ; Demarrer un nouveau journal (ID 86-87)
    dq fr_newlog_warning
    dq fr_newlog_prompt


    ; Parametres - champs supplementaires (ID 88-89)
    dq fr_settings_arrl_state_prompt
    dq fr_settings_wpm_prompt


    ; Parametres - saisie (ID 90-95)
    dq fr_settings_callsign_input
    dq fr_settings_name_input
    dq fr_settings_email_input
    dq fr_settings_address_input
    dq fr_settings_zip_input
    dq fr_settings_city_input

    ; Parametres - enregistrement (ID 96-102)
    dq fr_settings_callsign_saved
    dq fr_settings_name_saved
    dq fr_settings_email_saved
    dq fr_settings_address_saved
    dq fr_settings_zip_saved
    dq fr_settings_city_saved
    dq fr_settings_power_saved

    dq fr_settings_arrl_power_input

    dq fr_cw_time_title
    dq fr_cw_time_5_min
    dq fr_cw_time_10_min
    dq fr_cw_time_15_min
    dq fr_cw_time_30_min
    dq fr_cw_time_60_min
    dq fr_cw_time_choose

    dq fr_exit_question
    dq fr_exit_message

    dq fr_error_invalid_choice
    dq fr_error_invalid_band
    dq fr_error_invalid_callsign
    dq fr_error_callsign_file
    dq fr_error_invalid_rst
    dq fr_error_invalid_qsonr
    dq fr_error_wpx_log_file

    dq fr_status_logtype_wpx
    dq fr_status_logtype_hf
    dq fr_status_logtype_arrl
    dq fr_status_logtype_russian
    dq fr_status_logtype_cqww
    dq fr_status_logtype_sac
    dq fr_status_mode_radio
    dq fr_status_mode_cw
    dq fr_status_mode_cw_text
    dq fr_status_mode_text

    dq fr_qso_saved_message
    dq fr_qso_dupe_warning
    dq fr_qso_count_format
    dq fr_qso_dupe_count_format
    dq fr_qso_points_format
    dq fr_qso_sent_text_format

    ; CTY-beskeder (ID 136-137)
    dq fr_cty_result_format
    dq fr_cty_file_error

    ; HF-beskeder (ID 138-157)
    dq fr_hf_call_correct
    dq fr_hf_call_wrong
    dq fr_hf_rst_correct
    dq fr_hf_rst_wrong
    dq fr_hf_name_correct
    dq fr_hf_name_wrong
    dq fr_hf_qth_correct
    dq fr_hf_qth_wrong
    dq fr_hf_result_header
    dq fr_hf_result_qso
    dq fr_hf_result_call
    dq fr_hf_result_rst
    dq fr_hf_result_name
    dq fr_hf_result_qth
    dq fr_hf_result_total
    dq fr_hf_result_wrong
    dq fr_hf_result_percent
    dq fr_hf_highscore_header
    dq fr_hf_highscore_empty
    dq fr_hf_log_header

    ; Fælles checkerbeskeder (ID 158-164)
    dq fr_checker_band_ok
    dq fr_checker_band_error
    dq fr_checker_qso_ok
    dq fr_checker_qso_error
    dq fr_checker_claimed_score
    dq fr_checker_real_score
    dq fr_checker_highscore_date

    ; Russian DX (ID 165-173)
    dq fr_russian_country_mult
    dq fr_russian_country_used
    dq fr_russian_oblast_mult
    dq fr_russian_oblast_used
    dq fr_russian_oblast_error
    dq fr_russian_log_empty
    dq fr_russian_station
    dq fr_russian_not_station
    dq fr_russian_new_log

    ; CQ WW DX (ID 174-179)
    dq fr_cqww_continent_error
    dq fr_cqww_continent_prompt
    dq fr_cqww_zone_error
    dq fr_cqww_zone_prompt
    dq fr_cqww_new_log_done
    dq fr_cqww_new_log_warning

    ; SAC CW (ID 180-187)
    dq fr_sac_new_log_done
    dq fr_sac_new_log_prompt
    dq fr_sac_scandinavian
    dq fr_sac_non_scandinavian
    dq fr_sac_serial_prompt
    dq fr_sac_serial_error
    dq fr_sac_qso_points
    dq fr_sac_dupe_message

    ; ARRL DX (ID 188-193)
    dq fr_arrl_new_log_done
    dq fr_arrl_new_log_prompt
    dq fr_arrl_log_empty
    dq fr_arrl_multipliers
    dq fr_arrl_score
    dq fr_arrl_qso_points

    dq fr_menu_delete_highscore    ; ID 194

    dq fr_settings_arrl_state_menu

    dq fr_wpx_highscore_title       ; 196
    dq fr_arrl_highscore_title      ; 197
    dq fr_russian_highscore_title   ; 198
    dq fr_cqww_highscore_title      ; 199
    dq fr_sac_highscore_title       ; 200
    dq fr_hf_highscore_title        ; 201
    dq fr_highscore_sort_date       ; 202
    dq fr_highscore_sort_real       ; 203

    dq fr_hf_highscore_accuracy    ; 204

    dq fr_delete_hs_title       ; 205
    dq fr_delete_hs_wpx         ; 206
    dq fr_delete_hs_hf          ; 207
    dq fr_delete_hs_arrl        ; 208
    dq fr_delete_hs_russian     ; 209
    dq fr_delete_hs_cqww        ; 210
    dq fr_delete_hs_sac         ; 211
    dq fr_delete_hs_all         ; 212

    dq fr_settings_language     ; 213
	
fr_menu_title:
    db "Menu principal", 0

fr_menu_new_qso:
    db "Nouveau QSO", 0

fr_menu_show_log:
    db "Afficher le journal QSO", 0

fr_menu_search_call:
    db "Rechercher un indicatif", 0

fr_menu_new_log:
    db "Commencer un nouveau journal", 0

fr_menu_print_log:
    db "Imprimer le journal", 0

fr_menu_settings:
    db "Parametres", 0

fr_menu_highscore:
    db "Classement", 0

fr_menu_back:
    db "Retour", 0





; ==========================================
; Parametres (ID 9-18)
; ==========================================

fr_settings_title:
    db "Parametres", 0

fr_settings_logtype:
    db "Type de concours", 0

fr_settings_callsign:
    db "Indicatif", 0

fr_settings_name:
    db "Nom", 0

fr_settings_email:
    db "E-mail", 0

fr_settings_address:
    db "Adresse", 0

fr_settings_postcode:
    db "Code postal", 0

fr_settings_city:
    db "Ville", 0

fr_settings_power:
    db "Puissance", 0

fr_settings_back:
    db "Retour", 0





; ==========================================
; Menu type de concours (ID 19-26)
; ==========================================

fr_logtype_title:
    db "Choisir le type de concours", 0

fr_logtype_wpx:
    db "WPX", 0

fr_logtype_hf:
    db "HF", 0

fr_logtype_arrl_dx:
    db "ARRL DX CW", 0

fr_logtype_russian_dx:
    db "Russian DX", 0

fr_logtype_cqww_dx:
    db "CQ WW DX CW", 0

fr_logtype_sac_cw:
    db "SAC CW", 0

fr_logtype_back:
    db "Retour", 0





; ==========================================
; Nouveau QSO (ID 27-38)
; ==========================================

fr_qso_title:
    db "Nouveau QSO", 0

fr_qso_callsign:
    db "Indicatif", 0

fr_qso_band:
    db "Bande", 0

fr_qso_mode:
    db "Mode", 0

fr_qso_rst_sent:
    db "RST envoye", 0

fr_qso_rst_received:
    db "RST recu", 0

fr_qso_exchange:
    db "Echange", 0

fr_qso_zone:
    db "Zone", 0

fr_qso_serial:
    db "Numero de serie", 0

fr_qso_points:
    db "Points", 0

fr_qso_save:
    db "Enregistrer QSO", 0

fr_qso_back:
    db "Retour", 0





; ==========================================
; Afficher le journal QSO (ID 39-48)
; ==========================================

fr_show_log_title:
    db "Afficher le journal QSO", 0

fr_show_log_date:
    db "Date", 0

fr_show_log_time:
    db "Heure", 0

fr_show_log_callsign:
    db "Indicatif", 0

fr_show_log_band:
    db "Bande", 0

fr_show_log_mode:
    db "Mode", 0

fr_show_log_rst:
    db "RST", 0

fr_show_log_exchange:
    db "Echange", 0

fr_show_log_points:
    db "Points", 0

fr_show_log_back:
    db "Retour", 0







; ==========================================
; Rechercher un indicatif (ID 49-54)
; ==========================================

fr_search_enter_call:
    db "Saisir l'indicatif : ", 0

fr_search_you_entered:
    db "Vous avez recherche : %s", 0

fr_search_call_prompt:
    db "Indicatif a rechercher : ", 0

fr_search_results:
    db "QSO trouves :", 0

fr_search_count:
    db "Nombre de resultats : %d", 0

fr_search_not_found:
    db "Aucun QSO trouve.", 0

; ==========================================
; Exporter le journal (ID 55-60)
; ==========================================

fr_print_log_title:
    db "Exporter le journal", 0

fr_print_log_adif:
    db "ADIF - HF", 0

fr_print_log_cabrillo:
    db "Cabrillo", 0

fr_print_log_main_menu:
    db "Menu principal", 0

fr_print_log_back:
    db "Retour", 0

fr_print_log_choice:
    db "Choix : ", 0


; ==========================================
; Menu mode (ID 61-65)
; ==========================================

fr_mode_title:
    db "Mode de fonctionnement", 0

fr_mode_radio:
    db "RADIO", 0

fr_mode_cw:
    db "CW", 0

fr_mode_cw_text:
    db "CW + TEXTE", 0

fr_mode_text:
    db "TEXTE", 0


; ==========================================
; Choix de langue (ID 66)
; ==========================================

fr_language_title:
    db "Choisir la langue", 0


; ==========================================
; Menu puissance (ID 67-71)
; ==========================================

fr_power_title:
    db "Puissance", 0

fr_power_qrp:
    db "QRP", 0

fr_power_low:
    db "LOW", 0

fr_power_high:
    db "HIGH", 0

fr_power_arrl:
    db "Puissance ARRL", 0


; ==========================================
; Menu WPM (ID 72)
; ==========================================

fr_wpm_title:
    db "Vitesse CW (WPM)", 0


; ==========================================
; Tri des meilleurs scores (ID 73-74)
; ==========================================

fr_highscore_sort_date:
    db "Trier par date", 0

fr_highscore_sort_real:
    db "Trier par score reel", 0


; ==========================================
; Suppression des Highscores (ID 75-85)
; ==========================================

fr_highscore_delete_title:
    db "Supprimer les Highscores", 0

fr_highscore_delete_wpx:
    db "Supprimer les Highscores WPX", 0

fr_highscore_delete_hf:
    db "Supprimer les Highscores HF", 0

fr_highscore_delete_arrl:
    db "Supprimer les Highscores ARRL DX", 0

fr_highscore_delete_russian:
    db "Supprimer les Highscores Russian DX", 0

fr_highscore_delete_cqww:
    db "Supprimer les Highscores CQ WW DX", 0

fr_highscore_delete_sac:
    db "Supprimer les Highscores SAC CW", 0

fr_highscore_delete_all:
    db "Supprimer TOUS les Highscores", 0

fr_highscore_delete_confirm:
    db "Voulez-vous vraiment supprimer les Highscores selectionnes ? (O/N): ", 0

fr_highscore_delete_done:
    db "Highscores supprimes.", 0

fr_highscore_delete_error:
    db "ERREUR : Impossible de vider le fichier Highscore.", 0


; ==========================================
; Demarrer un nouveau journal (ID 86-87)
; ==========================================

fr_newlog_warning:
    db "AVERTISSEMENT : Le journal actuel sera entierement supprime.", 0

fr_newlog_prompt:
    db "Demarrer un nouveau journal ? (O/N): ", 0


; ==========================================
; Parametres - champs supplementaires (ID 88-89)
; ==========================================

fr_settings_arrl_state_prompt:
    db "Saisir l'etat ou la province ARRL (ex. ON ou NY) : ", 0

fr_settings_wpm_prompt:
    db "WPM (par ex. 10, 15, 20, 25) : ", 0


; ==========================================
; Parametres - saisie (ID 90-95)
; ==========================================

fr_settings_callsign_input:
    db "Saisir l'indicatif : ", 0

fr_settings_name_input:
    db "Saisir le nom : ", 0

fr_settings_email_input:
    db "Saisir l'adresse e-mail : ", 0

fr_settings_address_input:
    db "Saisir l'adresse : ", 0

fr_settings_zip_input:
    db "Saisir le code postal : ", 0

fr_settings_city_input:
    db "Saisir la ville : ", 0

; ==========================================
; Parametres - enregistrement (ID 96-102)
; ==========================================

fr_settings_callsign_saved:
    db "Indicatif enregistre.", 10, 0

fr_settings_name_saved:
    db "Nom enregistre.", 10, 0

fr_settings_email_saved:
    db "Adresse e-mail enregistree.", 10, 0

fr_settings_address_saved:
    db "Adresse enregistree.", 10, 0

fr_settings_zip_saved:
    db "Code postal enregistre.", 10, 0

fr_settings_city_saved:
    db "Ville enregistree.", 10, 0

fr_settings_power_saved:
    db "Puissance enregistree.", 10, 0

fr_settings_arrl_power_input:
    db "Saisir la puissance ARRL en watts : ", 0
	
fr_cw_time_title:
    db "=== Duree de l'entrainement CW ===", 0

fr_cw_time_5_min:
    db "1.  5 minutes", 0

fr_cw_time_10_min:
    db "2. 10 minutes", 0

fr_cw_time_15_min:
    db "3. 15 minutes", 0

fr_cw_time_30_min:
    db "4. 30 minutes", 0

fr_cw_time_60_min:
    db "5. 60 minutes", 0

fr_cw_time_choose:
    db "Choisissez la duree de l'entrainement : ", 0
	
fr_exit_question:
    db "Voulez-vous quitter le programme ? (O/N): ", 0

fr_exit_message:
    db "Fermeture d'ASMLog.", 0
	
fr_error_invalid_choice:
    db "Choix invalide.", 0

fr_error_invalid_band:
    db "Bande WPX invalide. Utilisez 160m, 80m, 40m, 20m, 15m ou 10m.", 0

fr_error_invalid_callsign:
    db "Indicatif invalide - doit contenir une lettre et un chiffre.", 0

fr_error_callsign_file:
    db "ERREUR : Le fichier des indicatifs est absent ou vide.", 0

fr_error_invalid_rst:
    db "Le RST doit contenir exactement trois chiffres, par exemple 599.", 0

fr_error_invalid_qsonr:
    db "QSONR doit contenir au maximum 5 chiffres.", 0

fr_error_wpx_log_file:
    db "Impossible d'ouvrir wpx_log.txt", 0
	
fr_status_logtype_wpx:
    db "Type de journal selectionne : WPX", 0

fr_status_logtype_hf:
    db "Type de journal selectionne : HF", 0

fr_status_logtype_arrl:
    db "Type de journal selectionne : ARRL DX CW", 0

fr_status_logtype_russian:
    db "Type de journal selectionne : Russian DX", 0

fr_status_logtype_cqww:
    db "Type de journal selectionne : CQ WW DX CW", 0

fr_status_logtype_sac:
    db "Type de journal selectionne : SAC CW", 0

fr_status_mode_radio:
    db "Mode QSO selectionne : RADIO", 0

fr_status_mode_cw:
    db "Mode QSO selectionne : CW", 0

fr_status_mode_cw_text:
    db "Mode QSO selectionne : CW + TEXT", 0

fr_status_mode_text:
    db "Mode QSO selectionne : TEXT", 0
	
; ==========================================
; QSO-beskeder (ID 130-135)
; ==========================================

fr_qso_saved_message:
    db "QSO enregistre.", 0

fr_qso_dupe_warning:
    db "ATTENTION: Cet indicatif est deja enregistre sur cette bande.", 0

fr_qso_count_format:
    db "Nombre de QSO: %d", 0

fr_qso_dupe_count_format:
    db "Nombre de DUPES: %d", 0

fr_qso_points_format:
    db "Points QSO: %d", 0

fr_qso_sent_text_format:
    db "Envoye: %s", 0
	
; ==========================================
; CTY-beskeder (ID 136-137)
; ==========================================

fr_cty_result_format:
    db "CTY trouve: %s / %s", 0

fr_cty_file_error:
    db "ERREUR: Impossible d'ouvrir cty.dat.", 0
	
; ==========================================
; Messages HF (ID 138-157)
; ==========================================

fr_hf_call_correct:
    db "CALL: CORRECT", 0

fr_hf_call_wrong:
    db "CALL: INCORRECT", 0

fr_hf_rst_correct:
    db "RST: CORRECT", 0

fr_hf_rst_wrong:
    db "RST: INCORRECT", 0

fr_hf_name_correct:
    db "NAME: CORRECT", 0

fr_hf_name_wrong:
    db "NAME: INCORRECT", 0

fr_hf_qth_correct:
    db "QTH: CORRECT", 0

fr_hf_qth_wrong:
    db "QTH: INCORRECT", 0

fr_hf_result_header:
    db "===== RESULTATS DE L'ENTRAINEMENT HF =====", 0

fr_hf_result_qso:
    db "QSO verifies: %u", 0

fr_hf_result_call:
    db "CALL corrects: %u", 0

fr_hf_result_rst:
    db "RST corrects: %u", 0

fr_hf_result_name:
    db "NAME corrects: %u", 0

fr_hf_result_qth:
    db "QTH corrects: %u", 0

fr_hf_result_total:
    db "Champs corrects: %u / %u", 0

fr_hf_result_wrong:
    db "Champs incorrects: %u", 0

fr_hf_result_percent:
    db "Precision: %u.%02u %%", 0

fr_hf_highscore_header:
    db "=== Classement HF CW ===", 0

fr_hf_highscore_empty:
    db "Aucun score HF CW pour le moment.", 0

fr_hf_log_header:
    db "=== Journal QSO HF ===", 0
	
; ==========================================
; Messages communs du verificateur (ID 158-164)
; ==========================================

fr_checker_band_ok:
    db "BANDE CORRECTE", 0

fr_checker_band_error:
    db "ERREUR DE BANDE", 0

fr_checker_qso_ok:
    db "QSO CORRECT", 0

fr_checker_qso_error:
    db "ERREUR QSO", 0

fr_checker_claimed_score:
    db "SCORE DECLARE: ", 0

fr_checker_real_score:
    db "SCORE REEL: %d", 0

fr_checker_highscore_date:
    db "DATE DU RECORD: %s", 0
	
; ==========================================
; Messages Russian DX (ID 165-173)
; ==========================================

fr_russian_country_mult:
    db "Nouveau multiplicateur de pays: %s sur %s", 0

fr_russian_country_used:
    db "Multiplicateur de pays deja compte: %s", 0

fr_russian_oblast_mult:
    db "Nouveau multiplicateur d'oblast: %s sur %s", 0

fr_russian_oblast_used:
    db "Multiplicateur d'oblast deja compte: %s", 0

fr_russian_oblast_error:
    db "Code d'oblast invalide.", 0

fr_russian_log_empty:
    db "Aucun QSO dans le journal Russian DX.", 0

fr_russian_station:
    db "Station russe.", 0

fr_russian_not_station:
    db "Station non russe.", 0

fr_russian_new_log:
    db "Nouveau journal Russian DX demarre.", 0
	
; ==========================================
; Messages CQ WW DX (ID 174-179)
; ==========================================

fr_cqww_continent_error:
    db "Continent invalide. Utilisez EU, AF, AS, NA, SA ou OC.", 0

fr_cqww_continent_prompt:
    db "Continent (EU/AF/AS/NA/SA/OC): ", 0

fr_cqww_zone_error:
    db "Zone CQ invalide. Utilisez une valeur de 1 a 40.", 0

fr_cqww_zone_prompt:
    db "Zone CQ: ", 0

fr_cqww_new_log_done:
    db "Nouveau journal CQ WW demarre.", 0

fr_cqww_new_log_warning:
    db "ATTENTION: Le journal CQ WW actuel sera entierement supprime.", 0
	
; ==========================================
; Messages SAC CW (ID 180-187)
; ==========================================

fr_sac_new_log_done:
    db "Nouveau journal SAC demarre.", 0

fr_sac_new_log_prompt:
    db "Commencer un nouveau journal ? (O/N): ", 0

fr_sac_scandinavian:
    db "SAC: Station scandinave", 0

fr_sac_non_scandinavian:
    db "SAC: Station non scandinave", 0

fr_sac_serial_prompt:
    db "Numero de serie: ", 0

fr_sac_serial_error:
    db "Numero de serie invalide. Chiffres uniquement, minimum 1.", 0

fr_sac_qso_points:
    db "Points QSO: %d", 0

fr_sac_dupe_message:
    db "DUPE - indicatif deja enregistre sur cette bande.", 0
	
; ==========================================
; Messages ARRL DX (ID 188-193)
; ==========================================

fr_arrl_new_log_done:
    db "Nouveau journal ARRL DX demarre.", 0

fr_arrl_new_log_prompt:
    db "Commencer un nouveau journal ARRL DX ? (O/N): ", 0

fr_arrl_log_empty:
    db "Aucun QSO dans le journal ARRL DX.", 0

fr_arrl_multipliers:
    db "Multiplicateurs ARRL: %d", 0

fr_arrl_score:
    db "Score ARRL: %d", 0

fr_arrl_qso_points:
    db "Points QSO: %d", 0
	
fr_menu_delete_highscore db "Supprimer les scores", 0

fr_settings_arrl_state_menu:
    db "État/province ARRL", 0
	
fr_wpx_highscore_title       db "=== WPX Highscore ===",0
fr_arrl_highscore_title      db "=== ARRL DX Highscore ===",0
fr_russian_highscore_title   db "=== Russian DX Highscore ===",0
fr_cqww_highscore_title      db "=== CQ WW DX Highscore ===",0
fr_sac_highscore_title       db "=== SAC CW Highscore ===",0
fr_hf_highscore_title        db "=== HF CW Highscore ===",0

fr_hf_highscore_accuracy db "Afficher par précision",0

fr_delete_hs_title   db "=== SUPPRIMER LES RECORDS ===",0
fr_delete_hs_wpx     db "Supprimer les records WPX",0
fr_delete_hs_hf      db "Supprimer les records HF",0
fr_delete_hs_arrl    db "Supprimer les records ARRL DX",0
fr_delete_hs_russian db "Supprimer les records Russian DX",0
fr_delete_hs_cqww    db "Supprimer les records CQ WW DX",0
fr_delete_hs_sac     db "Supprimer les records SAC CW",0
fr_delete_hs_all     db "Supprimer TOUS les records",0
fr_settings_language:
    db "Langue", 0