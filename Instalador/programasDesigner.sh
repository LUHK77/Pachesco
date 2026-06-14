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

clear
estilizarTexto "Escolha o programa que deseja instalar:"
echo ""
echo " 1) Blender"
echo " 2) GIMP"
echo " 3) Figma"
echo " 4) Krita"
echo " 5) Inkscape"
echo " 6) Penpot"
echo ""
echo " 7) Voltar"
echo " 0) Sair"
echo "───────────────────────────────────────────────"
read -p " Digite o número da sua opção: " opcao

case $opcao in
    1)
        clear
        criarPacote "blender" "snap"
        ;;
    2)
        clear
        criarPacote "gimp" "apt"
        ;;
    3)
        clear
        criarPacote "figma" "deb"
        ;;
    4)
        clear
        criarPacote "krita" "apt"
        ;;
    5)
        clear
        criarPacote "inkscape" "apt"
        ;;
    6)
        clear
        criarPacote "penpot-desktop" "snap"
        ;;
    0)
        clear
        echo -e "\n${CYAN}[Saindo do instalador. Até mais!]${RESET}\n"
        ;;
    *)
        clear
        echo -e "\n${RED}[!] Opção inválida. Tente novamente.${RESET}"
        sleep 1
        bash programasDesigner.sh
        ;;
esac