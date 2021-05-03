#!/bin/bash
#Agrego un comentario
#4	(16 DIG)	VISA
#51-55	(16 DIG)	MASTERCARD
#34-37	(15 DIG)	AMERICAN EXPRESS
#Hipotesis: el primer conjunto de numeros de las tarjetas american express
#es de 3 digitos

REGEX_VISA="^4[0-9]{3}-[0-9]{4}-[0-9]{4}-[0-9]{4}.*"
REGEX_MASTER="^5[1-5][0-9]{2}-[0-9]{4}-[0-9]{4}-[0-9]{4}.*"
REGEX_AMERICAN="^3[4-7][0-9]-[0-9]{4}-[0-9]{4}-[0-9]{4}.*"

while IFS= read -r line;
	do
          if [[ "$line" =~ $REGEX_VISA ]];then
		echo $line:VISA;
	  fi
	  if [[ "$line" =~ $REGEX_MASTER ]];then
		echo $line:MASTERCARD;
	  fi
	  if [[ "$line" =~ $REGEX_AMERICAN ]];then
		echo $line :AMERICAN EXPRESS;
	  fi
	done < debito-automatico.txt
