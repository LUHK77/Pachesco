    #!/bin/bash 
    source "Instalador/helpers.sh";

    NOME="eclipse";
    TIPO="snap";
    case "$TIPO" in
    apt)
        VERSAO=$(dpkg-query -W -f='${Version}' "$NOME" 2>/dev/null)
        ;;
    snap)
        VERSAO=$(snap info "$NOME" | awk '/installed:/ {print $2}')
        ;;
    *)
        VERSAO="Desconhecida"
        ;;
    esac
    DATA_INSTALACAO=$(date '+%Y-%m-%d');
    CAMINHO=$(which "$NOME");
    TAMANHO=$(dpkg-query -W -f='${Installed-Size}' "$NOME");
    TAMANHO_MB=$(awk -v tam="$TAMANHO" 'BEGIN {printf "%.2f", tam/1024}');
    TAMANHO_GB=$(awk -v tam="$TAMANHO" 'BEGIN {printf "%.2f", tam/1024/1024}');

	clear;
    estilizarTexto "INFORMAÇÕES"
	echo "Programa: $NOME";
	echo "Versão: $VERSAO";
    echo "Data de instalação: $DATA_INSTALACAO";
	echo "Caminho: $CAMINHO";

	if [ "$TAMANHO" -ge 1048576 ]; then
    echo "Tamanho do arquivo: $TAMANHO_GB GB";
	elif [ "$TAMANHO" -ge 1024 ]; then
    echo "Tamanho do arquivo: $TAMANHO_MB MB";
	else
    echo "Tamanho do arquivo: $TAMANHO KB";
	fi

    echo "1-Atualizar Pacote";
	echo "2-Remover Pacote";
	echo "3-Sair";
	read -p "Digite uma opção: " opc;

	case "$opc" in
    "1")
         case "$TIPO" in
            apt)
                sudo apt install --only-upgrade "$NOME" -y
                ;;
            snap)
                sudo snap refresh "$NOME"
                ;;
        esac
        ;;
    "2")
         case "$TIPO" in
            apt)
                sudo apt remove "$NOME" -y
                ;;
            snap)
                sudo snap remove "$NOME"
                ;;
        esac

        rm -- "$0"
        ;;
    "3")
        exit
        ;;
    *)
        echo "Opção Inválida";
        ;;
	esac

	clear;
	cd ../..;
	bash menu.sh;
