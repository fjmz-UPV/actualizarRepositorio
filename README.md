# Scripts de salvado y actualización de repositorios

Los _scripts_ proporcionados permiten actualizar la rama local con seguimiento `master` con la rama remota homónima, salvando en una rama adicional (cuyo nombre codifica el instante en el que se ejecuta el script) cualquier modificación que hubiera ocurrido desde la anterior actualización. 

El _script_ `actualizar.bat` está preparado para ser ejecutado en una consola de tipo `CMD` o `Símbolo del sistema`, o `Powershell` de Windows invocándolo como:
```bash
.\actualizar.bat
```
mientras que `actualizar.sh` lo está para un terminal `Git Bash` de Windows, o cualquier `terminal` de Linux o Mac OS-X, invocándolo como:
```bash
source actualizar.sh
```

## Instalación:

Cópiese el _script_ oportuno según el terminal a emplear, en cualquier carpeta del directorio correspondiente al repositorio local.

## Ejemplo de uso

Supongamos que localmente tenemos el siguiente repositorio:

```text
* 3762556 (HEAD -> master, origin/master) Nueva modificación
* e12df95 Primera actualización
* b778f90 Inic.
```

Supongamos también que hacemos algún tipo de modificación local _personal_ (que hemos guardado en el directorio de trabajo y que deseamos poder recuperar en el futuro de alguna manera) antes de actualizar el repositorio local con nuevos contenidos del remoto. Para ello, lo único que debemos hacer es ejecutar el _script_ apropiado según el tipo de terminal/sistema operativo. Por ejemplo, si estamos en un `CMD` o `Símbolo del sistema`, tras modificar un fichero del repositorio y salvarlo, entonces, al ejecutar 
```bash
.\actualizar.bat
```
el repositorio local quedaría como sigue:

```
* 2bc479c (05/03/2024_14_12_51,96) Guardado en 05/03/2024_14_12_51,96
| * 1248a10 (HEAD -> master, origin/master) Otra más
|/
* 3762556 Nueva modificación
* e12df95 Primera actualización
* b778f90 Inic.
```
habiendo ocurrido dos acciones:
- La modificación local que le hicimos a algún fichero está íntegramente guardada en la rama `05/03/2024_14_12_51,96` que denota el instante de tiempo (`DD/MM/AAAA_HH_MM_SS,ds`) en el que se ejecutó el _script_. 
- Se actualiza la rama `master` al estado remoto de la misma.


Si no hay ninguna actualización a tener en cuenta, ni local, ni remota, y se ejecuta el _script_, se sigue generando una rama indicando el instante en el que se ha invocado al script. Ejemplo:
```
* 2bc479c (05/03/2024_14_12_51,96) Guardado en 05/03/2024_14_12_51,96
| * 1248a10 (HEAD -> master, origin/master, 05/03/2024_14_26_20,55) Otra más  <-- Creación de rama-instante
|/
* 3762556 Nueva modificación
* e12df95 Primera actualización
* b778f90 Inic.
```

## Modo de operación general

La forma de proceder podría ser la siguiente:
- Clonar el repositorio inicialmente
- Copiar el/los _scripts_ a cualquier carpeta del directorio versionado
- Cada vez que haya alguna actualización remota que se desee trasladar localmente, habrá que ejecutar el _script_ (apropiado según la plataforma). Como consecuencia, además de actualizar localmente la rama `master`, se creará una rama cuyo nombre codifica el instante de tiempo en el que se ha ejecutado el _script_; si ha habido alguna modificación local se crea un commit a tal efecto, haciendo que la rama recientemente creada apunte a él.
- Para acceder a la versión modificada personalmente, por ejemplo, a la rama `05/03/2024_14_12_51,96`:
  ```bash
  git checkout 05/03/2024_14_12_51,96
  ```
  o bien, quizá más sintéticamente
  ```bash
  git checkout 2bc4   <--- El hash correspondiente
  ```

  - En dicha rama _personal_ se pueden seguir haciendo modificaciones, pudiéndose guardar de forma convencional.
  - Para volver de nuevo a la rama principal 
    ```bash
    git checkout master
    ```



# Scripts en fase de pruebas

Estos _scripts_ están en fase de pruebas. Si detectáis cualquier mal funcionamiento o tenéis cualquier sugerencia, contactad con cualquier profesor de la asignatura.
