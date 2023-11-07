CREATE DATABASE estoque;

USE estoque;

CREATE TABLE produtos(id_produto INT PRIMARY KEY NOT NULL, descricao VARCHAR(30) NOT NULL, preco DOUBLE NOT NULL, quantidade INT NOT NULL);

BEGIN;
INSERT INTO produtos VALUES (1, "coquinha 600mL", 6.50, 10), (2, "biscoito", 2.50, 15);
COMMIT;

BEGIN;
INSERT INTO produtos VALUES (3, "ÁGUA 500mL", 1.75, 35);
UPDATE produtos SET preco = (produtos.preco * 0.10) + produtos.preco;
COMMIT;

BEGIN;
SAVEPOINT desfaz_reduz_5;
UPDATE produtos SET quantidade = produtos.quantidade - 5;
ROLLBACK TO desfaz_reduz_5;
COMMIT;

BEGIN;
DELETE FROM produtos WHERE id_produto = 1;
SAVEPOINT desfaz_insert;
INSERT INTO peodutos VALUES (4, "fanta uva 600mL", 6.00, 22);
ROLLBACK TO desfaz_insert;
COMMIT;
