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

#BASE URL
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# setData 
source $DIR/data.conf
#makeDestiny()
cd $destiny
mkdir -v "$destiny/$dateBackup" &> $DIR/output.log
if [ $? -ne 0 ] ; then      
    echo "a $? el directorio origen ya existe"
else    
    echo "b $?  directorio creado: $dateBackup"
    # getCopy()
    scp -o StrictHostKeyChecking=no -i $key $user@$host:$origin "$destiny/$dateBackup" 2> $DIR/output.log    
    if [ $? -ne 0 ] ; then
        echo "c $?  no se encuentra fichero de origen"
    else        
        echo "d $?  descarga completada"
        # listDestiny()
        echo "creando lista..."         
        ls --full-time -ghR &>$DIR/output.log && echo "e $? terminado."
    fi
fi

echo -e "\n------" $0 PID:$$ END"--------"
