#!/bin/bash

    # Cores da Interface

    CYAN='\033[0;36m'
    BOLD='\033[1m'
    RESET='\033[0m'


    # Menu de seleção de categoria de programas

    echo -e "${CYAN}┌──────────────────────────────────────────────┐${RESET}"
    echo -e "${CYAN}│${RESET}  ${BOLD}Qual categoria de pacotes deseja instalar?${RESET}  ${CYAN}│${RESET}"
    echo -e "${CYAN}└──────────────────────────────────────────────┘${RESET}"
    echo " 1) Dev Web           -> Git, Node.js, NPM, Docker"
    echo " 2) Dev Python        -> Git, Python3, Pip, Venv"
    echo " 3) Dev C/C++         -> Git, GCC, G++, Make, CMake, Build-Essential"
    echo " 4) Ferramentas Base  -> Git, Vim, Curl, Wget, Tmux, Htop"
    echo " 5) Combo Completo    -> Todos os programas listados acima"
    echo " 6) Voltar"
    echo " 7) Sair"
    echo "───────────────────────────────────────────────────────────────"
    
    # Oferece a opção para o usuário digitar
    read -p "Digite o número da sua opção: " opcao

    case $opcao in
        1)
            clear
            echo -e "\n${CYAN}[Lendo repositórios...]${RESET}"
            apt update -y
            echo -e "${CYAN}[Instalando Pacote Dev Web...]${RESET}"
            apt install -y git docker.io nodejs npm
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        2)
            clear
            echo -e "\n${CYAN}[Lendo repositórios...]${RESET}"
            apt update -y
            echo -e "${CYAN}[Instalando Pacote Dev Python...]${RESET}"
            apt install -y python3 python3-pip python3-venv git
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        3)  
            clear
            echo -e "\n${CYAN}[Lendo repositórios...]${RESET}"
            apt update -y
            echo -e "${CYAN}[Instalando Pacote Dev C/C++...]${RESET}"
            apt install -y build-essential gcc g++ make cmake git
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        4)
            clear
            echo -e "\n${CYAN}[Lendo repositórios...]${RESET}"
            apt update -y
            echo -e "${CYAN}[Instalando Pacote Ferramentas Base...]${RESET}"
            apt install -y curl vim git tmux htop wget
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        5)  
            clear
            echo -e "\n${CYAN}[Lendo repositórios...]${RESET}"
            apt update -y
            echo -e "${CYAN}[Instalando Combo Completo...]${RESET}"
            apt install -y git docker.io nodejs npm python3 python3-pip python3-venv build-essential gcc g++ make cmake curl vim tmux htop wget
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        6)  
            clear
            sudo bash instalador.sh
            ;;
        7)
            clear
            echo -e "\n${CYAN}[Saindo do Pachesco...]${RESET}"
            exit 0
            ;;
        *)
            clear
            echo -e "\nDigite uma opção válida."
            bash programasdesenvolvedor.sh
            ;;
    esac