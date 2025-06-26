use inndata16;

create table autor(id int not null primary key auto_increment
                  ,nombre varchar(100) not null
                  ,nacionalidad varchar(100) not null
                  );

drop table if exists libro;

create table libro(id int not null primary key auto_increment
                  ,titulo varchar(100) not null
                  ,anio_publicacion int not null
                  ,disponible boolean not null
                  ,autor_id int not null 
                  ,foreign key(autor_id) references autor(id)
                  );

drop table if exists miembro;

create table miembro(id int not null primary key auto_increment
                    ,nombre  varchar(100) not null
                    ,email  varchar(100) not null
                    ,telefono varchar(10) not null);


drop table if exists prestamo;

create table prestamo(id int not null primary key auto_increment
                    ,fecha_prestamo date not null
                    ,fecha_devolucion date not null
                    ,libro_id int not null
                    ,miembro_id int not null
                    ,FOREIGN KEY (libro_id) REFERENCES libro(id)
                    ,FOREIGN KEY (miembro_id) REFERENCES miembro(id)
                    );

-- Insertar 10 registros en la tabla autor
INSERT INTO autor (nombre, nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiano'),
('Isabel Allende', 'Chilena'),
('Mario Vargas Llosa', 'Peruano'),
('Jorge Luis Borges', 'Argentino'),
('Octavio Paz', 'Mexicano'),
('Pablo Neruda', 'Chileno'),
('Julio Cortázar', 'Argentino'),
('Carlos Fuentes', 'Mexicano'),
('Roberto Bolaño', 'Chileno'),
('Laura Esquivel', 'Mexicana');

-- Insertar 20 registros en la tabla libro
INSERT INTO libro (titulo, anio_publicacion, disponible, autor_id) VALUES
('Cien años de soledad', 1967, true, 1),
('El amor en los tiempos del cólera', 1985, true, 1),
('La casa de los espíritus', 1982, true, 2),
('Eva Luna', 1987, false, 2),
('La ciudad y los perros', 1963, true, 3),
('Conversación en La Catedral', 1969, true, 3),
('Ficciones', 1944, true, 4),
('El Aleph', 1949, false, 4),
('El laberinto de la soledad', 1950, true, 5),
('Piedra de sol', 1957, true, 5),
('Veinte poemas de amor y una canción desesperada', 1924, true, 6),
('Canto general', 1950, false, 6),
('Rayuela', 1963, true, 7),
('Bestiario', 1951, true, 7),
('La muerte de Artemio Cruz', 1962, true, 8),
('Aura', 1962, false, 8),
('Los detectives salvajes', 1998, true, 9),
('2666', 2004, true, 9),
('Como agua para chocolate', 1989, true, 10),
('La ley del amor', 1995, false, 10);

-- Insertar 5 registros en la tabla miembro
INSERT INTO miembro (nombre, email, telefono) VALUES
('Ana García López', 'ana.garcia@email.com', '5551234567'),
('Carlos Rodríguez Pérez', 'carlos.rodriguez@email.com', '5552345678'),
('María Fernández Silva', 'maria.fernandez@email.com', '5553456789'),
('Juan Martínez Torres', 'juan.martinez@email.com', '5554567890'),
('Laura Sánchez Ruiz', 'laura.sanchez@email.com', '5555678901');

-- Insertar 15 registros en la tabla prestamo
INSERT INTO prestamo (fecha_prestamo, fecha_devolucion, libro_id, miembro_id) VALUES
('2024-01-15', '2024-02-15', 1, 1),
('2024-01-20', '2024-02-20', 3, 2),
('2024-02-01', '2024-03-01', 5, 3),
('2024-02-10', '2024-03-10', 7, 4),
('2024-02-15', '2024-03-15', 9, 5),
('2024-03-01', '2024-04-01', 11, 1),
('2024-03-05', '2024-04-05', 13, 2),
('2024-03-10', '2024-04-10', 15, 3),
('2024-03-20', '2024-04-20', 17, 4),
('2024-04-01', '2024-05-01', 19, 5),
('2024-04-10', '2024-05-10', 2, 1),
('2024-04-15', '2024-05-15', 6, 2),
('2024-05-01', '2024-06-01', 10, 3),
('2024-05-10', '2024-06-10', 14, 4),
('2024-05-20', '2024-06-20', 18, 5);


-- Seleccionar todos los libros de una biblioteca
select * from libro;

-- Consulta con Subconsulta: Obtener los miembros que han tomado más de 5 préstamos
select * 
  from miembro 
  where id in (
				select miembro_id
				  from prestamo
				 group by miembro_id, libro_id
				  having count(libro_id) > 5
			 )



select miembro.nombre, count(libro_id)
  from miembro 
  inner join prestamo on  miembro.id = prestamo.miembro_id
  group by miembro_id, libro_id
  having count(libro_id) > 5

--Consulta con JOIN: Obtener los títulos de los libros y los nombres de los autores
select autor.nombre
      ,libro.titulo
 from libro
 inner join autor on libro.autor_id = autor.id;

