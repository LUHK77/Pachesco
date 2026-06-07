#!/bin/bash

# Verificação se o usuário é root
if [ "$EUID" -ne 0 ]; then
    echo -e "\033[0;36m[Erro]\033[0m Por favor, execute este script como root (ou usando sudo)."
    exit 1
fi

CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'
VERDE='\033[0;32m'
SEM_COR='\033[0m'

while true; do
    clear
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
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Pacote Design Gráfico...]${SEM_COR}"
            apt install -y gimp inkscape scribus
            echo -e "${VERDE}[Instalando plugins extras do GIMP...]${SEM_COR}"
            apt install -y gimp-plugin-registry gimp-data-extras
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        2)
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Pacote Edição de Vídeo...]${SEM_COR}"
            apt install -y kdenlive ffmpeg handbrake-gtk
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        3)
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando dependências para UI/UX...]${SEM_COR}"
            # Penpot via Docker (requer Docker instalado)
            if ! command -v docker &> /dev/null; then
                echo -e "${VERDE}[Docker não encontrado. Instalando Docker...]${SEM_COR}"
                apt install -y docker.io docker-compose
                systemctl enable --now docker
            fi
            echo -e "${VERDE}[Baixando e iniciando Penpot via Docker Compose...]${SEM_COR}"
            mkdir -p /opt/penpot && cd /opt/penpot
            curl -o docker-compose.yaml https://raw.githubusercontent.com/penpot/penpot/main/docker/images/docker-compose.yaml
            docker compose -p penpot -f docker-compose.yaml up -d
            echo -e "${VERDE}[Penpot disponível em: http://localhost:9001]${SEM_COR}"
            echo -e "${VERDE}[Figma: acesse figma.com no navegador (app web)]${SEM_COR}"
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        4)
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Pacote Fotografia & RAW...]${SEM_COR}"
            apt install -y darktable rawtherapee libimage-exiftool-perl
            read -p "Instalação concluída. Pressione [Enter] para voltar ao menu..."
            ;;
        5)
            clear
            echo -e "\n${VERDE}[Lendo repositórios...]${SEM_COR}"
            apt update -y
            echo -e "${VERDE}[Instalando Combo Completo Designer...]${SEM_COR}"
            apt install -y gimp inkscape scribus gimp-plugin-registry gimp-data-extras \
                           kdenlive ffmpeg handbrake-gtk \
                           darktable rawtherapee libimage-exiftool-perl
            if ! command -v docker &> /dev/null; then
                echo -e "${VERDE}[Instalando Docker para o Penpot...]${SEM_COR}"
                apt install -y docker.io docker-compose
                systemctl enable --now docker
            fi
            echo -e "${VERDE}[Iniciando Penpot via Docker Compose...]${SEM_COR}"
            mkdir -p /opt/penpot && cd /opt/penpot
            curl -o docker-compose.yaml https://raw.githubusercontent.com/penpot/penpot/main/docker/images/docker-compose.yaml
            docker compose -p penpot -f docker-compose.yaml up -d
            echo -e "${VERDE}[Penpot disponível em: http://localhost:9001]${SEM_COR}"
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
            ;;
    esac
done