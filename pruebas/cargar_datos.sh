#!/bin/bash

echo "Ingrese su Apellido: "
read ENTRADA

sed -i -e "s&^APELLIDO=.*&APELLIDO=$ENTRADA&" app.conf


echo "Ingrese su NOMBRE: "
read ENTRADA

sed -i -e "s&^NOMBRE=.*&NOMBRE=$ENTRADA&" app.conf

echo "Ingrese su numero de DNI: "
read ENTRADA

sed -i -e "s&^DNI=.*&DNI=$ENTRADA&" app.conf

echo "Ingrese su domicilio: "
read ENTRADA

sed -i -e "s&^DIRECCION=.*&DIRECCION=$ENTRADA&" app.conf

echo "Ingrese su direccion de correo electronico: "
read ENTRADA

sed -i -e "s&^MAIL=.*&MAIL=$ENTRADA&" app.conf


