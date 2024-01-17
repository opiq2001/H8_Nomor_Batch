/*NO 1*/
SELECT t.id, t.stock, t.price, t.departure_time,
	   aa.airport_name as airport_arrival_name, ad.airport_name as airport_departure_name,
	   al.airline_name
FROM tickets t
JOIN airlines al
ON t.airlines_id = al.id
JOIN airports ad
ON t.airport_departure_id = ad.id
JOIN airports aa
ON t.airport_arrival_id = aa.id
WHERE t.airlines_id = al.id

/*NO 2*/
SELECT tr.id, tr.transaction_date, us.first_name, us.last_name, tr.price,
	   al.airline_name, aa.airport_name as airport_arrival_name,
	   ad.airport_name as airport_departure_name
FROM transactions tr
JOIN tickets t
ON tr.ticket_id = t.id
JOIN users us
ON tr.user_id = us.id
JOIN airlines al
ON t.airlines_id = al.id
JOIN airports ad
ON t.airport_departure_id = ad.id
JOIN airports aa
ON t.airport_arrival_id = aa.id
WHERE us.first_name = 'Bezalel'

/*NO 3*/
SELECT CONCAT(first_name, last_name) as fullname, gender, email
FROM users

/*NO 4*/
WITH ticket_biggest_sale AS(
	SELECT ticket_id, COUNT(id) AS ticket_sold
	FROM transactions
	GROUP BY ticket_id
)

SELECT tbs.ticket_sold, t.id AS ticket_id
FROM tickets t
JOIN ticket_biggest_sale tbs
ON t.id = tbs.ticket_id
ORDER BY tbs.ticket_sold DESC
OFFSET 0 ROWS
FETCH NEXT 4 ROWS ONLY 

/*NO 5*/
ALTER PROCEDURE get_transaction_by_date (@start_date AS date, @end_date AS date) AS
BEGIN
	SELECT
		tr.id, tr.transaction_date, us.first_name, us.last_name,
		tr.price, al.airline_name,
		aa.airport_name as airport_arrival_name,
		ad.airport_name as airport_departure_name
	FROM transactions tr
	JOIN tickets t
	ON tr.ticket_id = t.id
	JOIN users us
	ON tr.user_id = us.id
	JOIN airlines al
	ON t.airlines_id = al.id
	JOIN airports aa
	ON t.airport_departure_id = aa.id
	JOIN airports ad
	ON t.airport_arrival_id = ad.id
	WHERE tr.transaction_date BETWEEN @start_date AND @end_date
	ORDER BY tr.id
END;

EXEC get_transaction_by_date
@start_date = '2022-01-12',
@end_date = '2022-02-15'



