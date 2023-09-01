# Academic DB
Es un proyecto sobre una base de datos de una "academia" en la que hay estudiantes, profesores y clases.

# SQL
En el archivo *AcademicDB.sql* encontraremos todo el código necesario para crear la base de datos, las tablas y las columnas.

`CREATE DATABASE academic;`

Con este código crearemos la base de datos. Puedes cambiar el nombre si quieres, solo debes relplazarlo en donde dice "academic".

```
CREATE TABLE estudiante();
ALTER TABLE estudiante ADD COLUMN estudiante_id SERIAL NOT NULL;
ALTER TABLE estudiante ADD COLUMN nombre VARCHAR(50) NOUT NULL;
ALTER TABLE estudiante ADD COLUMN edad INT NOT NULL;
ALTER TABLE estudiante ADD COLUMN direccion VARCHAR(50);
ALTER TABLE estudiante ADD COLUMN celular BIGINT NOT NULL;
```

Con este código crearemos la tabla de estudiantes y agregaremos las columnas respectivas a este. 

- Para los valores como nombres y direcciones usaremos el tipo de dato de SQL **VARCHAR** el numero entre paréntesis representa el límite de caracteres que aceptaremos para este campo, en este caso es 50 que es más que suficiente para ambos valores.

- Para valores como las edades vamos a utilizar el tipo de dato de SQL **INT** el cual nos va a servir para números pequeños, 20 cifras.

- Para valores como el celular/numero de teléfono vamos a utilizar el tipo de dato de SQL **BIGINT** ya que los numeros de telefono generalmente son numeros grandes con al rededor de 10 cifras.

```
CREATE TABLE profesor();
ALTER TABLE profesor ADD COLUMN profesor_id SERIAL NOT NULL;
ALTER TABLE profesor ADD COLUMN nombre VARCHAR(50) NOUT NULL;
ALTER TABLE profesor ADD COLUMN edad INT NOT NULL;
ALTER TABLE profesor ADD COLUMN direccion VARCHAR(50);
ALTER TABLE profesor ADD COLUMN celular BIGINT NOT NULL;
```

Para la tabla de profesores realizamos la misma operación que en la de estudiantes.

```
CREATE TABLE clase();
ALTER TABLE clase ADD COLUMN clase_id SERIAL NOT NULL;
ALTER TABLE clase ADD COLUMN nombre VARCHAR(50) NOT NULL;
ALTER TABLE clase ADD COLUMN hora TIME NOT NULL;
ALTER TABLE clase ADD COLUMN profesor_id INT NOT NULL;
ALTER TABLE clase ADD COLUMN estudiante_id INT NOT NULL;
```

Con este código podremos crear nuestra tabla de clase y agregar las diferentes columnas que pertenecen a la misma.

- Para valores como el nombre utilizamos el mismo tipo de dato de SQL **VARCHAR**

- Para valores como la hora a la que se dará la clase usaremos el tipo de dato de SQL **TIME**. Este tiene la siguiente estructura 'HH:MM:SS'

- Para valores de los IDs tanto del profesor y el estudiante usaremos INT

```
ALTER TABLE clase
ADD CONSTRAINT fk_profesor
FOREIGN KEY (profesor_id) REFERENCES profesor(profesor_id);

ALTER TABLE clase
ADD CONSTRAINT fk_estudiante
FOREIGN KEY (estudiante_id) REFERENCES estudiante(estudiante_id);
```
Con ese código agregaremos las llaves foráneas (FOREIGN KEY) que nos van a ayudar a relacionar la tabla de estudiantes y de profesores con la clase.

# Academic.sh
Este archivo contiene todo el código de *bash script* para poder ingresar información en las 3 tablas (estudiante, profesor, clase) en el que hacemos uso de funciones, casos, y condicionales para entregarle una experiencia al usuario en la que sepa que información debe diligenciar para llenar cada tabla.

*Recuerde que para agregar datos a la tabla de "clase" se requiere tener datos en las tablas de estudiantes y profesores.*