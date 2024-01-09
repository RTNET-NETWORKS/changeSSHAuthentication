#!/bin/bash

# Made by ChatGPT !
# Be free to change the script as you want

# Vérifie si l'argument est fourni
if [ -z "$1" ]; then
    echo "Usage: $0 <yes|no>"
    exit 1
fi

# Vérifie si l'argument est "yes" ou "no"
if [ "$1" != "yes" ] && [ "$1" != "no" ]; then
    echo "Invalid argument. Please provide 'yes' or 'no'."
    exit 1
fi

# Définit le chemin du fichier de configuration SSH
sshd_config="/etc/ssh/sshd_config"

# Sauvegarde du fichier de configuration original
cp "$sshd_config" "$sshd_config.bak"

# Modifie la ligne PasswordAuthentication dans le fichier de configuration
sed -i "s/^PasswordAuthentication.*/PasswordAuthentication $1/" "$sshd_config"

# Redémarre le service SSH pour appliquer les changements
systemctl reload ssh

echo "PasswordAuthentication in $sshd_config set to $1"
