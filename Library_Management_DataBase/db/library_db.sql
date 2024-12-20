-- Active: 1734301207878@@127.0.0.1@3306@library_db
CREATE DATABASE IF NOT EXISTS library_db
CHARACTER SET utf8 COLLATE utf8_general_ci;

USE library_db;

CREATE TABLE IF NOT EXISTS `books` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci,
    `author` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci,
    `isbn` BIGINT(20) NOT NULL,
    `pub_year` INT(11) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `quantity` INT(11) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO books (title, author, isbn, pub_year, price, quantity)
VALUES 
    ('Brave New World', 'Aldous Huxley', 9780060850524, 1932, 9.25, 9),
    ('The Odyssey', 'Homer', 9780140268867, -800, 5.99, 20);

SELECT * FROM books LIMIT 100;
