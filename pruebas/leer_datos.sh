#!/bin/bash

ARCH="app.conf"

linea=`grep "APELLIDO" $ARCH`
APELLIDO=`echo $linea | cut -d "=" -f 1`

echo "apellido: $APELLIDO"

