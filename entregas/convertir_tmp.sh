#!/bin/bash
# *************************************************************************
# Alumno: Adrian Gustavo Bonino
# Padron: 68180
#
# 75.08 Sistemas Operativos - Facultad de Ingenieria
# Catedra Ing. Osvaldo Clua
#
#
# Conversor de Temperatura
#
# *************************************************************************

mostrar_ayuda(){
  echo " convertir_tmp.sh                                                        "
  echo " Listado de parametros                                                   "
  echo " ----------------------------------------------------------------------- "
  echo "   -h --help          muestra ayuda                                      "
  echo "   -e --examples      lista unos ejemplos de uso del comando             "
  echo "   -c --celsius       convierte grados celsius a fahrenheit              "
  echo "   -f --fahrenheit    convierte grados fahrenheit a celsius              "
  echo "                                                                         "
  echo "   NOTA: los valores de temperaturas pueden ser positivos o negativos    "
  echo "   y debe usar el . como separador decimal                               "
  echo " ------------------------------------------------------------------------"
}   

mostrar_ejemplos(){
  echo " convertir_tmp.sh                                                        "
  echo " Ejemplos de uso                                                         "
  echo " ----------------------------------------------------------------------- "
  echo " convertir_tmp.sh -c 50     convierte 50 grados celsius a fahrenheit     "
  echo "     50 celsius =                                                        "
  echo " convertir_tmp.sh -f 43     convierte 43 grados fahrenheit a celsius     "
  echo "     43 fahrenheit =                                                     "
  echo " convertir_tmp.sh -c -15    convierte -15 grados celsius a fahrenheit    "
  echo "     -15 celsius =                                                       "
  echo " convertir_tmp.sh -f -27.5  convierte -27.5 grados fahrenheit a celsius  "
  echo "     -27.5 fahrenheit =                                                  "
  echo " ------------------------------------------------------------------------"
}

verificar_argumento(){
  validate_number=^-?[0-9]+([.][0-9]+)?$;
  if ![[ $1 =~ $validate_number ]]; then
    return 1
  else
    return 0
  fi
}

convertir_a_fahrenheit(){
   RESULT=`echo "scale=2, (9/5) * $1 + 32" | bc `
   echo "  $1 Celsius = $RESULT Fahrenheit"
   echo ""
}

convertir_a_celsius(){
   RESULT=`echo "scale=2, ( $1 - 32 ) * 5 / 9" | bc`
   echo "  $1 Farhenheit = $RESULT Celsius"
   echo ""
}


if [ $# -eq 0 ] -o [[ $# -eq 1 ] -a [[ $1 == '-h' ] -o [ $1 == 'help' ]]]; then
  mostrar_ayuda
  exit 0
fi

if [ $1 -eq 1 ] -a [[ $1 == '-e' ] -o [ $1 == '--examples' ]]; then
  mostrar_ejemplos
  exit 0
fi

if [ $# -eq 2 ]; then
  if [ $1 -eq '-c' ] -o [ $1 -eq '--celsius' ]; then
     if [ $(verificar_argumeto $2) ]; then
        convertir_a_fahrenheit $2
     exit 0
  if [ $1 -eq '-f' ] -o [ $1 -eq '--fahreheit' ]; then
     if [ $(verificar_argumeto $2) ];then
        convertir_a_celsius $2
     exit 0
fi

echo "  ERROR: No se pudo procesar su solicitud..."
echo "  Verifique el correcto uso de parametros y valores ingresaods en el comando."
echo "  ---------------------------------------------------------------------------"

mostrar_ayuda
exit 0



