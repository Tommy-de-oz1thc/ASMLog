
; ==========================================
; ASMLog v3.0 - Faelles sprog-ID'er
; ==========================================
; ID'erne er ens i alle sprogfiler.
; Dansk er standardsprog.
;
; Sprog:
; DA - Dansk
; EN - Engelsk
; DE - Tysk
; RU - Russisk
; ES - Spansk
; IT - Italiensk
; FR - Fransk
; PL - Polsk
; ==========================================

%ifndef ASMLOG_SPROG_IDS
%define ASMLOG_SPROG_IDS 1

; ==========================================
; Hovedmenu (ID 0-8)
; ==========================================

%define MENU_TITLE        0
%define MENU_NEW_QSO      1
%define MENU_SHOW_LOG     2
%define MENU_SEARCH_CALL  3
%define MENU_NEW_LOG      4
%define MENU_PRINT_LOG    5
%define MENU_SETTINGS     6
%define MENU_HIGHSCORE    7
%define MENU_BACK         8

; ==========================================
; Settings-menu (ID 9-18)
; ==========================================

%define SETTINGS_TITLE      9
%define SETTINGS_LOGTYPE   10
%define SETTINGS_CALLSIGN  11
%define SETTINGS_NAME      12
%define SETTINGS_EMAIL     13
%define SETTINGS_ADDRESS   14
%define SETTINGS_POSTCODE  15
%define SETTINGS_CITY      16
%define SETTINGS_POWER     17
%define SETTINGS_BACK      18


; ==========================================
; Logtype-menu (ID 19-26)
; ==========================================

%define LOGTYPE_TITLE       19
%define LOGTYPE_WPX         20
%define LOGTYPE_HF          21
%define LOGTYPE_ARRL_DX     22
%define LOGTYPE_RUSSIAN_DX  23
%define LOGTYPE_CQWW_DX     24
%define LOGTYPE_SAC_CW      25
%define LOGTYPE_BACK        26


; ==========================================
; Ny QSO (ID 27-38)
; ==========================================

%define QSO_TITLE          27
%define QSO_CALLSIGN       28
%define QSO_BAND           29
%define QSO_MODE           30
%define QSO_RST_SENT       31
%define QSO_RST_RECEIVED   32
%define QSO_EXCHANGE       33
%define QSO_ZONE           34
%define QSO_SERIAL         35
%define QSO_POINTS         36
%define QSO_SAVE           37
%define QSO_BACK           38


; ==========================================
; Vis QSO-log (ID 39-48)
; ==========================================

%define SHOW_LOG_TITLE       39
%define SHOW_LOG_DATE        40
%define SHOW_LOG_TIME        41
%define SHOW_LOG_CALLSIGN    42
%define SHOW_LOG_BAND        43
%define SHOW_LOG_MODE        44
%define SHOW_LOG_RST         45
%define SHOW_LOG_EXCHANGE    46
%define SHOW_LOG_POINTS      47
%define SHOW_LOG_BACK        48



; ==========================================
; Soegefunktion (ID 49-54)
; ==========================================

%define SEARCH_ENTER_CALL     49
%define SEARCH_YOU_ENTERED    50
%define SEARCH_CALL_PROMPT    51
%define SEARCH_RESULTS        52
%define SEARCH_COUNT          53
%define SEARCH_NOT_FOUND      54


; ==========================================
; Udskriv log (ID 55-60)
; ==========================================

%define PRINT_LOG_TITLE       55
%define PRINT_LOG_ADIF        56
%define PRINT_LOG_CABRILLO    57
%define PRINT_LOG_MAIN_MENU   58
%define PRINT_LOG_BACK        59
%define PRINT_LOG_CHOICE      60


; ==========================================
; Mode-menu (ID 61-65)
; ==========================================

%define MODE_TITLE        61
%define MODE_RADIO        62
%define MODE_CW           63
%define MODE_CW_TEXT      64
%define MODE_TEXT         65



; ==========================================
; Sprogvalg-menu (ID 66)
; ==========================================

%define LANGUAGE_TITLE 66


; ==========================================
; Power-menu (ID 67-71)
; ==========================================

%define POWER_TITLE       67
%define POWER_QRP         68
%define POWER_LOW         69
%define POWER_HIGH        70
%define POWER_ARRL        71


; ==========================================
; WPM-menu (ID 72)
; ==========================================

%define WPM_TITLE 72

; Highscore sortering (ID 73-74)
%define HIGHSCORE_SORT_DATE  73
%define HIGHSCORE_SORT_REAL  74


; ==========================================
; Slet Highscore (ID 75-85)
; ==========================================

%define HIGHSCORE_DELETE_TITLE    75
%define HIGHSCORE_DELETE_WPX      76
%define HIGHSCORE_DELETE_HF       77
%define HIGHSCORE_DELETE_ARRL     78
%define HIGHSCORE_DELETE_RUSSIAN  79
%define HIGHSCORE_DELETE_CQWW     80
%define HIGHSCORE_DELETE_SAC      81
%define HIGHSCORE_DELETE_ALL      82
%define HIGHSCORE_DELETE_CONFIRM  83
%define HIGHSCORE_DELETE_DONE     84
%define HIGHSCORE_DELETE_ERROR    85


; ==========================================
; Start ny log (ID 86-87)
; ==========================================

%define NEWLOG_WARNING  86
%define NEWLOG_PROMPT   87


; ==========================================
; Settings - ekstra felter (ID 88-89)
; ==========================================

%define SETTINGS_ARRL_STATE_PROMPT 88
%define SETTINGS_WPM_PROMPT        89


; ==========================================
; Settings - indtastning (ID 90-95)
; ==========================================

%define SETTINGS_CALLSIGN_INPUT 90
%define SETTINGS_NAME_INPUT     91
%define SETTINGS_EMAIL_INPUT    92
%define SETTINGS_ADDRESS_INPUT  93
%define SETTINGS_ZIP_INPUT      94
%define SETTINGS_CITY_INPUT     95

; ==========================================
; Settings - gemt (ID 96-102)
; ==========================================

%define SETTINGS_CALLSIGN_SAVED  96
%define SETTINGS_NAME_SAVED      97
%define SETTINGS_EMAIL_SAVED     98
%define SETTINGS_ADDRESS_SAVED   99
%define SETTINGS_ZIP_SAVED      100
%define SETTINGS_CITY_SAVED     101
%define SETTINGS_POWER_SAVED    102

%define SETTINGS_ARRL_POWER_INPUT 103

; CW-traeningstid (ID 104-110)
%define CW_TIME_TITLE       104
%define CW_TIME_5_MIN       105
%define CW_TIME_10_MIN      106
%define CW_TIME_15_MIN      107
%define CW_TIME_30_MIN      108
%define CW_TIME_60_MIN      109
%define CW_TIME_CHOOSE      110

; Afslutning (ID 111-112)
%define EXIT_QUESTION    111
%define EXIT_MESSAGE     112

; Generelle fejlbeskeder (ID 113-119)
%define ERROR_INVALID_CHOICE       113
%define ERROR_INVALID_BAND         114
%define ERROR_INVALID_CALLSIGN     115
%define ERROR_CALLSIGN_FILE        116
%define ERROR_INVALID_RST          117
%define ERROR_INVALID_QSONR        118
%define ERROR_WPX_LOG_FILE         119

; Statusbeskeder - valgt logtype (ID 120-125)
%define STATUS_LOGTYPE_WPX         120
%define STATUS_LOGTYPE_HF          121
%define STATUS_LOGTYPE_ARRL        122
%define STATUS_LOGTYPE_RUSSIAN     123
%define STATUS_LOGTYPE_CQWW        124
%define STATUS_LOGTYPE_SAC         125

; Statusbeskeder - valgt QSO-mode (ID 126-129)
%define STATUS_MODE_RADIO          126
%define STATUS_MODE_CW             127
%define STATUS_MODE_CW_TEXT        128
%define STATUS_MODE_TEXT           129

; QSO-beskeder (ID 130-135)
%define QSO_SAVED_MESSAGE       130
%define QSO_DUPE_WARNING        131
%define QSO_COUNT_FORMAT        132
%define QSO_DUPE_COUNT_FORMAT   133
%define QSO_POINTS_FORMAT       134
%define QSO_SENT_TEXT_FORMAT    135

; CTY-beskeder (ID 136-137)
%define CTY_RESULT_FORMAT       136
%define CTY_FILE_ERROR          137

; HF-beskeder (ID 138-157)
%define HF_CALL_CORRECT          138
%define HF_CALL_WRONG            139
%define HF_RST_CORRECT           140
%define HF_RST_WRONG             141
%define HF_NAME_CORRECT          142
%define HF_NAME_WRONG            143
%define HF_QTH_CORRECT           144
%define HF_QTH_WRONG             145
%define HF_RESULT_HEADER         146
%define HF_RESULT_QSO            147
%define HF_RESULT_CALL           148
%define HF_RESULT_RST            149
%define HF_RESULT_NAME           150
%define HF_RESULT_QTH            151
%define HF_RESULT_TOTAL          152
%define HF_RESULT_WRONG          153
%define HF_RESULT_PERCENT        154
%define HF_HIGHSCORE_HEADER      155
%define HF_HIGHSCORE_EMPTY       156
%define HF_LOG_HEADER            157

; Fælles checkerbeskeder (ID 158-164)
%define CHECKER_BAND_OK           158
%define CHECKER_BAND_ERROR        159
%define CHECKER_QSO_OK            160
%define CHECKER_QSO_ERROR         161
%define CHECKER_CLAIMED_SCORE     162
%define CHECKER_REAL_SCORE        163
%define CHECKER_HIGHSCORE_DATE    164

; Russian DX (ID 165-173)
%define RUSSIAN_COUNTRY_MULT       165
%define RUSSIAN_COUNTRY_USED       166
%define RUSSIAN_OBLAST_MULT        167
%define RUSSIAN_OBLAST_USED        168
%define RUSSIAN_OBLAST_ERROR       169
%define RUSSIAN_LOG_EMPTY          170
%define RUSSIAN_STATION            171
%define RUSSIAN_NOT_STATION        172
%define RUSSIAN_NEW_LOG           173

; CQ WW DX (ID 174-179)
%define CQWW_CONTINENT_ERROR      174
%define CQWW_CONTINENT_PROMPT     175
%define CQWW_ZONE_ERROR          176
%define CQWW_ZONE_PROMPT         177
%define CQWW_NEW_LOG_DONE        178
%define CQWW_NEW_LOG_WARNING     179

; SAC CW (ID 180-187)
%define SAC_NEW_LOG_DONE          180
%define SAC_NEW_LOG_PROMPT        181
%define SAC_SCANDINAVIAN         182
%define SAC_NON_SCANDINAVIAN     183
%define SAC_SERIAL_PROMPT        184
%define SAC_SERIAL_ERROR         185
%define SAC_QSO_POINTS           186
%define SAC_DUPE_MESSAGE         187

; ARRL DX (ID 188-193)
%define ARRL_NEW_LOG_DONE         188
%define ARRL_NEW_LOG_PROMPT       189
%define ARRL_LOG_EMPTY            190
%define ARRL_MULTIPLIERS          191
%define ARRL_SCORE                192
%define ARRL_QSO_POINTS           193


; ==========================================
; Hovedmenu - Slet Highscore
; ==========================================

%define MENU_DELETE_HIGHSCORE    194

%define SETTINGS_ARRL_STATE_MENU 195

%define WPX_HIGHSCORE_TITLE       196
%define ARRL_HIGHSCORE_TITLE      197
%define RUSSIAN_HIGHSCORE_TITLE   198
%define CQWW_HIGHSCORE_TITLE      199
%define SAC_HIGHSCORE_TITLE       200
%define HF_HIGHSCORE_TITLE        201

%define HIGHSCORE_SORT_DATE       202
%define HIGHSCORE_SORT_REAL       203

%define HF_HIGHSCORE_ACCURACY 204

%define DELETE_HS_TITLE       205
%define DELETE_HS_WPX         206
%define DELETE_HS_HF          207
%define DELETE_HS_ARRL        208
%define DELETE_HS_RUSSIAN     209
%define DELETE_HS_CQWW        210
%define DELETE_HS_SAC         211
%define DELETE_HS_ALL         212

%define SPROG_TEXT_COUNT 213

; ==========================================
; Antal tekster
; ==========================================

%define SPROG_TEXT_COUNT      214


%endif
