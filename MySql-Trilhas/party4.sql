-- CREATE DATABASE party4;

-- USE party4;

-- select * from clientes;
-- select * from pedidos;
/*CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15)
);*/
/*CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);*/

-- DROP TABLE pedidos;

/*CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);*/

/*INSERT INTO clientes (nome, email, telefone) VALUES
('Ana', 'ana@email.com', '11999990001'),
('Bruno', 'bruno@email.com', '11999990002'),
('Carlos', 'carlos@email.com', '11999990003'),
('Diana', 'diana@email.com', '11999990004'),
('Eduardo', 'eduardo@email.com', '11999990005'),
('Fernanda', 'fernanda@email.com', '11999990006'),
('Gustavo', 'gustavo@email.com', '11999990007'),
('Helena', 'helena@email.com', '11999990008'),
('Igor', 'igor@email.com', '11999990009'),
('Juliana', 'juliana@email.com', '11999990010');

INSERT INTO pedidos (data_pedido, id_cliente) VALUES
('2025-07-01', 1), ('2025-07-02', 1), ('2025-07-03', 2),
('2025-07-04', 3), ('2025-07-05', 4), ('2025-07-06', 5),
('2025-07-07', 6), ('2025-07-08', 7), ('2025-07-09', 8),
('2025-07-10', 9);

SELECT * FROM pedidos WHERE id_cliente = 1;*/

/*CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100)
);

CREATE TABLE pedido_produto (
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO produtos (nome_produto) VALUES
('Refrigerante'), ('Salgadinho'), ('Bolo'), ('Doce'), ('Suco');

INSERT INTO pedido_produto (id_pedido, id_produto, quantidade) VALUES
(1, 1, 2), (1, 2, 1), (2, 3, 1), (3, 1, 1), (3, 4, 3);
*/
/*SELECT c.nome AS cliente, p.nome_produto, pp.quantidade
FROM clientes c
JOIN pedidos pe ON c.id_cliente = pe.id_cliente
JOIN pedido_produto pp ON pe.id_pedido = pp.id_pedido
JOIN produtos p ON pp.id_produto = p.id_produto;
*/

/*SELECT * FROM pedidos WHERE id_cliente = 1;

DELETE FROM clientes WHERE id_cliente = 1;

SELECT * FROM pedidos WHERE id_cliente = 1;
*/

/*DROP TABLE pedido_produto;
DROP TABLE pedidos;

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE pedido_produto (
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO clientes (id_cliente, nome, email, telefone) 
VALUES (100, 'Teste', 'teste@email.com', '48999990000');

INSERT INTO pedidos (data_pedido, id_cliente) VALUES ('2025-07-08', 100);

UPDATE clientes SET id_cliente = 101 WHERE id_cliente = 100;

SELECT * FROM pedidos WHERE id_cliente = 101;
*/

/*CREATE TABLE dados_cliente (
    id_cliente INT PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);*/

/*SELECT pe.id_pedido, c.nome AS cliente
FROM pedidos pe
JOIN clientes c ON pe.id_cliente = c.id_cliente
JOIN pedido_produto pp ON pe.id_pedido = pp.id_pedido
JOIN produtos pr ON pp.id_produto = pr.id_produto
WHERE pr.nome_produto = 'Bolo';*/

-- CREATE TABLE pedidos_errados (
    id_pedido INT PRIMARY KEY,
    id_cliente INT
);