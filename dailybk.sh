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


out "-------- $0 PID:$$ START --------" "" "" "coins.ogg"

# setData 
source $DIR/data.conf
# makeDestiny()
cd $destiny 
mkdir -v "$destiny/$dateBackup" &>>$DIR/out.log

if [ $? -ne 0 ] ; then
    out "el directorio de destino ya existe, revisar out.log" -a "" "nasty-error-long.ogg"
else    
    out "directorio creado: $dateBackup" -a "" "news-bringer.ogg"
    # getCopy()
    out "intentando la descarga..." -a "" "engine.ogg" 
    scp -o StrictHostKeyChecking=no -i $key $user@$host:$origin "$destiny/$dateBackup" &>>$DIR/out.log 
    
    if [ $? -ne 0 ] ; then
        out "no se encuentra fichero de origen, revisar out.log" -a "" "springy-incident.ogg"        
    else
        out "descarga finalizada" -a "" "conclusion.ogg"        
        # listDestiny()
        out "creando lista de directorio local..." -a "" "news-bringer.ogg"
        ls --full-time -ghR | tee -a $DIR/out.log 
    fi
fi

out "-------- $0 PID:$$ END --------" -a "" "eventually.ogg"