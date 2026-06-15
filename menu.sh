#!/bin/bash
clear;
source "Instalador/helpers.sh";
# Cores da Interface

CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# Banner de Boas-Vindas

    echo -e "${CYAN}${BOLD}"
    echo "  ██████╗  █████╗  ██████╗██╗  ██╗███████╗███████╗ ██████╗ ██████╗       /\_/\ "
    echo "  ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔════╝██╔════╝██╔════╝██╔═══██╗    ( o.o )"
    echo "  ██████╔╝███████║██║     ███████║█████╗  ███████╗██║     ██║   ██║     > ^ < "
    echo "  ██╔═══╝ ██╔══██║██║     ██╔══██║██╔══╝  ╚════██║██║     ██║   ██║    /  |  \\"
    echo "  ██║     ██║  ██║╚██████╗██║  ██║███████╗███████║╚██████╗╚██████╔╝   (  |  |)"
    echo "  ╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝ ╚═════╝     (__|__)"
    echo -e "${BOLD}  Instalador de Programas para Linux${RESET}"
    echo -e "  ───────────────────────────────────────────────────────────────────────────\n"

# Opções do menu

echo "1-Instalar programas";
echo "2-Biblioteca";
echo "3-Exportar Lista de Programas";
echo "4-Importar Lista de Programas";
echo "5-Sair";
echo "";

# Oferece a opção para o usuário digitar
read -p "Digite uma opção: " op;


case "$op" in
    1)
	clear
    sudo bash Instalador/instalador.sh
    ;;
    2)
	clear
    bash Biblioteca/biblioteca.sh
    ;;
    3)
    # Executa uma função que cria uma lista em formato de txt de todos os programas instalados pela aplicação e seu tipo de instalação 
    exportarPacotes
    ;;
    4)
    # Executa uma função que instala e cria os controladores dos programas 
    importarPacotes
    ;;
    5)
    echo "Saindo..."
    sleep 2;
    clear;
	exit   
    ;;
    *)
    echo -e "\n${RED}[!] Opção inválida. Tente novamente.${RESET}"
    bash menu.sh;
    ;;
esac
sleep 2;
bash menu.sh;