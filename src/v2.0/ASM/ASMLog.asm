bits 64
default rel
global band_text
global cty_current_cq_zone
global cty_match_continent
global cty_match_cq_zone
global cty_match_entity
global cw_test_text
global cw_text_call_format
global denmark_entity
global load_call_format
global log_text
global lookup_country
global mult_text
global qso_point
global qso_points
global qso_mode
global settings_callsign
global cw_training_minutes

global read_buffer
global read_mode
global settings_address
global settings_arrl_power
global settings_city
global settings_email
global settings_name
global settings_power
global settings_wpm
global settings_zip
global wpx_filename


extern _strlwr_s
extern _strupr_s
extern arrl_dx_highscore_menu
extern arrl_dx_new_qso
extern arrl_exchange
extern atoi

extern calculate_arrl_score
extern calculate_cqww_score
extern calculate_russian_score
extern calculate_sac_score
extern wpx_calculate_qso_points
extern wpx_training_time_expired
extern calculate_wpx_points
extern calculate_wpx_score
extern check_arrl_dx_cabrillo
extern check_facit_wpx_call
extern check_russian_dx_cabrillo
extern check_sac_cw_cabrillo
extern check_wpx_cabrillo
extern check_wpx_call
extern count_wpx_multiplier
extern cqww_dx_log_filename
extern cqww_dx_new_log
extern cqww_dx_new_qso
extern cqww_dx_search_log
extern cqww_dx_show_log
extern cqww_dx_highscore_menu
extern create_adif
extern create_cabrillo_arrl_dx
extern create_cabrillo_cqww_dx
extern create_cabrillo_russian_dx
extern create_cabrillo_sac
extern create_cabrillo_wpx_cw
extern create_facit_cabrillo_cqww_dx
extern create_facit_cabrillo_arrl_dx
extern create_facit_cabrillo_russian_dx
extern create_facit_cabrillo_sac
extern create_facit_cabrillo_wpx_cw
extern cw_send_text
extern fclose
extern fgets
extern fopen
extern fprintf
extern fscanf
extern getchar
extern get_wpx_mult_count
extern gets_s
extern gmtime
extern hf_highscore_menu
extern hf_log

extern is_facit_wpx_multiplier
extern is_wpx_band
extern is_wpx_multiplier
extern load_wpx_prefixes
extern new_hf_logfile
extern printf
extern reset_wpx_mult_count
extern reset_wpx_multiplier
extern reset_wpx_prefixes
extern russian_dx_highscore_menu
extern russian_dx_new_log
extern russian_dx_new_qso
extern russian_dx_new_qso
extern russian_dx_search_log
extern russian_dx_show_log
extern russian_dx_show_log
extern sac_cw_highscore_menu
extern sac_cw_log_filename
extern sac_cw_new_log
extern sac_cw_new_qso
extern sac_cw_search_log
extern sac_cw_show_log
extern scanf
extern search_arrl_log
extern search_hf_log
extern SetConsoleCP
extern SetConsoleOutputCP
extern show_arrl_log
extern show_hf_log
extern srand
extern start_new_arrl_log
extern strcmp
extern strcpy_s
extern strftime
extern strstr
extern system
extern time
extern qso_generate
extern wpx_exchange
extern wpx_highscore_menu
extern wpx_serial

section .data
splash_command:
    db "powershell.exe -NoProfile -STA -WindowStyle Hidden -EncodedCommand QQBkAGQALQBUAHkAcABlACAALQBBAHMAc"
    db "wBlAG0AYgBsAHkATgBhAG0AZQAgAFMAeQBzAHQAZQBtAC4AVwBpAG4AZABvAHcAcwAuAEYAbwByAG0AcwAKAEEAZABkAC0AVAB5A"
    db "HAAZQAgAC0AQQBzAHMAZQBtAGIAbAB5AE4AYQBtAGUAIABTAHkAcwB0AGUAbQAuAEQAcgBhAHcAaQBuAGcACgBBAGQAZAAtAFQAe"
    db "QBwAGUAIAAtAFQAeQBwAGUARABlAGYAaQBuAGkAdABpAG8AbgAgAEAAJwAKAHUAcwBpAG4AZwAgAFMAeQBzAHQAZQBtADsACgB1A"
    db "HMAaQBuAGcAIABTAHkAcwB0AGUAbQAuAFIAdQBuAHQAaQBtAGUALgBJAG4AdABlAHIAbwBwAFMAZQByAHYAaQBjAGUAcwA7AAoAc"
    db "AB1AGIAbABpAGMAIABzAHQAYQB0AGkAYwAgAGMAbABhAHMAcwAgAFMAcABsAGEAcwBoAEMAbwBuAHMAbwBsAGUAIAB7AAoAIAAgA"
    db "FsARABsAGwASQBtAHAAbwByAHQAKAAiAGsAZQByAG4AZQBsADMAMgAuAGQAbABsACIAKQBdACAAcAB1AGIAbABpAGMAIABzAHQAY"
    db "QB0AGkAYwAgAGUAeAB0AGUAcgBuACAASQBuAHQAUAB0AHIAIABHAGUAdABDAG8AbgBzAG8AbABlAFcAaQBuAGQAbwB3ACgAKQA7A"
    db "AoAIAAgAFsARABsAGwASQBtAHAAbwByAHQAKAAiAHUAcwBlAHIAMwAyAC4AZABsAGwAIgApAF0AIABwAHUAYgBsAGkAYwAgAHMAd"
    db "ABhAHQAaQBjACAAZQB4AHQAZQByAG4AIABiAG8AbwBsACAAUwBoAG8AdwBXAGkAbgBkAG8AdwAoAEkAbgB0AFAAdAByACAAaABXA"
    db "G4AZAAsACAAaQBuAHQAIABuAEMAbQBkAFMAaABvAHcAKQA7AAoAIAAgAFsARABsAGwASQBtAHAAbwByAHQAKAAiAHUAcwBlAHIAM"
    db "wAyAC4AZABsAGwAIgApAF0AIABwAHUAYgBsAGkAYwAgAHMAdABhAHQAaQBjACAAZQB4AHQAZQByAG4AIABiAG8AbwBsACAAUwBlA"
    db "HQARgBvAHIAZQBnAHIAbwB1AG4AZABXAGkAbgBkAG8AdwAoAEkAbgB0AFAAdAByACAAaABXAG4AZAApADsACgB9AAoAJwBAAAoAJ"
    db "ABwACAAPQAgACcAaQBtAGcAXABBAFMATQBMAG8AZwAuAHAAbgBnACcACgBpAGYAIAAoACEAKABUAGUAcwB0AC0AUABhAHQAaAAgA"
    db "C0ATABpAHQAZQByAGEAbABQAGEAdABoACAAJABwACkAKQAgAHsAIAAkAHAAIAA9ACAAJwBiAGkAbgBcAGkAbQBnAFwAQQBTAE0AT"
    db "ABvAGcALgBwAG4AZwAnACAAfQAKAGkAZgAgACgAIQAoAFQAZQBzAHQALQBQAGEAdABoACAALQBMAGkAdABlAHIAYQBsAFAAYQB0A"
    db "GgAIAAkAHAAKQApACAAewAgAGUAeABpAHQAIAB9AAoAJABjAG8AbgBzAG8AbABlACAAPQAgAFsAUwBwAGwAYQBzAGgAQwBvAG4Ac"
    db "wBvAGwAZQBdADoAOgBHAGUAdABDAG8AbgBzAG8AbABlAFcAaQBuAGQAbwB3ACgAKQAKACQAaQBtAGEAZwBlACAAPQAgACQAbgB1A"
    db "GwAbAAKAHQAcgB5ACAAewAKACAAIAAkAGkAbQBhAGcAZQAgAD0AIABbAFMAeQBzAHQAZQBtAC4ARAByAGEAdwBpAG4AZwAuAEkAb"
    db "QBhAGcAZQBdADoAOgBGAHIAbwBtAEYAaQBsAGUAKAAoAFIAZQBzAG8AbAB2AGUALQBQAGEAdABoACAALQBMAGkAdABlAHIAYQBsA"
    db "FAAYQB0AGgAIAAkAHAAKQAuAFAAYQB0AGgAKQAKACAAIAAkAGYAbwByAG0AIAA9ACAATgBlAHcALQBPAGIAagBlAGMAdAAgAFMAe"
    db "QBzAHQAZQBtAC4AVwBpAG4AZABvAHcAcwAuAEYAbwByAG0AcwAuAEYAbwByAG0ACgAgACAAJABmAG8AcgBtAC4AVABlAHgAdAAgA"
    db "D0AIAAnAEEAUwBNAEwAbwBnACAAdgAyAC4AMAAnAAoAIAAgACQAZgBvAHIAbQAuAFMAdABhAHIAdABQAG8AcwBpAHQAaQBvAG4AI"
    db "AA9ACAAJwBDAGUAbgB0AGUAcgBTAGMAcgBlAGUAbgAnAAoAIAAgACQAZgBvAHIAbQAuAEYAbwByAG0AQgBvAHIAZABlAHIAUwB0A"
    db "HkAbABlACAAPQAgACcARgBpAHgAZQBkAEQAaQBhAGwAbwBnACcACgAgACAAJABmAG8AcgBtAC4ATQBhAHgAaQBtAGkAegBlAEIAb"
    db "wB4ACAAPQAgACQAZgBhAGwAcwBlAAoAIAAgACQAZgBvAHIAbQAuAE0AaQBuAGkAbQBpAHoAZQBCAG8AeAAgAD0AIAAkAGYAYQBsA"
    db "HMAZQAKACAAIAAkAGYAbwByAG0ALgBDAGwAaQBlAG4AdABTAGkAegBlACAAPQAgAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABTAHkAc"
    db "wB0AGUAbQAuAEQAcgBhAHcAaQBuAGcALgBTAGkAegBlACgANwAyADAALAAgADUANAAwACkACgAgACAAJABmAG8AcgBtAC4ASwBlA"
    db "HkAUAByAGUAdgBpAGUAdwAgAD0AIAAkAHQAcgB1AGUACgAgACAAJABwAGkAYwB0AHUAcgBlACAAPQAgAE4AZQB3AC0ATwBiAGoAZ"
    db "QBjAHQAIABTAHkAcwB0AGUAbQAuAFcAaQBuAGQAbwB3AHMALgBGAG8AcgBtAHMALgBQAGkAYwB0AHUAcgBlAEIAbwB4AAoAIAAgA"
    db "CQAcABpAGMAdAB1AHIAZQAuAEQAbwBjAGsAIAA9ACAAJwBGAGkAbABsACcACgAgACAAJABwAGkAYwB0AHUAcgBlAC4AUwBpAHoAZ"
    db "QBNAG8AZABlACAAPQAgACcAWgBvAG8AbQAnAAoAIAAgACQAcABpAGMAdAB1AHIAZQAuAEkAbQBhAGcAZQAgAD0AIAAkAGkAbQBhA"
    db "GcAZQAKACAAIAAkAGYAbwByAG0ALgBDAG8AbgB0AHIAbwBsAHMALgBBAGQAZAAoACQAcABpAGMAdAB1AHIAZQApAAoAIAAgACQAZ"
    db "gBvAHIAbQAuAEEAZABkAF8AUwBoAG8AdwBuACgAewAgAGkAZgAgACgAJABjAG8AbgBzAG8AbABlACAALQBuAGUAIABbAEkAbgB0A"
    db "FAAdAByAF0AOgA6AFoAZQByAG8AKQAgAHsAIABbAFMAcABsAGEAcwBoAEMAbwBuAHMAbwBsAGUAXQA6ADoAUwBoAG8AdwBXAGkAb"
    db "gBkAG8AdwAoACQAYwBvAG4AcwBvAGwAZQAsACAAMAApACAAfAAgAE8AdQB0AC0ATgB1AGwAbAAgAH0AOwAgACQAZgBvAHIAbQAuA"
    db "EEAYwB0AGkAdgBhAHQAZQAoACkAIAB9ACkACgAgACAAJABmAG8AcgBtAC4AQQBkAGQAXwBLAGUAeQBEAG8AdwBuACgAewAgACQAZ"
    db "gBvAHIAbQAuAEMAbABvAHMAZQAoACkAIAB9ACkACgAgACAAJABwAGkAYwB0AHUAcgBlAC4AQQBkAGQAXwBQAHIAZQB2AGkAZQB3A"
    db "EsAZQB5AEQAbwB3AG4AKAB7ACAAJABmAG8AcgBtAC4AQwBsAG8AcwBlACgAKQAgAH0AKQAKACAAIABbAHYAbwBpAGQAXQAkAGYAb"
    db "wByAG0ALgBTAGgAbwB3AEQAaQBhAGwAbwBnACgAKQAKAH0AIABmAGkAbgBhAGwAbAB5ACAAewAKACAAIABpAGYAIAAoACQAYwBvA"
    db "G4AcwBvAGwAZQAgAC0AbgBlACAAWwBJAG4AdABQAHQAcgBdADoAOgBaAGUAcgBvACkAIAB7AAoAIAAgACAAIABbAFMAcABsAGEAc"
    db "wBoAEMAbwBuAHMAbwBsAGUAXQA6ADoAUwBoAG8AdwBXAGkAbgBkAG8AdwAoACQAYwBvAG4AcwBvAGwAZQAsACAAOQApACAAfAAgA"
    db "E8AdQB0AC0ATgB1AGwAbAAKACAAIAAgACAAWwBTAHAAbABhAHMAaABDAG8AbgBzAG8AbABlAF0AOgA6AFMAZQB0AEYAbwByAGUAZ"
    db "wByAG8AdQBuAGQAVwBpAG4AZABvAHcAKAAkAGMAbwBuAHMAbwBsAGUAKQAgAHwAIABPAHUAdAAtAE4AdQBsAGwACgAgACAAfQAKA"
    db "CAAIABpAGYAIAAoACQAaQBtAGEAZwBlACkAIAB7ACAAJABpAG0AYQBnAGUALgBEAGkAcwBwAG8AcwBlACgAKQAgAH0ACgAgACAAa"
    db "QBmACAAKAAkAGYAbwByAG0AKQAgAHsAIAAkAGYAbwByAG0ALgBEAGkAcwBwAG8AcwBlACgAKQAgAH0ACgB9AAoA", 0

address_input_prompt db "Skriv adresse: ", 0
address_saved_text db "Adresse gemt.", 10, 0
address_settings_title db 10, "=== Adresse ===", 10, 10, 0

append_mode db "a", 0

arrl_cabrillo_log_filename db "log/arrl_dx_log.txt", 0

band_10_search db "10m", 0
band_15_search db "15m", 0
band_160_search db "160m", 0
band_20_search db "20m", 0
band_40_search db "40m", 0
band_80_search db "80m", 0
band_error db "Ugyldigt WPX-baand. Brug 160m, 80m, 40m, 20m, 15m eller 10m.", 10, 0
band_prompt db "Baand: ", 0

cabrillo_claimed_score db "CLAIMED-SCORE: %u", 10, 0

call_error db "Ugyldigt kaldesignal - call skal indeholde bogstav og tal.", 10, 0
callsign_format db "%31s", 0
callsign_input_prompt db "Skriv kaldesignal: ", 0
callsign_prompt db "Dit kaldesignal: ", 0
callsign_saved_text db "Kaldesignal gemt.", 10, 0
callsign_settings_title db 10, "=== Kaldesignal ===", 10, 10, 0

char_format db " %c", 0

city_input_prompt db "Skriv by: ", 0
city_saved_text db "By gemt.", 10, 0
city_settings_title db 10, "=== By ===", 10, 10, 0

cty_colon db ":", 0
cty_denmark_format db "Denmark fundet: %d gang(e)", 10, 0
cty_entity_format db "Aktuel entity: %s", 10, 0
cty_error db "Kunne ikke aabne cty.dat", 10, 0
cty_generic_header_format db "CTY header: %s", 0
cty_germany_format db "Germany fundet: %d gang(e)",10,0
cty_header_format db "Mulige CTY headers: %d", 10, 0
cty_lines_format db "CTY linjer laest: %d", 10, 0
cty_match_entity_format db "MATCH entity: %s", 10, 0
cty_match_format db "MATCH: %s",10,0
cty_ok db "cty.dat blev fundet.", 10, 0
cty_oz_found db "OZ-prefix fundet i Denmark.", 10, 0
cty_oz_text db "OZ", 0
cty_prefix_format db "CTY prefix: %s",10,0
cty_prefix_length_format db "Prefix-laengde: %d",10,0
cty_result_format db "CTY fundet: %s / %s", 10, 0
cty_wpx_filename db "data/cty.dat", 0

; ==========================================
; CW TRAENING - TIDSVALGSMENU
; ASMLog v1.8.3
; ==========================================

cw_time_menu:
    db 10
    db "=== CW Traeningstid ===", 10, 10
    db "1.  5 minutter", 10
    db "2. 10 minutter", 10
    db "3. 15 minutter", 10
    db "4. 30 minutter", 10
    db "5. 60 minutter", 10
    db "0. Tilbage", 10, 10
    db "Vaelg traeningstid: ", 0

cw_test_text db "OZ1THC/P9", 10, 0
cw_text_call_format db "Sendt: %s", 10, 0

denmark_entity db "Denmark", 0
denmark_text db "Denmark:", 0

display_format db "%s", 0

dupe_count_format db "Antal DUPE'er: %d", 10, 0
dupe_file_format db "%s | %s | %s | %s | %s | %03d | %s | %d point | DUPE", 10, 0
dupe_message db "ADVARSEL: Kaldesignalet er allerede logget paa dette baand.", 10, 0
dupe_text db "DUPE", 0

email_input_prompt db "Skriv e-mail: ", 0
email_saved_text db "E-mail gemt.", 10, 0
email_settings_title db 10, "=== E-mail ===", 10, 10, 0

error_message db "Ugyldigt valg.", 10, 0
exit_message db "ASMLog afsluttes.", 10, 0
exit_question db "Vil du afslutte programmet? (J/N): ", 0
facit_wpx_dupe_format db "%s | %s | %s | %s | %s | %03d | %03d | %d point | DUPE", 10, 0
facit_wpx_filename db "facit/facit_wpx_log.txt", 0
facit_wpx_format db "%s | %s | %s | %s | %s | %03d | %03d | %d point", 10, 0
facit_wpx_mult_format db "%s | %s | %s | %s | %s | %03d | %03d | %d point | MULT", 10, 0
facit_wpx_rst db "599", 0
file_error db "Kunne ikke aabne wpx_log.txt", 10, 0
file_format db "%s | %s | %s | %s | %s | %03d | %s | %d point", 10, 0

germany_text db "Fed. Rep. of Germany:", 0

input_format db "%d", 0

log_type db 1

logtype_arrl_text:
    db "Logtype sat til ARRL DX CW.", 10, 0

logtype_cqww_text:
    db "Logtype sat til CQ WW DX CW.", 10, 0

logtype_hf_text:
    db "Logtype sat til HF Log.", 10, 0

logtype_menu:
    db 10
    db "=== Logtype ===", 10, 10
    db "1. WPX Contest", 10
    db "2. HF Log", 10
    db "3. ARRL DX CW", 10
    db "4. Russian DX Contest", 10
    db "5. CQ WW DX CW", 10
    db "6. SAC CW", 10
	db "h. Hoved Menu", 10
    db "0. Tilbage", 10, 10
    db "Valg: ", 0

logtype_russian_text:
    db "Logtype sat til Russian DX Contest.", 10, 0

logtype_sac_text:
    db "Logtype sat til SAC CW.", 10, 0

logtype_wpx_text:
    db "Logtype sat til WPX Contest.", 10, 0

menu:
    db 10
    db "1. Ny QSO", 10
    db "2. Vis QSO-log", 10
    db "3. Soeg kaldesignal", 10
    db "4. Start ny log", 10
    db "5. Udskriv log", 10
    db "6. Settings", 10
	db "7. Highscore", 10
    db "8. Slet Highscore", 10
    db "Alt andet - Vil du afslutte programmet? (J/N)", 10, 10
    db "Valg: ", 0

menu_arrl_title:
    db 10, "=== ASMLog v2.0 ARRL DX ===", 10
    db "ARRL DX CW Contest", 10
    db "Made by Tommy Clemmensen - OZ1THC", 10, 10, 0

menu_cqww_title:
    db 10, "=== ASMLog v2.0 CQ WW DX ===", 10
    db "CQ WW DX Contest - CW", 10
    db "Made by Tommy Clemmensen - OZ1THC", 10, 10, 0

menu_hf_title:
    db 10, "=== ASMLog v2.0 HF ===", 10
    db "HF Log", 10
    db "Made by Tommy Clemmensen - OZ1THC", 10, 10, 0

menu_russian_title:
    db 10, "=== ASMLog v2.0 Russian DX ===", 10
    db "Russian DX Contest - CW", 10
    db "Made by Tommy Clemmensen - OZ1THC", 10, 10, 0

menu_sac_title:
    db 10, "=== ASMLog v2.0 SAC ===", 10
    db "Scandinavian Activity Contest - CW", 10
    db "Made by Tommy Clemmensen - OZ1THC", 10, 10, 0

menu_wpx_title:
    db 10, "=== ASMLog v2.0 WPX ===", 10
    db "WPX CW Contest", 10
    db "Made by Tommy Clemmensen - OZ1THC", 10, 10, 0

mode_cw db "CW", 0


mode_cw_text    db "Mode: CW", 10, 10, 0
mode_cw_text_text db "Mode: CW + TEXT", 10, 10, 0

mode_menu:
    db 10
    db "=== Mode ===", 10, 10
    db "1. RADIO", 10
    db "2. CW", 10
    db "3. CW + TEXT", 10
    db "4. TEXT", 10
	db "h. Hoved Menu", 10
    db "0. Tilbage", 10, 10
    db "Valg: ", 0
mode_radio_text db "Mode: RADIO", 10, 10, 0
mode_text_text db "Mode: TEXT", 10, 10, 0
mult_count_format db "WPX-multipliers: %d", 10, 0
mult_file_format db "%s | %s | %s | %s | %s | %03d | %s | %d point | MULT", 10, 0

name_input_prompt db "Skriv navn: ", 0
name_saved_text db "Navn gemt.", 10, 0
name_settings_title db 10, "=== Navn ===", 10, 10, 0

new_message db "Du valgte: Ny QSO", 10, 0
newlog_prompt db "Start ny log? (J/N): ", 0
newlog_warning db "ADVARSEL: Hele den nuvaerende log bliver slettet.", 10, 0

no_results db "Ingen logposter fundet.", 10, 0

point_text db " point", 0
points_format db "QSO-point: %d", 10, 0

power_menu:
    db 10
    db "=== Power ===", 10, 10
    db "1. QRP", 10
    db "2. LOW", 10
    db "3. HIGH", 10
	db "4. ARRL Power", 10
	db "h. Hoved Menu", 10
    db "0. Tilbage", 10, 10
    db "Valg: ", 0


print_log_menu:
    db 10
    db "=== Udskriv log ===", 10, 10
    db "1. ADIF - HF", 10
    db "2. Cabrillo", 10
	db "h. Hoved Menu", 10
    db "3. Tilbage", 10, 10
    db "Valg: ", 0
power_high db "HIGH", 0
power_low db "LOW", 0
power_qrp db "QRP", 0
power_saved_text db "Power gemt.", 10, 0
qso_count_format db "Antal QSO'er: %d", 10, 0
qso_number dd 1
qso_mode db 1
qsonr_error db "QSONR skal kun indeholde max 5 tal.", 10, 0
qsonr_format db "%d", 0
qsonr_prompt db "QSONR modtaget: ", 0
qsonr_wpx_filename db "data/qsonr.txt", 0

read_mode db "r", 0

results_message db "%d QSO fundet.", 10, 0

rst_error db "RST skal vaere praecis tre cifre, fx 599.", 10, 0
rst_prompt db "RST: ", 0

russian_dx_log_filename db "log/russian_dx_log.txt", 0

russian_search_count_format:
    db 10, "Antal fund: %d", 10, 0

russian_search_header:
    db 10, "Fundne QSO'er:", 10, 0

russian_search_no_results:
    db 10, "Ingen QSO'er fundet.", 10, 0

russian_search_prompt:
    db 10, "Kaldesignal at soege efter: ", 0


saved_message db "QSO gemt.", 10, 0

search_display db "Du soegte efter: %s", 10, 0
search_prompt db "Skriv kaldesignal: ", 0

settings_address_format db "ADDRESS=%s", 10, 0
settings_address_read_format db " ADDRESS=%127[^", 13, 10, "]", 0
settings_arrl_power_format:
    db "ARRLPOWER=%s", 10, 0
settings_arrl_power_prompt:
    db "Indtast ARRL Power i watt: ", 0
settings_arrl_power_read_format:
    db " ARRLPOWER=%7s", 0
settings_callsign_display db 10, "Kaldesignal: %s", 10, 10, 0
settings_callsign_format db "CALLSIGN=%s", 10, 0
settings_callsign_read_format db " CALLSIGN=%31s", 0
settings_city_format db "CITY=%s", 10, 0
settings_city_read_format db " CITY=%63[^", 13, 10, "]", 0
settings_email_format db "EMAIL=%s", 10, 0
settings_email_read_format db " EMAIL=%127s", 0
settings_logtype_format db "LOGTYPE=%d", 10, 0
settings_logtype_read_format db "LOGTYPE=%d", 0

settings_menu:
    db 10
    db "=== Settings ===", 10, 10
    db "1. Logtype", 10
    db "2. Kaldesignal", 10
    db "3. Navn", 10
    db "4. E-mail", 10
    db "5. Adresse", 10
    db "6. Postnr.", 10
    db "7. By", 10
    db "8. Power", 10
    db "9. Mode", 10
    db "w. WPM", 10 
	db "0. Tilbage", 10, 10
    db "Valg: ", 0
settings_mode_format db "MODE=%d", 10, 0
settings_mode_read_format db " MODE=%d", 0
	
settings_name_format db "NAME=%s", 10, 0
settings_name_read_format db " NAME=%63[^", 13, 10, "]", 0
settings_power_format db "POWER=%s", 10, 0
settings_power_read_format db " POWER=%15s", 0
settings_wpm_format db "WPM=%d", 10, 0
settings_wpm_read_format db " WPM=%d", 0
settings_wpx_filename db "data/settings.txt", 0
settings_write_mode db "w", 0
settings_zip_format db "ZIP=%s", 10, 0
settings_zip_read_format db " ZIP=%15s", 0

show_message db "Du valgte: Vis log", 10, 0

text_prompt db "Skriv Kaldesignal: ", 0
time_format db "%d-%m-%Y %H:%M", 0

valid_count_format db "Gyldige QSO'er: %d", 10, 0

wpm_menu:
    db 10
    db "=== WPM ===", 10, 10
    db "1. 15 WPM", 10
    db "2. 20 WPM", 10
    db "3. 25 WPM", 10
    db "4. 30 WPM", 10
    db "5. 35 WPM", 10
	db "h. Hoved Menu", 10
    db ". Tilbage", 10, 10
    db "Valg: ", 0
wpm_prompt      db "WPM (f.eks. 10, 15, 20, 25): ", 0
wpm_scan_format db "%d", 0
wpx_filename db "log/wpx_log.txt", 0
wpx_score_format db "WPX-score: %d", 10, 0

write_mode db "w", 0

zip_input_prompt db "Skriv postnr.: ", 0
zip_saved_text db "Postnr. gemt.", 10, 0
zip_settings_title db 10, "=== Postnr. ===", 10, 10, 0
; Slet Highscore - stioversigt uafhaengig af log_type.
delete_hs_wpx db "highscore/wpx_highscore.txt", 0
delete_hs_hf db "highscore/hf_highscore.txt", 0
delete_hs_arrl db "highscore/arrl_dx_highscore.txt", 0
delete_hs_russian db "highscore/russian_dx_highscore.txt", 0
delete_hs_cqww db "highscore/cqww_dx_highscore.txt", 0
delete_hs_sac db "highscore/sac_cw_highscore.txt", 0
delete_hs_paths dq delete_hs_wpx, delete_hs_hf, delete_hs_arrl, delete_hs_russian, delete_hs_cqww, delete_hs_sac
delete_hs_menu_text:
    db 10, "=== SLET HIGHSCORE ===", 10, 10
    db "1. Slet WPX Highscore", 10
    db "2. Slet HF Highscore", 10
    db "3. Slet ARRL DX Highscore", 10
    db "4. Slet Russian DX Highscore", 10
    db "5. Slet CQ WW DX Highscore", 10
    db "6. Slet SAC CW Highscore", 10
    db "7. Slet ALLE Highscores", 10
    db "0. Tilbage", 10, 10
    db "Valg: ", 0
delete_hs_confirm db "Er du sikker paa at du vil slette den valgte highscore? (J/N): ", 0
delete_hs_done db "Highscore slettet.", 10, 0
delete_hs_error db "FEJL: Kunne ikke toemme highscore-filen.", 10, 0

section .bss
delete_hs_answer resb 1
delete_hs_choice resb 1
delete_hs_index resd 1

	band_text resb 16

cabrillo_score resd 1
choice resd 1

cty_buffer resb 256
cty_current_continent resb 4
cty_current_cq_zone resd 1
cty_current_entity resb 64
cty_denmark_count resd 1
cty_germany_count resd 1
cty_header_count resd 1
cty_lines resd 1
cty_match_continent resb 4
cty_match_cq_zone resd 1
cty_match_entity resb 64
cty_prefix resb 64
cty_prefix_endchar resb 1
cty_prefix_pos resq 1
cw_time_choice resb 1
cw_training_end     resq 1
cw_training_minutes resd 1
cw_training_start   resq 1

dupe_buffer resb 256
dupe_count resd 1
dupe_flag resd 1

exit_choice resb 1
facit_dupe_flag resd 1
facit_wpx_point resd 1
log_text resb 256

my_callsign resb 32

newlog_answer resb 8

qso_count resd 1
qso_point resd 1
qso_points resd 1
qsonr_text resb 32

read_buffer resb 256

rst_text resb 8

russian_search_call:
    resb 32

russian_search_count:
    resd 1

search_buffer resb 256
search_text resb 256

settings_address resb 128
settings_arrl_power resb 8
settings_callsign resb 32
settings_city resb 64
settings_email resb 128
settings_logtype_temp resd 1
settings_mode_temp resd 1
settings_name resb 64
settings_power resb 16
settings_wpm resd 1
settings_zip resb 16

time_buffer resb 64
time_value resq 1

section .text
global main

main:

    push rbx
    push r12
    sub rsp, 88

    ; Vis opstartsbillede en gang pr. programstart; tast lukker billedet.
    lea rcx, [splash_command]
    call system

    ; Initialiser tilfaeldige tal til trainer
    xor ecx, ecx
    call time

    mov ecx, eax
    call srand

    ; Indlaes gemt logtype
    call load_logtype

    ; R8D = WPX-score fra ASMLog.asm
    mov [cabrillo_score], r8d

	; Indlaes WPX-prefixer fra den eksisterende log
	lea rcx, [wpx_filename]
	call load_wpx_prefixes

    ; Indlaes facit WPX-prefixer fra den eksisterende facit-log
    
    mov ecx, 1252
    
	call SetConsoleCP

    mov ecx, 1252
    call SetConsoleOutputCP
	
	

  
    ; Åbn qsonr.txt
    lea rcx, [qsonr_wpx_filename]
    lea rdx, [read_mode]
    call fopen

	; Hvis filen ikke kunne åbnes, fortsætter vi bare med 1
	test rax, rax
	jz menu_loop

	mov rbx, rax

	; fscanf(fil, "%d", &qso_number)
	mov rcx, rbx
	lea rdx, [qsonr_format]
	lea r8, [qso_number]
	call fscanf

	; Luk filen
	mov rcx, rbx
	call fclose

menu_loop:

	; time(&time_value)
    lea rcx, [time_value]
    call time

    ; gmtime(&time_value) - UTC til Cabrillo
	lea rcx, [time_value]
	call gmtime

    ; RAX peger nu på en tm-struktur
    mov rbx, rax

    ; strftime(time_buffer, 64, time_format, tm)
    lea rcx, [time_buffer]
    mov edx, 64
    lea r8, [time_format]
    mov r9, rbx
    call strftime

    

; Vis den rigtige overskrift

    cmp byte [log_type], 2
    je show_hf_menu_title

    cmp byte [log_type], 3
    je show_arrl_menu_title

    cmp byte [log_type], 4
    je show_russian_menu_title

    cmp byte [log_type], 5
    je show_cqww_menu_title

	cmp byte [log_type], 6
	je show_sac_menu_title

    ; WPX
    lea rcx, [menu_wpx_title]
    call printf
    jmp show_mode

show_hf_menu_title:
    lea rcx, [menu_hf_title]
    call printf
    jmp show_mode

show_arrl_menu_title:
    lea rcx, [menu_arrl_title]
    call printf
    jmp show_mode

show_russian_menu_title:
    lea rcx, [menu_russian_title]
    call printf
	jmp show_mode
	
show_cqww_menu_title:

    lea rcx, [menu_cqww_title]
    call printf
    jmp show_mode

show_sac_menu_title:

    lea rcx, [menu_sac_title]
    call printf
    jmp show_mode

show_mode:

    cmp byte [qso_mode], 2
    je show_mode_cw

    cmp byte [qso_mode], 3
    je show_mode_cw_text
	
	cmp byte [qso_mode], 4
    je show_mode_text

    ; Ellers RADIO
    lea rcx, [mode_radio_text]
    call printf
    jmp show_main_menu

show_mode_cw:
    lea rcx, [mode_cw_text]
    call printf
    jmp show_main_menu

show_mode_cw_text:
    lea rcx, [mode_cw_text_text]
    call printf
    jmp show_main_menu

show_mode_text:
    lea rcx, [mode_text_text]
    call printf
    jmp show_main_menu
	
show_main_menu:
    lea rcx, [menu]
    call printf
   
    ; Laes ét tegn som menuvalg
	lea rcx, [char_format]
	lea rdx, [exit_choice]
	call scanf
	
	cmp byte [exit_choice], '1'
    je select_new_qso

	cmp byte [exit_choice], '2'
    je select_show_log

	cmp byte [exit_choice], '3'
    je select_search_log

	cmp byte [exit_choice], '4'
    je select_new_logfile

	cmp byte [exit_choice], '5'
    je print_log_settings
   
	cmp byte [exit_choice], '6'
	je settings
	
	cmp byte [exit_choice], '7'
	je show_highscore

	cmp byte [exit_choice], '8'
	je delete_highscore_menu

   ; Alt andet gaar til afslutningsspoergsmaal
   ; Toem resten af den indtastede linje
    flush_main_input:
    call getchar
    cmp eax, 10
    jne flush_main_input

    jmp confirm_exit
	
	
; Slet highscore uafhaengigt af den valgte logtype.
delete_highscore_menu:
    lea rcx, [delete_hs_menu_text]
    call printf
    lea rcx, [char_format]
    lea rdx, [delete_hs_choice]
    call scanf

    mov al, [delete_hs_choice]
    cmp al, '0'
    je menu_loop
    cmp al, '1'
    jb .invalid
    cmp al, '7'
    ja .invalid
    sub al, '1'
    movzx eax, al
    mov [delete_hs_index], eax

    lea rcx, [delete_hs_confirm]
    call printf
    lea rcx, [char_format]
    lea rdx, [delete_hs_answer]
    call scanf
    cmp byte [delete_hs_answer], 'J'
    je .confirmed
    cmp byte [delete_hs_answer], 'j'
    jne delete_highscore_menu
.confirmed:
    cmp dword [delete_hs_index], 6
    je .all
    mov ecx, [delete_hs_index]
    call delete_one_highscore
    jmp delete_highscore_menu
.all:
    mov dword [delete_hs_index], 0
.all_loop:
    mov ecx, [delete_hs_index]
    call delete_one_highscore
    inc dword [delete_hs_index]
    cmp dword [delete_hs_index], 6
    jb .all_loop
    jmp delete_highscore_menu
.invalid:
    lea rcx, [error_message]
    call printf
    jmp delete_highscore_menu

; ECX = indeks 0..5. Tøm kun highscore-filen med fopen("w").
delete_one_highscore:
    sub rsp, 40
    lea rax, [delete_hs_paths]
    mov rcx, [rax + rcx*8]
    lea rdx, [write_mode]
    call fopen
    test rax, rax
    jz .failed
    mov rcx, rax
    call fclose
    lea rcx, [delete_hs_done]
    call printf
    jmp .return
.failed:
    lea rcx, [delete_hs_error]
    call printf
.return:
    add rsp, 40
    ret

show_highscore:

    cmp byte [log_type], 1
    je .wpx
	
	cmp byte [log_type], 2
    je .hf

    cmp byte [log_type], 3
    je .arrl_dx
	
	cmp byte [log_type], 4
    je .russian_dx

	cmp byte [log_type], 5
    je .cqww_dx
	
	cmp byte [log_type], 6
    je .sac_cw
  
    jmp menu_loop

.wpx:
    call wpx_highscore_menu
    jmp menu_loop
	
.hf:
    call hf_highscore_menu
    jmp menu_loop

.arrl_dx:
    call arrl_dx_highscore_menu
    jmp menu_loop
	
.russian_dx:
    call russian_dx_highscore_menu
    jmp menu_loop
	
.cqww_dx:
    call cqww_dx_highscore_menu
    jmp menu_loop
	
.sac_cw:
    call sac_cw_highscore_menu
    jmp menu_loop
	
create_cabrillo_menu:

    ; Fjern Enter efter menuvalg 5
    call getchar

    ; Beregn den aktuelle WPX-score
    call calculate_log_score

    ; Lav normal WPX Cabrillo
	lea rcx, [settings_callsign]
	lea rdx, [wpx_filename]
	mov r8d, [cabrillo_score]
	call create_cabrillo_wpx_cw

	; Lav facit WPX Cabrillo
    lea rcx, [settings_callsign]
    call create_facit_cabrillo_wpx_cw

    ; Check WPX Cabrillo mod facit
    call check_wpx_cabrillo

    jmp menu_loop
	
create_cabrillo_arrl_menu:

    ; Fjern Enter efter menuvalg
    call getchar

    ; Beregn ARRL DX-score
    call calculate_arrl_score
    mov [cabrillo_score], eax

    ; Lav Cabrillo-filen med kaldesignal fra Settings
    lea rcx, [settings_callsign]
    lea rdx, [arrl_cabrillo_log_filename]
    mov r8d, [cabrillo_score]
    call create_cabrillo_arrl_dx

    call create_facit_cabrillo_arrl_dx

    ; Check ARRL DX Cabrillo mod facit
    call check_arrl_dx_cabrillo

    jmp menu_loop

create_cabrillo_russian_menu:

    ; Fjern Enter efter menuvalg
    call getchar

    ; Beregn Russian DX-score
    call calculate_russian_score
    mov [cabrillo_score], eax

    ; Lav Russian DX Cabrillo-filen med kaldesignal fra Settings
    lea rcx, [settings_callsign]
    lea rdx, [russian_dx_log_filename]
    mov r8d, [cabrillo_score]
        call create_cabrillo_russian_dx

    ; Lav facit Russian DX Cabrillo
    call create_facit_cabrillo_russian_dx

    ; Check Russian DX Cabrillo mod facit
    call check_russian_dx_cabrillo

    jmp menu_loop
	
create_cabrillo_cqww_menu:

    ; Fjern Enter efter menuvalg
    call getchar

    ; Beregn CQ WW DX-score
    call calculate_cqww_score
    mov [cabrillo_score], eax

    ; Lav CQ WW DX Cabrillo-filen med kaldesignal fra Settings
    lea rcx, [settings_callsign]
    lea rdx, [cqww_dx_log_filename]
    mov r8d, [cabrillo_score]
    call create_cabrillo_cqww_dx

    ; Facit Cabrillo kun i CW-mode
    cmp byte [qso_mode], 2
    jne .cqww_cabrillo_done
		
    lea rcx, [settings_callsign]
    call create_facit_cabrillo_cqww_dx

.cqww_cabrillo_done:
    jmp menu_loop
	
create_cabrillo_sac_menu:

    ; Fjern Enter efter menuvalg
    call getchar

    ; Beregn SAC-score
    call calculate_sac_score
    mov [cabrillo_score], eax

    ; Lav SAC CW Cabrillo-filen med kaldesignal fra Settings
    lea rcx, [settings_callsign]
    lea rdx, [sac_cw_log_filename]
    mov r8d, [cabrillo_score]
    call create_cabrillo_sac

    ; SAC checker kun i CW-mode
    cmp byte [qso_mode], 2
    jne .sac_cabrillo_done

    ; Opret SAC facit-Cabrillo med kaldesignal fra Settings
    call create_facit_cabrillo_sac

    ; Kontroller SAC Cabrillo mod facit
    call check_sac_cw_cabrillo

.sac_cabrillo_done:
    jmp menu_loop
	
settings:

    ; Vis aktuelt kaldesignal
    lea rcx, [settings_callsign_display]
    lea rdx, [settings_callsign]
    call printf

    ; Vis Settings-menu
    lea rcx, [settings_menu]
    call printf

    ; Laes valg
    lea rcx, [char_format]
    lea rdx, [choice]
    call scanf

    ; 1 = Logtype
    cmp byte [choice], '1'
    je logtype_settings

	; 2 = Kaldesignal
	cmp byte [choice], '2'
	je callsign_settings

	; 3 = Navn
	cmp byte [choice], '3'
	je name_settings

	; 4 = E-mail
	cmp byte [choice], '4'
	je email_settings

	; 5 = Adresse
	cmp byte [choice], '5'
	je address_settings

	; 6 = Postnr.
	cmp byte [choice], '6'
	je zip_settings

	; 7 = By
	cmp byte [choice], '7'
	je city_settings
	
	; 8 = Power
	cmp byte [choice], '8'
	je power_settings

    ; 9 = Mode
    cmp byte [choice], '9'
    je mode_settings
	
	; h = HovedMenu
	cmp byte [choice], 'h'
	je menu_loop
	
	; w = WPM
    cmp byte [choice], 'w'
    je wpm_settings

    ; 0 = Tilbage
    cmp byte [choice], '0'
    je menu_loop

    ; De andre valg laver vi senere
    jmp settings
	
mode_settings:
    lea rcx, [mode_menu]
    call printf

    lea rcx, [char_format]
    lea rdx, [choice]
    call scanf

    ; 1 = RADIO
    cmp byte [choice], '1'
    je set_mode_radio

    ; 2 = CW
    cmp byte [choice], '2'
    je set_mode_cw

    ; 3 = CW + TEXT
    cmp byte [choice], '3'
    je set_mode_cw_text
	
	; 4 = TEXT
    cmp byte [choice], '4'
    je set_mode_text

    ; h = HovedMenu
    cmp byte [choice], 'h'
    je menu_loop

    ; 5 = Tilbage
    cmp byte [choice], '0'
    je settings
	
    jmp mode_settings

set_mode_radio:
    mov byte [qso_mode], 1
    call save_settings
    jmp mode_settings

set_mode_cw:
    mov byte [qso_mode], 2
    call save_settings
    jmp mode_settings

set_mode_cw_text:
    mov byte [qso_mode], 3
    call save_settings
    jmp mode_settings
	
set_mode_text:
    mov byte [qso_mode], 4
    call save_settings
    jmp mode_settings
	
wpm_settings:
    ; Fjern Enter efter 'w'
    call getchar

.wpm_loop:
    lea rcx, [wpm_menu]
    call printf

    lea rcx, [char_format]
    lea rdx, [choice]
    call scanf

    cmp byte [choice], '1'
    je set_wpm_15

    cmp byte [choice], '2'
    je set_wpm_20

    cmp byte [choice], '3'
    je set_wpm_25

    cmp byte [choice], '4'
    je set_wpm_30

    cmp byte [choice], '5'
    je set_wpm_35

    cmp byte [choice], '0'
    je settings

    jmp .wpm_loop


set_wpm_15:
    mov dword [settings_wpm], 15
    call save_settings
    jmp wpm_settings.wpm_loop

set_wpm_20:
    mov dword [settings_wpm], 20
    call save_settings
    jmp wpm_settings.wpm_loop

set_wpm_25:
    mov dword [settings_wpm], 25
    call save_settings
    jmp wpm_settings.wpm_loop

set_wpm_30:
    mov dword [settings_wpm], 30
    call save_settings
    jmp wpm_settings.wpm_loop

set_wpm_35:
    mov dword [settings_wpm], 35
    call save_settings
    jmp wpm_settings.wpm_loop
	
start_hf_search:
    call search_hf_log
    jmp menu_loop

select_show_log:

    ; 2 = HF Log
    cmp byte [log_type], 2
    je start_hf_show

    ; 3 = ARRL DX CW
    cmp byte [log_type], 3
    je start_arrl_show

    ; 4 = Russian DX Contest
    cmp byte [log_type], 4
    je start_russian_show

    ; 5 = CQ WW DX CW
    cmp byte [log_type], 5
    je start_cqww_show

    cmp byte [log_type], 6
    je show_sac_log

    ; Ellers WPX
    jmp show_wpx_log

start_arrl_show:
    call show_arrl_log
    jmp menu_loop

start_russian_show:
    call russian_dx_show_log
    jmp menu_loop

start_cqww_show:
    call cqww_dx_show_log
    jmp menu_loop

show_sac_log:
    call sac_cw_show_log
    jmp menu_loop

select_search_log:

    ; 2 = HF Log
    cmp byte [log_type], 2
    je start_hf_search

    ; 3 = ARRL DX CW
    cmp byte [log_type], 3
    je start_arrl_search

    ; 4 = Russian DX Contest
    cmp byte [log_type], 4
    je start_russian_search

    ; 5 = CQ WW DX CW
    cmp byte [log_type], 5
    je start_cqww_search

	; 6 = SAC CW
    cmp byte [log_type], 6
    je start_sac_search

    ; Ellers WPX
    jmp search_log

start_arrl_search:

    ; Fjern Enter efter menuvalg 3
    call getchar

    call search_arrl_log
    jmp menu_loop

start_russian_search:

    ; Fjern Enter efter menuvalg 3
    call getchar

    call russian_dx_search_log
    jmp menu_loop
	
start_cqww_search:

    ; Fjern Enter efter menuvalg 3
    call getchar

    call cqww_dx_search_log
    jmp menu_loop

start_sac_search:

    ; Fjern Enter efter menuvalg 3
    call getchar

    call sac_cw_search_log
    jmp menu_loop
	
start_hf_show:
    call show_hf_log
    jmp menu_loop
	


select_new_qso:

    ; CW (2) skal foerst vaelge traeningstid
    cmp byte [qso_mode], 2
    je cw_time_selection

    ; CW + TEXT (3) og TEXT (4)
    cmp byte [qso_mode], 3
    je training_mode

    cmp byte [qso_mode], 4
    je training_mode

    jmp radio_mode

cw_time_selection:
    ; Fjern Enter efter hovedmenuens valg 1
    call getchar

.show_menu:
    ; Vis faelles tidsvalgsmenu
    lea rcx, [cw_time_menu]
    call printf

    ; Laes ét tegn
    lea rcx, [char_format]
    lea rdx, [cw_time_choice]
    call scanf

   
    ; 0 = Tilbage
    cmp byte [cw_time_choice], '0'
    je menu_loop

    ; 1-5 = Gyldigt tidsvalg
    cmp byte [cw_time_choice], '1'
    jb .show_menu

    cmp byte [cw_time_choice], '5'
    ja .show_menu

    ; Gem valgt traeningstid i minutter
    cmp byte [cw_time_choice], '1'
    je .time_5

    cmp byte [cw_time_choice], '2'
    je .time_10

    cmp byte [cw_time_choice], '3'
    je .time_15

    cmp byte [cw_time_choice], '4'
    je .time_30

    ; Valg 5 = 60 minutter
    mov dword [cw_training_minutes], 60
    jmp cw_training_start_timer

.time_5:
    mov dword [cw_training_minutes], 5
    jmp cw_training_start_timer

.time_10:
    mov dword [cw_training_minutes], 10
    jmp cw_training_start_timer

.time_15:
    mov dword [cw_training_minutes], 15
    jmp cw_training_start_timer

.time_30:
    mov dword [cw_training_minutes], 30
    jmp cw_training_start_timer 

cw_training_start_timer:

    ; Hent aktuel tid i sekunder
    xor ecx, ecx
    call time

    ; Gem starttidspunkt
    mov [cw_training_start], rax

    ; Omregn minutter til sekunder
    mov eax, [cw_training_minutes]
    imul rax, rax, 60

    ; Beregn sluttidspunkt
    add rax, [cw_training_start]
    mov [cw_training_end], rax

    ; Start den valgte CW-traening
    jmp training_mode

training_mode:
    cmp byte [log_type], 1
    je start_wpx_training
	
	cmp byte [log_type], 2
    je start_hf_training

    cmp byte [log_type], 3
    je start_arrl_training
	
	cmp byte [log_type], 4
    je start_russian_training
	
    cmp byte [log_type], 5
    je start_cqww_training
	
    cmp byte [log_type], 6
    je start_sac_training

radio_mode:

    ; RADIO fortsaetter med normal logtype
    cmp byte [log_type], 2
    je start_hf_from_main

    cmp byte [log_type], 3
    je start_arrl_from_main

    cmp byte [log_type], 4
    je start_russian_from_main

    cmp byte [log_type], 5
    je start_cqww_from_main

    cmp byte [log_type], 6
    je start_sac_from_main

    jmp start_wpx_from_main


start_wpx_from_main:
    jmp new_log
	
start_arrl_from_main:
    ; Fjern Enter efter menuvalg 1
    call getchar

arrl_radio_loop:
    call arrl_dx_new_qso

    ; EAX = 0 betyder Empty CALL
    test eax, eax
    jz menu_loop

    ; Naeste QSO i RADIO
    jmp arrl_radio_loop

start_russian_from_main:
    ; Fjern Enter efter menuvalg 1
    call getchar

russian_radio_loop:
    call russian_dx_new_qso

    ; Empty CALL afslutter
    test eax, eax
    jz menu_loop

    ; Fortsaet med naeste QSO
    jmp russian_radio_loop

start_cqww_from_main:
    ; Fjern Enter efter menuvalg 1
    call getchar

cqww_radio_loop:
    call cqww_dx_new_qso

    ; EAX = 0 betyder Empty CALL
    test eax, eax
    jz menu_loop

    ; Start naeste QSO automatisk
    jmp cqww_radio_loop

start_sac_from_main:
    ; Fjern Enter efter menuvalg 1
    call getchar

sac_radio_loop:
    call sac_cw_new_qso

    ; EAX = 0 betyder Empty CALL
    test eax, eax
    jz menu_loop

    ; Start naeste QSO automatisk
    jmp sac_radio_loop

start_wpx_training:
    call getchar

    movzx ecx, byte [log_type]
    call qso_generate

    ; Gem det genererede CALL
    mov r12, rax

    ; MODE 3 = CW + TEXT
    cmp byte [qso_mode], 3
    je .show_text_and_cw

    ; MODE 4 = kun TEXT
    cmp byte [qso_mode], 4
    je .show_text_only

    ; MODE 2 = kun CW
    jmp .send_cw


	
.show_text_and_cw:
    lea rcx, [cw_text_call_format]
    mov rdx, r12
    call printf
    jmp .send_cw

.show_text_only:
    lea rcx, [cw_text_call_format]
    mov rdx, r12
    call printf
    jmp new_log_cw

.send_cw:
    mov rcx, r12
    call cw_send_text
    jmp new_log_cw

    jmp new_log_cw

start_hf_training:
    call getchar

hf_training_loop:
    ; Generer naeste HF-station
    movzx ecx, byte [log_type]
    call qso_generate
    mov r12, rax

    ; Send stationen til HF-loggen
    mov rcx, r12
    call hf_log

    ; Empty CALL = hovedmenu
    test eax, eax
    jz menu_loop

    ; CW (2) kontrollerer tiden
    cmp byte [qso_mode], 2
    je hf_check_training_time

    ; CW + TEXT (3) og TEXT (4) fortsaetter
    cmp byte [qso_mode], 3
    je hf_training_loop

    cmp byte [qso_mode], 4
    je hf_training_loop

    jmp menu_loop

hf_check_training_time:
    ; Hent aktuel tid
    xor ecx, ecx
    call time

    ; Er traeningstiden udloebet?
    cmp rax, [cw_training_end]
    jae menu_loop

    ; Der er stadig tid til naeste QSO
    jmp hf_training_loop

start_arrl_training:
    call getchar

arrl_training_loop:
    movzx ecx, byte [log_type]
    call qso_generate
    mov r12, rax

    call arrl_dx_new_qso

    ; EAX = 0 betyder Empty CALL
    test eax, eax
    jz menu_loop

    ; CW (2) kontrollerer tiden
    cmp byte [qso_mode], 2
    je arrl_check_training_time

    ; CW + TEXT (3) og TEXT (4) fortsaetter
    cmp byte [qso_mode], 3
    je arrl_training_loop

    cmp byte [qso_mode], 4
    je arrl_training_loop

    jmp menu_loop

arrl_check_training_time:
    ; Hent aktuel tid
    xor ecx, ecx
    call time

    ; Er traeningstiden udloebet?
    cmp rax, [cw_training_end]
    jae menu_loop

    ; Der er stadig tid til naeste QSO
    jmp arrl_training_loop

start_russian_training:
    call getchar

russian_training_loop:
    ; Generer naeste station
    movzx ecx, byte [log_type]
    call qso_generate
    mov r12, rax

    call russian_dx_new_qso

    ; EAX = 0 betyder Empty CALL
    test eax, eax
    jz menu_loop

    ; Fortsaet automatisk i CW + TEXT
    cmp byte [qso_mode], 3
    je russian_training_loop

    ; Fortsaet automatisk i TEXT
    cmp byte [qso_mode], 4
    je russian_training_loop

    ; Ren CW: kontroller traeningstiden
    cmp byte [qso_mode], 2
    je russian_check_training_time

    jmp menu_loop

russian_check_training_time:
    xor ecx, ecx
    call time

    cmp rax, [cw_training_end]
    jae menu_loop

    jmp russian_training_loop

start_cqww_training:
    call getchar
	
cqww_training_loop:
    ; Generer naeste station
    movzx ecx, byte [log_type]
    call qso_generate
    mov r12, rax

    call cqww_dx_new_qso

    ; EAX = 0 betyder Empty CALL
    test eax, eax
    jz menu_loop

    ; Fortsaet automatisk i CW + TEXT
    cmp byte [qso_mode], 3
    je cqww_training_loop

    ; Fortsaet automatisk i TEXT
    cmp byte [qso_mode], 4
    je cqww_training_loop

    ; Ren CW: kontroller traeningstiden
    cmp byte [qso_mode], 2
    je cqww_check_training_time

    jmp menu_loop

cqww_check_training_time:
    xor ecx, ecx
    call time

    cmp rax, [cw_training_end]
    jae menu_loop

    jmp cqww_training_loop

start_sac_training:
    call getchar

sac_training_loop:
    ; Generer naeste station
    movzx ecx, byte [log_type]
    call qso_generate
    mov r12, rax

    call sac_cw_new_qso

    ; EAX = 0 betyder Empty CALL
    test eax, eax
    jz menu_loop

    ; Fortsaet automatisk i CW + TEXT
    cmp byte [qso_mode], 3
    je sac_training_loop

    ; Fortsaet automatisk i TEXT
    cmp byte [qso_mode], 4
    je sac_training_loop

    ; Ren CW: kontroller traeningstiden
    cmp byte [qso_mode], 2
    je sac_check_training_time

    jmp menu_loop

sac_check_training_time:
    xor ecx, ecx
    call time

    cmp rax, [cw_training_end]
    jae menu_loop

    jmp sac_training_loop

print_log_settings:
    lea rcx, [print_log_menu]
    call printf

    ; Laes valg
    lea rcx, [char_format]
    lea rdx, [choice]
    call scanf

    ; 1 = ADIF
    cmp byte [choice], '1'
    je print_adif

    ; 2 = Cabrillo
    cmp byte [choice], '2'
    je select_cabrillo
	
    ; h = HovedMenu
    cmp byte [choice], 'h'
    je menu_loop

    ; 0 = Tilbage
    cmp byte [choice], '0'
    je menu_loop

    ; Ugyldigt valg - vis menuen igen
    jmp print_log_settings

select_cabrillo:

    cmp byte [log_type], 3
    je create_cabrillo_arrl_menu

    cmp byte [log_type], 4
    je create_cabrillo_russian_menu

    cmp byte [log_type], 5
    je create_cabrillo_cqww_menu
	
	cmp byte [log_type], 6
    je create_cabrillo_sac_menu

    ; Foreloebig WPX
    jmp create_cabrillo_menu
	
print_adif:
    call create_adif
    jmp print_log_settings




start_new_hf_logfile:
    call new_hf_logfile
    jmp menu_loop
	
select_new_logfile:

    ; 2 = HF Log
    cmp byte [log_type], 2
    je start_new_hf_logfile

    ; 3 = ARRL DX CW
    cmp byte [log_type], 3
    je start_new_arrl_logfile

    ; 4 = Russian DX Contest
    cmp byte [log_type], 4
    je start_new_russian_logfile

    ; 5 = CQ WW DX CW
    cmp byte [log_type], 5
    je start_new_cqww_logfile

    ; 6 = SAC CW
    cmp byte [log_type], 6
    je start_new_sac_logfile

    ; Ellers WPX
    jmp new_logfile
	

start_new_cqww_logfile:

    call cqww_dx_new_log
    jmp menu_loop

start_hf_from_main:
    call getchar

hf_radio_loop:
    call hf_log
    test eax, eax
    jz menu_loop
    jmp hf_radio_loop
	
start_new_russian_logfile:
    call russian_dx_new_log
    jmp menu_loop

start_new_arrl_logfile:

    ; Fjern Enter efter menuvalg 4
    call getchar

    call start_new_arrl_log
    jmp menu_loop

start_new_sac_logfile:

    ; Fjern Enter efter menuvalg 4
    call getchar

    call sac_cw_new_log
    jmp menu_loop

load_logtype:
    push rbx
    sub rsp, 32

    ; Standard er WPX
    mov byte [log_type], 1

    ; Aabn settings.txt
    lea rcx, [settings_wpx_filename]
    lea rdx, [read_mode]
    call fopen

    ; Findes filen ikke, behold WPX
    test rax, rax
    jz .done

    mov rbx, rax

    ; Laes LOGTYPE
    mov rcx, rbx
    lea rdx, [settings_logtype_read_format]
    lea r8, [settings_logtype_temp]
    call fscanf

	; Laes MODE
	mov rcx, rbx
	lea rdx, [settings_mode_read_format]
	lea r8, [settings_mode_temp]
	call fscanf

	cmp dword [settings_mode_temp], 2
	je .set_mode_cw

	cmp dword [settings_mode_temp], 3
	je .set_mode_cw_text

	cmp dword [settings_mode_temp], 4
	je .set_mode_text

	mov byte [qso_mode], 1
	jmp .mode_done

.set_mode_cw:
    mov byte [qso_mode], 2
    jmp .mode_done

.set_mode_cw_text:
    mov byte [qso_mode], 3
    jmp .mode_done

.set_mode_text:
    mov byte [qso_mode], 4

.mode_done:

.mode_done:

	; Laes CALLSIGN
	mov rcx, rbx
	lea rdx, [settings_callsign_read_format]
	lea r8, [settings_callsign]
	call fscanf

	; Laes navn
	mov rcx, rbx
	lea rdx, [settings_name_read_format]
	lea r8, [settings_name]
	call fscanf

	; Laes e-mail
	mov rcx, rbx
	lea rdx, [settings_email_read_format]
	lea r8, [settings_email]
	call fscanf

	; Laes adresse
	mov rcx, rbx
	lea rdx, [settings_address_read_format]
	lea r8, [settings_address]
	call fscanf

	; Laes postnr.
	mov rcx, rbx
	lea rdx, [settings_zip_read_format]
	lea r8, [settings_zip]
	call fscanf

	; Laes by
	mov rcx, rbx
	lea rdx, [settings_city_read_format]
	lea r8, [settings_city]
	call fscanf

	; Laes Power
	mov rcx, rbx
	lea rdx, [settings_power_read_format]
	lea r8, [settings_power]
	call fscanf

	; Laes ARRL Power
	mov rcx, rbx
	lea rdx, [settings_arrl_power_read_format]
	lea r8, [settings_arrl_power]
	call fscanf

	; Laes WPM
	mov rcx, rbx
	lea rdx, [settings_wpm_read_format]
	lea r8, [settings_wpm]
	call fscanf

	; Luk filen
	mov rcx, rbx
	call fclose

    ; Accepter 1, 2, 3 eller 4
        
    cmp dword [settings_logtype_temp], 1
	je .set_wpx

	cmp dword [settings_logtype_temp], 2
	je .set_hf

	cmp dword [settings_logtype_temp], 3
	je .set_arrl

	cmp dword [settings_logtype_temp], 4
	je .set_russian

	cmp dword [settings_logtype_temp], 5
	je .set_cqww

	cmp dword [settings_logtype_temp], 6
	je .set_sac

	jmp .done

.set_wpx:
    mov byte [log_type], 1
    jmp .done

.set_hf:
    mov byte [log_type], 2
    jmp .done

.set_arrl:
    mov byte [log_type], 3
    jmp .done

.set_russian:
    mov byte [log_type], 4
    jmp .done

.set_cqww:
    mov byte [log_type], 5
    jmp .done

.set_sac:
    mov byte [log_type], 6
    jmp .done


.done:
    add rsp, 32
    pop rbx
    ret
save_settings:
    push rbx
    sub rsp, 32

    ; Aabn settings.txt til skrivning
    lea rcx, [settings_wpx_filename]
    lea rdx, [settings_write_mode]
    call fopen

    test rax, rax
    jz .done

    mov rbx, rax

    ; Skriv log_type som 1 eller 2
	mov rcx, rbx
	lea rdx, [settings_logtype_format]
	movzx r8d, byte [log_type]
	call fprintf

	; Skriv QSO mode
    mov rcx, rbx
    lea rdx, [settings_mode_format]
    movzx r8d, byte [qso_mode]
    call fprintf

	; Skriv kaldesignal
	mov rcx, rbx
	lea rdx, [settings_callsign_format]
	lea r8, [settings_callsign]
	call fprintf

	; Skriv navn
	mov rcx, rbx
	lea rdx, [settings_name_format]
	lea r8, [settings_name]
	call fprintf

	; Skriv e-mail
	mov rcx, rbx
	lea rdx, [settings_email_format]
	lea r8, [settings_email]
	call fprintf

	; Skriv adresse
	mov rcx, rbx
	lea rdx, [settings_address_format]
	lea r8, [settings_address]
	call fprintf

	; Skriv postnr.
	mov rcx, rbx
	lea rdx, [settings_zip_format]
	lea r8, [settings_zip]
	call fprintf

	; Skriv by
	mov rcx, rbx
	lea rdx, [settings_city_format]
	lea r8, [settings_city]
	call fprintf

	; Skriv Power
	mov rcx, rbx
	lea rdx, [settings_power_format]
	lea r8, [settings_power]
	call fprintf

    ; Skriv ARRL Power
    mov rcx, rbx
    lea rdx, [settings_arrl_power_format]
    lea r8, [settings_arrl_power]
    call fprintf

    ; Skriv WPM
    mov rcx, rbx
    lea rdx, [settings_wpm_format]
    mov r8d, [settings_wpm]
    call fprintf
	
	; Luk settings.txt
	mov rcx, rbx
	call fclose

.done:
    add rsp, 32
    pop rbx
    ret	
	
callsign_settings:

    ; Fjern Enter efter menuvalg 2
    call getchar

    ; Vis overskrift
    lea rcx, [callsign_settings_title]
    call printf

    ; Spoerg efter kaldesignal
    lea rcx, [callsign_input_prompt]
    call printf

    ; Laes kaldesignalet
    lea rcx, [settings_callsign]
    mov edx, 32
    call gets_s

    ; Lav det til store bogstaver
    lea rcx, [settings_callsign]
    mov edx, 32
    call _strupr_s

    ; Gem hele settings.txt
    call save_settings

    lea rcx, [callsign_saved_text]
    call printf

    jmp settings
	
name_settings:

    ; Fjern Enter efter menuvalg 3
    call getchar

    ; Vis overskrift
    lea rcx, [name_settings_title]
    call printf

    ; Spoerg efter navn
    lea rcx, [name_input_prompt]
    call printf

    ; Laes hele navnet, inklusive mellemrum
    lea rcx, [settings_name]
    mov edx, 64
    call gets_s

    ; Gem hele settings.txt
    call save_settings

    lea rcx, [name_saved_text]
    call printf

    jmp settings

email_settings:

    ; Fjern Enter efter menuvalg 4
    call getchar

    ; Vis overskrift
    lea rcx, [email_settings_title]
    call printf

    ; Spoerg efter e-mail
    lea rcx, [email_input_prompt]
    call printf

    ; Laes e-mail
    lea rcx, [settings_email]
    mov edx, 128
    call gets_s

    ; Gem hele settings.txt
    call save_settings

    lea rcx, [email_saved_text]
    call printf

    jmp settings

address_settings:

    ; Fjern Enter efter menuvalg 5
    call getchar

    ; Vis overskrift
    lea rcx, [address_settings_title]
    call printf

    ; Spoerg efter adresse
    lea rcx, [address_input_prompt]
    call printf

    ; Laes hele adressen, inklusive mellemrum
    lea rcx, [settings_address]
    mov edx, 128
    call gets_s

    ; Gem hele settings.txt
    call save_settings

    lea rcx, [address_saved_text]
    call printf

    jmp settings

zip_settings:
    call getchar

    lea rcx, [zip_settings_title]
    call printf

    lea rcx, [zip_input_prompt]
    call printf

    lea rcx, [settings_zip]
    mov edx, 16
    call gets_s

    call save_settings

    lea rcx, [zip_saved_text]
    call printf

    jmp settings


city_settings:
    call getchar

    lea rcx, [city_settings_title]
    call printf

    lea rcx, [city_input_prompt]
    call printf

    lea rcx, [settings_city]
    mov edx, 64
    call gets_s

    call save_settings

    lea rcx, [city_saved_text]
    call printf

    jmp settings

arrl_power_settings:
    call getchar

    lea rcx, [settings_arrl_power_prompt]
    call printf

    lea rcx, [settings_arrl_power]
    mov edx, 8
    call gets_s

    call save_settings

    jmp settings

power_settings:
    call getchar

    lea rcx, [power_menu]
    call printf

    lea rcx, [char_format]
    lea rdx, [choice]
    call scanf

    ; 1 = QRP
    cmp byte [choice], '1'
    je set_power_qrp

    ; 2 = LOW
    cmp byte [choice], '2'
    je set_power_low
	
    ; 3 = HIGH
	cmp byte [choice], '3'
	je set_power_high

	; 4 = ARRL Power
	cmp byte [choice], '4'
	je arrl_power_settings
	
	; h = HovedMenu
    cmp byte [choice], 'h'
    je menu_loop

	; 0 = Tilbage
	cmp byte [choice], '0'
	je settings

    jmp power_settings

set_power_qrp:
    lea rcx, [settings_power]
    mov edx, 16
    lea r8, [power_qrp]
    call strcpy_s

    call save_settings

    lea rcx, [power_saved_text]
    call printf

    jmp power_settings

set_power_low:
    lea rcx, [settings_power]
    mov edx, 16
    lea r8, [power_low]
    call strcpy_s

    call save_settings

    lea rcx, [power_saved_text]
    call printf

    jmp power_settings

set_power_high:
    lea rcx, [settings_power]
    mov edx, 16
    lea r8, [power_high]
    call strcpy_s

    call save_settings

    lea rcx, [power_saved_text]
    call printf

    jmp power_settings

logtype_settings:
    lea rcx, [logtype_menu]
    call printf

    lea rcx, [char_format]
    lea rdx, [choice]
    call scanf

    ; 1 = WPX Contest
    cmp byte [choice], '1'
    je set_logtype_wpx

    ; 2 = HF Log
    cmp byte [choice], '2'
    je set_logtype_hf

    ; 3 = ARRL DX CW
    cmp byte [choice], '3'
    je set_logtype_arrl

	; 4 = Russian DX Contest
	cmp byte [choice], '4'
	je set_logtype_russian

	; 5 = CQ WW DX CW
	cmp byte [choice], '5'
	je set_logtype_cqww

	; 6 = SAC CW
	cmp byte [choice], '6'
	je set_logtype_sac

	; h = HovedMenu
	cmp byte [choice], 'h'
	je menu_loop

	; 0 = Tilbage
	cmp byte [choice], '0'
	je settings

	jmp logtype_settings


set_logtype_wpx:
    mov byte [log_type], 1
    call save_settings

    lea rcx, [logtype_wpx_text]
    call printf

    jmp logtype_settings


set_logtype_hf:
    mov byte [log_type], 2
    call save_settings

    lea rcx, [logtype_hf_text]
    call printf

    jmp logtype_settings
	
set_logtype_arrl:
    mov byte [log_type], 3
    call save_settings
    lea rcx, [logtype_arrl_text]
    call printf
    jmp logtype_settings

set_logtype_russian:
    mov byte [log_type], 4
    call save_settings
    lea rcx, [logtype_russian_text]
    call printf
    jmp logtype_settings

set_logtype_cqww:
    mov byte [log_type], 5
    call save_settings
    lea rcx, [logtype_cqww_text]
    call printf
    jmp logtype_settings

set_logtype_sac:
    mov byte [log_type], 6
    call save_settings
    lea rcx, [logtype_sac_text]
    call printf
    jmp logtype_settings	

confirm_exit:
    lea rcx, [exit_question]
    call printf

    lea rcx, [char_format]
    lea rdx, [exit_choice]
    call scanf

    mov al, [exit_choice]

    cmp al, 'J'
    je exit_program

    cmp al, 'j'
    je exit_program

    cmp al, 'N'
    je menu_loop

    cmp al, 'n'
    je menu_loop

    ; Andet svar - spoerg igen
    jmp confirm_exit

new_log_cw:

    ; Point for den aktuelle QSO starter paa 0
    mov dword [qso_point], 0

    ; Denne QSO er ikke en dupe fra starten
    mov dword [dupe_flag], 0

    ; QSO'en er endnu ikke en ny WPX-multiplier
    call reset_wpx_multiplier

    ; CW-mode har allerede fjernet Enter
    ; Fortsaet direkte til indtastning af CALL
    jmp read_call
	
new_log:

    ; Point for den aktuelle QSO starter paa 0
    mov dword [qso_point], 0
	
    ; Denne QSO er ikke en dupe fra starten
    mov dword [dupe_flag], 0

	; QSO'en er endnu ikke en ny WPX-multiplier
	call reset_wpx_multiplier	
    
	; Fjern Enter efter menuvalget
    call getchar

read_call:

    lea rcx, [text_prompt]
    call printf

    lea rcx, [log_text]
    mov edx, 256
    call gets_s

    ; Empty CALL i alle fire modes
    cmp byte [qso_mode], 1
    je .check_empty_call

    cmp byte [qso_mode], 2
    je .check_empty_call

    cmp byte [qso_mode], 3
    je .check_empty_call

    cmp byte [qso_mode], 4
    jne .check_call

.check_empty_call:
    cmp byte [log_text], 0
    je menu_loop

.check_call:
    ; Start ved første tegn
    lea rax, [log_text]

    ; 0 = endnu ikke fundet
    xor r10d, r10d        ; bogstav
    xor r11d, r11d        ; tal

check_call_char:

    ; Er vi nået til slutningen?
    cmp byte [rax], 0
    je check_call_result

    ; Test om tegnet er 0-9
    cmp byte [rax], '0'
    jb check_letter

    cmp byte [rax], '9'
    ja check_letter

    ; Vi fandt et tal
    mov r11b, 1
    jmp next_call_char

check_letter:

    ; Test A-Z
    cmp byte [rax], 'A'
    jb check_lowercase

    cmp byte [rax], 'Z'
    jbe found_letter

check_lowercase:

    ; Test a-z
    cmp byte [rax], 'a'
    jb next_call_char

    cmp byte [rax], 'z'
    ja next_call_char

found_letter:
    ; Vi fandt et bogstav
    mov r10b, 1

next_call_char:
    inc rax
    jmp check_call_char

check_call_result:

    ; Fandt vi et bogstav?
    cmp r10b, 1
    jne bad_call

    ; Fandt vi et tal?
    cmp r11b, 1
    jne bad_call

    jmp call_ok

bad_call:
    lea rcx, [call_error]
    call printf
    jmp read_call

call_ok:

      ; Lav kaldesignalet til store bogstaver
    lea rcx, [log_text]
    mov edx, 256
    call _strupr_s

    ; Find land og kontinent
	lea rcx, [log_text]
	call lookup_country

   
    
	lea rcx, [cty_result_format]
	lea rdx, [cty_match_entity]
	lea r8,  [cty_match_continent]
	call printf
	
read_band:

    ; Spørg efter bånd
    lea rcx, [band_prompt]
    call printf

    lea rcx, [band_text]
    mov edx, 16
    call gets_s

    ; Kontroller om det er et gyldigt WPX-baand
    lea rcx, [band_text]
	call is_wpx_band
    test eax, eax
    jnz band_ok

    ; Ugyldigt WPX-baand
    lea rcx, [band_error]
    call printf
    jmp read_band
	
band_ok:
	
	; Åbn log.txt og se om kaldesignalet allerede findes
    lea rcx, [wpx_filename]
    lea rdx, [read_mode]
    call fopen

    ; Hvis log.txt ikke findes endnu, fortsæt normalt
        test rax, rax
    jz dupe_no_file

    mov rbx, rax
    jmp dupe_next_line       ; <-- TILFØJ DENNE

dupe_no_file:
    ; Ingen log.txt endnu, saa der er ingen DUPE
    ; Spring fclose over
    jmp calculate_points

dupe_next_line:

    ; Læs en linje fra log.txt
    lea rcx, [dupe_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    ; Slut på filen?
    test rax, rax
    jz dupe_not_found

    ; Søg efter kaldesignalet i linjen
    lea rcx, [dupe_buffer]
    lea rdx, [log_text]
    call strstr

    ; Call ikke fundet - prøv næste linje
    test rax, rax
    jz dupe_next_line

    ; Call blev fundet.
    ; Se nu om båndet også findes på samme linje.
    lea rcx, [dupe_buffer]
    lea rdx, [band_text]
    call strstr

    ; Bånd ikke fundet på denne linje
    test rax, rax
    jz dupe_next_line

    ; Både call og bånd blev fundet
    mov rcx, rbx
    call fclose

    ; Husk at denne QSO er en dupe
    mov dword [dupe_flag], 1

    lea rcx, [dupe_message]
    call printf

    jmp send_wpx_exchange

dupe_not_found:

    ; Luk log.txt
    mov rcx, rbx
    call fclose

calculate_points:
    call wpx_calculate_qso_points

send_wpx_exchange:

    ; MODE 2 = CW
    cmp byte [qso_mode], 2
    je .send_cw

    ; MODE 3 = CW + TEXT
    cmp byte [qso_mode], 3
    je .send_cw_text

    ; MODE 4 = kun TEXT
    cmp byte [qso_mode], 4
    je .send_text_only

    jmp read_rst

.send_cw_text:
    lea rcx, [cw_text_call_format]
    lea rdx, [wpx_exchange]
    call printf
    jmp .send_cw

.send_text_only:
    lea rcx, [cw_text_call_format]
    lea rdx, [wpx_exchange]
    call printf
    jmp read_rst

.send_cw:
    lea rcx, [wpx_exchange]
    call cw_send_text
    jmp read_rst

read_rst:

    ; Spørg efter RST
    lea rcx, [rst_prompt]
    call printf

    lea rcx, [rst_text]
    mov edx, 8
    call gets_s

    ; Første tegn skal være et tal
    cmp byte [rst_text], '0'
    jb bad_rst
    cmp byte [rst_text], '9'
    ja bad_rst

    ; Andet tegn skal være et tal
    cmp byte [rst_text + 1], '0'
    jb bad_rst
    cmp byte [rst_text + 1], '9'
    ja bad_rst

    ; Tredje tegn skal være et tal
    cmp byte [rst_text + 2], '0'
    jb bad_rst
    cmp byte [rst_text + 2], '9'
    ja bad_rst

    ; Der må ikke være flere end tre cifre
    cmp byte [rst_text + 3], 0
    jne bad_rst

    jmp rst_ok

bad_rst:
    lea rcx, [rst_error]
    call printf
    jmp read_rst

rst_ok:

	
read_qsonr:

    lea rcx, [qsonr_prompt]
    call printf

    lea rcx, [qsonr_text]
    mov edx, 32
    call gets_s

    lea rax, [qsonr_text]
    xor ecx, ecx          ; tæller antal cifre

    ; Tomt input er ikke tilladt
    cmp byte [rax], 0
    je bad_qsonr

check_qsonr_char:

    ; Slut på teksten?
    cmp byte [rax], 0
    je qsonr_ok

    ; Skal være 0-9
    cmp byte [rax], '0'
    jb bad_qsonr

    cmp byte [rax], '9'
    ja bad_qsonr

    ; Ét ciffer mere
    inc ecx

    ; Mere end 5 cifre?
    cmp ecx, 5
    ja bad_qsonr

    inc rax
    jmp check_qsonr_char

bad_qsonr:
    lea rcx, [qsonr_error]
    call printf
    jmp read_qsonr

qsonr_ok:

   

    ; Registrer kun WPX-multiplier for en QSO,
    ; der ikke er DUPE
    cmp dword [dupe_flag], 1
    je wpx_check_done

    lea rcx, [log_text]
    call check_wpx_call

wpx_check_done:

    ; fopen("log.txt", "a")
    lea rcx, [wpx_filename]
    lea rdx, [append_mode]
    call fopen

    ; fopen returnerer filens adresse i RAX
    test rax, rax
    jz open_error

    ; Gem filens adresse i RBX
    mov rbx, rax

    ; fprintf(fil, format, tid, baand, call, sendt_nr, modtaget_nr)



	mov rcx, rbx
    ; fprintf(fil, format, tid, baand, call, RST, sendt_nr, modtaget_nr)

    mov rcx, rbx
    ; Vælg normalt format eller DUPE-format
    ; DUPE har foerste prioritet
	cmp dword [dupe_flag], 1
	je use_dupe_format

	; Er dette et nyt WPX-prefix?
	call is_wpx_multiplier
	cmp eax, 1
	je use_mult_format

	; Almindelig QSO
	lea rdx, [file_format]
	jmp format_ready

use_mult_format:
    lea rdx, [mult_file_format]
    jmp format_ready

use_dupe_format:
    lea rdx, [dupe_file_format]

format_ready:

    ; 3. argument = tid
    lea r8, [time_buffer]

    ; 4. argument = baand
    lea r9, [band_text]

    ; 5. argument = mode (CW)
    lea rax, [mode_cw]
    mov [rsp + 32], rax

    ; 6. argument = kaldesignal
    lea rax, [log_text]
    mov [rsp + 40], rax

    ; 7. argument = RST
    lea rax, [rst_text]
    mov [rsp + 48], rax

    ; 8. argument = vores automatiske QSO-nummer
    mov eax, [qso_number]
    mov [rsp + 56], rax

    ; 9. argument = modtaget QSO-nummer
    lea rax, [qsonr_text]
    mov [rsp + 64], rax
	
	mov eax, [qso_point]
    mov [rsp + 72], rax


    call fprintf
	

    ; Luk log.txt
    mov rcx, rbx
    call fclose

	; Gem kun facit i traeningsmode
	cmp byte [qso_mode], 1
	je .skip_facit
    call save_wpx_facit

.skip_facit:

    ; Næste QSO-nummer
    inc dword [qso_number]

    ; Åbn qsonr.txt til skrivning
    lea rcx, [qsonr_wpx_filename]
    lea rdx, [write_mode]
    call fopen

    test rax, rax
    jz qsonr_save_done

    mov rbx, rax

    ; Gem næste QSO-nummer
    mov rcx, rbx
    lea rdx, [qsonr_format]
    mov r8d, [qso_number]
    call fprintf

    ; Luk qsonr.txt
    mov rcx, rbx
    call fclose
	
qsonr_save_done:


    ; RADIO fortsaetter ogsaa til naeste QSO
    cmp byte [qso_mode], 1
    je new_log_cw

    ; CW kontrollerer tiden foer naeste QSO
    cmp byte [qso_mode], 2
    je wpx_check_training_time

    cmp byte [qso_mode], 3
    je wpx_next_training_qso

    cmp byte [qso_mode], 4
    je wpx_next_training_qso

    ; Ren CW venter vi med
    jmp menu_loop


wpx_check_training_time:

    ; Hent aktuel tid
    xor ecx, ecx
    call time

    ; Sammenlign med sluttid i WPX-modulet
    mov rdx, [cw_training_end]
    call wpx_training_time_expired
    test al, al
    jnz menu_loop

    ; Der er stadig tid til naeste QSO
    jmp wpx_next_training_qso

wpx_next_training_qso:

    ; Generer naeste station
    movzx ecx, byte [log_type]
    call qso_generate

    ; Gem genereret CALL
    mov r12, rax

    ; CW (2) - kun morse
    cmp byte [qso_mode], 2
    je .send_cw_only

    ; CW + TEXT (3)
    cmp byte [qso_mode], 3
    je .show_cw_text

    ; TEXT (4)
    lea rcx, [cw_text_call_format]
    mov rdx, r12
    call printf
    jmp new_log_cw

.send_cw_only:
    mov rcx, r12
    call cw_send_text
    jmp new_log_cw

.show_cw_text:
    lea rcx, [cw_text_call_format]
    mov rdx, r12
    call printf

    mov rcx, r12
    call cw_send_text

    jmp new_log_cw


open_error:

    lea rcx, [file_error]
    call printf
    jmp exit_program

new_logfile:


    ; Fjern Enter efter menuvalget
    call getchar

    ; Vis advarsel
    lea rcx, [newlog_warning]
    call printf

    lea rcx, [newlog_prompt]
    call printf

    ; Læs J eller N
    lea rcx, [newlog_answer]
    mov edx, 8
    call gets_s

    ; Accepter stort J
    cmp byte [newlog_answer], 'J'
    je confirm_new_log

    ; Accepter lille j
    cmp byte [newlog_answer], 'j'
    je confirm_new_log

    ; Alt andet betyder: afbryd
    jmp menu_loop


confirm_new_log:

    ; Her begynder din eksisterende kode
    ; som tømmer log.txt
    lea rcx, [wpx_filename]
    lea rdx, [write_mode]
    call fopen

    test rax, rax
    jz open_error

    mov rbx, rax
    mov rcx, rbx
    call fclose

    ; Start QSO-nummer forfra ved 1
	mov dword [qso_number], 1

	; Start WPX-multiplierne forfra
	call reset_wpx_prefixes

    ; Gem 1 i qsonr.txt
    lea rcx, [qsonr_wpx_filename]
    lea rdx, [write_mode]
    call fopen

    test rax, rax
    jz open_error

    mov rbx, rax

    mov rcx, rbx
    lea rdx, [qsonr_format]
    mov r8d, 1
    call fprintf

    mov rcx, rbx
    call fclose

    ; Toem WPX-facitloggen
    lea rcx, [facit_wpx_filename]
    lea rdx, [write_mode]
    call fopen

    test rax, rax
    jz open_error

    mov rbx, rax
    mov rcx, rbx
    call fclose

    jmp menu_loop

calculate_log_score:

    push rbx
    sub rsp, 32

    ; Start forfra
    mov dword [qso_points], 0
    call reset_wpx_mult_count

    ; Aabn log.txt til laesning
    lea rcx, [wpx_filename]
    lea rdx, [read_mode]
    call fopen

    ; Hvis loggen ikke findes, er scoren 0
    test rax, rax
    jz calculate_log_score_zero

    mov rbx, rax

calculate_log_score_next:

    ; Laes naeste linje
    lea rcx, [read_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    ; Slut paa filen?
    test rax, rax
    jz calculate_log_score_finished

    ; Find teksten " point" i loglinjen
    lea rcx, [read_buffer]
    lea rdx, [point_text]
    call strstr

    ; Hvis " point" ikke blev fundet, gaa videre
    test rax, rax
    jz calculate_log_score_point_done

    ; Tegnet lige foer " point" er pointtallet
    movzx eax, byte [rax - 1]

    ; ASCII-ciffer til tal
    sub eax, '0'

    ; Laeg point til totalen
    add dword [qso_points], eax

calculate_log_score_point_done:

    ; Optael WPX-multiplier paa denne linje
    lea rcx, [read_buffer]
    call count_wpx_multiplier

    ; Laes naeste QSO
    jmp calculate_log_score_next
	
	calculate_log_score_finished:

    ; Luk log.txt
    mov rcx, rbx
    call fclose

    ; Beregn WPX-score
    mov ecx, [qso_points]
    call calculate_wpx_score

       mov [cabrillo_score], eax

    add rsp, 32
    pop rbx
    ret

calculate_log_score_zero:

    xor eax, eax
    mov [cabrillo_score], eax

    add rsp, 32
    pop rbx
    ret
	
show_wpx_log:

    mov dword [qso_count], 0
    mov dword [dupe_count], 0
    mov dword [qso_points], 0
    call reset_wpx_mult_count
    
    ; fopen("log.txt", "r")
    lea rcx, [wpx_filename]
    lea rdx, [read_mode]
    call fopen

        test rax, rax
    jz show_log_empty

    mov rbx, rax
    jmp read_next_line

show_log_empty:
    lea rcx, [no_results]
    call printf
    jmp menu_loop

read_next_line:

    ; fgets(read_buffer, 256, fil)
    lea rcx, [read_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    ; RAX = 0 betyder slut på filen
    test rax, rax
    jz finished_reading

	inc dword [qso_count]
	lea rcx, [read_buffer]
    lea rdx, [dupe_text]
    call strstr

    test rax, rax
    jz not_a_dupe

    inc dword [dupe_count]

not_a_dupe:

    ; Optael WPX-multiplier
	lea rcx, [read_buffer]
	call count_wpx_multiplier

    ; Find teksten " point" i loglinjen
	lea rcx, [read_buffer]
	lea rdx, [point_text]
	call strstr

	; Hvis " point" ikke blev fundet, spring over
	test rax, rax
	jz point_done

	; Tegnet lige foer " point" er pointtallet
	movzx eax, byte [rax - 1]

	; Lav ASCII-ciffer om til tal
	sub eax, '0'

	; Laeg point til totalen
	add dword [qso_points], eax

point_done:

    ; Vis den læste linje
    lea rcx, [display_format]
    lea rdx, [read_buffer]
    call printf

    ; Læs næste linje
    jmp read_next_line

finished_reading:

    lea rcx, [qso_count_format]
    mov edx, [qso_count]
    call printf

    lea rcx, [dupe_count_format]
    mov edx, [dupe_count]
    call printf
	
    mov eax, [qso_count]
    sub eax, [dupe_count]

    lea rcx, [valid_count_format]
    mov edx, eax
    call printf
	
    lea rcx, [points_format]
    mov edx, [qso_points]
    call printf

	call get_wpx_mult_count

	lea rcx, [mult_count_format]
	mov edx, eax
	call printf

    ; Beregn WPX-score
	mov ecx, [qso_points]
	call calculate_wpx_score

    ; Vis WPX-score
    lea rcx, [wpx_score_format]
    mov edx, eax
    call printf

    mov rcx, rbx
    call fclose

    jmp menu_loop
search_log:

    ; Nulstil antal fund
    xor r12d, r12d

    lea rcx, [search_prompt]
    call printf

    ; Fjern Enter efter scanf
    call getchar

    ; Læs søgeordet
	lea rcx, [search_text]
	mov edx, 256
	call gets_s

	; Gør søgeordet til små bogstaver
	lea rcx, [search_text]
	mov edx, 256
	call _strlwr_s

      ; Åbn log.txt til læsning
    lea rcx, [wpx_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz open_error

    mov rbx, rax


search_next_line:

    ; Læs næste linje
    lea rcx, [read_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    ; Slut på filen?
    test rax, rax
    jz search_finished

   ; Kopier originalen
	lea rcx, [search_buffer]
	mov edx, 256
	lea r8, [read_buffer]
	call strcpy_s

	; Gør kopien til små bogstaver
	lea rcx, [search_buffer]
	mov edx, 256
	call _strlwr_s

	; Søg i kopien
	lea rcx, [search_buffer]
	lea rdx, [search_text]
	call strstr

    ; RAX = 0 hvis søgeordet ikke blev fundet
    test rax, rax
    jz search_next_line

    ; Fundet! Vis hele linjen
	inc r12d
    lea rcx, [display_format]
    lea rdx, [read_buffer]
    call printf


    jmp search_next_line


search_finished:

    mov rcx, rbx
    call fclose

    ; Blev mindst én linje fundet?
    cmp r12d, 0
    je no_search_results

    ; Vis antal fundne logposter
    lea rcx, [results_message]
    mov edx, r12d
    call printf

    jmp menu_loop


no_search_results:

    lea rcx, [no_results]
    call printf

    jmp menu_loop

search_done:
    jmp menu_loop

lookup_country:

    push rbx
    push rsi
    sub rsp, 40

    mov rsi, rcx

    ; Intet land fundet endnu
    mov byte [cty_match_entity], 0
    mov dword [cty_current_cq_zone], 0
    mov dword [cty_match_cq_zone], 0
		
   ; Intet kontinent fundet endnu
	mov byte [cty_match_continent], 0
   

    ; Aabn cty.dat
    lea rcx, [cty_wpx_filename]
    lea rdx, [read_mode]
    call fopen

    ; Kunne filen ikke aabnes?
    test rax, rax
    jz lookup_country_done

    ; Gem filhaandtaget
    mov rbx, rax

    ; Start linjetaelleren ved 0
    mov dword [cty_lines], 0
	mov dword [cty_denmark_count], 0
	mov dword [cty_germany_count], 0
	mov dword [cty_header_count], 0

lookup_read_next:

    ; Laes naeste linje fra cty.dat
    lea rcx, [cty_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    ; RAX = 0 betyder slut paa filen
    test rax, rax
    jz lookup_close
	
	; Vi har laest en linje
    inc dword [cty_lines]
	; Begynder linjen uden mellemrum?
	; Prefixlinjer begynder med mellemrum
	cmp byte [cty_buffer], ' '
	je not_header_line

	; En mulig header skal ogsaa indeholde kolon
	lea rcx, [cty_buffer]
	lea rdx, [cty_colon]
	call strstr

	test rax, rax
	jz not_header_line

	; Kopier entity-navnet frem til kolon
	lea rax, [cty_buffer]
	lea rdx, [cty_current_entity]
	xor r9d, r9d

copy_entity_name:

    ; Maksimalt 63 tegn + afsluttende 0
    cmp r9d, 63
    jae entity_name_done

    mov cl, [rax]

    cmp cl, ':'
    je entity_name_done

    cmp cl, 0
    je entity_name_done

    mov [rdx], cl
    inc rax
    inc rdx
    inc r9d
    jmp copy_entity_name

entity_name_done:

    mov byte [rdx], 0
	
	; CQ-zonen skal hentes fra CTY-headerens foerste talfelt
    ; Find foerste kolon i CTY-headeren
    lea rcx, [cty_buffer]
    lea rdx, [cty_colon]
    call strstr

    test rax, rax
    jz continent_not_found

    ; Spring kolon over
    lea rcx, [rax + 1]

    ; Konverter CQ-zone til tal
	
    call atoi
	
    mov [cty_current_cq_zone], eax	

	
    ; Start ved begyndelsen af CTY-headeren
    lea rax, [cty_buffer]

    ; Vi skal finde tre kolon
    xor r10d, r10d

find_continent_colon:

    cmp byte [rax], 0
    je continent_not_found

    cmp byte [rax], ':'
    jne continent_next_char

    inc r10d

    cmp r10d, 3
    je continent_colon_found

continent_next_char:
    inc rax
    jmp find_continent_colon


continent_colon_found:

    ; Gaa forbi det tredje kolon
    inc rax

skip_continent_spaces:

    ; Spring mellemrum over
    cmp byte [rax], ' '
    jne copy_continent

    inc rax
    jmp skip_continent_spaces

copy_continent:

    ; Kopier de to bogstaver, fx EU
    mov cl, [rax]
    mov [cty_current_continent], cl

    mov cl, [rax + 1]
    mov [cty_current_continent + 1], cl

    ; Afslut teksten med 0
    mov byte [cty_current_continent + 2], 0
   
continent_not_found:

	
    inc dword [cty_header_count]

    ; TEST: Naar vi har fundet en almindelig CTY-header,
    ; laes dens foerste prefixlinje
    lea rcx, [cty_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz lookup_close

    jmp parse_prefix_line

not_header_line:
    ; Find "Denmark:" i den aktuelle linje
    lea rcx, [cty_buffer]
    lea rdx, [denmark_text]
    call strstr

    ; Ikke Danmark? Proev Tyskland
        test rax, rax
    jz check_germany
    jmp denmark_found

check_germany:

    lea rcx, [cty_buffer]
    lea rdx, [germany_text]
    call strstr

    test rax, rax
    jz lookup_read_next

    ; Tyskland blev fundet
    inc dword [cty_germany_count]
   
    ; Laes foerste tyske prefixlinje
    lea rcx, [cty_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz lookup_close

   
	jmp parse_prefix_line

    ; Laes anden tyske prefixlinje
    lea rcx, [cty_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz lookup_close

    lea rcx, [display_format]
    lea rdx, [cty_buffer]
    call printf

    jmp lookup_read_next

denmark_found:

    ; Denmark blev fundet
    inc dword [cty_denmark_count]

	; Laes naeste linje - den indeholder Danmarks prefixes
    lea rcx, [cty_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    ; Kun hvis linjen blev laest
    test rax, rax
    jz lookup_close

   
	
parse_prefix_line:

    ; Prefixlinjen begynder med mellemrum.
        ; Start ved begyndelsen af prefixlinjen
    lea rax, [cty_buffer]

skip_prefix_spaces:

    ; Er tegnet et mellemrum?
    cmp byte [rax], ' '
    jne first_prefix_found

    inc rax
    jmp skip_prefix_spaces

first_prefix_found:

    ; RAX peger paa starten af prefixet
    lea rdx, [cty_prefix]

copy_prefix_char:

    ; Hent naeste tegn
    mov cl, [rax]

    ; Komma betyder slut paa dette prefix
    cmp cl, ','
    je prefix_copy_done

    ; Semikolon betyder ogsaa slut
    cmp cl, ';'
    je prefix_copy_done
    ; Linjeskift betyder slut paa denne prefixlinje
    cmp cl, 10
    je prefix_line_done

    cmp cl, 13
    je prefix_line_done

    ; Sikkerhed: slut paa tekst
    cmp cl, 0
    je prefix_copy_done

    ; Kopier tegnet
    mov [rdx], cl

    inc rax
    inc rdx
    jmp copy_prefix_char

prefix_copy_done:

    mov byte [rdx], 0

    ; Gem hvor vi er i CTY-linjen
    mov [cty_prefix_pos], rax

    ; Gem komma eller semikolon
    mov al, [rax]
    mov [cty_prefix_endchar], al

    
	
	; Tael antal tegn i cty_prefix
    lea rax, [cty_prefix]
    xor edx, edx

count_prefix_length:

    cmp byte [rax], 0
    je prefix_length_done

    inc edx
    inc rax
    jmp count_prefix_length

prefix_length_done:

   
    ; Sammenlign hele prefixet med starten af kaldesignalet
    lea rax, [cty_prefix]
    mov rdx, rsi

compare_prefix:

    ; Er vi naaet til slutningen af prefixet?
    cmp byte [rax], 0
    je prefix_match

    ; Hent et tegn fra prefixet
    mov cl, [rax]

    ; Passer det med samme tegn i kaldesignalet?
    cmp cl, [rdx]
    jne prefix_not_match

    ; Gaa videre til naeste tegn
    inc rax
    inc rdx
    jmp compare_prefix

prefix_match:

    
	
	; Gem den fundne entity
    lea rcx, [cty_match_entity]
    mov edx, 64
    lea r8, [cty_current_entity]
    call strcpy_s
	
	; Gem CQ-zonen for det matchende land
    mov eax, [cty_current_cq_zone]
    mov [cty_match_cq_zone], eax

    ; Gem ogsaa kontinentet for det fundne land
	lea rcx, [cty_match_continent]
	mov edx, 4
	lea r8, [cty_current_continent]
	call strcpy_s

prefix_not_match:

    ; Hent sluttegnet igen
    cmp byte [cty_prefix_endchar], ';'
    je prefix_list_done

    ; Hent vores position igen og gaa forbi kommaet
    mov rax, [cty_prefix_pos]
    inc rax

    ; Klar til at kopiere naeste prefix
    lea rdx, [cty_prefix]
    jmp copy_prefix_char

prefix_line_done:

    ; Kig bagud: var tegnet lige foer linjeskiftet et komma?
    lea rdx, [cty_buffer]
	cmp rax, rdx
	je lookup_read_next

    cmp byte [rax - 1], ','
    jne lookup_read_next

    ; Ja - prefixlisten fortsaetter paa naeste fysiske linje
    lea rcx, [cty_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz lookup_close

    ; Parse den nye prefixlinje
    jmp parse_prefix_line

prefix_list_done:
    jmp lookup_read_next

    ; Foreloebig goer vi intet med linjen
    ; Laes bare den naeste
    jmp lookup_read_next

lookup_close:

    mov rcx, rbx
    call fclose

	
lookup_country_done:

    add rsp, 40
    pop rsi
    pop rbx
    ret

	
exit_program:
    lea rcx, [exit_message]
    call printf

    add rsp, 88
	pop r12
	pop rbx
	ret
	
save_wpx_facit:
    push rbx
    sub rsp, 96

    ; Facit-QSO starter som ikke-DUPE
    mov dword [facit_dupe_flag], 0

    ; Se om simulatorens CALL allerede findes paa samme baand
    lea rcx, [facit_wpx_filename]
    lea rdx, [read_mode]
    call fopen

    test rax, rax
    jz .facit_calculate_points

    mov rbx, rax

.facit_dupe_next_line:

    lea rcx, [dupe_buffer]
    mov edx, 256
    mov r8, rbx
    call fgets

    test rax, rax
    jz .facit_dupe_not_found

    ; Find simulatorens CALL
    lea rcx, [dupe_buffer]
    mov rdx, r12
    call strstr

    test rax, rax
    jz .facit_dupe_next_line

    ; Find samme baand
    lea rcx, [dupe_buffer]
    lea rdx, [band_text]
    call strstr

    test rax, rax
    jz .facit_dupe_next_line

    ; CALL + baand fundet = DUPE
    mov rcx, rbx
    call fclose

    mov dword [facit_dupe_flag], 1
    mov dword [facit_wpx_point], 0

    jmp .facit_dupe_checked

.facit_dupe_not_found:

    mov rcx, rbx
    call fclose

.facit_calculate_points:

    ; Find korrekt land og kontinent for simulatorens CALL
    mov rcx, r12
    call lookup_country

    lea rcx, [band_text]
    lea rdx, [cty_match_entity]
    lea r8,  [cty_match_continent]
    lea r9,  [denmark_entity]
    call calculate_wpx_points
    mov dword [facit_wpx_point], eax

.facit_dupe_checked:

    ; En DUPE maa ikke registreres som ny multiplier
    cmp dword [facit_dupe_flag], 1
    je .facit_mult_done

    ; Kontroller simulatorens CALL som WPX-multiplier
    mov rcx, r12
    call check_facit_wpx_call

.facit_mult_done:

    ; Aabn facitloggen i append-mode
    lea rcx, [facit_wpx_filename]
    lea rdx, [append_mode]
    call fopen

    ; Hvis filen ikke kunne aabnes, fortsæt uden facit
    test rax, rax
    jz .done

    mov rbx, rax

    ; DATO/TID | BAND | MODE | CALL | RST | SENDT NR | MODTAGET NR

    mov rcx, rbx

	    ; DUPE har foerste prioritet
    cmp dword [facit_dupe_flag], 1
    je .facit_use_dupe_format

    ; Ellers kontroller MULT
    call is_facit_wpx_multiplier
    test eax, eax
    jz .facit_not_mult

    lea rdx, [facit_wpx_mult_format]
    jmp .facit_format_ready

.facit_not_mult:
    lea rdx, [facit_wpx_format]
    jmp .facit_format_ready

.facit_use_dupe_format:
    lea rdx, [facit_wpx_dupe_format]

.facit_format_ready:
	mov rcx, rbx
	lea r8, [time_buffer]
	lea r9, [band_text]

    ; 5. argument = mode
    lea rax, [mode_cw]
    mov [rsp + 32], rax

    ; 6. argument = simulatorens korrekte CALL
    mov [rsp + 40], r12

    ; 7. argument = korrekt RST
    lea rax, [facit_wpx_rst]
    mov [rsp + 48], rax

    ; 8. argument = vores sendte QSO-nummer
    mov eax, [qso_number]
    mov [rsp + 56], rax

    ; 9. argument = simulatorens korrekte modtagne serienummer
    mov eax, [wpx_serial]
    mov [rsp + 64], rax
     
	mov eax, [facit_wpx_point]
	mov [rsp + 72], rax
	 
    call fprintf

    ; Luk filen
    mov rcx, rbx
    call fclose

.done:
    add rsp, 96
    pop rbx
    ret