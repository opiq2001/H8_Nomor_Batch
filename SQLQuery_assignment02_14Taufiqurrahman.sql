use ecommerce_DB

/*No 1*/ /*Table payment*/
DROP TABLE IF EXISTS payments
-- Membuat tabel payments
CREATE TABLE payments (
    id INT PRIMARY KEY IDENTITY(1, 1),
	buy_price INT,
    quantity INT,
	total_payment INT,
	transaction_date DATE,
	payment_name VARCHAR(50),
	user_id INT NOT NULL,
	product_id INT NOT NULL,
);

insert  into payments(buy_price, quantity, total_payment, transaction_date, payment_name, user_id, product_id) 
values 
	(85600, 2, 171200, '2023-01-15', 'VA Mandiri', 1, 1),
    (275000, 9, 2475000, '2023-02-19', 'Gopay', 2, 2),
    (99000, 10, 990000, '2023-03-10', 'OVO', 3, 3),
    (980000, 4, 3920000, '2023-04-11', 'COD', 4, 4),
    (74900, 1, 74900, '2023-05-12', 'VA Mandiri', 5, 5),
    (75240, 3, 225720, '2023-06-13', 'Gopay', 6, 6),
    (224000, 5, 1120000, '2023-07-14', 'OVO', 7, 7),
    (68500, 3, 205500, '2023-08-15', 'COD', 1, 8),
    (1449000, 7, 10143000, '2023-09-16', 'VA Mandiri', 2, 9),
    (360000, 8, 2880000, '2023-10-17', 'Gopay', 3, 10),
    (69500, 1, 69500, '2023-11-18', 'OVO', 4, 11),
    (10500, 2, 21000, '2023-12-19', 'COD', 5, 12),
    (17000, 4, 68000, '2022-01-20', 'VA Mandiri', 6, 13),
    (48400, 9, 435600, '2022-02-21', 'Gopay', 7, 14),
    (16900, 4, 67600, '2022-03-22', 'OVO', 1, 15),
    (90000, 5, 450000, '2022-04-23', 'COD', 2, 16),
    (980000, 2, 1960000, '2022-05-24', 'VA Mandiri', 1, 4),
    (99000, 1, 99000, '2022-06-25', 'Gopay', 3, 3),
    (275000, 8, 2200000, '2022-07-26', 'OVO', 5, 2),
    (85600, 7, 599200, '2022-08-27', 'COD', 7, 1),
    (224000, 6, 1344000, '2022-09-28', 'VA Mandiri', 2, 7),
    (75240, 4, 300960, '2022-10-29', 'Gopay', 4, 5),
    (74900, 3, 224700, '2022-11-30', 'OVO', 6, 6);
;
SELECT * FROM payments

SELECT AVG(total_payment) as average_total_payment, CONCAT('Q', DATEPART(quarter, transaction_date)) AS Quarter_From_Date, DATEPART(year, transaction_date) AS transaction_year
FROM payments
GROUP BY DATEPART(quarter, transaction_date), DATEPART(year, transaction_date);

/*No 1*/ /*Explore sendiri karena table payment pada soal tidak ada*/
/*Mencari harga tertinggi diantara harga-harga yang dibawah 100.000*/
WITH cte_under_onehundred (id, name, price_under_onehundred) AS(
	SELECT id, name, price as price_under_onehundred
	FROM products
	WHERE price < 100000
)
SELECT * FROM cte_under_onehundred
WHERE
price_under_onehundred = (SELECT MAX(cte_under_onehundred.price_under_onehundred)FROM cte_under_onehundred)


/*No 2*/

/*SUBQUERY*/
SELECT birth_date FROM Users
ORDER BY birth_date
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

/*MAIN QUERY*/
SELECT id, first_name, last_name, phone_number, email, city_id, address, birth_date
FROM Users
WHERE birth_date IN
(SELECT birth_date FROM Users
ORDER BY birth_date
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY);

/*No 3*/

/*SUBQUERY*/
SELECT MIN(price) FROM products

/*MAIN QUERY*/
SELECT id, name, price, stocks
FROM products
WHERE price = ALL (SELECT MIN(price) FROM products);

/*No 4*/
SELECT Users.id as user_id, Users.first_name, Users.last_name, payments.product_id, products.name, payments.buy_price, payments.quantity, payments.total_payment, payments.transaction_date, payments.payment_name
FROM Users LEFT JOIN payments
ON Users.id = payments.user_id
LEFT JOIN products
ON payments.product_id = products.id
ORDER BY payments.id


/*No 4*/ /*Explore sendiri karena table payment pada soal tidak ada*/
DROP TABLE IF EXISTS #user_city;
CREATE TABLE #user_city(
	users_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	city_name VARCHAR(50)
)

INSERT INTO #user_city
	SELECT Users.id, Users.first_name, Users.last_name, Cities.name
	FROM Users LEFT JOIN Cities
	ON Users.id = Cities.id;

SELECT * FROM #user_city

