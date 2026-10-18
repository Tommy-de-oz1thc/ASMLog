# ASMLog v2.0 — Technical Code Documentation

**Application:** Windows x64 amateur-radio logger and CW trainer  
**Author credit:** Made by Tommy Clemmensen - OZ1THC  
**Document:** Technical baseline, revision 1 — 18 October 2026  
**Status:** Source-based architecture documentation. Not a substitute for a complete routine-by-routine audit.

## 1. Purpose and operating modes

ASMLog provides QSO logging and CW training for six log types: WPX, HF, ARRL DX CW, Russian DX, CQ WW DX CW, and SAC CW. The four modes are RADIO (real-radio keyboard logging), CW (audio-only simulator), CW + TEXT (audio plus displayed text), and TEXT (displayed simulated text). Training sessions support 5, 10, 15, 30, and 60 minutes. Only CW training is intended to persist highscore results.

## 2. Project structure

The inspected `build.bat` expects sources under `asm/` and outputs under `obj/` and `bin/`:

```text
build.bat
asm/
  ASMLog.asm              main program and common flow
  ASMLog.rc               Windows resources
  contest/
    wpx.asm
    arrl_dx.asm
    russian_dx.asm
    cqww_dx.asm
    sac_cw.asm
  diverse/
    hf.asm                HF logging
    cw.asm                CW support
    adif.asm              ADIF export
  generator/
    qso_generator.asm     generator dispatch
    qso_generator_wpx.asm
    qso_generator_hf.asm
    qso_generator_arrl_dx.asm
    qso_generator_russian_dx.asm
    qso_generator_cqww_dx.asm
    qso_generator_sac_cw.asm
  checker/
    wpx_checker.asm
    hf_checker.asm
    arrl_dx_checker.asm
    russian_dx_checker.asm
    cqww_dx_checker.asm
    sac_cw_checker.asm
  highscore/
    wpx_highscore.asm
    hf_highscore.asm
    arrl_dx_highscore.asm
    russian_dx_highscore.asm
    cqww_dx_highscore.asm
    sac_cw_highscore.asm
  cabrillo/
    cabrillo_wpx.asm
    cabrillo_arrl_dx.asm
    cabrillo_russian_dx.asm
    cabrillo_cqww_dx.asm
    cabrillo_sac_cw.asm
obj/                      compiled .obj and .res files
bin/                      ASMLog.exe and runtime assets
data/                     settings and reference data
log/                      QSO and Cabrillo logs
highscore/                persisted results
```

The exact contents of runtime directories depend on the deployed program and session.

## 3. Building

`build.bat` initializes the MSVC x64 toolchain using a Visual Studio Build Tools `vcvars64.bat` path, assembles each module with `nasm -f win64`, compiles `asm/ASMLog.rc` using `rc`, and links the resulting objects to `bin/ASMLog.exe`.

Relevant linker switches from the inspected script:

```bat
/out:bin\ASMLog.exe /subsystem:console /machine:x64 /LARGEADDRESSAWARE:NO
```

Libraries: `libcmt.lib`, `legacy_stdio_definitions.lib`, `kernel32.lib`, `winmm.lib`. Each stage checks `errorlevel` and exits on failure. Requirements: NASM on PATH, a compatible Visual Studio Build Tools environment, and the expected directory structure. The script's `vcvars64.bat` path contains `Microsoft Visual Studio\18\BuildTools` and may need adjusting on other PCs.

Build from the project root:

```bat
build.bat
```

A successful link does not replace runtime regression tests.

## 4. Module ownership

| Component | Responsibility |
|---|---|
| `ASMLog.asm` | Main menu, settings, common program flow, QSO entry/display, shared session control and some existing WPX log aggregation |
| `contest/*.asm` | Contest-specific scoring and multiplier rules |
| `generator/*.asm` | Generation of simulated stations and exchanges |
| `checker/*.asm` | Facit/reference comparison and Real result determination |
| `highscore/*.asm` | Per-logtype highscore handling |
| `cabrillo/*.asm` | Contest-specific Cabrillo export |
| `diverse/hf.asm` | HF log functions |
| `diverse/cw.asm` | CW functions |
| `diverse/adif.asm` | ADIF export |

Keep common session timing and menu control in `ASMLog.asm`; do not move those into a contest module simply to reduce main-file size.

## 5. Windows x64 ABI

- Integer/pointer arguments 1–4: `RCX`, `RDX`, `R8`, `R9`.
- Return integer: `RAX`/`EAX`.
- Caller reserves 32 bytes of shadow space; maintain 16-byte stack alignment at calls.
- Preserve nonvolatile registers (`RBX`, `RBP`, `RSI`, `RDI`, `R12`–`R15`) when modified.
- `global` exports symbols, `extern` imports symbols from other object files.
- When moving a function, review dependencies, stack discipline, shared state, fallthrough/jumps, and `build.bat` linking.

## 6. WPX scoring: actual v2.0 split

### In `asm/contest/wpx.asm`

The inspected source exports `wpx_calculate_qso_points`, `calculate_wpx_points`, `calculate_wpx_score`, `check_wpx_multiplier`, `count_wpx_multiplier`, `get_wpx_mult_count`, `reset_wpx_mult_count`, and prefix-related routines.

The QSO point wrapper calls `calculate_wpx_points` and stores the returned value in the shared `qso_point`:

```asm
wpx_calculate_qso_points:
    sub rsp, 40
    lea rcx, [band_text]
    lea rdx, [cty_match_entity]
    lea r8,  [cty_match_continent]
    lea r9,  [denmark_entity]
    call calculate_wpx_points
    mov dword [qso_point], eax
    add rsp, 40
    ret
```

The final multiplication routine is:

```asm
calculate_wpx_score:
    mov eax, ecx
    imul eax, [mult_count]
    ret
```

Thus `ECX` supplies accumulated QSO points, `mult_count` is the WPX multiplier count, and `EAX` returns the resulting score. `count_wpx_multiplier` scans a log line for a `MULT` marker and increments the counter when present.

### Remaining in `asm/ASMLog.asm`

`calculate_log_score` remains WPX-specific. It:

1. Clears `qso_points` and calls `reset_wpx_mult_count`.
2. Opens the WPX log file referenced by `wpx_filename`.
3. Reads each line with `fgets`.
4. Finds `point_text` and converts the **single character immediately preceding** that marker from ASCII to a number.
5. Adds the extracted point value to `qso_points`.
6. Calls `count_wpx_multiplier` on each line.
7. Calls `calculate_wpx_score` and writes the result to `cabrillo_score`.

`show_wpx_log` also resets and processes WPX QSO/DUPE/point totals for display. The v2.0 decision is to **leave this working code in place** rather than risk further refactoring.

**Important for v3.0:** The single-digit text parsing assumption in `calculate_log_score` must be reviewed if new international point values or log formats are introduced. Prefer explicit numeric interfaces for future changes, without rewriting stable v2.0 code unnecessarily.

## 7. Other scoring modules

| Log type | Rule module |
|---|---|
| ARRL DX CW | `asm/contest/arrl_dx.asm` |
| Russian DX | `asm/contest/russian_dx.asm` |
| CQ WW DX CW | `asm/contest/cqww_dx.asm` |
| SAC CW | `asm/contest/sac_cw.asm` |
| WPX | `asm/contest/wpx.asm` plus existing main-file log aggregation |
| HF | `asm/diverse/hf.asm` and HF checker; accuracy-based result, not standard contest points × multipliers |

Do not apply WPX point, DUPE, or multiplier rules to the other contests. Each has its own contest-specific logic.

## 8. Generator → facit → checker → highscore

```text
Selected logtype + mode
         |
  QSO generator
         |
 Generated reference (facit)
         |
  User QSO entry
         |
    User log
         |
 Contest checker
         |
 Claimed / Real score
         |
 CW highscore, when enabled
```

**Claimed** represents the user's logged score. **Real** is the score after comparison with generated reference QSOs. Exact checks (call, band, exchange, duplicates, multipliers) are contest-specific. The facit score must not be substituted for the user's score. WPX checker code resides in `asm/checker/wpx_checker.asm`, exporting `check_wpx_cabrillo` and `wpx_highscore_menu` in the inspected source.

## 9. Highscore and known limitations

Highscore modules are per logtype. Intended v2.0 behavior: CW training can save a highscore; CW + TEXT and TEXT can calculate/show results without saving a highscore. Store the selected training period (5/10/15/30/60 minutes) with the result. Highscore deletion is contest-specific.

**Known accepted v2.0 limitation:** WPX highscore requires starting a new log first.

**Future maintenance:** Review hard-coded operator callsigns in checker/highscore paths; use the configured `settings_callsign` where appropriate. This is a separate cleanup item, not a documentation-driven code change.

## 10. Files and exports

- `data/`: settings, callsigns, and reference data (including country/multiplier data where applicable).
- `log/`: entered QSO logs and contest exports.
- `highscore/`: saved training results.
- `asm/cabrillo/`: per-contest Cabrillo writer modules.
- `asm/diverse/adif.asm`: ADIF output.
- Facit/reference records must remain separate from user-entered logs and be reset appropriately on a new session.

The exact record schemas should be documented from the relevant read/write functions before changing formats. Do not assume all contests share one record layout.

## 11. Regression testing

After any code change affecting scoring or checkers:

1. Build with `build.bat`; resolve all NASM, resource, and linker errors.
2. Complete a WPX QSO in RADIO, TEXT, CW + TEXT, and CW.
3. Test expected WPX QSO points, DUPE behavior, and multiplier counting.
4. Check correct and incorrect facit comparisons (call, band, exchange).
5. Verify Claimed and Real use the correct source values.
6. Verify Cabrillo headers, QSO rows, and claimed score.
7. Start a new WPX log and verify CW highscore and training-period recording.
8. Confirm TEXT/CW + TEXT do not write CW highscore.
9. Verify a selected training period actually ends correctly.
10. Recheck other contests when shared interfaces or main-program control flow change.

A successful single QSO is a useful smoke test, not proof of all checker, export, and session paths.

## 12. Safe maintenance workflow

1. Save a known-good ZIP backup **outside** the working project folder.
2. Make one small change at a time.
3. Review `global`, `extern`, shared variables, and call conventions.
4. Build and test on Windows.
5. If it fails, restore the last known-good state.
6. Remove diagnostic output before release.
7. Update this document when source interfaces, scoring rules, formats, or build requirements change.

The attempted relocation of `send_wpx_exchange` previously caused a runtime failure and was reverted; leave it untouched for v2.0. The common training-time control also remains part of the main program.

## 13. Documentation scope and follow-up

This is a **technical architecture and maintenance guide**, not yet a complete symbol-by-symbol API reference. A future reference can record every exported function's parameters, return values, modified globals, and callers. The final release source and build script remain authoritative.

---

*ASMLog v2.0 — Technical Code Documentation — Revision 1.*
