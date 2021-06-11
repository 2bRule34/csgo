echo off
SETLOCAL DISABLEDELAYEDEXPANSION
color 9 & mode 50, 15
TITLE Steam Clear
goto :permcheck

:main
cls
echo.
echo.
echo.
echo         \=============================/
echo                   Steam Clear
echo              by qoft with love <3
echo              \===================/
echo.
echo.
echo.
timeout /t 1 /NOBREAK >NUL
echo           ^<press any key to continue^>
pause >NUL 2>NUL

taskkill /f /im hl1.exe >NUL 2>NUL
taskkill /f /im hl2.exe >NUL 2>NUL
taskkill /f /im Steam.exe >NUL 2>NUL
REG DELETE HKEY_CURRENT_USER\Software\Valve\Steam\Users /f >NUL 2>NUL
REG DELETE HKEY_CURRENT_USER\Software\Valve\Steam\Users /f >NUL 2>NUL
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Valve\User s /f >NUL 2>NUL
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Users /f >NUL 2>NUL
REG DELETE HKEY_CURRENT_USER\Software\Valve\Steam /f >NUL 2>NUL
REG DELETE HKEY_CURRENT_USER\Software\Valve /f >NUL 2>NUL
REG DELETE HKEY_CURRENT_USER\Software\Wow6432Node\Valve\Steam /f >NUL 2>NUL
REG DELETE HKEY_CURRENT_USER\Software\Wow6432Node\Valve /f >NUL 2>NUL
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Valve\User s /f >NUL 2>NUL
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Valve /f >NUL 2>NUL
REG DELETE HKEY_LOCAL_MACHINE\Software\Valve\Steam\Users /f >NUL 2>NUL
REG DELETE HKEY_LOCAL_MACHINE\Software\Valve /f >NUL 2>NUL
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Classes\steam /f >NUL 2>NUL
REG DELETE HKEY_CURRENT_USER\Software\Classes\steam /f >NUL 2>NUL
REG DELETE HKEY_CLASSES_ROOT\steam /f >NUL 2>NUL
cd\ >NUL 2>NUL 
C: >NUL 2>NUL
cd C:\Program Files (x86)\Steam >NUL 2>NUL 
del /s /q "C:\Steam\appcache\Steam.log >NUL 2>NUL
del /S /Q "C:\Program Files (x86)\Steam\config" >NUL 2>NUL
del /S /q "C:\Steam\appcache\AppUpdateStats.blob" >NUL 2>NUL
del /S /q "C:\Steam\appcache\GameOverlayRenderer.log" >NUL 2>NUL
del /S /q "C:\Steam\appcache\GameOverlayUI.exe.log" >NUL 2>NUL
del /S /q "C:\Steam\appcache\crashhandler.dll" >NUL 2>NUL 
del /S /q "C:\Steam\appcache\crashhandler64.dll" >NUL 2>NUL
del /S /q "C:\Steam\appcache\CSERHelper.dll" >NUL 2>NUL
del /S /q "C:\Steam\appcache\Steam.dll" >NUL 2>NUL
del /S /q "C:\Steam\appcache\steamclient.dll" >NUL 2>NUL
del /S /q "C:\Steam\appcache\steamclient64.dll" >NUL 2>NUL
del /S /q "C:\Steam\appcache\SteamUI.dll" >NUL 2>NUL
del /S /q "C:\Steam\appcache\streaming_client.exe" >NUL 2>NUL
del /S /q "C:\Steam\appcache\WriteMiniDump.exe" >NUL 2>NUL 
del /S /q "C:\Steam\appcache\debug.log" >NUL 2>NUL
del /Q F logs >NUL 2>NUL
del /Q F *.mdmp >NUL 2>NUL
del ClientRegistry.blob >NUL 2>NUL 
rmdir /S /Q "C:\Program Files (x86)\Steam\appcache" >NUL 2>NUL 
rmdir /S /Q "C:\Program Files (x86)\Steam\config" >NUL 2>NUL 
rmdir /S /Q "C:\Program Files (x86)\Steam\userdata" >NUL 2>NUL 
rmdir /S /Q "C:\Program Files (x86)\Steam\dumps" >NUL 2>NUL 
rmdir /S /Q "C:\Program Files (x86)\Steam\logs" >NUL 2>NUL 
rmdir /S /Q "C:\Program Files (x86)\Steam\appcache" >NUL 2>NUL 
call :errorcheck

cls 
echo.
echo.
echo.
echo               ---------------------
echo                  Steam Cleared !
echo               ---------------------
echo.
echo.
echo.
timeout /t 1 /NOBREAK >NUL
echo             ^<press any key to close^>
pause >NUL 2>NUL
exit /b 

:errorcheck 
if %errorlevel% EQU 1 (
    cls
    color c
    echo                 Something went wrong... 
    echo     If you already ran this before, this may be why.
    echo   Make sure you are running this script as administrator.
    timeout /t 3 
    exit /b 
) else (
    goto :eof
)

:permcheck
net file 1>NUL 2>NUL
if "%errorlevel%" EQU "0" (
    goto :main
) else (
    goto :insuffperms
    exit /b
)

:insuffperms
cls
color c
echo.
echo  You must be running as admin to use this Utility!
echo      Please Run this script as administrator. 
echo. 
echo             Press Any Key to exit...
pause >NUL
exit /b