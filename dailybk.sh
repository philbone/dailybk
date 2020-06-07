#!/bin/bash
echo "------ $0 PID:$$ START--------"

#/usr/bin/scp me@localhost.com:file somewhere 2>&1>/dev/null &
ping -c 4 192.168.0.1 2>&1>output.log &
pid=$! # Process Id of the previous running command

spin='-\|/'
titulo="Daily Focused Backaap!"
salidaErr="Error al intentar la descarga"
salidaExi="Exito al descargar la copia"
avisoInicial="Inicia descarga"

if [[ $pid -gt 0 ]]; then
	echo -e "\n- $avisoInicial"
	notify-send -t 1000000 "$titulo" "$avisoInicial"
	i=0
	while kill -0 $pid 2>/dev/null
	do
		i=$(( (i+1) %4 ))
		printf "\r${spin:$i:1} Descargando"
		sleep .1
	done
	printf "\r${spin:0:1} Descarga finalizada"
	echo -e "\n- $salidaExi"
	notify-send -t 1000000 "$titulo" "$salidaExi"
else
	echo -e "\n -> $salidaErr"
	notify-send -t 1000000 "$titulo" "$salidaErr"
fi

echo -e "\n------" $0 PID:$$ END"--------"
