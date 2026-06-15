#!/bin/bash
source "Instalador/helpers.sh";

estilizarTexto "Biblioteca";
echo "1- Listar Programas";
echo "2- Atualizar todos os programas";
echo "3- Voltar";

read -p "Digite uma opções: " op;

case "$op" in

	"1")
	clear
	estilizarTexto "Biblioteca";
	echo "";
	ls Biblioteca/Pacotes | sed 's/\.sh$//' | sed 's/./\u&/';
	echo "";
	echo "0 - Sair";
	read -p "Digite o nome do programa para ver mais informações: " programa;
	programa="${programa,,}";
	if [ "$programa" -eq 0 ]; then
	echo "Saindo..."
	bash menu.sh
	fi
    bash Biblioteca/Pacotes/"$programa"/"$programa".sh;
	;;
	"2")
	sudo apt update -y;
	sudo apt upgrade -y;
	;;
	"3")
	clear;
	echo "Saindo....";
	;;
	*)
	clear;
	echo "Opção inválida.";
	sleep 2;
	bash Biblioteca/biblioteca.sh
	;;
esac

sleep 2;
bash menu.sh

