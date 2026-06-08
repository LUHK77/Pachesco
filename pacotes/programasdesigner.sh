#!/bin/bash

# Verificação se o usuário é root
if [ "$EUID" -ne 0 ]; then
    echo -e "\033[0;36m[Erro]\033[0m Por favor, execute este script como root (ou usando sudo)."
    exit 1
fi

CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

    echo -e "${CYAN}┌──────────────────────────────────────────────┐${RESET}"
    echo -e "${CYAN}│${RESET}  ${BOLD}Qual categoria de pacotes deseja instalar?${RESET}  ${CYAN}│${RESET}"
    echo -e "${CYAN}└──────────────────────────────────────────────┘${RESET}"
    echo " 1) Design Gráfico     -> GIMP, Inkscape, Scribus"
    echo " 2) Edição de Vídeo    -> Kdenlive, FFmpeg, HandBrake"
    echo " 3) UI/UX & Prototipagem -> Figma (web), Penpot (self-hosted)"
    echo " 4) Fotografia & RAW   -> Darktable, RawTherapee, ExifTool"
    echo " 5) Combo Completo     -> Todos os programas listados acima"
    echo " 6) Voltar"
    echo " 7) Sair"
    echo "───────────────────────────────────────────────────────────────"

    read -p "Digite o número da sua opção: " opcao

    case $opcao in
        1)
            clear
            echo -e "\n${CYAN}[Lendo repositórios...]${RESET}"
            apt update -y
            echo -e "${CYAN}[Instalando Pacote Design Gráfico...]${RESET}"
            apt install -y gimp inkscape scribus
            echo -e "${CYAN}[Instalando plugins extras do GIMP...]${RESET}"
            apt install -y gimp-plugin-registry gimp-data-extras
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        2)
            clear
            echo -e "\n${CYAN}[Lendo repositórios...]${RESET}"
            apt update -y
            echo -e "${CYAN}[Instalando Pacote Edição de Vídeo...]${RESET}"
            apt install -y kdenlive ffmpeg handbrake-gtk
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        3)
            clear
            echo -e "\n${CYAN}[Lendo repositórios...]${RESET}"
            apt update -y
            echo -e "${CYAN}[Instalando dependências para UI/UX...]${RESET}"
            # Penpot via Docker (requer Docker instalado)
            if ! command -v docker &> /dev/null; then
                echo -e "${CYAN}[Docker não encontrado. Instalando Docker...]${RESET}"
                apt install -y docker.io docker-compose
                systemctl enable --now docker
            fi
            echo -e "${CYAN}[Baixando e iniciando Penpot via Docker Compose...]${RESET}"
            mkdir -p /opt/penpot && cd /opt/penpot
            curl -o docker-compose.yaml https://raw.githubusercontent.com/penpot/penpot/main/docker/images/docker-compose.yaml
            docker compose -p penpot -f docker-compose.yaml up -d
            echo -e "${CYAN}[Penpot disponível em: http://localhost:9001]${RESET}"
            echo -e "${CYAN}[Figma: acesse figma.com no navegador (app web)]${RESET}"
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        4)
            clear
            echo -e "\n${CYAN}[Lendo repositórios...]${RESET}"
            apt update -y
            echo -e "${CYAN}[Instalando Pacote Fotografia & RAW...]${RESET}"
            apt install -y darktable rawtherapee libimage-exiftool-perl
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        5)
            clear
            echo -e "\n${CYAN}[Lendo repositórios...]${RESET}"
            apt update -y
            echo -e "${CYAN}[Instalando Combo Completo Designer...]${RESET}"
            apt install -y gimp inkscape scribus gimp-plugin-registry gimp-data-extras \
                           kdenlive ffmpeg handbrake-gtk \
                           darktable rawtherapee libimage-exiftool-perl
            if ! command -v docker &> /dev/null; then
                echo -e "${CYAN}[Instalando Docker para o Penpot...]${RESET}"
                apt install -y docker.io docker-compose
                systemctl enable --now docker
            fi
            echo -e "${CYAN}[Iniciando Penpot via Docker Compose...]${RESET}"
            mkdir -p /opt/penpot && cd /opt/penpot
            curl -o docker-compose.yaml https://raw.githubusercontent.com/penpot/penpot/main/docker/images/docker-compose.yaml
            docker compose -p penpot -f docker-compose.yaml up -d
            echo -e "${CYAN}[Penpot disponível em: http://localhost:9001]${RESET}"
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        6)
            clear
            sudo bash instalador.sh
            ;;
        7)
            clear
            echo -e "\n${CYAN}[Saindo do Pachesco...]${RESET}"
            exit 
            ;;
        *)
            clear
            echo -e "\nDigite uma opção válida."
            sudo bash programasdesigner.sh
            ;;
    esac