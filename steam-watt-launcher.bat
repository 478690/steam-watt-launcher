@echo off
setlocal enabledelayedexpansion
:: Auto Program Launcher v5.1 - Universal Version (Enhanced Search)
title Auto Program Launcher v5.1 - Universal

echo ========================================
echo        Auto Program Launcher v5.1
echo          Universal Edition
echo ========================================
echo.

:: Variables
set STEAM_FOUND=0
set WATT_FOUND=0
set STEAM_PATH=
set WATT_PATH=

echo Searching for Steam...
echo.

:: Steam detection - Registry first, then common locations
echo Checking registry...
reg query "HKLM\SOFTWARE\Wow6432Node\Valve\Steam" /v "InstallPath" >nul 2>&1
if %errorlevel%==0 (
    for /f "tokens=2*" %%i in ('reg query "HKLM\SOFTWARE\Wow6432Node\Valve\Steam" /v "InstallPath" 2^>nul') do (
        set STEAM_PATH=%%j
        set STEAM_PATH=!STEAM_PATH:\Steam.exe=!
        if not "!STEAM_PATH!"=="" (
            if not "!STEAM_PATH:~-1!"=="\" (
                set STEAM_PATH=!STEAM_PATH!\
            )
            set STEAM_PATH="!STEAM_PATH!Steam.exe"
            set STEAM_FOUND=1
            echo Found Steam via registry: !STEAM_PATH!
            goto steam_done
        )
    )
)

reg query "HKLM\SOFTWARE\Valve\Steam" /v "InstallPath" >nul 2>&1
if %errorlevel%==0 (
    for /f "tokens=2*" %%i in ('reg query "HKLM\SOFTWARE\Valve\Steam" /v "InstallPath" 2^>nul') do (
        set STEAM_PATH=%%j
        set STEAM_PATH=!STEAM_PATH:\Steam.exe=!
        if not "!STEAM_PATH!"=="" (
            if not "!STEAM_PATH:~-1!"=="\" (
                set STEAM_PATH=!STEAM_PATH!\
            )
            set STEAM_PATH="!STEAM_PATH!Steam.exe"
            set STEAM_FOUND=1
            echo Found Steam via registry: !STEAM_PATH!
            goto steam_done
        )
    )
)

echo Checking common installation locations...
:: Check Program Files directories dynamically
for %%d in ("%ProgramFiles%" "%ProgramFiles(x86)%") do (
    if exist "%%d\Steam\Steam.exe" (
        set STEAM_PATH="%%d\Steam\Steam.exe"
        set STEAM_FOUND=1
        echo Found Steam in: !STEAM_PATH!
        goto steam_done
    )
)

:: Check other common drives
for %%d in (C D E F G) do (
    if exist "%%d:\Steam\Steam.exe" (
        set STEAM_PATH="%%d:\Steam\Steam.exe"
        set STEAM_FOUND=1
        echo Found Steam in: !STEAM_PATH!
        goto steam_done
    )
)

:steam_done
if %STEAM_FOUND%==0 (
    echo Steam not found.
) else (
    if exist !STEAM_PATH! (
        echo Steam path is accessible.
    ) else (
        echo Steam path not accessible.
        set STEAM_FOUND=0
    )
)

echo.
echo Searching for Watt Toolkit...
echo.

:: Watt Toolkit search strategy - Enhanced search order
echo Searching in current directory...
for %%f in ("Watt Toolkit.lnk" "Watt Toolkit.exe" "watt-toolkit.lnk" "watt-toolkit.exe") do (
    if exist "%%f" (
        set WATT_PATH="%%f"
        set WATT_FOUND=1
        echo Found Watt Toolkit in current directory: %%f
        goto watt_done
    )
)

echo Searching in user profile directories...
:: Check user profile common locations (excluding problematic desktop)
for %%d in ("%USERPROFILE%\Documents" "%USERPROFILE%\Downloads" "%APPDATA%") do (
    for %%f in (%%d\*Watt*.lnk %%d\*Watt*.exe %%d\*watt*.lnk %%d\*watt*.exe) do (
        if exist "%%f" (
            set WATT_PATH="%%f"
            set WATT_FOUND=1
            echo Found Watt Toolkit in user directories: %%f
            goto watt_done
        )
    )
)

echo Searching in parent directories...
:: Check for relative paths to common folder structures
if exist "..\userfull\Watt Toolkit.lnk" (
    set WATT_PATH="..\userfull\Watt Toolkit.lnk"
    set WATT_FOUND=1
    echo Found Watt Toolkit in parent userfull directory
    goto watt_done
)

if exist "..\Watt Toolkit.lnk" (
    set WATT_PATH="..\Watt Toolkit.lnk"
    set WATT_FOUND=1
    echo Found Watt Toolkit in parent directory
    goto watt_done
)

echo Searching in program directories...
:: Check Program Files directories
for %%d in ("%ProgramFiles%" "%ProgramFiles(x86)%") do (
    if exist "%%d\Watt Toolkit" (
        for %%f in ("%%d\Watt Toolkit\*.exe" "%%d\Watt Toolkit\*.lnk") do (
            if exist "%%f" (
                set WATT_PATH="%%f"
                set WATT_FOUND=1
                echo Found Watt Toolkit in Program Files: %%f
                goto watt_done
            )
        )
    )
)

echo Searching on Desktop (last resort)...
:: Desktop search as fallback
for %%f in ("%USERPROFILE%\Desktop\*Watt*.lnk" "%USERPROFILE%\Desktop\*Watt*.exe") do (
    if exist "%%f" (
        set WATT_PATH="%%f"
        set WATT_FOUND=1
        echo Found Watt Toolkit on Desktop: %%f
        goto watt_done
    )
)

echo Watt Toolkit not found.
goto watt_done

:watt_done
echo.
echo ========================================
echo Starting programs...
echo ========================================
echo.

:: Start Steam
if %STEAM_FOUND%==1 (
    echo Starting Steam...
    echo Launching: !STEAM_PATH!
    start "" !STEAM_PATH!
    if !errorlevel!==0 (
        echo Steam started successfully!
    ) else (
        echo Failed to start Steam.
    )
    echo Waiting 2 seconds...
    ping 127.0.0.1 -n 3 >nul 2>&1
) else (
    echo Steam not found, skipping...
)

echo.

:: Start Watt Toolkit
if %WATT_FOUND%==1 (
    echo Starting Watt Toolkit...
    echo Launching: !WATT_PATH!
    start "" !WATT_PATH!
    if !errorlevel!==0 (
        echo Watt Toolkit started successfully!
    ) else (
        echo Failed to start Watt Toolkit.
    )
) else (
    echo Watt Toolkit not found, skipping...
)

echo.
echo ========================================
echo Summary
echo ========================================
if %STEAM_FOUND%==1 echo Steam: Ready to start
if %STEAM_FOUND%==0 echo Steam: Not found
if %WATT_FOUND%==1 echo Watt Toolkit: Ready to start
if %WATT_FOUND%==0 echo Watt Toolkit: Not found

echo.
echo Program launcher finished.
echo This window will close automatically...
ping 127.0.0.1 -n 4 >nul 2>&1
exit