#!/bin/bash

# Obtener el sistema operativo
SO=$(uname)

# Comparar el sistema operativo

function runLinuxInstall() {
    nvimInstalled=$(which nvim | wc -l)
    if [ $nvimInstalled -eq 0 ]
    then
        apt-get install neovim
        if [ $? -ne 0 ]
        then
            echo "[!]: Error installing Neovim!."
            exit 1
        fi
    else
        echo "[i]: Neovim is already installed"
    fi
}

if [ "$SO" == "Linux" ]; then
    runLinuxInstall
elif [ "$SO" == "Darwin" ]; then
    echo "Estás usando macOS"
else
    echo "Sistema operativo no reconocido: $SO"
fi
