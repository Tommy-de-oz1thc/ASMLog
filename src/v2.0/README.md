# ASMLog v2.0

ASMLog v2.0 adds CW training and simulated contest QSOs to the free Windows x64 amateur radio logger.

**Status:** v2.0 Stable prepared and tested locally; GitHub publication is pending.

## Supported logs and contests

- HF Log
- CQ WPX CW Contest
- ARRL DX CW Contest
- Russian DX Contest
- CQ WW DX CW Contest
- Scandinavian Activity Contest (SAC CW)

## Operating modes

| Mode | Description |
| --- | --- |
| **RADIO** | Log real radio QSOs using the keyboard; no simulated CW. |
| **CW** | Simulated QSOs played as Morse audio without displayed answer text. |
| **CW + TEXT** | Simulated Morse audio with the transmitted text shown on screen. |
| **TEXT** | Simulated QSOs shown as text without Morse audio. |

A suggested learning progression is **TEXT → CW + TEXT → CW → RADIO**.

## CW training

- Choose a training period of **5, 10, 15, 30, or 60 minutes**.
- Practice generated QSOs in the selected log type.
- Check your entered QSOs against the generated reference (facit).
- Compare **Claimed** score with **Real** score after checking.
- Highscores are saved for **CW** training, not CW + TEXT or TEXT.

## Logging and exports

- QSO entry and log display
- Callsign search
- Duplicate QSO handling and contest-specific point/multiplier calculations
- ADIF export for HF Log
- Cabrillo export for supported contests
- Settings for callsign, operator details, and power

## Known limitation

**WPX highscore:** Start a new log before a WPX training session for the highscore to work correctly. This behavior is accepted in v2.0.

## Running ASMLog

Use the Windows x64 application distribution. Keep its accompanying directories and data files in their original relative locations. Set your callsign, log type, and operating mode in **Settings** before logging or training.

## Building from source

ASMLog is written in **NASM x64 Assembly**. The Windows build uses `build.bat`, NASM, and Microsoft Visual Studio Build Tools (including the x64 linker and resource compiler). Run `build.bat` from the project root and retain the expected `asm/`, `obj/`, `bin/`, and data directories.

## Documentation

- **Danish user guide:** `ASMLog_v2.0_Dansk_Brugervejledning.pdf` (separate documentation file)
- **English technical documentation:** `ASMLog_v2.0_Technical_Code_Documentation_EN.md` (separate documentation file)

The documentation is an initial edition and may be refined, especially the highscore and facit-checking explanations. Update paths or add links once the documents are placed in the GitHub repository.

## Future development

International scoring extensions are planned for v3.0. Morserino-32 input is planned for a later version and is **not** part of v2.0.

## Author

Made by Tommy Clemmensen - OZ1THC
