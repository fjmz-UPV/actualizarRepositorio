#!/bin/bash
set -x #echo on
instante=`date +'%d/%m/%Y_%H_%M_%S,00'`
mensaje=`echo Guardado en $instante`
git checkout -b $instante
git add -A
git commit -m "'$mensaje'"
git checkout master
git pull