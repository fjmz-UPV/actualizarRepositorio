set instante=%DATE%_%TIME::=_%
set mensaje="Guardado en %instante%"
git checkout -b %instante%
git add -A
git commit -m %mensaje%
git checkout master
git pull