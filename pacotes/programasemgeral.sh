#!/bin/bash

# Verificação se o usuário é root
if [ "$EUID" -ne 0 ]; then
    echo -e "\033[0;36m[Erro]\033[0m Por favor, execute este script como root (ou usando sudo)."
    exit 1
fi

CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'
VERDE='\033[0;32m'
SEM_COR='\033[0m'

while true; do
    clear
    echo -e "${CYAN}┌──────────────────────────────────────────────┐${RESET}"
    echo -e "${CYAN}│${RESET}  ${BOLD}Qual categoria de pacotes deseja instalar?${RESET}  ${CYAN}│${RESET}"
    echo -e "${CYAN}└──────────────────────────────────────────────┘${RESET}"
    echo " 1) Navegadores         -> Firefox, Chromium, Lynx"
    echo " 2) Comunicação         -> Thunderbird, Telegram, Discord"
    echo " 3) Produtividade       -> LibreOffice, Obsidian, Calibre"
    echo " 4) Segurança & Rede    -> UFW, Fail2ban, Nmap, Net-tools, OpenVPN"
    echo " 5) Sistema & Monitor   -> Htop, Neofetch, Timeshift, Bleachbit, Gnome-Disk"
    echo " 6) Multimídia          -> VLC, MPV, Audacity, OBS Studio"
    echo " 7) Combo Completo      -> Todos os programas listados acima"
    echo " 8) Voltar"
    echo " 9) Sair"
    echo "───────────────────────────────────────────────────────────────"

    read -p "Digite o número da sua opção: " opcao

    case $opcao in
        1)
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Navegadores...]${SEM_COR}"
            apt install -y firefox chromium-browser lynx
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        2)
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Programas de Comunicação...]${SEM_COR}"
            apt install -y thunderbird
            echo -e "${VERDE}[Instalando Telegram via Snap...]${SEM_COR}"
            snap install telegram-desktop
            echo -e "${VERDE}[Instalando Discord via Snap...]${SEM_COR}"
            snap install discord
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        3)
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Programas de Produtividade...]${SEM_COR}"
            apt install -y libreoffice calibre
            echo -e "${VERDE}[Instalando Obsidian via Snap...]${SEM_COR}"
            snap install obsidian --classic
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        4)
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Ferramentas de Segurança & Rede...]${SEM_COR}"
            apt install -y ufw fail2ban nmap net-tools openvpn
            echo -e "${VERDE}[Ativando UFW (firewall)...]${SEM_COR}"
            ufw --force enable
            echo -e "${VERDE}[Ativando Fail2ban...]${SEM_COR}"
            systemctl enable --now fail2ban
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        5)
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Ferramentas de Sistema & Monitor...]${SEM_COR}"
            apt install -y htop neofetch timeshift bleachbit gnome-disk-utility
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        6)
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Programas de Multimídia...]${SEM_COR}"
            apt install -y vlc mpv audacity
            echo -e "${VERDE}[Instalando OBS Studio...]${SEM_COR}"
            add-apt-repository -y ppa:obsproject/obs-studio
            apt update -y
            apt install -y obs-studio
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        7)
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Combo Completo Utilitários...]${SEM_COR}"
            # Navegadores
            apt install -y firefox chromium-browser lynx
            # Comunicação
            apt install -y thunderbird
            snap install telegram-desktop
            snap install discord
            # Produtividade
            apt install -y libreoffice calibre
            snap install obsidian --classic
            # Segurança & Rede
            apt install -y ufw fail2ban nmap net-tools openvpn
            ufw --force enable
            systemctl enable --now fail2ban
            # Sistema & Monitor
            apt install -y htop neofetch timeshift bleachbit gnome-disk-utility
            # Multimídia
            apt install -y vlc mpv audacity
            add-apt-repository -y ppa:obsproject/obs-studio
            apt update -y
            apt install -y obs-studio
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        8)
            clear
            sudo bash instalador.sh
            ;;
        9)
            clear
            echo -e "\n${VERDE}[Saindo do instalador...]${SEM_COR}"
            exit 0
            ;;
        *)
            clear
            echo -e "\nDigite uma opção válida."
            sleep 2
            ;;
    esac
done