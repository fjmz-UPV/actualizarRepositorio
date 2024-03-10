# Scripts de salvado, actualización y fusión de repositorios

Los _scripts_ proporcionados permiten actualizar la rama local con seguimiento `master` con la rama remota homónima del repositorio ubicado en `origin`, salvando adicionalmente en una _commit_ (cuyo nombre codifica el instante en el que se ejecuta el script) cualquier modificación que hubiera ocurrido desde la última actualización. 

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
* 3cbac5f (HEAD -> master, origin/master) Tercer commit
* ee17d79 Segundo commit
* 81de5d4 Primer commit
```

Supongamos también que hacemos algún tipo de modificación local _personal_ (que hemos guardado en el directorio de trabajo y que deseamos _arrastrar_ junto con las actualizaciones que se vayan recibiendo). Para ello, lo único que debemos hacer es ejecutar el _script_ apropiado según el tipo de terminal/sistema operativo. Por ejemplo, si estamos en un `CMD` o `Símbolo del sistema`, tras modificar un fichero del repositorio y salvarlo convencionalmente, entonces, al ejecutar 
```bash
.\actualizar.bat
```
el repositorio local quedaría como sigue:

```
*   ecb132e (HEAD -> master) Mezclado y actualizado
|\
| * f461d30 (tag: Remoto_10/03/2024_10_05_47,00, origin/master) Actualización remota
* | 2bb0e7e (tag: Local_10/03/2024_10_05_47,00) Guardado en 10/03/2024_10_05_47,00
|/
* 3cbac5f Tercer commit
* ee17d79 Segundo commit
* 81de5d4 Primer commit
```
habiendo ocurrido las siguientes acciones:
- La modificación local que le hicimos a algún fichero está guardada en un _commit_ etiquetado como `Local_10/03/2024_10_05_47,00` (prefijo `Local_` más instante de tiempo) de la rama `master`
- El _commit_ correspondiente a la actualización remota (rama `origin/master`) se etiqueta como `Remoto_10/03/2024_10_05_47,00` (prefijo `Remoto_` más instante de tiempo)
- La rama `master` se funde con la rama remota con seguimiento `origin/master` con la opción `-Xours` con lo que se da prioridad a las actualizaciones locales que pudieran generar conflicto con las remotas. El _commit_ de fusión posee el comentario `Mezclado y actualizado` y es el _commit_ actual del repositorio local.

> Si el repositorio posee Jupyter Notebooks y han sido manipulados localmente, si como resultado de la fusión hubieran quedado corruptos, las alternativas para poder seguir trabajando podrían ser las siguientes:
> - Editar el fichero del Jupyter Notebook a nivel textual y resolver el problema: un Jupyter Notebook es un fichero JSON
> - Rehusar la fusión, haciendo que la rama `master` local coincida con la remota, para lo cual, podría ejecutarse:
>   ```bash
>   git reset --hard Remoto_10/03/2024_10_05_47,00
>   ```
>   o la etiqueta que resultara oportuna. Las modificaciones locales siguen estando presentes y si se quisiera acceder a ellas, podría hacerse saltando al commit cuya etiqueta fuera de la forma `Local_...`



Si no hay ninguna actualización a tener en cuenta, ni local, ni remota, y se ejecuta el _script_, no se generan nuevos _commits_, pero sí se siguen generando las etiqueta correspondientes a los _commits_ locales y remotos asociados:
```
*   ecb132e (HEAD -> master, tag: Local_10/03/2024_10_11_28,00) Mezclado y actualizado
|\
| * f461d30 (tag: Remoto_10/03/2024_10_11_28,00, tag: Remoto_10/03/2024_10_05_47,00, origin/master) Actualización remota
* | 2bb0e7e (tag: Local_10/03/2024_10_05_47,00) Guardado en 10/03/2024_10_05_47,00
|/
* 3cbac5f Tercer commit
* ee17d79 Segundo commit
* 81de5d4 Primer commit
```

## Modo de operación general

La forma de proceder podría ser la siguiente:
- Clonar el repositorio inicialmente
- Copiar el/los _scripts_ a cualquier carpeta del directorio versionado
- Trabajar de manera convencional y cuando haya alguna actualización remota que se desee fundir con las actualizaciones locales, invóquese el _script_.





# Scripts en fase de pruebas

Estos _scripts_ están en fase de pruebas. Si detectáis cualquier mal funcionamiento o tenéis cualquier sugerencia, contactad con cualquier profesor de la asignatura.
