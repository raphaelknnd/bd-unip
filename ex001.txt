CREATE DATABASE livraria;
USE livraria;

CREATE TABLE clientes(cpf VARCHAR(11) NOT NULL PRIMARY KEY, nome VARCHAR(30) NOT NULL, idade INT NOT NULL);

ALTER TABLE clientes ADD telefone VARCHAR(11) NOT NULL;

ALTER TABLE clientes DROP COLUMN telefone;

ALTER TABLE clientes CHANGE nome cliente VARCHAR (30) NOT NULL;

ALTER TABLE clientes MODIFY COLUMN idade TINYINT NOT NULL;

ALTER TABLE clientes RENAME usuarios;

/*Alunos: 
- Raphael Kênnedy PI22100069
- Vitor Marcelo PI22100685
*/