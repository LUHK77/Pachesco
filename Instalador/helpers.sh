#!/bin/bash

#estiliza o texto recebido
estilizarTexto() {
    local texto="$1"

    local CYAN='\033[0;36m'
    local BOLD='\033[1m'
    local RESET='\033[0m'

    local tamanho=${#texto}

    echo -ne "${CYAN}┌"
    for ((i=0; i<tamanho+2; i++)); do
        echo -n "─"
    done
    echo -e "┐${RESET}"

    echo -e "${CYAN}│${RESET} ${BOLD}${texto}${RESET} ${CYAN}│${RESET}"

    echo -ne "${CYAN}└"
    for ((i=0; i<tamanho+2; i++)); do
        echo -n "─"
    done
    echo -e "┘${RESET}"
}

#faz a instalação de um pacote, verificando se é do tipo apt ou snap, e cria um arquivo de controle deste pacote
criarPacote() {
    local programa="$1"
    local tipo="$2"
    local arquivo="Biblioteca/Pacotes/${programa}.sh"

    #verificação se o pacote já existe no sistema
    if [[ -f "$arquivo" ]] || dpkg -s "$programa" &>/dev/null || snap list | grep -qw "$programa"; then
    if [[ -f "$arquivo" ]]; then
        echo "Pacote '$programa' já existe no sistema."
        sleep 2
        return 1
    fi
    echo "Aviso: o pacote '$programa' já pode estar instalado no sistema. Criando o arquivo do pacote..."
    sleep 2
    fi

    echo -e "\n${CYAN}[Atualizando repositórios...]${RESET}";
    apt update -y;
    echo -e "\n${CYAN}[Iniciando a Instalação do programa...]${RESET}";
    #tipo de instalação
    case "$tipo" in
        apt)
            sudo apt install "$programa" -y
            ;;
        snap)
            sudo snap install --classic "$programa"
            ;;
        deb)
            sudo dpkg -i "$programa"
            sudo apt install -f -y
            ;;
        tar)
            echo "Instalação TAR deve ser tratada manualmente."
            ;;
        *)
            echo "Tipo de instalação inválido."
            return 1
            ;;
    esac
    mkdir -p Biblioteca/Pacotes/"$programa";
    echo "${programa}|${tipo}" > "Biblioteca/Pacotes/${programa}/${programa}.txt";
    #cria o arquivo de controle, incluindo as informações de cada pacote
    cat > "Biblioteca/Pacotes/${programa}/${programa}.sh" << EOF
    #!/bin/bash 
    source "$(dirname "$0")/helpers.sh";

    NOME="${programa}";
    TIPO="${tipo}";
    case "\$TIPO" in
    apt | deb)
        VERSAO=\$(dpkg-query -W -f='\${Version}' "\$NOME" 2>/dev/null)
        ;;
    snap)
        VERSAO=\$(snap info "\$NOME" | awk '/installed:/ {print \$2}')
        ;;
    *)
        VERSAO="Desconhecida"
        ;;
    esac
    DATA_INSTALACAO=\$(date '+%Y-%m-%d');
    CAMINHO=\$(which "\$NOME");
    case "\$TIPO" in
    apt | deb)
        TAMANHO=\$(dpkg-query -W -f='\${Installed-Size}' "\$NOME")
    ;;
    snap)
        TAMANHO=\$(du -sk /snap/"\$NOME"/\$(snap list "\$NOME" | awk 'NR==2{print \$3}') | awk '{print \$1}')
    ;;
    *)
        TAMANHO="Desconhecido"
        ;;
    esac
    TAMANHO_MB=\$(awk -v tam="\$TAMANHO" 'BEGIN {printf "%.2f", tam/1024}');
    TAMANHO_GB=\$(awk -v tam="\$TAMANHO" 'BEGIN {printf "%.2f", tam/1024/1024}');

	clear;
    estilizarTexto "INFORMAÇÕES"
	echo "Programa: \$NOME";
	echo "Versão: \$VERSAO";
    echo "Data de instalação: \$DATA_INSTALACAO";
	echo "Caminho: \$CAMINHO";

	if [ "\$TAMANHO" -ge 1048576 ]; then
    echo "Tamanho do arquivo: \$TAMANHO_GB GB";
	elif [ "\$TAMANHO" -ge 1024 ]; then
    echo "Tamanho do arquivo: \$TAMANHO_MB MB";
	else
    echo "Tamanho do arquivo: \$TAMANHO KB";
	fi

    echo "1-Atualizar Programa";
	echo "2-Remover Programa";
	echo "3-Sair";
	read -p "Digite uma opção: " opc;

	case "\$opc" in
    "1")
         case "\$TIPO" in
            apt | deb)
                sudo apt install --only-upgrade "\$NOME" -y
                ;;
            snap)
                sudo snap refresh "\$NOME"
                ;;
        esac
        ;;
    "2")
         case "\$TIPO" in
            apt | deb)
                sudo apt remove "\$NOME" -y
                ;;
            snap)
                sudo snap remove "\$NOME"
                ;;
        esac

        sudo rm -rf "\$(dirname "\${BASH_SOURCE[0]}")"
        ;;
    "3")
        exit
        ;;
    *)
        echo "Opção Inválida";
        ;;
	esac
EOF

    chmod +x "Biblioteca/Pacotes/${programa}.sh"
}

#cria uma lista dos pacotes instalados com o tipo
exportarPacotes(){
    cat Biblioteca/Pacotes/*/*.txt > Biblioteca/relatorioDeProgramas.txt;
	echo "Exportando aplicações...";
}

#faz a instalação de todos os pacotes listados
importarPacotes(){
    while IFS='|' read -r nome tipo; do
    nome=$(echo "$nome" | xargs)
    tipo=$(echo "$tipo" | xargs)

    criarPacote "$nome" "$tipo"

done < Biblioteca/relatorioDeProgramas.txt
}