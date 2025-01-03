-- Active: 1734301207878@@127.0.0.1@3306@BOOKSTORE


CREATE DATABASE BOOKSTORE;

USE BOOKSTORE;


-- FOR AUTHOS TABLE
CREATE TABLE AUTHOS (
    AUTHOR_ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) UNIQUE NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- CHANGING TABLE NAME
ALTER TABLE AUTHOS RENAME TO AUTHORS;


-- FOR BOOKS TABLE
CREATE TABLE BOOKS (
    BOOK_ID INT AUTO_INCREMENT PRIMARY KEY,
    TITLE VARCHAR(255) NOT NULL,
    PRICE DECIMAL(10, 2) NOT NULL,
    STOCK_QUANTITY INT DEFAULT 0,
    AUTHOR_ID INT,
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- FOR CUSTOMER TABLE
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(100) UNIQUE NOT NULL,
    PHONE VARCHAR(15) UNIQUE NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- FOR ORDERS TABLE
CREATE TABLE ORDERS (
    ORDER_ID INT AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_ID INT NOT NULL,
    ORDER_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
    TOTAL_AMOUNT DECIMAL(10, 2) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX (CUSTOMER_ID)
);

-- FOR ORDER_DETAILS TABLE
CREATE TABLE ORDER_DETAILS (
    ORDER_DETAILS_ID INT AUTO_INCREMENT PRIMARY KEY,
    ORDER_ID INT,
    BOOK_ID INT,
    QUANTITY INT NOT NULL CHECK(QUANTITY>0),
    LINE_TOTAL DECIMAL(10, 2),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID) ON DELETE CASCADE,
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID) ON DELETE RESTRICT
);



