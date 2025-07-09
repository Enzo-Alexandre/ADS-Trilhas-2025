CREATE DATABASE sistema_vendas_final;

USE sistema_vendas_final;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15)
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    estoque INT
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE pedido_produto (
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO clientes (nome, email, telefone) VALUES
('João Silva', 'joao.silva@email.com', '47999998888'),
('Maria Souza', 'maria.souza@email.com', '47988887777');

INSERT INTO produtos (nome, preco, estoque) VALUES
('Notebook Gamer', 5500.00, 20),
('Mouse Sem Fio', 150.00, 100),
('Teclado Mecânico', 450.00, 50);

SELECT 'Ambiente Criado com Sucesso!' AS Status;
SELECT * FROM clientes;
SELECT * FROM produtos;

SELECT 
    p.id_pedido, 
    c.nome AS cliente, 
    pr.nome AS produto, 
    pp.quantidade
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN pedido_produto pp ON p.id_pedido = pp.id_pedido
JOIN produtos pr ON pp.id_produto = pr.id_produto;


SELECT nome
FROM produtos
WHERE id_produto = (
    SELECT id_produto
    FROM pedido_produto
    GROUP BY id_produto
    ORDER BY SUM(quantidade) DESC
    LIMIT 1
);

-- Apagamos o procedimento se ele já existir para evitar erros
DROP PROCEDURE IF EXISTS registrar_pedido;

-- Criando o procedimento
DELIMITER //
CREATE PROCEDURE registrar_pedido(
    IN p_cliente_id INT,
    IN p_produto_id INT,
    IN p_quantidade INT
)
BEGIN
    -- Declaração de variável para armazenar o ID do novo pedido
    DECLARE v_id_pedido INT;

    -- Inserir o cabeçalho do pedido na tabela 'pedidos'
    INSERT INTO pedidos (id_cliente, data_pedido) VALUES (p_cliente_id, CURDATE());
    
    -- Capturar o ID do pedido que acabamos de criar
    SET v_id_pedido = LAST_INSERT_ID();

    -- Inserir o item do pedido na tabela de junção 'pedido_produto'
    INSERT INTO pedido_produto (id_pedido, id_produto, quantidade) VALUES (v_id_pedido, p_produto_id, p_quantidade);

    -- Atualizar o estoque do produto vendido
    UPDATE produtos SET estoque = estoque - p_quantidade WHERE id_produto = p_produto_id;
    
    SELECT 'Pedido registrado com sucesso!' AS resultado;
END //
DELIMITER ;


SELECT nome, estoque FROM produtos WHERE id_produto = 3;

CALL registrar_pedido(1, 3, 5);

SELECT nome, estoque FROM produtos WHERE id_produto = 3;

SELECT * FROM pedidos;
SELECT * FROM pedido_produto;

CREATE INDEX idx_cliente_pedidos ON pedidos(id_cliente);

CREATE INDEX idx_produto_pedidoproduto ON pedido_produto(id_produto);


EXPLAIN SELECT * FROM pedidos WHERE id_cliente = 1;