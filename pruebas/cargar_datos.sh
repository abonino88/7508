#!/bin/bash

echo "Ingrese su Apellido: "
read APELLIDO

sed -i -e "s&^APELLIDO=.*&APELLIDO=$APELLIDO&" app.conf
