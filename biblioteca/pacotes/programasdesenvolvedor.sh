#!/bin/bash

    # Verificação se o usuário é root
    if [ "$EUID" -ne 0 ]; then
    echo -e "${AZUL}[Erro]${SEM_COR} Por favor, execute este script como root (ou usando sudo)."
    exit 1
    fi

    CYAN='\033[0;36m'
    BOLD='\033[1m'
    RESET='\033[0m'

    CYAN='\033[0;36m'
    BOLD='\033[1m'
    RESET='\033[0m'

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
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Pacote Dev Web...]${SEM_COR}"
            apt install -y git docker.io nodejs npm
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        2)
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Pacote Dev Python...]${SEM_COR}"
            apt install -y python3 python3-pip python3-venv git
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        3)  
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Pacote Dev C/C++...]${SEM_COR}"
            apt install -y build-essential gcc g++ make cmake git
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        4)
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Pacote Ferramentas Base...]${SEM_COR}"
            apt install -y curl vim git tmux htop wget
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        5)  
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Combo Completo...]${SEM_COR}"
            apt install -y git docker.io nodejs npm python3 python3-pip python3-venv build-essential gcc g++ make cmake curl vim tmux htop wget
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        6)  
            clear
            sudo bash instalador.sh
            ;;
        7)
            clear
            echo -e "\n${VERDE}[Saindo do instalador...]${SEM_COR}"
            exit 0
            ;;
        *)
            clear
            echo -e "\nDigite uma opção válida."
            sleep 2
            bash programasdesenvolvedor.sh
            ;;
    esac
done