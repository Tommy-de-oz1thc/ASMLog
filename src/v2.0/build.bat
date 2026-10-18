@echo off

call "%ProgramFiles(x86)%\Microsoft Visual Studio\18\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

nasm -f win64 asm\ASMLog.asm -o obj\ASMLog.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\contest\wpx.asm -o obj\wpx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\cabrillo\cabrillo_wpx.asm -o obj\cabrillo_wpx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\cabrillo\cabrillo_arrl_dx.asm -o obj\cabrillo_arrl_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\cabrillo\cabrillo_russian_dx.asm -o obj\cabrillo_russian_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\cabrillo\cabrillo_cqww_dx.asm -o obj\cabrillo_cqww_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\cabrillo\cabrillo_sac_cw.asm -o obj\cabrillo_sac_cw.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\diverse\hf.asm -o obj\hf.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\diverse\adif.asm -o obj\adif.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\contest\arrl_dx.asm -o obj\arrl_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\contest\russian_dx.asm -o obj\russian_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\contest\cqww_dx.asm -o obj\cqww_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\contest\sac_cw.asm -o obj\sac_cw.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\diverse\cw.asm -o obj\cw.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\generator\qso_generator.asm -o obj\qso_generator.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\generator\qso_generator_wpx.asm -o obj\qso_generator_wpx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\generator\qso_generator_arrl_dx.asm -o obj\qso_generator_arrl_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\generator\qso_generator_russian_dx.asm -o obj\qso_generator_russian_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\generator\qso_generator_cqww_dx.asm -o obj\qso_generator_cqww_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\generator\qso_generator_sac_cw.asm -o obj\qso_generator_sac_cw.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\generator\qso_generator_hf.asm -o obj\qso_generator_hf.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\checker\wpx_checker.asm -o obj\wpx_checker.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\checker\arrl_dx_checker.asm -o obj\arrl_dx_checker.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\checker\russian_dx_checker.asm -o obj\russian_dx_checker.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\checker\cqww_dx_checker.asm -o obj\cqww_dx_checker.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\checker\sac_cw_checker.asm -o obj\sac_cw_checker.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\checker\hf_checker.asm -o obj\hf_checker.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\highscore\wpx_highscore.asm -o obj\wpx_highscore.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\highscore\arrl_dx_highscore.asm -o obj\arrl_dx_highscore.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\highscore\russian_dx_highscore.asm -o obj\russian_dx_highscore.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\highscore\cqww_dx_highscore.asm -o obj\cqww_dx_highscore.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\highscore\sac_cw_highscore.asm -o obj\sac_cw_highscore.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\highscore\hf_highscore.asm -o obj\hf_highscore.obj
if errorlevel 1 exit /b 1

rc /nologo /fo obj\ASMLog.res asm\ASMLog.rc
if errorlevel 1 exit /b 1

link obj\ASMLog.res obj\ASMLog.obj obj\wpx.obj obj\cabrillo_wpx.obj obj\cabrillo_arrl_dx.obj obj\cabrillo_russian_dx.obj obj\cabrillo_cqww_dx.obj obj\cabrillo_sac_cw.obj ^
obj\hf.obj obj\adif.obj obj\arrl_dx.obj obj\russian_dx.obj obj\cqww_dx.obj obj\sac_cw.obj obj\cw.obj ^
obj\qso_generator.obj obj\qso_generator_wpx.obj obj\qso_generator_arrl_dx.obj obj\qso_generator_russian_dx.obj obj\qso_generator_cqww_dx.obj obj\qso_generator_sac_cw.obj obj\qso_generator_hf.obj ^
obj\wpx_checker.obj  obj\arrl_dx_checker.obj obj\russian_dx_checker.obj obj\cqww_dx_checker.obj obj\sac_cw_checker.obj obj\hf_checker.obj ^
obj\wpx_highscore.obj obj\arrl_dx_highscore.obj obj\russian_dx_highscore.obj obj\cqww_dx_highscore.obj obj\sac_cw_highscore.obj obj\hf_highscore.obj ^
/out:bin\ASMLog.exe /subsystem:console /machine:x64 /LARGEADDRESSAWARE:NO libcmt.lib legacy_stdio_definitions.lib kernel32.lib winmm.lib
if errorlevel 1 exit /b 1

echo.
echo Programmet er bygget.
