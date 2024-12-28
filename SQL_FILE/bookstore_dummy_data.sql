
-- INSERT DUMMY DATA INTO AUTHORS TABLE
INSERT INTO AUTHORS (NAME, EMAIL) VALUES
('J.K. Rowling', 'jkrowling@example.com'),
('George R.R. Martin', 'grrm@example.com'),
('J.R.R. Tolkien', 'tolkien@example.com'),
('Agatha Christie', 'achristie@example.com');

-- INSERT DUMMY DATA INTO BOOKS TABLE
INSERT INTO BOOKS (TITLE, PRICE, STOCK_QUANTITY, AUTHOR_ID) VALUES
('Harry Potter and the Philosopher\s Stone', 19.99, 50, 1),
('A Game of Thrones', 24.99, 30, 2),
('The Hobbit', 14.99, 40, 3),
('Murder on the Orient Express', 12.99, 20, 4);

-- INSERT DUMMY DATA INTO CUSTOMERS TABLE
INSERT INTO CUSTOMERS (NAME, EMAIL, PHONE) VALUES
('Alice Johnson', 'alice.johnson@example.com', '1234567890'),
('Bob Smith', 'bob.smith@example.com', '9876543210'),
('Charlie Brown', 'charlie.brown@example.com', '5554443333'),
('Diana Prince', 'diana.prince@example.com', '6667778888');

-- INSERT DUMMY DATA INTO ORDERS TABLE
INSERT INTO ORDERS (CUSTOMER_ID, ORDER_DATE, TOTAL_AMOUNT) VALUES
(1, '2024-12-01 10:30:00', 120.50),
(2, '2024-12-05 15:45:00', 80.00),
(3, '2024-12-10 09:15:00', 150.75),
(4, '2024-12-15 18:30:00', 200.00),
(1, '2024-12-20 14:00:00', 50.00);

-- INSERT DUMMY DATA INTO ORDER_DETAILS TABLE
INSERT INTO ORDER_DETAILS (ORDER_ID, BOOK_ID, QUANTITY, LINE_TOTAL) VALUES
(1, 1, 2, 39.98), -- 2 copies of "Harry Potter and the Philosopher's Stone"
(1, 3, 1, 14.99), -- 1 copy of "The Hobbit"
(2, 2, 1, 24.99), -- 1 copy of "A Game of Thrones"
(3, 1, 1, 19.99), -- 1 copy of "Harry Potter and the Philosopher's Stone"
(4, 4, 1, 12.99); -- 1 copy of "Murder on the Orient Express"
