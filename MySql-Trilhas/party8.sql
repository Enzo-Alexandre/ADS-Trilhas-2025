-- CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

/*CREATE TABLE IF NOT EXISTS autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO autores (nome) VALUES ('Machado de Assis'), ('Clarice Lispector');
INSERT INTO livros (titulo, id_autor) VALUES ('Dom Casmurro', 1), ('A Hora da Estrela', 2);
INSERT INTO clientes (nome, email) VALUES ('Ana', 'ana@email.com'), ('Carlos', 'carlos@email.com');*/

/*SELECT id_cliente, nome, email 
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clientes.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
FROM clientes;*/

-- TRUNCATE TABLE clientes;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clientes.csv'
INTO TABLE clientes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
