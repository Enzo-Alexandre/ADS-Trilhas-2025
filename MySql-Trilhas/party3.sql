-- CREATE DATABASE party3;
USE party3;

select * from funcionarios;

/*CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cargo VARCHAR(100)
);*/
/*INSERT INTO funcionarios (id_funcionario, nome, email, cargo) VALUES
(1, 'Ana Silva', 'ana.silva@email.com', 'Desenvolvedora'),
(2, 'Bruno Costa', 'bruno.costa@email.com', 'Analista'),
(3, 'Carla Lima', 'carla.lima@email.com', 'Gerente');
*/

/*INSERT INTO funcionarios (id_funcionario, nome, email, cargo) VALUES
(4, 'Daniel Martins', 'daniel.martins@email.com', 'Analista'),
(5, 'Eduarda Souza', 'eduarda.souza@email.com', 'Desenvolvedora'),
(6, 'Fábio Pereira', 'fabio.pereira@email.com', 'Designer'),
(7, 'Gabriela Santos', 'gabriela.santos@email.com', 'Analista'),
(8, 'João Oliveira', 'joao.oliveira@email.com', 'Estagiário');*/

/*ALTER TABLE funcionarios
ADD COLUMN cidade VARCHAR(100) DEFAULT 'Não Informado';

INSERT INTO funcionarios (id_funcionario, nome, email, cargo) VALUES
(9, 'Heloísa Alves', 'heloisa.alves@email.com', 'Recrutadora');*/

-- SELECT * FROM funcionarios WHERE cargo = 'Analista';	
-- SELECT * FROM funcionarios ORDER BY nome ASC;
-- Exibe apenas os três primeiros registros da tabela
-- SELECT * FROM funcionarios LIMIT 3;
-- SELECT DISTINCT cidade FROM funcionarios;
/*SELECT cargo, COUNT(*) AS total_por_cargo
FROM funcionarios
GROUP BY cargo;*/

-- UPDATE funcionarios SET cargo = 'Coordenador' WHERE id_funcionario = 8;
DELETE FROM funcionarios WHERE id_funcionario IN (2);