/*use ecommerce_DB; */

/* CREATE TABLES */
create table products(
	id int primary key,
	name varchar(100) not null,
	price float not null,
	stocks int not null default 10
);

create table categories(
	id int primary key,
	name varchar(20) not null
);

create table product_categories(
	id int primary key,
	product_id int not null,
	category_id int not null,
	constraint fk_product_id foreign key (product_id) references products(id),
	constraint fk_category_id foreign key (category_id) references categories(id)
);

/* INSERT DATA */
insert into products(id, name, price, stocks)
values
	(1, 'Heavy Duty Automotive Gear Oil - Mobilube HD 80W-90 (1 liter)',85600, 100),
	(2, 'Oli Mesin - Mobil 1 0W-20 (1 liter)',275000, 100),
	(3, 'Milk Frother Elektrik Pembuih Susu Baterai Hand Mixer Electric - Rosegold',99000, 100),
	(4, 'Philips LOW WATT Air Fryer HD9200/91 - 800 Watt - Regular',980000, 20),
	(5, 'COOGER Spin Mop Blue 360 derajat - Alat Pel Lantai Super Mop',74900, 120),
	(6, 'Wardah Body Care Olive Series - Natural Halal Melembabkan',75240, 100),
	(7, 'Serum Avoskin Miraculous Refining 30ml-AHA BHA-Waktunya Eksfoliasi',224000, 100),
	(8, 'Cetaphil Baby Daily Lotion with Organic Calendula 400 ml - Calendula 50ml',68500, 150),
	(9, 'Cocolatte Stroller Bayi CL 909 Spin Reversible - Orange',1449000, 20),
	(10, 'Minimal Aires Shirt Green - GREEN, S',360000, 30),
	(11, 'Dress Anak Bayi Perempuan Cewek Putih Kelinci Katun New Born - 6 Bulan',69500, 100),
	(12, 'Kemeja Lengan Panjang Pria Cottonology Hella Hitam - Hitam,L',10500, 100),
	(13, 'Milna Biskuit Bayi Jeruk 130gr',17000, 200),
	(14, 'Coca Cola Japanese Design LIMITED EDITION JAPAN',48400, 100),
	(15, 'Kusuka Keripik Singkong Ayam Lada Hitam 180 gram',16900, 100),
	(16, 'Vitamin C',90000, 100);

insert into categories(id, name)
values
	(1, 'Automotive'),
	(2, 'Skin Care'),
	(3, 'Fashion'),
	(4, 'Body Care'),
	(5, 'FnB'),
	(6, 'Baby Care'),
	(7, 'Health'),
	(8, 'Electronics'),
	(9, 'Home Appliance');

insert into product_categories(id, product_id, category_id)
values
	(1,1,1),
	(2,2,1),
	(3,3,8),
	(4,3,9),
	(5,4,8),
	(6,4,9),
	(7,5,9),
	(8,6,4),
	(9,7,2),
	(10,8,4),
	(11,8,6),
	(12,9,6),
	(13,10,3),
	(14,11,3),
	(15,11,6),
	(16,12,3),
	(17,13,5),
	(18,13,6),
	(19,14,5),
	(20,15,5),
	(21,16,7);

/* SELECT */
select id, name, price, stocks
from products
where stocks>100;

select id, name, price, stocks
from products
order by price
offset 1 rows
fetch next 3 rows only;