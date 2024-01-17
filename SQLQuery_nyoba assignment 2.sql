use ecommerce_DB

select * from Users

/*Assignment 2*/
/*No 2*/
select top 1 birth_date from Users
select id, first_name, last_name, phone_number, email, city_id, address, birth_date
from Users
where birth_date IN
(select top 1 birth_date from Users);

/*No 3*/
select MIN(price) from products

select id, name, price, stocks
from products
where price = ALL (select MIN(price) from products);


