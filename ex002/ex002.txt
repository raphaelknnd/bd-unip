create table if not exists livros(codigo BIGINT NOT NULL AUTO_INCREMENT primary key, titulo VARCHAR(15) NOT NULL, editora VARCHAR(15) NOT NULL, edicao VARCHAR(5));

ALTER TABLE usuarios ADD id_livro BIGINT;

ALTER TABLE usuarios ADD CONSTRAINT fk_livros foreign key(id_livro) references livros (codigo);

ALTER TABLE usuarios DROP COLUMN id_livro;

ALTER TABLE usuarios DROP FOREIGN KEY fk_livros;

/*Inserção dos usuários*/

INSERT INTO usuarios (cpf, cliente, idade) VALUES ("09876543211", "jose", 15);

INSERT INTO usuarios (cpf, cliente, idade) VALUES ("00998877665", "maria", 19);

INSERT INTO usuarios (cpf, cliente, idade) VALUES ("10022993388", "joao", 15);

INSERT INTO usuarios (cpf, cliente, idade) VALUES ("01928374650", "joel", 15);

INSERT INTO usuarios (cpf, cliente, idade) VALUES ("11226677889", "pedro", 15);

INSERT INTO usuarios (cpf, cliente, idade) VALUES ("09876510000", "cassio", 15);

INSERT INTO usuarios (cpf, cliente, idade) VALUES ("09987651221", "elma", 15);

INSERT INTO usuarios (cpf, cliente, idade) VALUES ("12347865999", "marta", 15);

INSERT INTO usuarios (cpf, cliente, idade) VALUES ("09900987878", "clara", 15);

INSERT INTO usuarios (cpf, cliente, idade) VALUES ("22334455667", "messias", 15);

/*Inserção dos livros*/
INSERT INTO livros (titulo, editora, edicao) VALUES ("calculo 1", "libraritas", "4a ed");

INSERT INTO livros (titulo, editora, edicao) VALUES ("calculo 2", "libraritas", "1a ed");

INSERT INTO livros (titulo, editora) VALUES ("calculo 3", "libraritas");

INSERT INTO livros (titulo, editora, edicao) VALUES ("Java", "libraritas", "4a ed");

INSERT INTO livros (titulo, editora) VALUES ("Linguagem C", "libraritas");

INSERT INTO livros (titulo, editora, edicao) VALUES ("Python", "libraritas", "2a ed");

INSERT INTO livros (titulo, editora) VALUES ("Ruby", "libraritas");

INSERT INTO livros (titulo, editora, edicao) VALUES ("Logica 1", "libraritas", "7a ed");

INSERT INTO livros (titulo, editora, edicao) VALUES ("Banco de dados", "libraritas", "5a ed");

INSERT INTO livros (titulo, editora) VALUES ("BD 2", "libraritas");

/*Inserindo valores na chave extrangeira*/
UPDATE usuarios SET id_livro = 1 WHERE cliente = "messias"; 

UPDATE usuarios SET id_livro = 2 WHERE cliente = "maria"; 

UPDATE usuarios SET id_livro = 5 WHERE cliente = "joao"; 

UPDATE usuarios SET id_livro = 7 WHERE cliente = "joel"; 

UPDATE usuarios SET id_livro = 9 WHERE cliente = "clara"; 

/*Alterando valores em usuarios*/
UPDATE usuarios SET idade = 22 WHERE cliente = "messias";
UPDATE usuarios SET idade = 25 WHERE cliente = "joel";
UPDATE usuarios SET idade = 29 WHERE cliente = "joao";
UPDATE usuarios SET idade = 44 WHERE cliente = "elma";

/*Alterando valores em livros*/
UPDATE livros SET editora = "brasa" WHERE titulo = "Java";
UPDATE livros SET editora = "liberta" WHERE titulo = "Python";
UPDATE livros SET editora = "champios" WHERE titulo = "Ruby";
UPDATE livros SET editora = "fifa" WHERE titulo = "Banco de Dados";

/*Excluindo valores de usuarios*/
DELETE FROM usuarios WHERE cliente = "marta";
DELETE FROM usuarios WHERE cliente = "cassio";
DELETE FROM usuarios WHERE cliente = "jose";
DELETE FROM usuarios WHERE cliente = "elma";

/*Excluindo valores de livros*/
DELETE FROM livros WHERE codigo = 8;
DELETE FROM livros WHERE codigo = 3;
DELETE FROM livros WHERE codigo = 4;
DELETE FROM livros WHERE codigo = 6;

/*Bônus*/
DELETE FROM livros WHERE codigo = 1;
/*ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`livraria`.`usuarios`, CONSTRAINT `fk_livros` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`codigo`))*/