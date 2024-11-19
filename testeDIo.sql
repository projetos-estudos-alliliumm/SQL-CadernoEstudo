CREATE database TESTE;
--
USE TESTE;
--
create table usuarios (
	id_primaria INT,
    PRIMARY KEY (`id`),
    nome VARCHAR(255) NOT NULL COMMENT 'Nome do Usuário',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'E-mail do Usuário',
    endereco VARCHAR(255) NOT NULL COMMENT 'Endereço do Usuário',
    data_nascimento DATE NOT NULL COMMENT 'Data de Nascimento'
);

CREATE TABLE `usuariosname2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chave_secundaria` int,
  `nome` varchar(255) NOT NULL COMMENT 'Nome do Usuário',
  `email` varchar(100) NOT NULL COMMENT 'E-mail do Usuário',
  `endereco` varchar(255) NOT NULL COMMENT 'Endereço do Usuário',
  `data_nascimento` date NOT NULL COMMENT 'Data de Nascimento',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `fk_usuariosname_usuarios` FOREIGN KEY (`chave_secundaria`) REFERENCES `usuarios` (`id_primaria`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
INSERT INTO usuarios
(
	id_primaria,
    nome,
    email,
    endereco,
    data_nascimento
)
values
(
	1,
    'Alessandra Teles',
    'alessandra91@gmail.com',
    'Rua Brasil, 274, Morro Aleixo',
    '2002-03-24'
);
--
SELECT * FROM USUARIOS;
select * from usuariosname;
select nome from usuarios where nome = "Alessandra Teles";
--
SET SQL_SAFE_UPDATES=0;
--
UPDATE 
	usuarios SET
    id_primaria = 2
    WHERE
		nome = "Alessandra Teles";
--        
DELETE FROM usuarios
	where id_primaria=2;
--    
ALTER TABLE usuarios RENAME usuariosname;
--
DROP TABLE usuarios;
DROP TABLE usuariosname;
--
ALTER TABLE usuarios
modify column id INT auto_increment,
add PRIMARY KEY (id_primaria);

ALTER TABLE usuariosname
add constraint fk_usuariosname_usuarios
Foreign key (chave_secundaria) references usuarios (id_primaria)
on delete cascade;

ALTER TABLE usuariosname
drop constraint fk_usuariosname_usuarios;
--
-- ON DELETE -> O QUE ACONTECE COM OS FILHOS QUANDO O PAI É DELETADO
-- ON UPDATE -> O QUE ACONTECE COM OS FILHOS QUANDO O PAI É ATUALIZADO
-- CASCADE, SET NULL, SET DEFAULT, RESTRICT
--

