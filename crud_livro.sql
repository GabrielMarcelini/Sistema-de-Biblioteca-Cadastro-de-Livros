DROP DATABASE IF EXISTS crud_manager;

CREATE DATABASE IF NOT EXISTS crud_manager;

USE crud_manager;

CREATE TABLE IF NOT EXISTS users(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    sexo ENUM('M', 'F'),
    email VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS posts(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    post_date DATE NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) 
    REFERENCES users(id)
);


CREATE TABLE IF NOT EXISTS companies (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(128) NOT NULL,
`role` VARCHAR(128) NOT NULL,
`start` DATE NOT NULL,
`end` DATE,
user_id INT NOT NULL,
FOREIGN KEY(user_id)
REFERENCES users(id)
);

CREATE TABLE Livro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    editora VARCHAR(255) NOT NULL,
    ano_publicacao INT NOT NULL,
    quantidade VARCHAR(255) NOT NULL,
    companies_id INT,
    FOREIGN KEY (companies_id) REFERENCES companies(id)
);

ALTER TABLE users ADD COLUMN password VARCHAR(255) NOT NULL DEFAULT '';

INSERT INTO users VALUES
(DEFAULT, "Emerson Carvalho", "M", "emerson@mail.com"),
(DEFAULT, "Luiza Carvalho", "F", "lu@mail.com"),
(DEFAULT, "Elenice Carvalho", "F", "le@mail.com"),
(DEFAULT, "Noé Carvalho", "M", "noe@mail.com"),
(DEFAULT, "Rosânia Carvalho", "F", "ro@mail.com");

INSERT INTO posts VALUES
(DEFAULT, "Olá do Emerson", CURDATE(), 1),
(DEFAULT, "Olá da Luiza", CURDATE(), 2),
(DEFAULT, "Olá da Denise", CURDATE(), 3),
(DEFAULT, "Olá do Noé", CURDATE(), 4),
(DEFAULT, "Olá da Rosânia", CURDATE(), 5),
(DEFAULT, "Olá da Rosânia 1", CURDATE(), 5),
(DEFAULT, "Olá da Rosânia 2", CURDATE(), 5),
(DEFAULT, "Olá da Rosânia 3", CURDATE(), 5);

INSERT INTO companies (name, role, start, end, user_id) VALUES
("Biblioteca Municipal de São Paulo", "Bibliotecário Chefe", '2020-01-15', NULL, 1),
("Biblioteca Comunitária Saber Mais", "Voluntária de Catalogação", '2021-03-10', NULL, 2),
("Biblioteca Central da Universidade", "Assistente de Arquivo", '2019-08-01', '2023-12-31', 3),
("Biblioteca Itinerante Leitura Viva", "Responsável por Logística", '2022-05-20', NULL, 4),
("Biblioteca Pública Infantil", "Contadora de Histórias", '2020-07-01', NULL, 5);

select * from users;