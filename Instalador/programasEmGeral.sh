#!/bin/bash
source "$(dirname "$0")/helpers.sh";
# ─────────────────────────────────────────
#  Cores da Interface
# ─────────────────────────────────────────
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BOLD='\033[1m'
RESET='\033[0m'

# ─────────────────────────────────────────
#  Verificar root
# ─────────────────────────────────────────
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}[!] Este script precisa ser executado como root (sudo).${RESET}"
    exit 1
fi

clear
echo -e "${CYAN}┌──────────────────────────────────────────────┐${RESET}"
echo -e "${CYAN}│${RESET}   ${BOLD}Escolha o programa que deseja instalar:${RESET}   ${CYAN}│${RESET}"
echo -e "${CYAN}└──────────────────────────────────────────────┘${RESET}"
echo ""
echo " 1) VLC           — Reprodutor de mídia"
echo " 2) LibreOffice   — Pacote de escritório"
echo " 3) Firefox       — Navegador web"
echo " 4) Thunderbird   — Cliente de e-mail"
echo " 5) Flameshot     — Captura de tela"
echo " 6) Transmission  — Gerenciador de downloads"
echo ""
echo " 7) Voltar"
echo " 0) Sair"
echo "───────────────────────────────────────────────"
read -p " Digite o número da sua opção: " opcao

case $opcao in
    1)
        clear
        echo -e "\n${CYAN}[Atualizando repositórios...]${RESET}"
        apt update -y
        echo -e "${CYAN}[Instalando VLC...]${RESET}"
        apt install -y vlc
        echo -e "${GREEN}[✓ VLC instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    2)
        clear
        echo -e "\n${CYAN}[Atualizando repositórios...]${RESET}"
        apt update -y
        echo -e "${CYAN}[Instalando LibreOffice...]${RESET}"
        apt install -y libreoffice
        echo -e "${GREEN}[✓ LibreOffice instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    3)
        clear
        echo -e "\n${CYAN}[Atualizando repositórios...]${RESET}"
        apt update -y
        echo -e "${CYAN}[Instalando Firefox...]${RESET}"
        apt install -y firefox
        echo -e "${GREEN}[✓ Firefox instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    4)
        clear
        echo -e "\n${CYAN}[Atualizando repositórios...]${RESET}"
        apt update -y
        echo -e "${CYAN}[Instalando Thunderbird...]${RESET}"
        apt install -y thunderbird
        echo -e "${GREEN}[✓ Thunderbird instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    5)
        clear
        echo -e "\n${CYAN}[Atualizando repositórios...]${RESET}"
        apt update -y
        echo -e "${CYAN}[Instalando Flameshot...]${RESET}"
        apt install -y flameshot
        echo -e "${GREEN}[✓ Flameshot instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    6)
        clear
        echo -e "\n${CYAN}[Atualizando repositórios...]${RESET}"
        apt update -y
        echo -e "${CYAN}[Instalando Transmission...]${RESET}"
        apt install -y transmission
        echo -e "${GREEN}[✓ Transmission instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
     7)
        clear
        cd ..
        bash instalador.sh
        ;;
    0)
        clear
        echo -e "\n${CYAN}[Saindo do instalador. Até mais!]${RESET}\n"
        exit 0
        ;;
    *)
        clear
        echo -e "\n${RED}[!] Opção inválida. Tente novamente.${RESET}"
        sleep 1
        bash programasemgeral.sh
        ;;
esac