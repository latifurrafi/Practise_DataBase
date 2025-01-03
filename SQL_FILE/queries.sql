
SELECT * FROM `AUTHORS`;

SELECT * FROM `BOOKS`;

-- ALL BOOKS WITHS THERE AUTHOS USING JOIN

SELECT
    BOOKS.BOOK_ID,
    BOOKS.TITLE,
    BOOKS.PRICE,
    BOOKS.STOCK_QUANTITY,
    AUTHORS.NAME AS AUTHOR_NAME,
    AUTHORS.EMAIL AS AUTHOR_EMAIL

    FROM 
    BOOKS 
    LEFT JOIN
    AUTHORS ON BOOKS.AUTHOR_ID = AUTHORS.AUTHOR_ID;


-- NEED INFORMATION ON CUSTOMER
SELECT
    CUSTOMER_ID,
    NAME,
    EMAIL,
    PHONE
    FROM
    CUSTOMERS
-- WHERE
--     CUSTOMER_ID =1;



-- CHECKING TOTAL AMOUNT OF ORDERS
SELECT 
    SUM(TOTAL_AMOUNT) AS TOTAL_SALES
    FROM
    ORDERS;

-- TOP SELLING BOOKS

SELECT
    BOOKS.TITLE,
    SUM(ORDER_DETAILS.QUANTITY) AS TOTAL_SOLD
    FROM
    ORDER_DETAILS
    JOIN
    BOOKS ON ORDER_DETAILS.BOOK_ID = BOOKS.BOOK_ID
    GROUP BY
    BOOKS.TITLE
    ORDER BY
    TOTAL_SOLD DESC
    LIMIT 1;


