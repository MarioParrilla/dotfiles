#!/bin/bash

# Obtener el sistema operativo
SO=$(uname)

# Comparar el sistema operativo

function runLinuxInstall() {
    nvimInstalled=$(which nvim | wc -l)
    if [ $nvimInstalled -eq 0 ]
    then
        apt-get install neovim > /dev/null
        if [ $? -ne 0 ]
        then
            echo "[!]: Error installing Neovim!."
            exit 1
        fi
        echo "[i]: Neovim Installed"
    else
        echo "[i]: Neovim is already installed"
    fi
}

if [ "$EUID" -ne 0 ]; then
    echo "[!]: You need to use with root permissions"
    exit 1
fi

if [ "$SO" == "Linux" ]; then
    runLinuxInstall
elif [ "$SO" == "Darwin" ]; then
    echo "Estás usando macOS"
else
    echo "Sistema operativo no reconocido: $SO"
fi
