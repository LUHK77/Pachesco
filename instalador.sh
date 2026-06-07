#!/bin/bash

CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

echo -e "${CYAN}┌──────────────────────────────────────────┐${RESET}"
echo -e "${CYAN}│${RESET}  ${BOLD}Qual tipo de programa deseja instalar?${RESET}  ${CYAN}│${RESET}"
echo -e "${CYAN}└──────────────────────────────────────────┘${RESET}"
echo "1-Programas para desenvolvedor."
echo "2-Programas para designer."
echo "3-Programas de uso geral."
echo "4-Outro programa."
echo "5-Voltar."
echo "6-Sair."

read -p "Escolha uma opção: " op;

case "$op" in
	"1")
	clear
	sudo bash programasdesenvolvedor.sh
	 ;;
	"2")
	 sudo bash programasdedesigner.sh
	 ;;
	 "3")
	 sudo bash programasemgeral.sh
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

	echo "Programa: \$NOME"
	echo "Versão: \$VERSAO"
        echo "Data de instalação: \$DATA_INSTALACAO"
	echo "Caminho: \$CAMINHO"
        echo "Tamanho do arquivo: \$TAMANHO"
EOF

        chmod +x "biblioteca/pacotes/$programa.sh"
	;;
	5)
	clear
    bash menu.sh
    ;;
	6)
	clear
	echo "Saindo..."
	exit
	;;
    *)
	clear
    echo "Digite uma opção valida!"
	bash instalador.sh
    ;;
esac
