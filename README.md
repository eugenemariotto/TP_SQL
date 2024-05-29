TP_SQL

<center>
<img src="https://objetivo.news/download/multimedia.normal.bcba10cea1861629.Y29kZXJob3VzZS1xdWUtZXMtcXVlLWhhY2VuX25vcm1hbC53ZWJw.webp" style="width: 100% ; aspect-ratio:16/9">
</center>


# <center>Entrega de Proyecto Final - SQL </center>
**Estudiante:** Eugenia Mariotto

**Comisión:** 53180

**Tutora:** Carla Palermo

**Docente:** Anderson Ocaña 

---

## Indice

 - [Temática del Proyecto](#temática-del-proyecto)
 - [Modelo de Negocio](#modelo-de-negocio)
 - [Diagrama Entidad-Relación](#diagrama-entidad-relación)
 - [Listado de Tablas y Descripción](#listado-de-tablas-y-descripción)
 - [Ingesta de Datos](#ingesta-de-datos)
 - [Objetos de la Base de Datos](#objetos-de-la-base-de-datos)
   - [Documentación de Funciones](#documentación-de-funciones)
   - [Documentación de Triggers](#documentación-de-triggers)
   - [Documentación de Procedimientos Almacenados](#documentación-de-procedimientos-almacenados)
   - [Documentación de Vistas](#documentación-de-vistas)
   - [Roles, Permisos y Usuarios](#roles-permisos-y-usuarios)
 - [Backup de la Base de Datos](#backup-de-la-base-de-datos)
 - [Herramientas y Tecnologías Usadas](#herramientas-y-tecnologías-usadas)
 - [Instrucciones para Levantar el Proyecto en CodeSpaces GitHub](#instrucciones-para-levantar-el-proyecto-en-codespaces-github)
 - [Formato de Entrega](#formato-de-entrega)

---

## Temática del Proyecto

El área de Recursos Humanos de la empresa UMAMI necesita una base de datos para procesar la información de sus empleados. Esta empresa está situada en distintas ubicaciones del país y tiene más de 5000 empleados, es por esto que se decide utilizar SQL para almacenar más información de forma más práctica.

---

## Diagrama Entidad-Relación

<img src="C:\Users\Tap\Desktop\TEST GIT" style="width: 60% ; aspect-ratio:16/9">

![Diagrama Entidad-Relación](https://github.com/eugenemariotto/TP_SQL/blob/main/der%20version%20final.png)

---

[<- volver al índice](#indice)

---

## Listado de Tablas y Descripción

El script para la creación y definición de la base de datos se encuentra en el archivo database_structure.sql, ubicado en la carpeta structure.

A continuación se presenta la descripción de cada una de las tablas de la base de datos.

---

### Tabla `area`
| Campo      | Tipo         | Null | Key  | Default | Extra             |
|------------|--------------|------|------|---------|--------------------|
| id_area    | INT          | NO   | PRI  | NULL    |                    |
| banda      | INT          | NO   |      | NULL    |                    |
| desc_area  | VARCHAR(50)  | YES  |      | NULL    |                    |

### Tabla `contrato`
| Campo          | Tipo         | Null | Key  | Default | Extra             |
|----------------|--------------|------|------|---------|--------------------|
| id_contrato    | INT          | NO   | PRI  | NULL    |                    |
| desc_contrato  | VARCHAR(50)  | YES  |      | NULL    |                    |

### Tabla `zona`
| Campo        | Tipo         | Null | Key  | Default | Extra             |
|--------------|--------------|------|------|---------|--------------------|
| id_zona      | INT          | NO   | PRI  | NULL    |                    |
| desc_zona    | VARCHAR(50)  | YES  |      | NULL    |                    |

### Tabla `nivel`
| Campo        | Tipo         | Null | Key  | Default | Extra             |
|--------------|--------------|------|------|---------|--------------------|
| id_nivel     | INT          | NO   | PRI  | NULL    |                    |
| banda        | INT          | NO   |      | NULL    |                    |
| desc_puesto  | VARCHAR(50)  | YES  |      | NULL    |                    |
| minima       | DOUBLE       | NO   |      | NULL    |                    |
| maxima       | DOUBLE       | NO   |      | NULL    |                    |

### Tabla `empleados`
| Campo              | Tipo          | Null         | Key  | Default                | Extra             |
|--------------------|---------------|--------------|------|------------------------|--------------------|
| id_empleado        | INT           | NO           | PK   | NULL                   | auto_increment     |
| primer_nombre      | VARCHAR(50)   | NO           |      | NULL                   |                    |
| segundo_nombre     | VARCHAR(50)   | YES          |      | NULL                   |                    |
| primer_apellido    | VARCHAR(50)   | NO           |      | NULL                   |                    |
| segundo_apellido   | VARCHAR(50)   | YES          |      | NULL                   |                    |
| dni                | VARCHAR(20)   | NO           |      | NULL                   |                    |
| cuil               | VARCHAR(20)   | NO           |      | NULL                   |                    |
| genero             | ENUM('F','M','No binario')   | NO   | NULL                   |                    |
| calle              | VARCHAR(50)   | NO           |      | NULL                   |                    |
| numeracion         | VARCHAR(50)   | NO           |      | NULL                   |                    |
| piso               | VARCHAR(50)   | YES          |      | NULL                   |                    |
| departamento       | VARCHAR(50)   | YES          |      | NULL                   |                    |
| codigo_postal      | INT           | YES          |      | NULL                   |                    |
| ciudad             | VARCHAR(50)   | NO           |      | NULL                   |                    |
| email              | VARCHAR(50)   | NO           | UNI  | NULL                   |                    |
| fecha_de_nacimiento| DATE          | YES          |      | NULL                   |                    |
| fecha_alta         | DATE          | YES          |      | NULL                   |                    |
| tipo_de_empleados  | ENUM('C Level','Líder','Team Player') | YES | NULL  |                    |
| id_nivel           | INT           | NO           | FK   | NULL                   |                    |
| id_area            | INT           | NO           | FK   | NULL                   |                    |
| id_contrato        | INT           | NO           | FK   | NULL                   |                    |
| id_zona            | INT           | NO           | FK   | NULL                   |                    |
| id_lider           | INT           | YES          | FK   | NULL                   |                    |
| sueldo             | DOUBLE        | YES          |      | NULL                   |                    |
| banda              | ENUM('100','200','300')| YES | NULL           |                    |

### Tabla `evaluacion`
| Campo              | Tipo          | Null | Key  | Default                | Extra             |
|--------------------|---------------|------|------|------------------------|--------------------|
| id_eval            | INT           | NO   | PK   | NULL                   |                    |
| fecha_eval         | DATE          | NO   |      | NULL                   |                    |
| resultado_evaluacion| INT          | NO   |      | NULL                   |                    |
| id_empleado        | INT           | NO   | FK   | NULL                   |                    |
| evaluado_por       | INT           | NO   |      | NULL                   |                    |

### Tabla `fichero`
| Campo              | Tipo          | Null | Key  | Default                | Extra             |
|--------------------|---------------|------|------|------------------------|--------------------|
| id_fichero         | INT           | NO   | PK   | NULL                   | auto_increment     |
| id_empleado        | INT           | YES  | FK   | NULL                   |                    |
| fecha_hora_ingreso | DATETIME      | YES  |      | NULL                   |                    |
| fecha_hora_egreso  | DATETIME      | YES  |      | NULL                   |                    |

### Tabla `rotacion`
| Campo              | Tipo          | Null | Key  | Default                | Extra             |
|--------------------|---------------|------|------|------------------------|--------------------|
| id_baja            | INT           | NO   | PK   | NULL                   | auto_increment     |
| id_empleado        | INT           | YES  | FK   | NULL                   |                    |
| fecha_de_baja      | DATE          | YES  |      | NULL                   |                    |

### Tabla `ajustes`
| Campo              | Tipo          | Null | Key  | Default                | Extra             |
|--------------------|---------------|------|------|------------------------|--------------------|
| id_sueldo          | INT           | NO   | PK   | NULL                   |                    |
| id_empleado        | INT           | YES  | FK   | NULL                   |                    |
| fecha_de_ajuste    | DATE          | YES  |      | NULL                   |                    |
| observaciones      | VARCHAR(50)   | YES  |      | NULL                   |                    |
| monto_usd          | INT           | NO   |      | NULL                   |                    |
| monto_ars          | INT           | YES  |      | NULL                   |                    |


---

[<- volver al índice](#indice)

---


## Ingesta de Datos

* La ingesta de datos en las tablas se realizó por medio del archivo population.sql que se encuentra en la carpeta structure.
---


[<- volver al índice](#indice)

---

## Objetos de la Base de Datos

Los objetos de la base de dajos se encuentran en la carpeta objects, con un archivo sql para cada tipo de objeto, a saber:
- Funciones : funtions.sql
- Triggers : triggers.sql
- Prodecimientos almacenados : stored_procedures.sql
- Vistas : views.sql
- Roles, permisos y usuarios : roles_users.sql 

A continuación, se desarrolla la documentación de cada uno de ellos.

---


### Documentación de Funciones 

---

### Listado de funciones

Listado de Funciones

1. Función: premio_desempenio

Descripción:
Esta función calcula el premio por desempeño para un empleado específico multiplicando el monto en USD por el porcentaje de premio proporcionado.

Parámetros:
p_id (INT): El ID del empleado.
p_premio (FLOAT): El porcentaje del premio a aplicar.

Valor Retornado:
FLOAT: Retorna el valor del premio calculado.

Ejemplo de Uso:
SELECT premio_desempenio(123, 0.10) AS Premio;

Muestra de Resultado:
Antes de ejecutar la función:
SELECT * FROM ajustes WHERE id_empleado = 123;
+-------------+----------+
| id_empleado | monto_usd|
+-------------+----------+
| 123         | 1000.00  |
+-------------+----------+

 Después de ejecutar la función:
SELECT premio_desempenio(123, 0.10) AS Premio;
+---------+
| Premio  |
+---------+
| 100.00  |
+---------+

2. Función: monto_teletrabajo

Descripción:
Esta función calcula el monto destinado al teletrabajo para un empleado específico dividiendo el monto en USD por el factor de teletrabajo proporcionado.

Parámetros:
m_id (INT): El ID del empleado.
m_teletrabajo (FLOAT): El factor de teletrabajo a aplicar.

Valor Retornado:
FLOAT: Retorna el valor del monto de teletrabajo calculado.

Ejemplo de Uso:
SELECT monto_teletrabajo(123, 2) AS MontoTeletrabajo;

Muestra de Resultado:
Antes de ejecutar la función:
SELECT * FROM ajustes WHERE id_empleado = 123;
+-------------+----------+
| id_empleado | monto_usd|
+-------------+----------+
| 123         | 1000.00  |
+-------------+----------+

Después de ejecutar la función:

SELECT monto_teletrabajo(123, 2) AS MontoTeletrabajo;
+-----------------+
| MontoTeletrabajo|
+-----------------+
| 500.00          |
+-----------------+

---

### Función 1 : `fn_1_total_entradas`

**Descripción:** 

Esta función permite obtener la cantidad total de unidades de un producto que han ingresado al almacén. Se calcula sumando todas las entradas registradas en la tabla detalle_entradas. 

Esta función es llamada en el trigger tr_actualizar_total_entradas.


**Parámetros:**


| Parámetro     | Descripción                               | 
|-------------|-------------------------------------------|
| id_prod | id del producto tipo INT                         | 



**Retorno:**

Valor entero con el resultado de la suma de todas las cantidades del producto identificado con el parámetro en la tabla detalle_entradas.

**Ejemplo de uso:**
Para el caso del id de producto 1, la consulta sería la siguiente:

```sql
SELECT fn_1_total_entradas(1);
```

**Muestra del resultado de la consulta:**

![Consulta función 1](./images/funcion_1.png)


---

### Función 2 : `fn_2_total_salidas`

**Descripción:** 

Esta función permite obtener la cantidad total de unidades de un producto que han salido del almacén. Se calcula sumando todas las salidas registradas en la tabla detalle_salidas. 

Esta función es llamada en el trigger tr_actualizar_total_salidas.


**Parámetros:**


| Parámetro     | Descripción                               | 
|-------------|-------------------------------------------|
| id_prod | id del producto tipo INT                         | 

**Retorno:**

Valor entero con el resultado de la suma de todas las cantidades del producto identificado con el parámetro en la tabla detalle_salidas.

**Ejemplo de uso:**
Para el caso del id de producto 1, la consulta sería la siguiente:

```sql
SELECT fn_2_total_salidas(1);
```

**Muestra del resultado de la consulta:**

![Consulta función 2](./images/funcion_2.png)


---

### Función 3 : `fn_3_actualizar_ultimo_precio`

**Descripción:** 

Esta función permite actualizar el valor del último precio de un producto en la tabla inventario cuando se ingresa una entrada. 

Esta función es llamada por el trigger tr_actualizar_ultimo_precio.


**Parámetros:**

| Parámetro     | Descripción                               | 
|-------------|-------------------------------------------|
| id_prod | id del producto tipo INT                         | 

**Retorno:**

Esta función retorna el precio del producto indicado como parámetro, el cual corresponde al registro de entrada más reciente.

**Ejemplo de uso:**
Para el caso del id de producto 1, la consulta sería la siguiente:

```sql
SELECT fn_3_actualizar_ultimo_precio(1);
```

**Muestra del resultado de la consulta:**

![Consulta función 3](./images/funcion_3.png)


---

### Función 4 : `fn_4_valor_total_inventario`

**Descripción:** 

Esta función premite obtener el valor total del inventario. Para lo cual multiplica el stock y el precio de cada producto y los suma.

Esta función es llamada en la vista vw_2_valor_inventario.

**Parámetros:**

Esta función no requiere parámetros.

**Retorno:**

Retorna el resulato del cálculo del valor total del inventario.

**Ejemplo de uso:**

```sql
SELECT fn_4_valor_total_inventario();
```

**Muestra del resultado de la consulta:**

![Consulta función 4](./images/funcion_4.png)

---

[<- volver al índice](#indice)

---

### Documentación de Triggers 

---

### Listado de triggers

* Trigger 1 : tr_actualizar_total_entradas
* Trigger 2 : tr_actualizar_total_salidas
* Trigger 3 : tr_actualizar_ultimo_precio

---

### Trigger 1 : `tr_actualizar_total_entradas`

**Descripción:** 

Este trigger se ejecuta después que se inserta un registro en la tabla detalle_entradas actualizando el campo total_entradas en la tabla inventario por medio de la función fn_1_total_entradas.

**Detalles:**

* **Tabla afectada:** detalle_entradas
* **Acción:** INSERT
* **Información registrada:** valor actualizado de total_entradas en tabla inventarios

**Ejemplo:**

* Se inserta una nueva entrada en la tabla detalle_entradas.
* El trigger calcula el nuevo valor del campo total_entradas mediante la funcion fn_1_total_entradas para el id correspondiente y actualiza la tabla inventario. 

---

### Trigger 2 : `tr_actualizar_total_salidas`

**Descripción:** 

Este trigger se ejecuta después que se inserta un registro en la tabla detalle_salidas actualizando el camapo total_salidas en la tabla inventario por medio de la función fn_2_total_salidas.

**Detalles:**

* **Tabla afectada:** detalle_salidas
* **Acción:** INSERT
* **Información registrada:** valor actualizado de total_salidas en tabla inventarios

**Ejemplo:**

* Se inserta una nueva salida en la tabla detalle_salidas.
* El trigger calcula el nuevo valor del campo total_salidas mediante la funcion fn_2_total_salidas para el id correspondiente y actualiza la tabla inventario. 

---

### Trigger 3 : `tr_actualizar_ultimo_precio`

**Descripción:** 

Este trigger se ejecuta después que se inserta un registro en la tabla detalle_entradas actualizando el campo ultimo_precio_$ en la tabla inventario por medio de la función fn_3_actualizar_ultimo_precio.

**Detalles:**

* **Tabla afectada:** detalle_entradas
* **Acción:** INSERT
* **Información registrada:** valor actualizado de ultimo_precio_$ en tabla inventarios

**Ejemplo:**

* Se inserta una nueva entrada en la tabla detalle_entradas.
* El trigger calcula el nuevo valor del campo ultimo_precio_$ mediante la funcion fn_3_actualizar_ultimo_precio para el id correspondiente y actualiza la tabla inventario. 

---

[<- volver al índice](#indice)

---

### Documentación de Procedimientos Almacenados

---

Procedimiento almacenado: sp_actualizacion_sueldos
Descripción:
Este procedimiento almacenado se encarga de calcular y mostrar información sobre el ajuste de sueldos de los empleados de acuerdo con la inflación y un bono especificados como parámetros.

Parámetros:
inflacion_ars (IN): Valor de inflación en ARS (pesos argentinos).
bono_usd (IN): Valor del bono en USD (dólares estadounidenses).

Retorno:
Este procedimiento no tiene retorno, pero devuelve un conjunto de resultados con la información de los empleados y los ajustes de sueldos calculados.

Ejemplo de uso:
CALL sp_actualizacion_sueldos(1.05, 1.10);
Este ejemplo llama al procedimiento sp_actualizacion_sueldos con una inflación del 5% y un bono del 10% en dólares.

Procedimiento almacenado: registrarevaluacion
Descripción:
Este procedimiento almacenado se encarga de registrar una evaluación realizada a un empleado en la tabla evaluacion.

Parámetros:
p_id_empleado (IN): ID del empleado al que se le realiza la evaluación.
p_fecha_eval (IN): Fecha en la que se realizó la evaluación.
p_resultado_evaluacion (IN): Resultado de la evaluación.
p_evaluado_por (IN): ID de la persona que realizó la evaluación.


[<- volver al índice](#indice)

---


## Roles, Permisos y Usuarios en MySQL

### Roles:
1. **todos_los_permisos**: Este rol tiene todos los permisos posibles sobre la base de datos `rrhh_umami`.
2. **solo_lectura**: Este rol tiene permisos de solo lectura sobre la base de datos `rrhh_umami`.
3. **lectura_insercion**: Este rol tiene permisos de lectura e inserción sobre la base de datos `rrhh_umami`.

### Permisos:
- `ALL PRIVILEGES`: Concede todos los permisos posibles sobre la base de datos especificada.
- `SELECT`: Concede el permiso de seleccionar datos de las tablas en la base de datos.
- `INSERT`: Concede el permiso de insertar nuevos registros en las tablas de la base de datos.

### Usuarios:
1. `Jorge@%`: Usuario con nombre 'Jorge', con acceso desde cualquier host ('%'), identificado por la contraseña '111'. Este usuario tiene asignado el rol `todos_los_permisos`, lo que le otorga todos los permisos sobre la base de datos `rrhh_umami`.
2. `Juan@%`: Usuario con nombre 'Juan', con acceso desde cualquier host ('%'), identificado por la contraseña '222'. Este usuario tiene asignado el rol `solo_lectura`, lo que le permite realizar consultas de solo lectura en la base de datos `rrhh_umami`.
3. `Julian@%`: Usuario con nombre 'Julian', con acceso desde cualquier host ('%'), identificado por la contraseña '333'. Este usuario tiene asignado el rol `lectura_insercion`, lo que le permite realizar consultas de lectura e inserción en la base de datos `rrhh_umami`.

Estos roles y permisos proporcionan un nivel de control de acceso a la base de datos, permitiendo asignar diferentes conjuntos de permisos a diferentes usuarios según sus necesidades y responsabilidades.

---

[<- volver al índice](#indice)

---

## Backup de la Base de Datos

El backup generado es del tipo self-contained file y contiene estructura y datos. Los backups se almacenan en la carpeta backup.

También se puede generar un backup a través del comando `make backup-db` que permite ejecutar un backup de manera manual.


---

[<- volver al índice](#indice)

---

## Herramientas y Tecnologías Usadas
* MySQL: motor de bases de datos, version 8.0.36
* MySQL Workbench: interfaz gráfica, version 8.0.36
* Microsoft Word, Excel, PowerPoint
* Visual Studio Code: para desarrollar el documento README.md
* Google Drive y Zoom: para ver el contenido de las clases
* https://mockaroo.com/: para generar datos ficticios
* https://www.tablesgenerator.com/: para transformar tablas de formato csv a markdown
* Makefile: para generar una interfaz sencilla de procesos
* Docker: para generar un container
* GitHub: para entregar el proyecto

---

[<- volver al índice](#indice)

---

## Instrucciones para Levantar el Proyecto en CodeSpaces GitHub

* env : archivo con contraseñas y data secretas
* Makefile : abstracción de creacción del proyecto
* docker-compose.yml : permite generar las bases de datos en forma de contenedores

### Pasos para arrancar el proyecto

* En la terminal de linux escribir :
    - `make` _si da un error de que no conexion al socket, volver al correr el comando `make`_
    - `make clean-db` limpia la base de datos
    - `make test-db` para observar los datos de cada tabla
    - `make backup-db` para realizar un backup de la base de datos
    - `make access-db` para acceder a la base de datos


---

[<- volver al índice](#indice)

---
