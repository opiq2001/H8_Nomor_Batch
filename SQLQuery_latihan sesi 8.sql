USE ecommerce_DB
CREATE LOGIN  credit_analyst
WITH PASSWORD='qwertyuiop';

CREATE USER alex_credit_analyst
FOR LOGIN credit_analyst;

GRANT SELECT TO alex_credit_analyst;
GRANT UPDATE ON dbo.Users TO alex_credit_analyst;
GRANT UPDATE ON dbo.products TO alex_credit_analyst;
GRANT UPDATE ON dbo.payments TO alex_credit_analyst;

/*No 2*/
CREATE PROCEDURE get_transaction_payment AS
BEGIN
SELECT
	*
FROM payments
END

EXEC get_transaction_payment

/*No 3*/
CREATE PROCEDURE get_transaction_users (@start_date AS date, @end_date AS date) AS
BEGIN
	SELECT
		Users.id as user_id, Users.first_name, Users.last_name, payments.product_id, products.name, payments.buy_price, payments.quantity, payments.total_payment, payments.transaction_date
		FROM Users LEFT JOIN payments
		ON Users.id = payments.user_id
		LEFT JOIN products
		ON payments.product_id = products.id
		WHERE payments.transaction_date > @start_date AND transaction_date < @end_date
END

EXEC get_transaction_users
@start_date='2023-01-01',
@end_date='2023-06-01'

/*No 4*/
CREATE PROCEDURE get_products (@min_price AS float=0, @max_price AS float) AS
BEGIN
	SELECT
		*
	FROM products
	WHERE price > @min_price AND price < @max_price
END

EXEC get_products
@min_price=10000,
@max_price=100000

/*No 5*/
ALTER PROCEDURE get_transaction_by_quarter (@quarter_param AS varchar(20), @transaction_year_param AS INT) AS
BEGIN
	SELECT
		user_id, product_id, quantity, buy_price, transaction_date, id as payment_id, total_payment, CONCAT('Q', DATEPART(quarter, transaction_date)) AS quarter_year, DATEPART(year, transaction_date) AS transaction_year
	FROM
		payments
	WHERE CONCAT('Q', DATEPART(quarter, transaction_date)) = @quarter_param AND DATEPART(year, transaction_date) = @transaction_year_param
END

EXEC get_transaction_by_quarter
@quarter_param ='Q2',
@transaction_year_param='2022'

