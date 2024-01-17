/*1*/
DROP TABLE IF EXISTS Users,
					 Cities;

CREATE TABLE Users (
    id INT PRIMARY KEY IDENTITY(1, 1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    phone_number VARCHAR(20) NOT NULL UNIQUE, 
	email VARCHAR(30) NOT NULL UNIQUE,
	city_id INT NOT NULL,
	address TEXT,
	birth_date DATE NOT NULL,
);

CREATE TABLE Cities (
    id INT PRIMARY KEY IDENTITY(1, 1),
    name VARCHAR(50) NOT NULL
);



/*2*/
insert into Users(first_name, last_name, phone_number, email, city_id, address, birth_date)
values
	( 'Bezalel', 'Simmel','081390789645','bezalelsimmel@gmail.com', 1, 'Komplek Melati Mas','1985-11-21' ),
	( 'Parto', 'Bamford','081390789644','partobamford@gmail.com', 3, 'Golden Park ','1985-11-21' ),
	( 'Chirstian', 'Koblick','081390789643','christianbamford@gmail.com', 5, 'Griya Indah Lestari','1985-11-21' ),
	( 'Kyoichi', 'Maliniak','081390789642','kyoichimaliniak@gmail.com', 7, 'Komplek Melati Indah','1985-11-21' ),
	( 'Anneke', 'Preusig','081390789641','annekepreusig@gmail.com', 8, 'Jalan Paguyuban','1985-11-21' ),
	( 'Tzvetan', 'Zielinski','081390789640','tvetanzieliski@gmail.com', 1, 'Perum Jaya Indah','1985-11-21'),
	( 'Atelier',NULL,'081390789639','atelier@gmail.com', 3, 'Jalan Lestari','1985-11-21' );

insert into Cities(name)
values
	('Jakarta'),
	('Bandung'),
	('Cirebon'),
	('Bogor'),
	('Depok'),
	('Malang'),
	('Surbaya'),
	('Yogyakarta'),
	('Solo'),
	('Bali'),
	('Palembang'),
	('Pekanbaru'),
	('Medan'),
	('Batam'),
	('Kendari'),
	('Pontianak');


/*3*/
SELECT products.id, products.name as product_name, products.price, products.stocks, categories.name as category_name
FROM products
LEFT JOIN product_categories
ON products.id = product_categories.id
LEFT JOIN categories
ON categories.id = products.id

/*4*/
SELECT products.id, products.name, products.price, products.stocks, categories.name
FROM products
LEFT JOIN categories
ON products.id = categories.id
WHERE categories.name = 'Home Appliance'

/*5*/
SELECT Users.id, Users.first_name, Users.last_name, Users.phone_number, Users.email, Users.address, Users.birth_date, Cities.name as city_name
FROM Users
RIGHT JOIN Cities
ON Users.city_id = Cities.id
WHERE Cities.name = 'Jakarta'

/*6*/
DELETE FROM Cities WHERE id=5;

/*7*/
SELECT Users.id, Users.first_name, Users.last_name, Users.phone_number, Users.email, Users.address, Users.birth_date, Cities.name as city_name
FROM Users
LEFT JOIN Cities
ON Users.city_id = Cities.id
WHERE Users.city_id = 5

/*8*/
SELECT Cities.id as city_id, Cities.name as city_name
FROM Cities
LEFT JOIN Users
ON Cities.id = Users.city_id
WHERE Users.city_id IS NULL

