-- CREATE DATABASE party7;
USE party7;

-- INSTALL PLUGIN validate_password SONAME 'validate_password.dll';
-- UNINSTALL PLUGIN validate_password;
-- INSTALL COMPONENT 'file://component_validate_password';
-- SELECT * FROM mysql.component;
-- SHOW VARIABLES LIKE 'validate_password%';

/*CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS relatorios (
    id_relatorio INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    conteudo TEXT
);

CREATE USER 'usuario_local'@'localhost' IDENTIFIED BY 'Senha$F0rte!2024';
CREATE USER 'usuario_remoto'@'%' IDENTIFIED BY 'SenhaRemota#2024';

ALTER USER 'usuario_local'@'localhost' IDENTIFIED BY 'NovaSenha$2024!';

DROP USER 'usuario_remoto'@'%';*/

/*GRANT SELECT ON party7.clientes TO 'usuario_local'@'localhost';

CREATE DATABASE IF NOT EXISTS loja;
CREATE USER 'admin_user'@'%' IDENTIFIED BY 'Admin123!';
GRANT ALL PRIVILEGES ON loja.* TO 'admin_user'@'%';

REVOKE SELECT ON party7.clientes FROM 'usuario_local'@'localhost';

CREATE USER 'usuario_servidor'@'localhost' IDENTIFIED BY 'Servidor@123';
GRANT SELECT ON party7.clientes TO 'usuario_servidor'@'localhost';

CREATE USER 'relatorio_user'@'localhost' IDENTIFIED BY 'Relatorio@123';
GRANT SELECT ON party7.relatorios TO 'relatorio_user'@'localhost';

SELECT user, host FROM mysql.user;

SHOW GRANTS FOR 'usuario_local'@'localhost';
SHOW GRANTS FOR 'admin_user'@'%';
SHOW GRANTS FOR 'relatorio_user'@'localhost';

SHOW VARIABLES LIKE 'validate_password%';*/


SET GLOBAL validate_password.policy = 'STRONG';

ALTER USER 'usuario_local'@'localhost' IDENTIFIED BY 'Senha$F0rte!2024';

CREATE USER 'leitura_prod'@'%' IDENTIFIED BY 'Leitura#2024';
GRANT SELECT ON party7.* TO 'leitura_prod'@'%';

CREATE USER 'escrita_prod'@'%' IDENTIFIED BY 'Escrita#2024';
GRANT INSERT, UPDATE, DELETE ON party7.* TO 'escrita_prod'@'%';
