#!/bin/bash
source "$(dirname "$0")/helpers.sh";

CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

clear
estilizarTexto "Escolha o programa que deseja instalar:"
echo ""
echo " 1) VLC"
echo " 2) LibreOffice"
echo " 3) Firefox"
echo " 4) Thunderbird"
echo " 5) Flameshot"
echo " 6) Transmission"
echo ""
echo " 7) Voltar"
echo " 0) Sair"
echo "───────────────────────────────────────────────"

read -p " Digite o número da sua opção: " opcao

case $opcao in
    1)
        clear
        criarPacote "vlc" "apt"
        ;;
    2)
        clear
        criarPacote "libreoffice" "apt"
        ;;
    3)
        clear
        criarPacote "firefox" "snap"
        ;;
    4)
        clear
        criarPacote "thunderbird" "snap"
        ;;
    5)
        clear
        criarPacote "flameshot" "snap"
        ;;
    6)
        clear
        criarPacote "transmission" "apt"
        ;;
    7)
        clear;
        bash Instalador/instalador.sh
        ;;
    0)
        clear
        echo -e "\n${CYAN}[Saindo do instalador. Até mais!]${RESET}\n"
        ;;
    *)
        clear
        echo -e "\n${RED}[!] Opção inválida. Tente novamente.${RESET}"
        sleep 1
        bash Instalador/programasEmGeral.sh
        ;;
esac