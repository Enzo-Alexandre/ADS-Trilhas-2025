USE loja_unisenai;

/*ALTER TABLE produtos ADD COLUMN estoque INT NOT NULL DEFAULT 0;

UPDATE produtos SET estoque = 50 WHERE id_produto = 1; -- Notebook Gamer
UPDATE produtos SET estoque = 120 WHERE id_produto = 2; -- Mouse Vertical
UPDATE produtos SET estoque = 80 WHERE id_produto = 3; -- Teclado Mecânico
UPDATE produtos SET estoque = 30 WHERE id_produto = 4; -- Monitor Ultrawide

CREATE TABLE pedido_produto (
    id_pedido_produto INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE log_acoes (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    acao VARCHAR(255),
    data_hora DATETIME
);

CREATE TABLE relatorios (
    id_relatorio INT PRIMARY KEY AUTO_INCREMENT,
    descricao TEXT,
    data_geracao DATETIME
);

SELECT id_produto, nome, estoque FROM produtos;
SELECT * FROM log_acoes;
SELECT * FROM relatorios;

DELIMITER //

CREATE TRIGGER valida_estoque_antes_de_inserir
BEFORE INSERT ON pedido_produto
FOR EACH ROW
BEGIN
    DECLARE estoque_disponivel INT;

    SELECT estoque INTO estoque_disponivel FROM produtos WHERE id_produto = NEW.id_produto;

    IF estoque_disponivel < NEW.quantidade THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: Estoque insuficiente para o produto solicitado.';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER atualiza_estoque_apos_inserir
AFTER INSERT ON pedido_produto
FOR EACH ROW
BEGIN
    UPDATE produtos 
    SET estoque = estoque - NEW.quantidade 
    WHERE id_produto = NEW.id_produto;
END //

DELIMITER ;

SELECT nome, estoque FROM produtos WHERE id_produto = 3;

INSERT INTO pedido_produto(id_pedido, id_produto, quantidade) VALUES (1, 3, 10);

SELECT nome, estoque FROM produtos WHERE id_produto = 3;

DELIMITER //

CREATE TRIGGER log_cliente_excluido
AFTER DELETE ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO log_acoes(acao, data_hora) 
    VALUES (CONCAT('Cliente excluido. ID: ', OLD.id_cliente, ', Nome: ', OLD.nome), NOW());
END //

DELIMITER ;

SELECT * FROM clientes;
SELECT * FROM log_acoes;


DELETE FROM pedidos WHERE id_cliente = 3;


DELETE FROM clientes WHERE id_cliente = 3;

SELECT * FROM clientes;
SELECT * FROM log_acoes;

DROP TRIGGER IF EXISTS log_cliente_excluido;

CREATE EVENT limpa_logs_antigos
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(CURDATE(), '23:59:00')
DO
    DELETE FROM log_acoes WHERE data_hora < NOW() - INTERVAL 60 DAY;
    
CREATE EVENT gera_relatorio_mensal
ON SCHEDULE EVERY 1 MONTH
STARTS '2025-08-01 00:00:00'
DO
    INSERT INTO relatorios(descricao, data_geracao)
    VALUES ('Relatorio mensal de vendas gerado automaticamente.', NOW());
    
SET GLOBAL event_scheduler = ON;

SHOW VARIABLES LIKE 'event_scheduler';

DROP TRIGGER IF EXISTS valida_estoque_antes_de_inserir;

DELIMITER //
CREATE TRIGGER valida_estoque_antes_de_inserir
BEFORE INSERT ON pedido_produto
FOR EACH ROW
BEGIN
    DECLARE estoque_disponivel INT;
    
    IF NEW.quantidade <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: A quantidade do pedido deve ser maior que zero.';
    END IF;

    SELECT estoque INTO estoque_disponivel FROM produtos WHERE id_produto = NEW.id_produto;

    IF estoque_disponivel < NEW.quantidade THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: Estoque insuficiente para o produto solicitado.';
    END IF;
END //
DELIMITER ;*/


-- SELECT nome, estoque FROM produtos WHERE id_produto = 4;

-- DROP PROCEDURE IF EXISTS gerar_carga_teste;


/*DELIMITER //
CREATE PROCEDURE gerar_carga_teste(IN numero_de_insercoes INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < numero_de_insercoes DO
        INSERT INTO pedido_produto(id_pedido, id_produto, quantidade) VALUES (2, 4, 1);
        SET i = i + 1;
    END WHILE;
    SELECT CONCAT(numero_de_insercoes, ' registros inseridos.') AS resultado;
END //
DELIMITER ;
*/
/*DROP PROCEDURE IF EXISTS gerar_carga_teste;
DROP PROCEDURE IF EXISTS gerar_carga_teste_otimizado;

DELIMITER //
CREATE PROCEDURE gerar_carga_teste_otimizado(IN numero_de_insercoes INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    -- Prepara o início do comando SQL
    SET @sql_text = 'INSERT INTO pedido_produto(id_pedido, id_produto, quantidade) VALUES ';

    -- Este laço constrói a string do comando
    WHILE i < numero_de_insercoes DO
        -- Adiciona os valores de cada linha
        SET @sql_text = CONCAT(@sql_text, '(2, 4, 1),');
        SET i = i + 1;
    END WHILE;

    -- Remove a última vírgula da string e adiciona o ponto e vírgula final
    SET @sql_text = TRIM(TRAILING ',' FROM @sql_text);
    SET @sql_text = CONCAT(@sql_text, ';');
    
    -- Prepara e executa o comando SQL que foi construído dinamicamente
    PREPARE stmt FROM @sql_text;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    SELECT CONCAT(numero_de_insercoes, ' registros inseridos de forma otimizada.') AS resultado;
END //
DELIMITER ;*/

-- UPDATE produtos SET estoque = 20000 WHERE id_produto = 4;

-- CALL gerar_carga_teste_otimizado(20000);

-- SELECT nome, estoque FROM produtos WHERE id_produto = 4;

