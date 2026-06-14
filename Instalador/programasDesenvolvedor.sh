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

clear
echo -e "${CYAN}┌────────────────────────────────────────────┐${RESET}"
echo -e "${CYAN}│${RESET}   ${BOLD}Escolha o programa que deseja instalar:${RESET}   ${CYAN}│${RESET}"
echo -e "${CYAN}└────────────────────────────────────────────┘${RESET}"
echo ""
echo " 1) VS Code";
echo " 2) Arduino";
echo " 3) Eclipse";
echo " 4) SQLite";
echo " 5) Pycharm";
echo " 6) Dev C++";
echo ""
echo " 0) Sair"
echo "───────────────────────────────────────────────"
read -p " Digite o número da sua opção: " opcao

case $opcao in
    1)
        clear
        criarPacote "code" "apt"
        ;;
    2)
        clear
        criarPacote "arduino" "snap";
        ;;
    3)
        clear;
	    #Cria um arquivo com as informações do programa instalado
	    criarPacote "eclipse" "snap";
	    ;;
    4)
        clear
        criarPacote "sqlitestudio" "apt"
        ;;
    5)
        clear
        criarPacote "pycharm-community" "snap"
        ;;
    6)
        clear
        criarPacote "codeblocks" "apt"
        ;;
    0)
        clear
        echo -e "\n${CYAN}[Saindo do instalador. Até mais!]${RESET}\n"
        exit 0
        ;;
    *)
        clear
        echo -e "\n${RED}[!] Opção inválida. Tente novamente.${RESET}"
        bash programasDesenvolvedor.sh
        sleep 1
        bash programasDesenvolvedor.sh
        ;;
esac