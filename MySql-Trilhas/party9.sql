 CREATE DATABASE IF NOT EXISTS loja_unisenai;

 USE loja_unisenai;



CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO clientes (nome, email) VALUES
('Ana Silva', 'ana.silva@email.com'),
('Bruno Costa', 'bruno.costa@email.com'),
('Carla Dias', 'carla.dias@email.com');

INSERT INTO produtos (nome, preco) VALUES
('Notebook Gamer', 4550.75),
('Mouse Vertical', 150.40),
('Teclado Mecânico', 399.99),
('Monitor Ultrawide', 1850.995);

INSERT INTO pedidos (id_cliente, data_pedido, valor_total) VALUES
(1, '2025-07-01', 4701.15),
(2, '2025-07-05', 399.99),
(1, CURDATE(), 1850.99);

SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM pedidos;

SELECT 
    nome,
    CONCAT('CLIENTE-ID-', id_cliente, '-', UPPER(SUBSTRING(nome, 1, 3))) AS identificador_unico
FROM 
    clientes;

SELECT 
    nome, 
    SUBSTRING(nome, 1, 3) AS tres_primeiros_caracteres
FROM 
    produtos;

SELECT 
    nome,
    UPPER(nome) AS nome_maiusculo
FROM 
    clientes;
    
SELECT 
    NOW() AS data_hora_sistema,
    DATE_FORMAT(NOW(), '%d/%m/%Y %H:%i:%s') AS data_hora_formatada;
    
SELECT 
    id_pedido, 
    data_pedido,
    DATEDIFF(CURDATE(), data_pedido) AS dias_desde_o_pedido
FROM 
    pedidos;
    
    
SELECT 
    nome,
    preco AS preco_original,
    ROUND(preco, 2) AS preco_arredondado
FROM 
    produtos;
    
SELECT 
    valor_total,
    FLOOR(valor_total) AS valor_arredondado_baixo,
    CEIL(valor_total) AS valor_arredondado_cima
FROM 
    pedidos;
    
    
DELIMITER //

CREATE PROCEDURE inserir_novo_pedido(
    IN p_id_cliente INT, 
    IN p_valor_total DECIMAL(10, 2)
)
BEGIN
    INSERT INTO pedidos(id_cliente, data_pedido, valor_total)
    VALUES (p_id_cliente, CURDATE(), p_valor_total);
    
    -- Mensagem de confirmação
    SELECT 'Novo pedido inserido com sucesso!' AS resultado;
END //

DELIMITER ;

CALL inserir_novo_pedido(3, 550.80);

SELECT * FROM pedidos;

DELIMITER //

CREATE FUNCTION calcular_valor_com_desconto(
    p_valor DECIMAL(10,2), 
    p_percentual_desconto DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE valor_final DECIMAL(10,2);
    SET valor_final = p_valor * (1 - p_percentual_desconto / 100);
    RETURN valor_final;
END //

DELIMITER ;

SELECT 
    id_pedido,
    valor_total AS valor_original,
    ROUND(calcular_valor_com_desconto(valor_total, 10.0), 2) AS valor_com_10_porcento_desconto
FROM
    pedidos;