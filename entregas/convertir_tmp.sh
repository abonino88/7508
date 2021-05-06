#!/bin/bash
# ********************************************************************************
# Alumno: Adrian Gustavo Bonino
# Padron: 68180
#
# 75.08 Sistemas Operativos - Facultad de Ingenieria
# Catedra Ing. Osvaldo Clua
#
#
# Conversor de Temperatura
#
# ********************************************************************************

ARGUMENTO=""

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
  echo "     50 celsius = 122 fahrenheit                                         "
  echo " convertir_tmp.sh -f 43     convierte 43 grados fahrenheit a celsius     "
  echo "     43 fahrenheit = 6.11 celsius                                        "
  echo " convertir_tmp.sh -c -15    convierte -15 grados celsius a fahrenheit    "
  echo "     -15 celsius = 5 fehrenheit                                          "
  echo " convertir_tmp.sh -f -27.5  convierte -27.5 grados fahrenheit a celsius  "
  echo "     -27.5 fahrenheit = -33.05 celsius                                   "
  echo " ------------------------------------------------------------------------"
}

verificar_argumento(){
  CADENA='^-?[0-9]+([.][0-9]+)?$'
  if [[  $ARGUMENTO =~ $CADENA ]]  ; then
    return 0
  else
    return 1
  fi
}

convertir_a_fahrenheit(){
   RESULT=`echo "scale=2;(9/5)*$1+32" | bc `
   echo "  $1 Celsius = $RESULT Fahrenheit"
   echo ""
}

convertir_a_celsius(){
   RESULT=`echo "scale=2;($1-32)*5/9" | bc`
   echo "  $1 Farhenheit = $RESULT Celsius"
   echo ""
}

if [ $# == 0 ];then
  mostrar_ayuda
  exit 0
fi


if [ $# == 1 ];then
    if [ $1 == '-h' ] || [ $1 == 'help' ]; then
      mostrar_ayuda
      exit 0
    fi
fi

if [ $# == 1 ];then
  if [ $1 == '-e' ] || [ $1 == '--examples' ]; then
    mostrar_ejemplos
    exit 0
  fi
fi

if [ $# -eq 2 ]; then
  ARGUMENTO=$2
  if [ $1 == '-c' ] || [ $1 == '--celsius' ]; then
     if   verificar_argumento ; then
       convertir_a_fahrenheit $2
       exit 0
     fi
  fi
  if [ $1 == '-f' ] || [ $1 == '--fahrenheit' ]; then
     if  verificar_argumento ;then
        convertir_a_celsius $2
     exit 0
     fi
  fi
fi

echo ""
echo "  ---------------------------------------------------------------------------"
echo "  ERROR: No se pudo procesar su solicitud..."
echo "  Verifique el correcto uso de parametros y valores ingresaods en el comando."
echo "  ---------------------------------------------------------------------------"

mostrar_ayuda
exit 0
