@echo off

set "BaseDir=%~dp0%"
set "System=%BaseDir%system\"
set "System_x64=%~dp0%system\System32"
set "System_x86=%~dp0%system\SysWOW64"

if not exist "%System%" mkdir "%System%"
if not exist "%System_x64%\" mkdir "%System_x64%"
if not exist "%System_x86%\" mkdir "%System_x86%"

robocopy "%BaseDir%Debug_NonRedist\x64\Microsoft.VC120.DebugCRT" "%System_x64%" ^
msvcp120d.dll msvcr120d.dll vccorlib120d.dll

robocopy "%BaseDir%Debug_NonRedist\x64\Microsoft.VC120.DebugCXXAMP" "%System_x64%" ^
vcamp120d.dll

robocopy "%BaseDir%Debug_NonRedist\x64\Microsoft.VC120.DebugMFC" "%System_x64%" ^
mfc120d.dll mfc120ud.dll mfcm120d.dll mfcm120ud.dll

robocopy "%BaseDir%Debug_NonRedist\x64\Microsoft.VC120.DebugOpenMP" "%System_x64%" ^
vcomp120d.dll

robocopy "%BaseDir%Debug_NonRedist\x86\Microsoft.VC120.DebugCRT" "%System_x86%" ^
msvcp120d.dll msvcr120d.dll vccorlib120d.dll

robocopy "%BaseDir%Debug_NonRedist\x86\Microsoft.VC120.DebugCXXAMP" "%System_x86%" ^
vcamp120d.dll

robocopy "%BaseDir%Debug_NonRedist\x86\Microsoft.VC120.DebugMFC" "%System_x86%" ^
mfc120d.dll mfc120ud.dll mfcm120d.dll mfcm120ud.dll

robocopy "%BaseDir%Debug_NonRedist\x86\Microsoft.VC120.DebugOpenMP" "%System_x86%" ^
vcomp120d.dll
