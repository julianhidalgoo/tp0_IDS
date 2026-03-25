#!/bin/bash
#Presentacion del programa
echo "Bienvenido, $USERNAME, elija una opcion"
echo -e "1) Crear entorno \n2) Correr proceso \n3) Listar alumnos por padron \n4) Mostrar 10 notas mas altas \n5) Ingresar padron y mostrar datos \n6) Cerrar programa" 

#Procesado de eleccion
read opcion

while (( $opcion != 6 )); do
  case $opcion in
    1)
      mkdir $HOME/EPNro1
      mkdir "$HOME/EPNro1/entrada" "$HOME/EPNro1/salida" "$HOME/EPNro1/procesado"
      mv consolidar.sh $HOME/EPNro1
      cp $HOME/alumnos/*.txt $HOME/EPNro1/entrada
      echo "Entorno creado con exito"
    ;;
    2)
      if [[ -d $HOME/EPNro1 ]]; then
        bash $HOME/EPNro1/consolidar.sh &
      else
        echo "Por favor, elija primero la opcion 1"
      fi
      echo "Archivos procesados con exito"
    ;;
    3)
      if [[ -f $HOME/EPNro1/salida/$FILENAME.txt ]]; then
        echo "Lista ordenada por padron:"
        sort -n $HOME/EPNro1/salida/$FILENAME.txt
      else
        echo "Es necesario correr la opcion 2 antes"
      fi
    ;;
    4)
      if [[ -f $HOME/EPNro1/salida/$FILENAME.txt ]]; then
        echo "Las 10 notas mas altas son:"
        sort -k5,5nr $HOME/EPNro1/salida/$FILENAME.txt | head -n 10
      else
        echo "Es necesario correr la opcion 2 antes"
      fi
    ;;
    5)
      echo -n 'Ingrese un numero de padron: '
      read padron
        echo -e "Datos del alumno:\n"
        grep "^$padron" $HOME/EPNro1/salida/$FILENAME.txt
    ;;
  esac
#Se imprime el menu nuevamente
  echo -e "\n\n\n1) Crear entorno \n2) Correr proceso \n3) Listar alumnos por padron \n4) Mostrar 10 notas mas altas \n5) Ingresar padron y mostrar datos \n6) Cerrar programa\n\n\n"
  read opcion
done

if [[ "$1" == "-d" ]]; then
  mv $HOME/EPNro1/consolidar.sh $HOME/
  rm -r -f $HOME/EPNro1
fi

echo "Programa finalizado"
