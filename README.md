### Características

- Se utiliza docker-compose para montar las imagenes de:
    - Solr
    - Fedora Repositories
    - Ruby on Rails
    - Redis
    - MySQL

Con la finalidad de crear un entorno de desarrollo totalmente montado en docker del proyecto hyrax, para e l repositorio del Colegio de México.

<!--# Proquest

<img src="https://migantoju.com/wp-content/uploads/2018/12/1_u_Jr6FozmyMCi3pe9ZsoFg-768x432.png"  width="384" height="216" />-->


**Contenido**

<!--ts-->
- [Iniciar el proyecto](#iniciar-el-proyecto)
    * [Modificar el archivo .env](#modificar-archivo-.env)
	* [Ejecutar archivo docker-compose](#ejecutar-archivo-docker-compose)
	+ [Modificar permisos a la carpeta /conf](#modificar-permisos-de-la-carpeta-/conf)
	* [Detener contenedores y volver a iniciarlos](#detener-contenedores-y-volver-a-contruirlos)
<!--te-->

** **

## Iniciar el proyecto


### Modificar archivo .env

Para poder personalizar nuestras imagenes de docker debemos modificar los archivos .env:

>	` .env`


### Ejecutar archivo docker-compose

Para poder descargar las imagenes correspondientes ejecutamos nuestro archivo docker-compose principal, que se encuentra en la raiz del repositorio:

Si no tenemos los archivos de migracion debemos crearlos:

>	`$ docker-compose up`

### Modificar permisos de la carpeta /conf

Al crear los volumenes dentro del archivo docker-compose, estos se crean con permisos restringidos por lo que es importante cambiarlos, para que se puedan accesar a los archivos de configuracion y crear correctamente los cores de solr.

Dentro de solr se crea la carpeta /conf en la siguiente direccion: 

> '/server/solr/mycores/hydra-development/'

Dentro de esta ruta no se tienen los permisos para poder accesar a ella, por lo que debemos cambiar los permisos desde el bash de docker, para ello vamos a accesar al contenedor como usuario "root" con el siguiente comando en una nueva terminal:

>	`$ docker exec -it --user root colmex.solr /bin/bash`

Despues navegamos hasta:

>   `$ cd server/solr/mycores/`

Y cambiamos los permisos a todas las subcarpetas de /hydra-development, incluyendola:

>   `$ chmod 777 -R ./hydra-development/`

### Detener contenedores y volver a contruirlos

Dentro de la consola donde ejecutamos el archivo docker-compose presionamos CTRL+C para detener todos los contenedores:

Y finalmente ejecutamos docker-compose de la siguiente manera, para volver a cargar los archivos:
>   `$ docker-compose up --build`

