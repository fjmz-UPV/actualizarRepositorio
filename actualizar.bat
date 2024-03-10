REM Version 2.0
set instante=%DATE%_%TIME::=_%
set mensaje="Guardado en %instante%"
git add -A
git commit -m %mensaje%
git tag "Local_%instante%"
git fetch origin master
git tag "Remoto_%instante%" origin/master
git merge -Xours origin/master -m "Mezclado y actualizado"
