CREATE DATABASE loja;

USE loja

CREATE TABLE produtos(id_produto INT NOT NULL PRIMARY KEY, descricao VARCHAR(20) NOT NULL, preco DECIMAL(10, 2) NOT NULL);

CREATE TABLE pedidos(id_pedido INT NOT NULL PRIMARY KEY, quantidade INT NOT NULL, valor_total DECIMAL(10, 2) NOT NULL, id_produto INT NOT NULL);

/*ALTER TABLE pedidos ADD CONSTRAINT fk_idprod foreign key(id_produto) references produtos (id_produto);*/

/*Criando uma funcao*/
DELIMITER //
CREATE FUNCTION ajusta_preco(a DECIMAL(10, 2), b DECIMAL(10, 2))
RETURNS DECIMAL DETERMINISTIC

BEGIN
	DECLARE novo_preco DECIMAL;
	SET novo_preco = ((a / 100) * b) + b;
	RETURN novo_preco;
END;
// DELIMITER;

/*Criando procedure*/
DELIMITER //
CREATE PROCEDURE ajusta_preco_10()

BEGIN
	UPDATE produtos SET preco = ajusta_preco(10, produtos.preco);
END;
// DELIMITER;

/*Criando trigger*/
CREATE TABLE log_ateracao(id_produto INT NOT NULL, data DATE NOT NULL);

CREATE TRIGGER registraAlteracaoPreco AFTER UPDATE ON produtos FOR EACH ROW
BEGIN
	INSERT INTO log_alteracao VALUES (NEW.id_produto, NOW());
END;

/*povoando tabelas*/
INSERT INTO produtos VALUES (1, "coca", 5.50), (2, "biscoito", 2.00);

INSERT INTO pedidos VALUES (1, 10, 55.00, 1), (2, 2, 4.00, 2);

/*Testando procedure*/
CALL ajusta_preco_10();

SELECT * FROM log_alteracao;