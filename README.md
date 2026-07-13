# 🏔️ Avalanche Customization Kit

---

## Требования / Requirements

> [!IMPORTANT]
>  🇷🇺 Архив **ДОЛЖЕН** быть полностью распакован на Рабочий стол текущего пользователя перед запуском. Работа напрямую из ZIP/RAR архива приведет к ошибкам путей!
>  🇷🇺 Сам исполняемый файл лоадера `AvalancheLoader.exe` **ОБЯЗАТЕЛЬНО** должен предварительно лежать в папке `C:\Avalanche\`.

> [!IMPORTANT]
>  🇺🇸 The archive **MUST** be fully unpacked onto your Desktop before running. Executing scripts inside a ZIP/RAR archive will cause directory errors.
>  🇺🇸 The actual `AvalancheLoader.exe` file **MUST** be pre-located inside the `C:\Avalanche\` root directory.

---

##  Способ #1: через `replacer.bat`

Скрипт полностью автоматизирует процесс замены файлов

### 🇷🇺 Инструкция:
1. Нажмите правой кнопкой мыши по файлу **`replacer.bat`** ➔ **Запуск от имени Администратора**.
2. Выберите язык интерфейса в консоли: `1` для English или `2` для Русского.
3. Скрипт просканирует подпапки, выведет список доступных изображений и предложит интерактивный выбор.

### 🇺🇸 Instructions:
1. Right-click **`replacer.bat`** ➔ **Run as Administrator**.
2. Select your layout language in the console: `1` for English, `2` for Russian.
3. The script processes asset subfolders, indexes graphics, and provides an interactive prompt.

---

##  Способ #2: Ручной (Manual)

Если вы хотите заменять файлы самостоятельно.

### 🇷🇺 Пошаговый процесс:

 **Логотип Чит-Меню:**  
  Перейдите в `logo (loader+menu)` ➔ Выберите нужный вариант логотипа ➔ Переименуйте его в `logo.png` ➔ Скопируйте с заменой по пути:
  ```bash
  C:\Avalanche\assets\images\logo.png
  ```
 **Логотип Лоадера:**  
  Выберите изображение ➔ Переименуйте его в `cheatLogo.png` ➔ Перенесите с заменой в папку:
  ```bash
  C:\Avalanche\assets\loader\cheatLogo.png
  ```
 **Смена Баннеров:**  
  Скопируйте абсолютно все файлы из локальной папки `banner (loader)` и перенесите их с заменой в директорию:
  ```bash
  C:\Avalanche\assets\loader\
  ```
 **Кастомные Иконки (Шрифты):**  
  Возьмите файл `icons_data.ttf` из папки `font` и переместите его с заменой в директорию:
  ```bash
  C:\Avalanche\assets\loader\icons_data.ttf
  ```

### 🇺🇸 Step-by-Step Flow:

 **Cheat Menu Logo:**  
  Open `logo (loader+menu)` ➔ Choose your asset variant ➔ Rename it to `logo.png` ➔ Move and overwrite at:
  ```bash
  C:\Avalanche\assets\images\logo.png
  ```
 **Loader Logo:**  
  Pick an image ➔ Rename it exactly to `cheatLogo.png` ➔ Move and overwrite inside:
  ```bash
  C:\Avalanche\assets\loader\cheatLogo.png
  ```
 **Banners Swapping:**  
  Copy all files inside the local `banner (loader)` folder ➔ Paste and overwrite directly to:
  ```bash
  C:\Avalanche\assets\loader\
  ```
 **Loader Glyphs & Fonts:**  
  Extract `icons_data.ttf` from the `font` directory ➔ Overwrite it inside:
  ```bash
  C:\Avalanche\assets\loader\icons_data.ttf
  ```

---

<p align="center">
  <sub> <b>Avalanche Customization Kit</b> </sub>
</p>
