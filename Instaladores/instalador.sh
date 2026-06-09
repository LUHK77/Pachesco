#!/bin/bash
echo "Qual tipo de programa deseja instalar: ";
echo "1-Programas para desenvolvedor."
echo "2-Programas para designer."
echo "3-Programas de uso geral."
echo "4-Outro programa."
echo "5-Voltar."

read -p "Escolha uma opção: " op;

case "$op" in
	"1")
	 bash programasDev.sh
	 ;;
	"2")
	 bash programasDesigner.sh
	 ;;
	 "3")
	 bash programasGeral.sh
	 ;;
	 "4")
	 read -p "Digite o nome do programa desejado: " programa;
	 sudo apt install "$programa" -y;

	 #Cria um arquivo com as informações do programa instalado
	 cat > "biblioteca/pacotes/$programa.sh" << EOF
	#!/bin/bash

	NOME="$programa"
	VERSAO=$(dpkg-query -W -f='${Version}' "$programa");
	DATA_INSTALACAO=$(date '+%Y-%m-%d');
	CAMINHO=$(which "$programa")
	TAMANHO=\$(dpkg-query -W -f='\${Installed-Size}' "$programa");
	TAMANHO_MB=\$(awk -v tam="\$TAMANHO" 'BEGIN {printf "%.2f", tam/1024}');
	TAMANHO_GB=\$(awk -v tam="\$TAMANHO" 'BEGIN {printf "%.2f", tam/1024/1024}');
    echo "INFORMAÇÕES:"
	echo "Programa: \$NOME"
	echo "Versão: \$VERSAO"
    echo "Data de instalação: \$DATA_INSTALACAO"
	echo "Caminho: \$CAMINHO"

	if [ "\$TAMANHO" -ge 1048576 ]; then
    echo "Tamanho do arquivo: \$TAMANHO_GB GB"
	elif [ "\$TAMANHO" -ge 1024 ]; then
    echo "Tamanho do arquivo: \$TAMANHO_MB MB"
	else
    echo "Tamanho do arquivo: \$TAMANHO KB"
	fi

    echo "1-Atualizar Pacote"
	echo "2-Remover Pacote"
	echo "3-Sair"
	read -p "Digite uma opção: " opc;

	case "\$opc" in
    "1")
        sudo apt install --only-upgrade "\$NOME" -y;
        ;;
    "2")
        sudo apt remove "\$NOME" -y;
		rm biblioteca/pacotes/"\$NOME.sh"
        ;;
    "3")
        exit
        ;;
    *)
        echo "Opção inválida"
        ;;
	esac

	clear;
	cd ../..;
	bash menu.sh;
EOF

    chmod +x "biblioteca/pacotes/$programa.sh";
	clear;
	bash menu.sh;
	;;
	"5")
	clear;
	bash menu.sh;
	;;
esac
