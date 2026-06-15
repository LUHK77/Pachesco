#!/bin/bash
source "Instalador/helpers.sh";
clear;
# Menu de seleção de categoria de programas

estilizarTexto "Qual tipo de programa deseja instalar?";
echo "1-Programas para desenvolvedor."
echo "2-Programas para designer."
echo "3-Programas de uso geral."
echo "4-Outro programa."
echo "5-Voltar."

# Oferece a opção para o usuário digitar

read -p "Escolha uma opção: " op;

case "$op" in
	"1")
	clear;
	bash Instalador/programasDesenvolvedor.sh;
	;;
	"2")
	clear;
	bash Instalador/programasDesigner.sh;
	;;
	"3")
	clear;
	bash Instalador/programasEmGeral.sh;
	;;
	"4")
    clear;
    read -p "Digite o nome do programa desejado: " programa;
    
    if ! apt-cache show "$programa" &>/dev/null; then
        echo "Pacote '$programa' não encontrado nos repositórios apt."
        sleep 2
        bash menu.sh
    else
        criarPacote "$programa" "apt";
        clear;
        bash menu.sh;
    fi
    ;;
	"5")
	clear;
	bash menu.sh;
	;;
    *)
	clear;
    echo "Digite uma opção valida!";
	bash instalador.sh;
    ;;
esac
bash menu.sh;
