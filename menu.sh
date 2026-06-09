#!/bin/bash
echo "Bem vindo ao Downloader, o instalador de programas personalizados!";
echo "1-Instalar programas";
echo "2-Biblioteca";
echo "3-Exportar Aplicações";
echo "4-Backup de Pacotes";
echo "5-Sair";

read -p "Digite uma opção: " op;

case "$op" in
	1)
	clear;
	bash Instaladores/instalador.sh
  	;;
 	2)
	clear;
  	bash biblioteca/biblioteca.sh
  	;;
	3)
  	echo "Exportando aplicações :)."
    ;;
 	4)
  	echo "Fazendo backup"
  	;;
	5)
  	echo "Saindo..."
	clear;
  	;;
 	*)
  	echo "Digite uma opção valida!, seu maldito"
  	;;
esac
