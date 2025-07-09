CREATE DATABASE IF NOT EXISTS party6;
USE party6;

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    cidade VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE,
    id_cliente INT,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100),
    categoria VARCHAR(50),
    preco DECIMAL(10,2)
);

CREATE INDEX idx_nome_cliente ON clientes(nome);

SELECT * FROM clientes WHERE nome = 'Ana';

CREATE UNIQUE INDEX idx_email_cliente ON clientes(email);

CREATE INDEX idx_nome_cidade_cliente ON clientes(nome, cidade);
SELECT * FROM clientes WHERE nome = 'Bruno' AND cidade = 'Joinville';

EXPLAIN
SELECT c.nome, p.valor_total
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente;

CREATE INDEX idx_id_cliente_pedidos ON pedidos(id_cliente);

EXPLAIN SELECT * FROM clientes WHERE UPPER(nome) = 'ANA';

SELECT * FROM clientes ORDER BY nome ASC LIMIT 5;

SELECT * FROM clientes WHERE UPPER(nome) = 'ANA';

SELECT * FROM clientes WHERE nome = 'Ana';

CREATE INDEX idx_categoria_produto ON produtos(categoria);
CREATE INDEX idx_preco_produto ON produtos(preco);

SELECT * FROM produtos WHERE categoria = 'bebida' AND preco < 50;

EXPLAIN
SELECT c.nome, p.valor_total
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE p.valor_total > 100
ORDER BY p.valor_total DESC;

CREATE INDEX idx_valor_total_pedidos ON pedidos(valor_total);

