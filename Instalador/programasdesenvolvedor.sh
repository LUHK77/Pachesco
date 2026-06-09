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
echo " 1) VS Code"
echo " 2) PHPStorm"
echo " 3) Eclipse"
echo " 4) BeKeeper Studio"
echo " 5) IntelliJ IDEA"
echo " 6) Dev C++"
echo ""
echo " 7) Voltar"
echo " 0) Sair"
echo "───────────────────────────────────────────────"
read -p " Digite o número da sua opção: " opcao

case $opcao in
    1)
        clear
        echo -e "\n${CYAN}[Adicionando repositório do VS Code...]${RESET}"
        curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft.gpg
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
            > /etc/apt/sources.list.d/vscode.list
        echo -e "${CYAN}[Atualizando repositórios...]${RESET}"
        apt update -y
        echo -e "${CYAN}[Instalando VS Code...]${RESET}"
        apt install -y code
        echo -e "${GREEN}[✓ VS Code instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    2)
        clear
        echo -e "\n${CYAN}[Baixando PHPStorm...]${RESET}"
        wget -q --show-progress -O /tmp/phpstorm.tar.gz "https://download.jetbrains.com/webide/PhpStorm-2024.1.tar.gz"
        echo -e "${CYAN}[Extraindo para /opt/phpstorm...]${RESET}"
        tar -xzf /tmp/phpstorm.tar.gz -C /opt/
        mv /opt/PhpStorm-* /opt/phpstorm
        ln -sf /opt/phpstorm/bin/phpstorm.sh /usr/local/bin/phpstorm
        echo -e "${GREEN}[✓ PHPStorm instalado! Execute com: phpstorm]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    3)
        clear
        echo -e "\n${CYAN}[Atualizando repositórios...]${RESET}"
        apt update -y
        echo -e "${CYAN}[Instalando Eclipse...]${RESET}"
        snap install --classic eclipse
        echo -e "${GREEN}[✓ Eclipse instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    4)
        clear
        echo -e "\n${CYAN}[Adicionando repositório do BeKeeper Studio...]${RESET}"
        curl -fsSL https://deb.beekeeperstudio.io/beekeeper.key | gpg --dearmor -o /usr/share/keyrings/beekeeper.gpg
        echo "deb [signed-by=/usr/share/keyrings/beekeeper.gpg] https://deb.beekeeperstudio.io stable main" \
            > /etc/apt/sources.list.d/beekeeper-studio.list
        echo -e "${CYAN}[Atualizando repositórios...]${RESET}"
        apt update -y
        echo -e "${CYAN}[Instalando BeKeeper Studio...]${RESET}"
        apt install -y beekeeper-studio
        echo -e "${GREEN}[✓ BeKeeper Studio instalado!]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    5)
        clear
        echo -e "\n${CYAN}[Baixando IntelliJ IDEA Community...]${RESET}"
        wget -q --show-progress -O /tmp/intellij.tar.gz "https://download.jetbrains.com/idea/ideaIC-2024.1.tar.gz"
        echo -e "${CYAN}[Extraindo para /opt/intellij...]${RESET}"
        tar -xzf /tmp/intellij.tar.gz -C /opt/
        mv /opt/idea-IC-* /opt/intellij
        ln -sf /opt/intellij/bin/idea.sh /usr/local/bin/intellij
        echo -e "${GREEN}[✓ IntelliJ IDEA instalado! Execute com: intellij]${RESET}"
        read -p " Pressione [Enter] para voltar ao menu..."
        bash "$0"
        ;;
    6)
        clear
        echo -e "\n${CYAN}[Atualizando repositórios...]${RESET}"
        apt update -y
        echo -e "${CYAN}[Instalando Dev C++ (via Wine + repositório)...]${RESET}"
        apt install -y codeblocks
        echo -e "${GREEN}[✓ Code::Blocks instalado como alternativa ao Dev C++!]${RESET}"
        echo -e " ${CYAN}(Dev C++ é nativo para Windows. Code::Blocks é equivalente no Linux.)${RESET}"
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
        bash programasdesenvolvedor.sh
        sleep 1
        bash programasdesenvolvedor.sh
        ;;
esac