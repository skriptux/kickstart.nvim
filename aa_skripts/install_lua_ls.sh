#!/bin/bash

set -e

# Переменные
REPO_URL="https://github.com/LuaLS/lua-language-server"
INSTALL_DIR="$HOME/.local/bin"
SOURCE_DIR="$HOME/apps/lua-language-server-src"  # Директория для исходников
LUA_LS_BIN="$INSTALL_DIR/lua-language-server"

# Проверяем и создаем директорию, если её нет
if [ ! -d "$INSTALL_DIR" ]; then
    mkdir -p "$INSTALL_DIR"
    echo "Создана директория $INSTALL_DIR"
fi

# Проверяем и создаем директорию для исходников
if [ ! -d "$SOURCE_DIR" ]; then
    mkdir -p "$SOURCE_DIR"
    echo "Создана директория $SOURCE_DIR для исходников"
fi

# Проверка и установка git для Debian
if [ -f "/etc/debian_version" ]; then
    if ! command -v git >/dev/null 2>&1; then
        echo "Устанавливаем Git..."
        sudo apt update && sudo apt install -y git
    fi
fi

# Проверка и установка необходимых зависимостей для Debian
if [ -f "/etc/debian_version" ]; then
    if ! command -v ninja >/dev/null 2>&1; then
        echo "Устанавливаем Ninja..."
        sudo apt update && sudo apt install -y ninja-build g++-17
    fi
fi

# Клонируем репозиторий в директорию для исходников, если он ещё не клонирован
if [ ! -d "$SOURCE_DIR/lua-language-server" ]; then
    echo "Клонируем репозиторий Lua Language Server..."
    git clone "$REPO_URL" "$SOURCE_DIR/lua-language-server"
fi

# Переходим в каталог с исходниками
cd "$SOURCE_DIR/lua-language-server"

# Собираем проект
echo "Собираем Lua Language Server..."
./make.sh

# Делаем ссылку в ~/.local/bin
ln -s ~/apps/lua-language-server-src/lua-language-server/bin/lua-language-server ~/.local/bin/lua-language-server

# Проверяем установку
if "$LUA_LS_BIN" --version >/dev/null 2>&1; then
    echo "Lua Language Server успешно установлен в $LUA_LS_BIN"
else
    echo "Ошибка установки Lua Language Server" >&2
    exit 1
fi

