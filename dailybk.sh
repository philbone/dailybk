#!/bin/bash
clear
echo "------ $0 PID:$$ START--------"
# colores
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'

# setData 
source data.conf

# BASE URL
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" 

# error messages
ERR_MSG1="DESCARGA ABORTADA!"
ERR_MSG2="El destino ya existe."
ERR_MSG3="Error al ejecutar scp, ver log: $DIR/output.log"

# sounds
ERR_SOUND="$DIR/sounds/to-the-point.ogg"
SUC_SOUND="$DIR/sounds/eventually.ogg"

# success messages
SUC_MSG1="DIRECTORIO CREADO: $dateBackup"
SUC_MSG2="DESCARGA COMPLETADA!!"
FIN_MSG="Hecho!"

# makeDestiny()
cd $destiny
mkdir -v "$destiny/$dateBackup" &> $DIR/output.log
if [ $? -ne 0 ] ; then        
    notify-send -t 1000000 "$ERR_MSG1" "$ERR_MSG2" 
    echo ${red}$ERR_MSG1, $ERR_MSG2${end}
    paplay $ERR_SOUND
else    
    echo ${grn}$SUC_MSG1${end}
    # getCopy()
    scp -o StrictHostKeyChecking=no -i $key $user@$host:$origin "$destiny/$dateBackup" 2> $DIR/output.log    
    if [ $? -ne 0 ] ; then
        echo ${red}$ERR_MSG3${end}
        paplay $ERR_SOUND
    else
        notify-send -t 1000000 "$SUC_MSG2"
        echo ${grn}$SUC_MSG2${end}
        # listDestiny()
        echo "creando lista..." 
        paplay $SUC_SOUND
        ls --full-time -ghR &>$DIR/output.log && echo ${grn}$FIN_MSG${end}
    fi
fi

echo -e "\n------" $0 PID:$$ END"--------"
