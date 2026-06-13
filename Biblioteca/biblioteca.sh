#!/bin/bash
source "Instalador/helpers.sh";

echo "1- Listar Programas";
echo "2- Atualizar todos os programas";
echo "3- Gerar log de instalações";
echo "4- Voltar";

read -p "Digite uma opções: " op;

case "$op" in

	"1")
	estilizarTexto "Biblioteca";
	ls Biblioteca/Pacotes | sed 's/\.sh$//';
	read -p "Digite o nome do programa para ver mais informações: " programa;
	bash Biblioteca/Pacotes/"$programa".sh;
	;;
	"2")
	sudo apt update -y;
	sudo apt upgrade -y;
	;;
	"3")
	echo "Eh isso ai";
	;;
	"4")
	clear;
	bash menu.sh;
	;;
	*)
	echo "Opção inválida.";
	;;
esac
bash menu.sh;

