CREATE DATABASE ex007;
USE ex007;

CREATE TABLE livros(id INT PRIMARY KEY NOT NULL, titulo VARCHAR(50) NOT NULL, autor VARCHAR(50) NOT NULL);

INSERT INTO livros VALUES (1, "Python 3", "Pedro Peter"), (2, "Java 8", "Arnold Shwazeneger"), (3, "Aulas, apenas!", "Max Steel");

CREATE VIEW VisaoLivrosAutor AS SELECT titulo, autor FROM livros;

ALTER TABLE livros ADD COLUMN anoPublicacao INT NOT NULL;

CREATE TABLE emprestimos(id INT PRIMARY KEY NOT NULL, livro_id INT NOT NULL, dataEmprestimo DATE NOT NULL);

ALTER TABLE emprestimos ADD CONSTRAINT fk_livro foreign key(livro_id) references livros (id);

INSERT INTO emprestimos VALUES (1, 1, "2023-05-23"), (2, 2, "2023-06-10"), (3, 3, "2023-07-15");

UPDATE emprestimos SET dataEmprestimo = "2023-11-05" WHERE id = 1;

DELIMITER //
CREATE FUNCTION calculaMulta(dias INT)
RETURNS DECIMAL DETERMINISTIC

BEGIN
	DECLARE multa DECIMAL;
	SET multa = (dias * 1.50);
	RETURN multa;
END;
// DELIMITER;

DROP TABLE emprestimos;

BEGIN
SAVEPOINT desfaz_exclui_livro;
DELETE FROM livros WHERE id = 1;
ROLLBACK TO desfaz_exclui_livro;
COMMIT;

