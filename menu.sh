#!/bin/bash
clear;
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
echo "4-Backup de Pacotes";
echo "5-Sair";

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
	clear;
    ls Biblioteca/Pacotes | sed 's/\.sh$//' > Biblioteca/relatorioDeProgramas.txt;
	echo "Exportando aplicações..."
    ;;
    4)
	clear;
    echo "Fazendo backup..."
    ;;
    5)
	clear
    echo "Saindo..."
	exit
    ;;
    *)
	clear
    echo "Digite uma opção valida!"
    bash menu.sh
    ;;
esac





