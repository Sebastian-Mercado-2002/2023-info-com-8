CREATE DATABASE desafio_semana_7;
USE desafio_semana_7;

CREATE TABLE Usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  telefono VARCHAR(20),
  username VARCHAR(50),
  email VARCHAR(50),
  contrasena VARCHAR(50),
  estado BOOLEAN,
  fecha_creacion DATE,
  avatar VARCHAR(100),
  es_publico BOOLEAN,
  es_colaborador BOOLEAN,
  es_admin BOOLEAN
);

CREATE TABLE Articulo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  titulo VARCHAR(100),
  resumen VARCHAR(200),
  contenido TEXT,
  fecha_publicacion DATE,
  estado BOOLEAN,
  imagen VARCHAR(100),
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

CREATE TABLE Comentario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_articulo INT,
  id_usuario INT,
  contenido VARCHAR(200),
  fecha_hora DATETIME,
  estado BOOLEAN,
  FOREIGN KEY (id_articulo) REFERENCES Articulo(id),
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

CREATE TABLE Categoria_Articulo (
  id_articulo INT,
  id_categoria INT,
  FOREIGN KEY (id_articulo) REFERENCES Articulo(id),
  FOREIGN KEY (id_categoria) REFERENCES Categoria(id)
);

CREATE TABLE Categoria (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  descripcion VARCHAR(200),
  imagen VARCHAR(100),
  estado BOOLEAN
);

INSERT INTO Usuario (nombre, apellido, telefono, username, email, contrasena, estado, fecha_creacion, avatar, es_publico, es_colaborador, es_admin)
VALUES
  ('Admin', 'Admin', '555-123-4567', 'admin', 'admin@example.com', 'contrasena', TRUE, '2023-06-02', 'admin.jpg', FALSE, FALSE, TRUE),
  ('Colaborador 1', 'Colaborador', '555-987-6543', 'colaborador1', 'colaborador1@example.com', 'contrasena', TRUE, '2017-08-04', 'colaborador1.jpg', FALSE, TRUE, FALSE),
  ('Colaborador 2', 'Colaborador', '555-555-5555', 'colaborador2', 'colaborador2@example.com', 'contrasena', TRUE, '2009-07-23', 'colaborador2.jpg', FALSE, TRUE, FALSE),
  ('Colaborador 3', 'Colaborador', '555-123-7890', 'colaborador3', 'colaborador3@example.com', 'contrasena', TRUE, '2016-02-10', 'colaborador3.jpg', FALSE, TRUE, FALSE),
  ('Colaborador 4', 'Colaborador', '555-987-3210', 'colaborador4', 'colaborador4@example.com', 'contrasena', TRUE, '2020-05-24', 'colaborador4.jpg', FALSE, TRUE, FALSE),
  ('Publico 1', 'Publico', '555-555-1234', 'publico1', 'publico1@example.com', 'contrasena', TRUE, '2021-08-14', 'publico1.jpg', TRUE, FALSE, FALSE),
  ('Publico 2', 'Publico', '555-321-6540', 'publico2', 'publico2@example.com', 'contrasena', TRUE, '2007-07-13', 'publico2.jpg', TRUE, FALSE, FALSE),
  ('Publico 3', 'Publico', '555-555-7890', 'publico3', 'publico3@example.com', 'contrasena', TRUE, '2015-02-20', 'publico3.jpg', TRUE, FALSE, FALSE),
  ('Publico 4', 'Publico', '555-789-1234', 'publico4', 'publico4@example.com', 'contrasena', TRUE, '2022-06-22', 'publico4.jpg', TRUE, FALSE, FALSE),
  ('Publico 5', 'Publico', '555-123-4560', 'publico5', 'publico5@example.com', 'contrasena', TRUE, '2015-04-12', 'publico5.jpg', TRUE, FALSE, FALSE);


UPDATE Usuario
SET es_admin = TRUE
WHERE id = 2;


INSERT INTO Articulo (id_usuario, titulo, resumen, contenido, fecha_publicacion, estado, imagen)
VALUES
  (1, 'Artículo 1', 'Resumen del artículo 1', 'Contenido del artículo 1', CURDATE(), TRUE, 'imagen1.jpg'),
  (2, 'Artículo 2', 'Resumen del artículo 2', 'Contenido del artículo 2', CURDATE(), TRUE, 'imagen2.jpg'),
  (3, 'Artículo 3', 'Resumen del artículo 3', 'Contenido del artículo 3', CURDATE(), TRUE, 'imagen3.jpg'),
  (4, 'Artículo 4', 'Resumen del artículo 4', 'Contenido del artículo 4', CURDATE(), FALSE, 'imagen4.jpg');

INSERT INTO Comentario (id_articulo, id_usuario, contenido, fecha_hora, estado)
VALUES
  (1, 1, 'Primer comentario en el primer artículo', NOW(), TRUE),
  (1, 2, 'Segundo comentario en el primer artículo', NOW(), TRUE),
  (1, 3, 'Tercer comentario en el primer artículo', NOW(), TRUE),
  (2, 1, 'Primer comentario en el segundo artículo', NOW(), TRUE),
  (2, 2, 'Segundo comentario en el segundo artículo', NOW(), TRUE);

DELETE FROM Articulo
WHERE estado = FALSE
LIMIT 1;


SELECT a.titulo, a.fecha_publicacion, u.nombre AS nombre_usuario, c.fecha_hora AS fecha_comentario
FROM Articulo a
INNER JOIN Comentario c ON a.id = c.id_articulo
INNER JOIN Usuario u ON u.id = c.id_usuario
GROUP BY a.id, a.titulo, a.fecha_publicacion, u.nombre, c.fecha_hora;
