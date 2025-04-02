#!/bin/bash
# УСТАНОВКА NEOVIM

set -e

# Переменные
URL="https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.appimage"
INSTALL_DIR="$HOME/.local/bin"
NVIM_BIN="$INSTALL_DIR/nvim"

# Проверяем и создаем директорию, если её нет
if [ ! -d "$INSTALL_DIR" ]; then
    mkdir -p "$INSTALL_DIR"
    echo "Создана директория $INSTALL_DIR"
fi

# Проверка и установка FUSE для Debian
if [ -f "/etc/debian_version" ]; then
    if ! command -v fuse >/dev/null 2>&1; then
        echo "Устанавливаем FUSE..."
        sudo apt update && sudo apt install -y fuse
    fi
fi

# Загрузка Neovim
curl -L "$URL" -o "$NVIM_BIN"

# Делаем исполняемым
chmod +x "$NVIM_BIN"

# Проверяем установку
if "$NVIM_BIN" --version >/dev/null 2>&1; then
    echo "Neovim успешно установлен в $NVIM_BIN"
else
    echo "Ошибка установки Neovim" >&2
    exit 1
fi

