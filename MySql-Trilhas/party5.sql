-- CREATE DATABASE party5;
-- USE party5;

/*CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15)
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE,
    id_cliente INT,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

INSERT INTO clientes (nome, email, telefone) VALUES
('Ana', 'ana@email.com', '11999990001'),
('Bruno', 'bruno@email.com', '11999990002'),
('Carlos', 'carlos@email.com', '11999990003'),
('Diana', 'diana@email.com', '11999990004');

INSERT INTO pedidos (data_pedido, id_cliente, valor_total) VALUES
('2025-07-01', 1, 150.00),
('2025-07-02', 1, 300.00),
('2025-07-03', 2, 180.00),
('2025-07-04', NULL, 250.00); -- Pedido sem cliente
*/

/*SELECT c.nome, p.valor_total
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;
*/

/*SELECT c.nome, p.valor_total
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente;
*/

/*SELECT c.nome, p.valor_total
FROM clientes c
RIGHT JOIN pedidos p ON c.id_cliente = p.id_cliente;*/

/*SELECT c.nome AS cliente, p.valor_total
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente

UNION

SELECT c.nome, p.valor_total
FROM clientes c
RIGHT JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE c.id_cliente IS NULL;
*/

/*SELECT nome
FROM clientes
WHERE id_cliente = (
  SELECT id_cliente
  FROM pedidos
  ORDER BY valor_total DESC
  LIMIT 1
);*/

/*INSERT INTO pedidos (data_pedido, id_cliente, valor_total)
SELECT CURDATE(), temp.id_cliente, 120.00
FROM (
  SELECT id_cliente
  FROM pedidos
  ORDER BY valor_total DESC
  LIMIT 1
) AS temp;*/

-- SELECT COUNT(*) AS total_pedidos FROM pedidos;

/*SELECT c.nome, SUM(p.valor_total) AS total_vendas
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;*/

SELECT c.nome, SUM(p.valor_total) AS total_vendas
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente
HAVING total_vendas > 200;

