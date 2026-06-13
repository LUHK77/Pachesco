#!/bin/bash

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
echo -e "${CYAN}┌────────────────────────────────────────────┐${RESET}"
echo -e "${CYAN}│${RESET}   ${BOLD}Escolha o programa que deseja instalar:${RESET}   ${CYAN}│${RESET}"
echo -e "${CYAN}└────────────────────────────────────────────┘${RESET}"
echo ""
echo " 1) Blender"
echo " 2) GIMP"
echo " 3) Figma"
echo " 4) Krita"
echo " 5) Inkscape"
echo " 6) Canva"
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
        echo -e "${CYAN}[Instalando Blender...]${RESET}"
        snap install blender --classic
        echo -e "${GREEN}[✓ Blender instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    2)
        clear
        echo -e "\n${CYAN}[Atualizando repositórios...]${RESET}"
        apt update -y
        echo -e "${CYAN}[Instalando GIMP...]${RESET}"
        apt install -y gimp
        echo -e "${GREEN}[✓ GIMP instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    3)
        clear
        echo -e "\n${CYAN}[Baixando Figma...]${RESET}"
        wget -q --show-progress -O /tmp/figma.deb "https://desktop.figma.com/linux/Figma-linux-x64.deb"
        echo -e "${CYAN}[Instalando Figma...]${RESET}"
        dpkg -i /tmp/figma.deb
        apt install -f -y
        echo -e "${GREEN}[✓ Figma instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    4)
        clear
        echo -e "\n${CYAN}[Atualizando repositórios...]${RESET}"
        apt update -y
        echo -e "${CYAN}[Instalando Krita...]${RESET}"
        apt install -y krita
        echo -e "${GREEN}[✓ Krita instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    5)
        clear
        echo -e "\n${CYAN}[Atualizando repositórios...]${RESET}"
        apt update -y
        echo -e "${CYAN}[Instalando Inkscape...]${RESET}"
        apt install -y inkscape
        echo -e "${GREEN}[✓ Inkscape instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    6)
        clear
        echo -e "\n${CYAN}[Canva não possui cliente nativo para Linux.]${RESET}"
        echo -e " ${CYAN}Abrindo a versão web no navegador padrão...${RESET}"
        xdg-open "https://www.canva.com" 2>/dev/null || echo -e "${RED}[!] Não foi possível abrir o navegador automaticamente.${RESET}"
        echo -e " ${CYAN}Acesse manualmente: https://www.canva.com${RESET}"
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
        bash programasdesigner.sh
        ;;
esac