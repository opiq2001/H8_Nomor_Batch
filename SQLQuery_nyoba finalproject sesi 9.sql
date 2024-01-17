select * from airlines
/*no 1*/
select t.id, t.stock, t.price, t.departure_time,
	   aa.airport_name as airport_arrival_name, ad.airport_name as airport_departure_name,
	   al.airline_name
from tickets t
JOIN airlines al
ON t.airlines_id = al.id
JOIN airports ad
ON t.airport_departure_id = ad.id
JOIN airports aa
ON t.airport_arrival_id = aa.id
WHERE t.airlines_id = al.id

/*no 2*/
