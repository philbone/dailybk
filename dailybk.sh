#!/bin/bash
clear
# BASE URL
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function out {
    echo $3 $(date +"%m-%d-%Y %T") $1 | tee $2 $DIR/out.log
}


out "$0 PID:$$ START --------"

# setData 
source $DIR/data.conf
# makeDestiny()
cd $destiny
mkdir -v "$destiny/$dateBackup" &>>$DIR/out.log

if [ $? -ne 0 ] ; then      
    out "el directorio de destino ya existe" -a
else    
    out "directorio creado: $dateBackup" -a
    # getCopy()
    out "intentando la descarga..." -a
    script -q -c "scp -o StrictHostKeyChecking=no -i $key $user@$host:$origin '$destiny/$dateBackup'" >>$DIR/out.log # intentar con tee
    if [ $? -ne 0 ] ; then
        out "no se encuentra fichero de origen" -a        
    else        
        out "descarga completada" -a
        # listDestiny()
        out "creando lista..." -a
        ls --full-time -ghR | tee -a $DIR/out.log 
    fi
fi

out "$0 PID:$$ END--------\n" -a -e
