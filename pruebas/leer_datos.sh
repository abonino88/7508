#!/bin/bash

ARCH="app.conf"

linea=`grep "APELLIDO" $ARCH`
APELLIDO=`echo $linea | cut -d "=" -f 1`

echo "apellido: $APELLIDO"
echo

echo "listado de parametros y valores"
while read LINEA
    do  
	if [[ -n $LINEA ]]
	    then
            PARAMETRO=`echo $LINEA | cut -d "=" -f 1`
            VALOR=`echo $LINEA | cut -d "=" -f 2`

            echo "Nombre del parametro: $PARAMETRO, valor: $VALOR"
        fi	    
    done < $ARCH


