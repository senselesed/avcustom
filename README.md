# 🏔️ Avalanche Customization Kit

---

## Требования / Requirements

> [!IMPORTANT]
> 🇷🇺 Архив **ДОЛЖЕН** быть полностью распакован на Рабочий стол текущего пользователя перед запуском. Работа напрямую из ZIP/RAR архива приведет к ошибкам путей! (Папка с кастомными иконками должна находиться по пути `Desktop\avcustom\ico`).
> 🇷🇺 Сам исполняемый файл лоадера `AvalancheLoader.exe` **ОБЯЗАТЕЛЬНО** должен предварительно лежать в папке `C:\Avalanche\`.

> [!IMPORTANT]
> 🇺🇸 The archive **MUST** be fully unpacked onto your Desktop before running. Executing scripts inside a ZIP/RAR archive will cause directory errors. (Your custom icons folder should be located at `Desktop\avcustom\ico`).
> 🇺🇸 The actual `AvalancheLoader.exe` file **MUST** be pre-located inside the `C:\Avalanche\` root directory.

> [!WARNING]
> 🇷🇺 **ВНИМАНИЕ:** После первого переноса файлов через `replacer.bat`, вам необходимо запустить лоадер, закрыть его, а затем **запустить скрипт и перенести файлы еще раз**. При первом запуске лоадер удаляет/сбрасывает кастомные файлы!

> [!WARNING]
> 🇺🇸 **WARNING:** After transferring files for the first time via `replacer.bat`, you must launch the loader, close it, and then **run the script to transfer the files again**. The loader deletes/resets custom assets during its initial run!

---

## Способ #1: через `replacer.bat`

Скрипт полностью автоматизирует процесс копирования файлов и создания ярлыка.

### 🇷🇺 Инструкция:
1. Нажмите правой кнопкой мыши по файлу **`replacer.bat`** ➔ **Запуск от имени Администратора**.
2. Выберите язык интерфейса в консоли: `1` для English или `2` для Русского.
3. Скрипт автоматически настроит шрифты, предложит интерактивный выбор логотипов, скопирует баннеры и создаст ярлык с выбранной иконкой.
4. **Не забудьте повторить процедуру после первого запуска лоадера!**

### 🇺🇸 Instructions:
1. Right-click **`replacer.bat`** ➔ **Run as Administrator**.
2. Select your layout language in the console: `1` for English, `2` for Russian.
3. The script will automatically configure fonts, prompt for logo choices, transfer banners, and create a shortcut with the selected icon.
4. **Do not forget to repeat the process after launching the loader for the first time!**

---

## Способ #2: Ручной (Manual)

Если вы хотите заменять файлы самостоятельно.

### 🇷🇺 Пошаговый процесс:

**Логотип Чит-Меню:** Перейдите в папку `logo (menu)` ➔ Выберите нужный вариант логотипа ➔ Переименуйте его в `logo.png` ➔ Скопируйте с заменой по пути: `C:\Avalanche\assets\images\logo.png`

**Логотип Лоадера:** Перейдите в папку `logo (loader)` ➔ Выберите изображение ➔ Переименуйте его в `cheatLogo.png` ➔ Перенесите с заменой в: `C:\Avalanche\assets\loader\cheatLogo.png`

**Смена Баннеров:** Скопируйте абсолютно все файлы из локальной папки `banner (loader)` и перенесите их с заменой в директорию: `C:\Avalanche\assets\loader\`

**Шрифты Лоадера:** Возьмите файл `icons_data.ttf` из папки `font (loader)` и переместите его с заменой в: `C:\Avalanche\assets\loader\icons_data.ttf`

**Шрифты Меню:** Возьмите файлы `jetbrains_mono_medium.ttf` и `jetbrains_mono_regular.ttf` из папки `font (menu)` и переместите их с заменой в: `C:\Avalanche\assets\fonts\`

### 🇺🇸 Step-by-Step Flow:

**Cheat Menu Logo:** Open `logo (menu)` ➔ Choose your asset variant ➔ Rename it to `logo.png` ➔ Move and overwrite at: `C:\Avalanche\assets\images\logo.png`

**Loader Logo:** Open `logo (loader)` ➔ Pick an image ➔ Rename it exactly to `cheatLogo.png` ➔ Move and overwrite inside: `C:\Avalanche\assets\loader\cheatLogo.png`

**Banners Swapping:** Copy all files inside the local `banner (loader)` folder ➔ Paste and overwrite directly to: `C:\Avalanche\assets\loader\`

**Loader Fonts (Glyphs):** Extract `icons_data.ttf` from the `font (loader)` directory ➔ Overwrite it inside: `C:\Avalanche\assets\loader\icons_data.ttf`

**Menu Fonts:** Extract `jetbrains_mono_medium.ttf` and `jetbrains_mono_regular.ttf` from the `font (menu)` directory ➔ Move and overwrite inside: `C:\Avalanche\assets\fonts\`

---

<p align="center">
  <sub> <b>Avalanche Customization Kit</b> </sub>
</p>
