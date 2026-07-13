# 🏔️ Avalanche Customization Kit

<p align="center">
  <img src="https://shields.io" alt="Platform">
  <img src="https://shields.io" alt="Languages">
  <img src="https://shields.io" alt="Status">
</p>

---

## Требования / Requirements

> [!IMPORTANT]
> * 🇷🇺 **РАБОЧИЙ СТОЛ:** Архив **ДОЛЖЕН** быть полностью распакован на Рабочий стол текущего пользователя перед запуском. Работа напрямую из ZIP/RAR архива приведет к ошибкам путей!
> * 🇷🇺 **ДИРЕКТОРИЯ:** Сам исполняемый файл лоадера `AvalancheLoader.exe` **ОБЯЗАТЕЛЬНО** должен предварительно лежать в папке `C:\Avalanche\`.

> [!IMPORTANT]
> * 🇺🇸 **DESKTOP:** The archive **MUST** be fully unpacked onto your Desktop before running. Executing scripts inside a ZIP/RAR archive will cause directory errors.
> * 🇺🇸 **DIRECTORY:** The actual `AvalancheLoader.exe` file **MUST** be pre-located inside the `C:\Avalanche\` root directory.

---

## ⚡ Способ #1: Автопилот (через `replacer.bat`)

Скрипт полностью автоматизирует процесс рутинной замены ассетов, индексирует доступную графику и генерирует ярлык среды.

### 🇷🇺 Инструкция:
1. Нажмите правой кнопкой мыши по файлу **`replacer.bat`** ➔ **Запуск от имени Администратора** (требуется для создания директорий и линковки в `C:\`).
2. Выберите язык интерфейса в консоли: `1` для English или `2` для Русского.
3. Скрипт просканирует подпапки, выведет список доступных изображений и предложит интерактивный выбор:
   * Введите номер картинки для **Меню чита** (или `Enter` для пропуска).
   * Введите номер картинки для **Лоадера** (или `Enter` для пропуска).
4. **Финал автоматизации:** Скрипт автоматически проверит наличие `C:\Avalanche\AvalancheLoader.exe`, создаст для него рабочий ярлык на вашем Рабочем столе, настроит внутренние рабочие директории и привяжет кастомную премиум-иконку из папки `avcustom`.

### 🇺🇸 Instructions:
1. Right-click **`replacer.bat`** ➔ **Run as Administrator** (required for creating system directories and linking inside `C:\`).
2. Select your layout language in the console: `1` for English, `2` for Russian.
3. The script processes asset subfolders, indexes graphics, and provides an interactive prompt:
   * Input the index number for the **Cheat Menu Logo** (or hit `Enter` to skip).
   * Input the index number for the **Loader Logo** (or hit `Enter` to skip).
4. **Deployment Phase:** The script validates `C:\Avalanche\AvalancheLoader.exe`, deploys a desktop shortcut, maps operational path environments, and applies a custom `.ico` profile.

---

## 🛠️ Способ #2: Ручной хардкор (Manual Pipeline)

Если вы хотите полностью контролировать структуру папок и заменять файлы самостоятельно.

### 🇷🇺 Алгоритм сборки:

* **Логотип Чит-Меню:**  
  Перейдите в `logo (loader+menu)` ➔ Выберите нужный вариант графики ➔ Переименуйте его в `logo.png` ➔ Скопируйте с заменой по пути:
  ```bash
  C:\Avalanche\assets\images\logo.png
  ```
* **Логотип Лоадера:**  
  Выберите изображение ➔ Переименуйте его строго в `cheatLogo.png` ➔ Перенесите с заменой в папку:
  ```bash
  C:\Avalanche\assets\loader\cheatLogo.png
  ```
* **Смена Баннеров:**  
  Скопируйте абсолютно все файлы из локальной папки `banner (loader)` и перенесите их с заменой в директорию:
  ```bash
  C:\Avalanche\assets\loader\
  ```
* **Кастомные Иконки (Шрифты):**  
  Возьмите файл `icons_data.ttf` из папки `font` и переместите его с заменой в целевую директорию:
  ```bash
  C:\Avalanche\assets\loader\icons_data.ttf
  ```

### 🇺🇸 Step-by-Step Flow:

* **Cheat Menu Logo:**  
  Open `logo (loader+menu)` ➔ Choose your asset variant ➔ Rename it to `logo.png` ➔ Move and overwrite at:
  ```bash
  C:\Avalanche\assets\images\logo.png
  ```
* **Loader Logo:**  
  Pick an image ➔ Rename it exactly to `cheatLogo.png` ➔ Move and overwrite inside:
  ```bash
  C:\Avalanche\assets\loader\cheatLogo.png
  ```
* **Banners Swapping:**  
  Copy all files inside the local `banner (loader)` folder ➔ Paste and overwrite directly to:
  ```bash
  C:\Avalanche\assets\loader\
  ```
* **Loader Glyphs & Fonts:**  
  Extract `icons_data.ttf` from the `font` directory ➔ Overwrite it inside:
  ```bash
  C:\Avalanche\assets\loader\icons_data.ttf
  ```

---

<p align="center">
  <sub>Automated Script Powered by <b>Avalanche Customizer Core</b> • 2026</sub>
</p>
