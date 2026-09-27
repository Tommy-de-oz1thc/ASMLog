@echo off

call "%ProgramFiles(x86)%\Microsoft Visual Studio\18\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

nasm -f win64 asm\ASMLog.asm -o obj\ASMLog.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\wpx.asm -o obj\wpx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\cabrillo_wpx.asm -o obj\cabrillo_wpx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\cabrillo_arrl_dx.asm -o obj\cabrillo_arrl_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\cabrillo_russian_dx.asm -o obj\cabrillo_russian_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\cabrillo_cqww_dx.asm -o obj\cabrillo_cqww_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\cabrillo_sac_cw.asm -o obj\cabrillo_sac_cw.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\hf.asm -o obj\hf.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\adif.asm -o obj\adif.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\arrl_dx.asm -o obj\arrl_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\russian_dx.asm -o obj\russian_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\cqww_dx.asm -o obj\cqww_dx.obj
if errorlevel 1 exit /b 1

nasm -f win64 asm\sac_cw.asm -o obj\sac_cw.obj
if errorlevel 1 exit /b 1

link obj\ASMLog.obj obj\wpx.obj obj\cabrillo_wpx.obj obj\cabrillo_arrl_dx.obj obj\cabrillo_russian_dx.obj obj\cabrillo_cqww_dx.obj obj\cabrillo_sac_cw.obj obj\hf.obj obj\adif.obj obj\arrl_dx.obj obj\russian_dx.obj obj\cqww_dx.obj obj\sac_cw.obj /out:bin\ASMLog.exe /subsystem:console /machine:x64 libcmt.lib legacy_stdio_definitions.lib
if errorlevel 1 exit /b 1

echo.
echo Programmet er bygget.
