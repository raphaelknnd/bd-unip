/*questão 1*/
CREATE DATABASE ex004;

CREATE TABLE livros(isbn VARCHAR(17) PRIMARY KEY NOT NULL, titulo VARCHAR(50), disponivel BIT NOT NULL);

INSERT INTO livros VALUES("349-65-79116-74-8", "Python 3", 1), ("937-89-42357-54-8", "Java O.O.", 1), ("018-32-73858-38-4", "Markdown Documentation", 1);

CREATE VIEW livros_disponiveis AS SELECT isbn, titulo FROM livros WHERE disponivel = 1;

SELECT * FROM livros_disponiveis;

/*questão 2*/
CREATE TABLE pedidos(id INT PRIMARY KEY NOT NULL, data DATE NOT NULL, total INT NOT NULL);

INSERT INTO pedidos VALUES(1, "2001-05-07", 10), (2, "2001-05-10", 9), (3, "2001-05-15", 1), (4, "2001-06-10", 10), (5, "2001-10-15", 10), (6, "2001-02-07", 29);

CREATE VIEW relatorio_mensal AS SELECT MONTHNAME(data) AS Mês, SUM(total) AS Total FROM pedidos GROUP BY MONTHNAME(data) ORDER BY Mês; 

SELECT * FROM relatorio_mensal;

/*questão 3*/
CREATE TABLE projetos(nome VARCHAR(50) NOT NULL, data_entrega DATE NOT NULL, id INT PRIMARY KEY NOT NULL);

INSERT INTO projetos VALUES("Ponte metálica", "2001-05-10", 1), ("Ponte nova", "2023-12-25", 2), ("Casa do Vitor", "2002-02-24", 3);

CREATE VIEW projetos_atrasados AS SELECT id AS ID_Projeto, nome AS Projeto FROM projetos WHERE data_entrega < CURDATE(); 

SELECT * FROM projetos_atrasados; 