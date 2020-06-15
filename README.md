# Dailybk

Bash para descargar el respadlo diario desde el vps de focused.cl

## Index

1. [Requisitos](#Requisitos)
1. Instalación
   1. Manual
   1. Clone
1. Como usar
   1. Terminal
   1. Servicio al inicio
   1. Cronjob

### Requisitos
Corre sobre GNU/Linux. Es neceario que este instalado scp para realizar la copia segura vía ssh y ssh-keygen para borrar la passphrase de la llave de identidad ssh.

### Instalación

#### Manual

#### Clone

### Como usar

#### Terminal
#### Servicio al inicio
#### Cronjob
La sintaxis para usar conjob: 

`1 2 3 4 5 /path/to/command arg1 arg2` 

Donde

* 1: Minute (0-59)
* 2: Hours (0-23)
* 3: Day (0-31)
* 4: Month (0-12 [12 == December])
* 5: Day of the week(0-7 [7 or 0 == sunday])
* /path/to/command – Script or command name to schedule

Ejemplo: Todos los dias a las 3 a.m queremos ejecutar `dailybk.sh` que está en el directorio `/home/user/` 

Desde el terminal, abrir el editor de la siguiente manera:  
`$ crontab -e`

Con el editor abierto, en una nueva línea añadir su entrada de crontab. Para que corra todos los días a las 3 a.m, la tarea se vería de la siguiente manera:   
`0 3 * * * /home/user/dailybk.sh`

Guarde y cierre el archivo.

Para más detalle [RTM](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/crontab.html)

En esta página hay un tutorial para aprender a usar cronjob: https://linuxmoz.com/crontab-syntax-tutorial/


