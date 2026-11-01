# ASMLog

**Amateur radio logging and CW training software for Windows x64**

ASMLog is a lightweight amateur radio logging and Morse code training program written in NASM x64 Assembly. It combines real-radio QSO logging with simulated CW training for HF contacts and supported contests.

**Current release: ASMLog v3.0 — International Edition (Free)**

## Supported logs and contests

- HF Log
- CQ WPX CW Contest
- ARRL DX CW Contest
- Russian DX CW Contest
- CQ WW DX CW Contest
- Scandinavian Activity Contest (SAC CW)

## Operating modes

| Mode | Description |
| --- | --- |
| **RADIO** | Log contacts made using a real radio; keyboard entry, without simulated CW. |
| **CW** | Practice generated QSOs using Morse audio without displayed answer text. Timed training and results are supported. |
| **CW + TEXT** | Practice with Morse audio and the transmitted text displayed. |
| **TEXT** | Practice generated QSOs as displayed text without Morse audio. |

Suggested learning progression: **TEXT → CW + TEXT → CW → RADIO**.

## Features

- QSO entry, log viewing, and callsign search
- Generated stations and exchanges for training
- CW training periods of 5, 10, 15, 30, or 60 minutes
- CW reference checking and training results
- CW training highscores
- Contest-specific scoring, multipliers, and duplicate checking
- International contest point handling in v3.0
- Cabrillo export for supported contests
- ADIF export for HF Log
- Persistent operator and operating settings

## Languages

ASMLog v3.0 provides eight selectable interface languages:

- English (`en`)
- German (`de`)
- Russian (`ru`)
- Spanish (`es`)
- Italian (`it`)
- French (`fr`)
- Polish (`pl`)
- Danish (`da`)

Some contest-specific output may remain in English.

## Getting started

1. Extract the Windows x64 release package to a folder.
2. Keep the supplied directories and data files in their original relative locations.
3. Start ASMLog from the extracted release folder.
4. Open **Settings** to enter your callsign and operator details, choose a log type and operating mode, and select your preferred language.

The release package includes default settings with blank personal information fields. Enter your own details before operating.

## Source code and building

ASMLog is developed in **NASM x64 Assembly** for Windows. The v3.0 GitHub release is planned as the final GitHub release of ASMLog, with later versions distributed separately.

For builds from source, the Windows project uses `build.bat`, NASM, and Microsoft Visual Studio Build Tools (including the x64 linker and resource compiler). Keep the expected source and data directory structure intact.

## Version information

See [`README-v3.0.md`](README-v3.0.md) for the v3.0 release details. Earlier version README files are retained for release history.

## Distribution

- **ASMLog v3.0:** Free
- **OZ1THC Digital:** https://payhip.com/OZ1THCDigital

## Author

Made by **Tommy Clemmensen — OZ1THC**.
