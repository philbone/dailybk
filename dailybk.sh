#!/bin/bash
clear
# BASE URL
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function makeaSound {
    paplay $DIR/sounds/$1
}

function out {
    echo $3 $(date +"%m-%d-%Y %T") $1 | tee $2 $DIR/out.log && makeaSound $4
}

function showAlert {
    notify-send -t 50 -i "$1" "$2" "$3"
}

out "-------- $0 PID:$$ START --------" "" "" "coins.ogg" && showAlert "emblem-downloads" "Focused Daily Backup!" "Iniciando proceso de descarga..."

# setData 
source $DIR/data.conf
# makeDestiny()
cd $destiny 
mkdir -v "$destiny/$dateBackup" &>>$DIR/out.log

if [ $? -ne 0 ] ; then
    out "el directorio de destino ya existe, revisar out.log" -a "" "nasty-error-long.ogg" && showAlert "emblem-important" "Problema al escribir" "El destino ya existe!"
else    
    out "directorio creado: $dateBackup" -a "" "news-bringer.ogg" && showAlert "stock_new-dir" "Destino creado" "Nuevo directorio $dateBackup"
    # getCopy()
    out "intentando la descarga..." -a "" "engine.ogg" && showAlert "connect_creating" "Descargando..." "Intentando traer la copia remota"
    scp -o StrictHostKeyChecking=no -i $key $user@$host:$origin "$destiny/$dateBackup" &>>$DIR/out.log     
    if [ $? -ne 0 ] ; then
        out "no se encuentra fichero de origen, revisar out.log" -a "" "springy-incident.ogg" && showAlert "computer-fail" "Descarga abortada" "Hubo un problema con el origen." 
    else
        out "descarga finalizada" -a "" "conclusion.ogg" && showAlert "emblem-default" "Terminado" "La descarga ha finalizado." 
        # listDestiny()
        out "creando lista de directorio local..." -a "" "news-bringer.ogg"
        ls --full-time -ghR | tee -a $DIR/out.log 
    fi
fi

out "-------- $0 PID:$$ END --------" -a "" "eventually.ogg"