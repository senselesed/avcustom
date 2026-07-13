@echo off
setlocal enabledelayedexpansion
chcp 65001 > nul
cls

:: Автоматический запрос прав администратора
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /b
)

:: Переходим в папку, где лежит сам bat-файл
cd /d "%~dp0"

set "TARGET_IMAGES=C:\Avalanche\assets\images"
set "TARGET_LOADER=C:\Avalanche\assets\loader"
set "SRC_MENU=logo (menu)"
set "SRC_LOADER=logo (loader)"
set "SRC_FONT=font"
set "SRC_BANNER=banner (loader)"

if not exist "%SRC_MENU%" ( echo [ERROR] Folder "%SRC_MENU%" not found. && pause && exit )
if not exist "%SRC_LOADER%" ( echo [ERROR] Folder "%SRC_LOADER%" not found. && pause && exit )

if not exist "%TARGET_IMAGES%" mkdir "%TARGET_IMAGES%" 2>nul
if not exist "%TARGET_LOADER%" mkdir "%TARGET_LOADER%" 2>nul

:LANG_SELECT
cls
echo Language / Язык:
echo English
echo Русский
echo.
set /p lang="Choose [1/2]: "

if "%lang%"=="1" (
    set "msg_font=Copying fonts..."
    set "msg_menu=Select logo for CHEAT MENU"
    set "msg_loader=Select logo for LOADER"
    set "msg_banner=Copying banners..."
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

:: 1. Шрифты
cls
echo %msg_font%
if exist "%SRC_FONT%\icons_data.ttf" (
    copy /Y "%SRC_FONT%\icons_data.ttf" "%TARGET_LOADER%\icons_data.ttf" > nul
    echo %msg_ok%
) else (
    echo [SKIP]
)
timeout /t 1 > nul

:: 2. Логотип меню
:MENU_LOGO
cls
echo %msg_menu%:
echo ----------------------------------------
set count=0
for /f "delims=" %%f in ('where /R "%SRC_MENU%" *.png *.jpg *.jpeg 2^>nul') do (
    set /a count+=1
    set "file_!count!=%%~nxf"
    echo [!count!] %%~nxf
)
echo ----------------------------------------
echo.
if %count%==0 ( echo %msg_skip% && goto LOADER_LOGO )

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

:: 3. Логотип лоадера
:LOADER_LOGO
cls
echo %msg_loader%:
echo ----------------------------------------
set count=0
for /f "delims=" %%f in ('where /R "%SRC_LOADER%" *.png *.jpg *.jpeg 2^>nul') do (
    set /a count+=1
    set "file_!count!=%%~nxf"
    echo [!count!] %%~nxf
)
echo ----------------------------------------
echo.
if %count%==0 ( echo %msg_skip% && goto LOADER_BANNER )

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

:: 4. Баннеры
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

:: 5. Создание ярлыка с кастомной иконкой из C:\Avalanche
:CREATE_SHORTCUT
cls
echo %msg_shortcut%
set "EXE_PATH=C:\Avalanche\AvalancheLoader.exe"
set "ICON_PATH=%USERPROFILE%\Desktop\avcustom\ico\default.ico"

if exist "%EXE_PATH%" (
    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
        "$s = (New-Object -ComObject WScript.Shell).CreateShortcut(([Environment]::GetFolderPath('Desktop') + '\AvalancheLoader.lnk'));" ^
        "$s.TargetPath = '%EXE_PATH%';" ^
        "$s.WorkingDirectory = 'C:\Avalanche';" ^
        "if (Test-Path '%ICON_PATH%') { $s.IconLocation = '%ICON_PATH%' };" ^
        "$s.Save();"
    echo %msg_ok%
) else (
    echo [ERROR] C:\Avalanche\AvalancheLoader.exe not found!
)
timeout /t 2 > nul

cls
echo %msg_done%
pause > nul
