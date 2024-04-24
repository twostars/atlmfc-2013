@echo off
setlocal

set "sysdir=%systemroot%\system32"
set "BaseDir=%~dp0%"

reg query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=x86 || set OS=x64

if %OS%==x86 goto :x86
if %OS%==x64 goto :x64

echo Failed to determine OS architecture
goto end_script

:x86
echo OS architecture: 32-bit

echo Running vcredist_x86.exe
cmd /c ""%BaseDir%1033\vcredist_x86.exe"" /install /norestart

robocopy "%BaseDir%Debug_NonRedist\x86\Microsoft.VC120.DebugCRT" "%sysdir%" ^
msvcp120d.dll msvcr120d.dll vccorlib120d.dll

robocopy "%BaseDir%Debug_NonRedist\x86\Microsoft.VC120.DebugCXXAMP" "%sysdir%" ^
vcamp120d.dll

robocopy "%BaseDir%Debug_NonRedist\x86\Microsoft.VC120.DebugMFC" "%sysdir%" ^
mfc120d.dll mfc120ud.dll mfcm120d.dll mfcm120ud.dll

robocopy "%BaseDir%Debug_NonRedist\x86\Microsoft.VC120.DebugOpenMP" "%sysdir%" ^
vcomp120d.dll

goto end_script

:x64
echo OS architecture: 64-bit

echo Running vcredist_x86.exe
cmd /c ""%BaseDir%1033\vcredist_x86.exe"" /install /norestart

echo Running vcredist_x64.exe
cmd /c ""%BaseDir%1033\vcredist_x64.exe"" /install /norestart

robocopy "%BaseDir%Debug_NonRedist\x64\Microsoft.VC120.DebugCRT" "%sysdir%" ^
msvcp120d.dll msvcr120d.dll vccorlib120d.dll

robocopy "%BaseDir%Debug_NonRedist\x64\Microsoft.VC120.DebugCXXAMP" "%sysdir%" ^
vcamp120d.dll

robocopy "%BaseDir%Debug_NonRedist\x64\Microsoft.VC120.DebugMFC" "%sysdir%" ^
mfc120d.dll mfc120ud.dll mfcm120d.dll mfcm120ud.dll

robocopy "%BaseDir%Debug_NonRedist\x64\Microsoft.VC120.DebugOpenMP" "%sysdir%" ^
vcomp120d.dll

robocopy "%BaseDir%Debug_NonRedist\x86\Microsoft.VC120.DebugCRT" "%sysdir%\..\SysWOW64" ^
msvcp120d.dll msvcr120d.dll vccorlib120d.dll

robocopy "%BaseDir%Debug_NonRedist\x86\Microsoft.VC120.DebugCXXAMP" "%sysdir%\..\SysWOW64" ^
vcamp120d.dll

robocopy "%BaseDir%Debug_NonRedist\x86\Microsoft.VC120.DebugMFC" "%sysdir%\..\SysWOW64" ^
mfc120d.dll mfc120ud.dll mfcm120d.dll mfcm120ud.dll

robocopy "%BaseDir%Debug_NonRedist\x86\Microsoft.VC120.DebugOpenMP" "%sysdir%\..\SysWOW64" ^
vcomp120d.dll

:end_script
exit /b
