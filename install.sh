#!/bin/bash

# Obtener el sistema operativo
SO=$(uname)

# Comparar el sistema operativo
if [ "$SO" == "Linux" ]; then
    runLinuxInstall
elif [ "$SO" == "Darwin" ]; then
    echo "Estás usando macOS"
else
    echo "Sistema operativo no reconocido: $SO"
fi

runLinuxInstall() {
    nvimInstalled=dpkg --list | grep -o neovim -m 1 | wc -l
    if [ $nvimInstalled -eq 0 ]
    then
        apt-get install neovim;
        if [ $? -ne 0 ]
        then
            echo "[!]: Error installing Neovim!."
            exit 1
        fi
    else
        echo "[i]: Neovim is already installed"
    fi
}
