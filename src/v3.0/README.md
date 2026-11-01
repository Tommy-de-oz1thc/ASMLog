# ASMLog v3.0 — International Edition

**Free Windows x64 amateur radio logging and CW training software**

ASMLog v3.0 builds on v2.0 with international contest point handling and a selectable eight-language interface. The existing logging and CW training modes remain available.

## What's new in v3.0

- International point handling for the supported CW contests
- Eight selectable interface languages: English, German, Russian, Spanish, Italian, French, Polish, and Danish
- Language selection and translated main menu and Settings interface
- Continued support for the four operating and training modes introduced in v2.0

## Supported logs and contests

- HF Log
- CQ WPX CW Contest
- ARRL DX CW Contest
- Russian DX CW Contest
- CQ WW DX CW Contest
- Scandinavian Activity Contest (SAC CW)

HF Log remains available alongside the contest modules.

## Operating modes

| Mode | Description |
| --- | --- |
| **RADIO** | Log real radio QSOs using the keyboard; no simulated CW. |
| **CW** | Generated QSOs played as Morse audio without displayed answer text. |
| **CW + TEXT** | Generated QSOs played as Morse audio with transmitted text on screen. |
| **TEXT** | Generated QSOs shown as text without Morse audio. |

Suggested learning progression: **TEXT → CW + TEXT → CW → RADIO**.

## CW training and results

- Select a timed CW session of **5, 10, 15, 30, or 60 minutes**.
- Practice generated QSOs for the selected log type.
- Compare entered contacts against the generated reference (FACIT) during CW checking.
- Contest training can compare **Claimed** and **Real** scores.
- Highscores are recorded for **CW** training, not CW + TEXT or TEXT.
- HF Log CW training checks callsign, RST, name, and QTH fields for the current session.

## Logging and exports

- QSO entry, log display, and callsign search
- Contest-specific duplicate checking, scoring, and multiplier handling
- Cabrillo export for supported contests
- ADIF export for HF Log
- Settings for callsign, name, email, address, postal code, city, power, and other operating options
- Saved settings restored after restarting the program

## Languages

The selectable interface languages in v3.0 are:

| Code | Language |
| --- | --- |
| `en` | English |
| `de` | German |
| `ru` | Russian |
| `es` | Spanish |
| `it` | Italian |
| `fr` | French |
| `pl` | Polish |
| `da` | Danish |

**Note:** Some contest-specific messages may still be displayed in English. Language support does not imply that every generated contest string has been translated.

## Running ASMLog

1. Extract the release archive to a folder on Windows x64.
2. Keep the accompanying folders and data files in their original relative locations.
3. Start the program from the extracted release folder.
4. Set your callsign, log type, operating mode, and language in **Settings**.

The release settings have blank personal-information fields. The distributed log, FACIT, and Cabrillo files should not contain test QSOs or previous users' results.

## Building from source

ASMLog is written in **NASM x64 Assembly**. The Windows build uses `build.bat`, NASM, and Microsoft Visual Studio Build Tools, including the x64 linker and resource compiler. Preserve the project's expected directory structure when building.

## Changes from v2.0

Version 2.0 introduced simulated CW training and the four operating modes. Version 3.0 focuses on **international contest scoring and eight-language support** rather than adding new training modes.

## Future development

Morserino-32 (M32) input and additional CW simulation settings are planned for v4.0; they are **not included in v3.0**. Later development also includes a CW pileup trainer.

ASMLog v3.0 is planned as the final GitHub release. Later versions are planned for distribution through OZ1THC Digital.

## Distribution

**ASMLog v3.0 is free.**

OZ1THC Digital: https://payhip.com/OZ1THCDigital

## Author

Made by **Tommy Clemmensen — OZ1THC**.

