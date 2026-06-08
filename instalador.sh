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
	 programasDev.sh
	 ;;
	"2")
	 programasDesigner.sh
	 ;;
	 "3")
	 programasGeral.sh
	 ;;
	 "4")
	 read -p "Digite o nome do programa desejado: " programa;
         cd pacotes;
	 ls;
	 sudo apt install "$programa" -y;
	 cat > "biblioteca/pacotes/$programa.sh" << EOF
	#!/bin/bash

	NOME="$programa"
	VERSAO=$(dpkg-query -W -f='${Version}' "$programa");
	DATA_INSTALACAO=$(date '+%Y-%m-%d');
	CAMINHO=$(which "$programa")
	TAMANHO=$(du -sh "$CAMINHO" | cut -f1);
    echo "INFORMAÇÕES:"
	echo "Programa: \$NOME"
	echo "Versão: \$VERSAO"
    echo "Data de instalação: \$DATA_INSTALACAO"
	echo "Caminho: \$CAMINHO"
    echo "Tamanho do arquivo: \$TAMANHO"

    echo "1-Atualizar Pacote"
	echo "2-Remover Pacote"
	echo "3-Sair"
	read -p "Digite uma opção: " opc;

	case "$opc" in
    "1")
        sudo apt install --only-upgrade "$NOME"
        ;;
    "2")
        sudo apt remove "$NOME"
        ;;
    "3")
        exit
        ;;
    *)
        echo "Opção inválida"
        ;;
	esac
EOF

        chmod +x "biblioteca/pacotes/$programa.sh"
	;;
	"5")
	clear;
	bash menu.sh
	;;
esac
