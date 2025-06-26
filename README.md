# DBMA_Biblioteca_inndata
Ejercicio: Sistema de Gestión de una Biblioteca

Descripción

Imagina que estamos creando un sistema para gestionar una biblioteca. Las entidades del sistema incluyen:

Autores: Información sobre los autores de los libros. Libros: Información sobre los libros disponibles en la biblioteca. Miembros: Información sobre los miembros de la biblioteca. Préstamos: Información sobre los libros prestados a los miembros.
Modelo Entidad-Relación (ER)

Autor ID_Autor (PK) Nombre Nacionalidad Libro ID_Libro (PK) Título ID_Autor (FK) Año_Publicación Género Disponible (booleano) Miembro ID_Miembro (PK) Nombre Email Teléfono Préstamo ID_Préstamo (PK) ID_Miembro (FK) ID_Libro (FK) Fecha_Préstamo Fecha_Devolución
Relaciones:

Un autor puede escribir varios libros. Un libro puede ser prestado a varios miembros. Un miembro puede realizar varios préstamos.
Coloca al menos 3 inserciones en cada una de las tablas para hacer las siguientes consultas:

1.      Obtener todos los libros disponibles en la biblioteca

2.      Consulta con Subconsulta: Obtener los miembros que han tomado más de 5 préstamos

3.      Consulta con JOIN: Obtener los títulos de los libros y los nombres de los autores



Coloca tu modelo relacional y el script de la base de datos y consultas en un link de Google Drive y compartelo, asegurate de que lo compartes de manera correcta.