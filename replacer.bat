@echo off
setlocal enabledelayedexpansion
chcp 65001 > nul
cls

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /b
)

cd /d "%~dp0"

set "TARGET_IMAGES=C:\Avalanche\assets\images"
set "TARGET_LOADER=C:\Avalanche\assets\loader"
set "TARGET_FONTS=C:\Avalanche\assets\fonts"

set "SRC_MENU=logo (menu)"
set "SRC_LOADER=logo (loader)"
set "SRC_FONT_LOADER=font (loader)"
set "SRC_FONT_MENU=font (menu)"
set "SRC_BANNER=banner (loader)"
set "SRC_ICO=%USERPROFILE%\Desktop\avcustom\ico"

if not exist "%SRC_MENU%" ( echo [ERROR] Folder "%SRC_MENU%" not found. && pause && exit )
if not exist "%SRC_LOADER%" ( echo [ERROR] Folder "%SRC_LOADER%" not found. && pause && exit )

if not exist "%TARGET_IMAGES%" mkdir "%TARGET_IMAGES%" 2>nul
if not exist "%TARGET_LOADER%" mkdir "%TARGET_LOADER%" 2>nul
if not exist "%TARGET_FONTS%" mkdir "%TARGET_FONTS%" 2>nul

:LANG_SELECT
cls
echo Language / Язык:
echo English
echo Русский
echo.
set "lang="
set /p lang="Choose [1/2]: "

if "%lang%"=="1" (
    set "msg_font=Copying fonts..."
    set "msg_menu=Select logo for CHEAT MENU"
    set "msg_loader=Select logo for LOADER"
    set "msg_banner=Copying banners..."
    set "msg_ico=Select icon (.ico) for SHORTCUT"
    set "msg_enter=Enter number (or Press Enter to skip): "
    set "msg_skip=[SKIPPED]"
    set "msg_err_num=[ERROR] Invalid number."
    set "msg_ok=[OK] Success."
    set "msg_err_copy=[ERROR] File is locked or target folder is read-only!"
    set "msg_shortcut=Creating shortcut on Desktop..."
    set "msg_done=All done."
    goto MAIN_PROCESS
)
if "%lang%"=="2" (
    set "msg_font=Копирование шрифтов..."
    set "msg_menu=Выберите логотип для МЕНЮ ЧИТА"
    set "msg_loader=Выберите логотип для ЛОАДЕРА"
    set "msg_banner=Копирование баннеров..."
    set "msg_ico=Выберите иконку (.ico) для ЯРЛЫКА"
    set "msg_enter=Введите номер (или Enter для пропуска): "
    set "msg_skip=[ПРОПУЩЕНО]"
    set "msg_err_num=[ОШИБКА] Неверный номер."
    set "msg_ok=[OK] Успешно скопировано."
    set "msg_err_copy=[ОШИБКА] Файл занят другим процессом или доступ ограничен!"
    set "msg_shortcut=Создание ярлыка на рабочем столе..."
    set "msg_done=Процесс завершен."
    goto MAIN_PROCESS
)
goto LANG_SELECT

:MAIN_PROCESS
cls
echo %msg_font%
set fonts_copied=0

if exist "%SRC_FONT_LOADER%\icons_data.ttf" (
    copy /Y "%SRC_FONT_LOADER%\icons_data.ttf" "%TARGET_LOADER%\icons_data.ttf" > nul
    set /a fonts_copied+=1
)

if exist "%SRC_FONT_MENU%\jetbrains_mono_medium.ttf" (
    copy /Y "%SRC_FONT_MENU%\jetbrains_mono_medium.ttf" "%TARGET_FONTS%\jetbrains_mono_medium.ttf" > nul
    set /a fonts_copied+=1
)

if exist "%SRC_FONT_MENU%\jetbrains_mono_regular.ttf" (
    copy /Y "%SRC_FONT_MENU%\jetbrains_mono_regular.ttf" "%TARGET_FONTS%\jetbrains_mono_regular.ttf" > nul
    set /a fonts_copied+=1
)

if !fonts_copied! GTR 0 (
    echo %msg_ok%
) else (
    echo [SKIP]
)
timeout /t 1 > nul

:MENU_LOGO
cls
echo %msg_menu%:
echo ----------------------------------------
set count=0
for /f "delims=" %%f in ('dir /b /a-d "%SRC_MENU%\*.png" "%SRC_MENU%\*.jpg" "%SRC_MENU%\*.jpeg" 2^>nul') do (
    set /a count+=1
    set "file_!count!=%%f"
    echo [!count!] %%f
)
echo ----------------------------------------
echo.
if %count%==0 ( echo %msg_skip% && goto LOADER_LOGO )

set "choice="
set /p choice="%msg_enter%"
if "%choice%"=="" echo %msg_skip% && timeout /t 1 > nul && goto LOADER_LOGO
if not defined file_%choice% echo %msg_err_num% && timeout /t 2 > nul && goto MENU_LOGO

set "selected=!file_%choice%!"
if exist "%TARGET_IMAGES%\logo.png" del /F /Q "%TARGET_IMAGES%\logo.png" > nul
copy /Y "%SRC_MENU%\%selected%" "%TARGET_IMAGES%\logo.png" > nul
if errorlevel 1 (
    echo %msg_err_copy%
    pause
) else (
    echo %msg_ok%
)
timeout /t 1 > nul

:LOADER_LOGO
cls
echo %msg_loader%:
echo ----------------------------------------
set count=0
for /f "delims=" %%f in ('dir /b /a-d "%SRC_LOADER%\*.png" "%SRC_LOADER%\*.jpg" "%SRC_LOADER%\*.jpeg" 2^>nul') do (
    set /a count+=1
    set "file_!count!=%%f"
    echo [!count!] %%f
)
echo ----------------------------------------
echo.
if %count%==0 ( echo %msg_skip% && goto LOADER_BANNER )

set "choice="
set /p choice="%msg_enter%"
if "%choice%"=="" echo %msg_skip% && timeout /t 1 > nul && goto LOADER_BANNER
if not defined file_%choice% echo %msg_err_num% && timeout /t 2 > nul && goto LOADER_LOGO

set "selected=!file_%choice%!"
if exist "%TARGET_LOADER%\cheatLogo.png" del /F /Q "%TARGET_LOADER%\cheatLogo.png" > nul
copy /Y "%SRC_LOADER%\%selected%" "%TARGET_LOADER%\cheatLogo.png" > nul
if errorlevel 1 (
    echo %msg_err_copy%
    pause
) else (
    echo %msg_ok%
)
timeout /t 1 > nul

:LOADER_BANNER
cls
echo %msg_banner%
if exist "%SRC_BANNER%" (
    xcopy "%SRC_BANNER%\*" "%TARGET_LOADER%\" /Y /E /Q > nul
    echo %msg_ok%
) else (
    echo [SKIP]
)
timeout /t 1 > nul

:SELECT_ICO
cls
set "ICON_PATH="
if not exist "%SRC_ICO%" (
    echo [SKIP] Folder "%SRC_ICO%" not found.
    timeout /t 2 > nul
    goto CREATE_SHORTCUT
)

echo %msg_ico%:
echo ----------------------------------------
set count=0
for /f "delims=" %%f in ('dir /b /a-d "%SRC_ICO%\*.ico" 2^>nul') do (
    set /a count+=1
    set "file_!count!=%%f"
    echo [!count!] %%f
)
echo ----------------------------------------
echo.
if %count%==0 (
    echo %msg_skip% ^(No .ico files found^)
    timeout /t 2 > nul
    goto CREATE_SHORTCUT
)

set "choice="
set /p choice="%msg_enter%"
if "%choice%"=="" (
    echo %msg_skip%
    if exist "%SRC_ICO%\default.ico" set "ICON_PATH=%SRC_ICO%\default.ico"
    timeout /t 1 > nul
    goto CREATE_SHORTCUT
)
if not defined file_%choice% echo %msg_err_num% && timeout /t 2 > nul && goto SELECT_ICO

set "selected=!file_%choice%!"
set "ICON_PATH=%SRC_ICO%\%selected%"

:CREATE_SHORTCUT
cls
echo %msg_shortcut%
set "EXE_PATH=C:\Avalanche\AvalancheLoader.exe"

if exist "%EXE_PATH%" (
    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
        "$s = (New-Object -ComObject WScript.Shell).CreateShortcut(([Environment]::GetFolderPath('Desktop') + '\AvalancheLoader.lnk'));" ^
        "$s.TargetPath = '%EXE_PATH%';" ^
        "$s.WorkingDirectory = 'C:\Avalanche';" ^
        "if ('%ICON_PATH%' -ne '' -and (Test-Path '%ICON_PATH%')) { $s.IconLocation = '%ICON_PATH%, 0' };" ^
        "$s.Save();"
    echo %msg_ok%
) else (
    echo [ERROR] C:\Avalanche\AvalancheLoader.exe not found!
)
timeout /t 2 > nul

cls
echo %msg_done%
pause > nul
