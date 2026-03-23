#!/bin/bash
touch $HOME/EPNro1/salida/$FILENAME.txt
for archivo in $HOME/EPNro1/entrada/*.txt
do
  cat $archivo >> $HOME/EPNro1/salida/$FILENAME.txt
  mv $archivo $HOME/EPNro1/procesado
done
