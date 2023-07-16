CREATE TABLE IF NOT EXISTS book
(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title   VARCHAR(50),
    author  VARCHAR(30),
    price   DECIMAL(8, 2),
    amount  INT
);

INSERT INTO book (title, author, price, amount)
VALUES ('Мастер и Маргарита', 'Булгаков М.А.', 670.99, 3);

INSERT INTO book (title, author, price, amount)
VALUES ('Белая гвардия', 'Булгаков М.А.', 540.50, 5);

INSERT INTO book (title, author, price, amount)
VALUES ('Идиот', 'Достоевский Ф.М.', 460.00, 10);

INSERT INTO book (title, author, price, amount)
VALUES ('Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 2);


-- IF(условие, true_field, false_field)
SELECT author,
       title,
       ROUND(IF(author = 'Булгаков М.А.', price * 1.1, IF(author = 'Есенин С.А.', price * 1.05, price)), 2) AS new_price
FROM book;

-- WHERE
SELECT author, title, price
FROM book
WHERE amount < 10;

-- BETWEEN
SELECT title, author
FROM book
WHERE (price BETWEEN 540.50 AND 800)
  AND amount IN (2, 3, 5, 7);


-- ORDER BY
SELECT author, title
FROM book
WHERE (amount BETWEEN 2 AND 14)
ORDER BY author DESC, title;


-- LIKE vs "=",<>
SELECT title
FROM book
WHERE title LIKE 'Б%';-- '%' - необязательный символ (может и не быть)

SELECT title
FROM book
WHERE title LIKE '______';

SELECT title
FROM book
WHERE title LIKE '______%';-- '_' - это обязательно стоящий символ

SELECT title
FROM book
WHERE title NOT LIKE '% %';
-- без пробелов символика


-- GROUP BY
SELECT author,
       COUNT(author),
       COUNT(amount),
       COUNT(*)-- в т.ч. и NULL
FROM book
GROUP BY author;

SELECT author, SUM(title) AS Различных_книг, SUM(amount) AS Количество_экземпляров
FROM book
GROUP BY author;

-- необязательно в запросе -name ... FROM user GROUP BY name;
SELECT COUNT(email)
FROM user
GROUP BY name;


-- запросы с б.менее сложн. рассматриваем на примере
SELECT author, COUNT(DISTINCT title) AS Различных_книг, COUNT(amount) AS Количество_экземпляров
FROM book
GROUP BY author;

SELECT author, MIN(price) AS Минимальная_цена, MAX(price) AS Максимальная_цена, AVG(price) AS Средняя_цена
FROM book
GROUP BY author;


-- GROUP BY  ..HAVING
SELECT author,
       MIN(price) AS Минимальная_цена,
       MAX(price) AS Максимальная_цена
FROM book
GROUP BY author
HAVING SUM(price * amount) > 5000
ORDER BY Минимальная_цена DESC;


SELECT author,
       ROUND(AVG(price), 2) AS Средняя_цена,
       ROUND(SUM(price), 2) AS Стоимость
FROM book
WHERE amount BETWEEN 5 AND 14;



CREATE DATABASE stepik_db;
-- -----------------------------------------------------------
CREATE TABLE book
(
    book_id INTEGER AUTO_INCREMENT,
    title   VARCHAR(20),
    author  VARCHAR(10),
    price   DECIMAL(5, 2),
    amount  INTEGER,
    PRIMARY KEY (book_id)
);

ALTER TABLE book
    MODIFY COLUMN title VARCHAR(50),
    MODIFY COLUMN author VARCHAR(30);


INSERT INTO book (title, author, price, amount)
VALUES ('Мастер и Маргарита', 'Булгаков М.А.', 670.99, 3);

INSERT INTO book (title, author, price, amount)
VALUES ('Белая гвардия', 'Булгаков М.А.', 540.50, 5);

INSERT INTO book (title, author, price, amount)
VALUES ('Белая гвардия', 'Булгаков М.А.', 540.50, 5);

INSERT INTO book (title, author, price, amount)
VALUES ('Идиот', 'Достоевский Ф.М.', 460.00, 10);

INSERT INTO book (title, author, price, amount)
VALUES ('Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 3);

INSERT INTO book (title, author, price, amount)
VALUES ('Игрок', 'Достоевский Ф.М.', 480.50, 10);

INSERT INTO book (title, author, price, amount)
VALUES ('Стихотворения и поэмы', 'Есенин С.А.', 650.00, 15);


SELECT ROUND(AVG(price), 2) AS Средняя_цена,
       ROUND(SUM(price), 2) AS Стоимость
FROM book
WHERE amount BETWEEN 5 AND 14;
-- ---------------------------------------------------------


-- WARN! визуально выделяем на таблице группу
SELECT author,
    SUM(price * amount) AS Стоимость
FROM book
WHERE (title <> 'Идиот' AND title <> 'Белая гвардия')
GROUP BY author
HAVING SUM(price * amount) > 5000
ORDER BY Стоимость DESC;


SELECT author,
    MIN(price) AS Минимальная_цена,
    MAX(price) AS Максимальная_цена
FROM book
GROUP BY author
HAVING SUM(amount) > 10 AND author <> 'Есенин С.А.';



-- MySQL:      FROM => WHERE = SELECT = GROUP BY = HAVING = ORDER BY = LIMIT.
-- PostgreSQL: FROM => WHERE = GROUP BY = HAVING = SELECT = DISTINCT = ORDER BY = LIMIT.
SELECT book_id AS Порядковый_номер, author AS Автор, ROUND(AVG(price)) AS Средняя_цена
FROM book
GROUP BY book_id, author
HAVING Порядковый_номер > 2;


;










