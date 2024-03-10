#!/bin/bash
# Version 2.0
set -x #echo on
instante=`date +'%d/%m/%Y_%H_%M_%S,00'`
mensaje=`echo Guardado en $instante`
git add -A
git commit -m "$mensaje"
git tag "Local_$instante"
git fetch origin master
git tag "Remoto_$instante" origin/master
git merge -Xours origin/master -m "Mezclado y actualizado"
set +x #echo off
