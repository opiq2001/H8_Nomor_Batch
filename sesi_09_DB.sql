IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Sesi_09_DB')
BEGIN
  CREATE DATABASE Sesi_09_DB;
END;
GO

USE [Sesi_09_DB]
GO

DROP TABLE IF EXISTS airlines;
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS airports;

CREATE TABLE users (
  id int PRIMARY KEY IDENTITY(1, 1),
  first_name varchar(20) NOT NULL,
  last_name varchar(20) NOT NULL,
  gender  VARCHAR(5) NOT NULL CHECK (gender IN('M', 'F')),   
  email varchar(40) NOT NULL unique
);

INSERT INTO users (first_name, last_name, gender, email) VALUES
('Bezalel', 'Simmel', 'F', 'bezael.simmel@gmail.com'),
('Parto', 'Bamford', 'M', 'parto.bamford@gmail.com'),
('Chirstian', 'Koblick', 'M', 'chirstian.koblick@gmail.com'),
('Kyoichi', 'Maliniak', 'M', 'kyoichi.maliniak@gmail.com'),
('Anneke', 'Preusik', 'F', 'anneke.preusik@mgmail.com'),
('Tzvetan', 'Zielinski', 'F', 'tsvetan.zielinski@gmail.com');

CREATE TABLE airlines (
	  id int PRIMARY KEY IDENTITY(1, 1),
    airline_name varchar(20) NOT NULL
);


INSERT INTO airlines(airline_name) VALUES 
	('XYZ Airlines'),
	('ABC Airlines'),
	('QWE Air'),
	('ZXC Airways'),
	('ASD Air'),
	('FGH Airways');

CREATE TABLE airports (
	 id int PRIMARY KEY IDENTITY(1, 1),
    airport_name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50)
);

INSERT INTO airports (airport_name, city, country) VALUES
('Soekarno Hatta International tAirport', 'Banten', 'Indonesia'),
('Adisumarmo International Airport', 'Solo', 'Indonesia'),
('Adisucipto International Airport', 'Yogyakarta', 'Indonesia'),
('Kualanamu International Airport', 'Medan', 'Indonesia'),
('Singapore Changi Airport', 'Singapore', 'Singapore'),
('Suvarnabhumi Airport', 'Bangkok', 'Thailand');

CREATE TABLE tickets (
  id int PRIMARY KEY IDENTITY(1, 1),
  airlines_id INT,
  airport_departure_id INT,
  airport_arrival_id INT,
  departure_time DATETIME,
  stock int NOT NULL,
  price int NOT NULL
);

INSERT INTO tickets (airlines_id, airport_departure_id, airport_arrival_id, departure_time, stock, price) VALUES
(1, 1, 2, '2023-01-01 10:00:00', 100, 1000000),
(1, 1, 3, '2023-01-01 11:00:00', 100, 1000000),
(1, 1, 4, '2023-01-01 12:00:00', 100, 1000000),
(1, 3, 1, '2023-04-05 06:00:00', 100, 1000000),
(1, 4, 1, '2023-03-03 08:00:00', 100, 1000000),
(1, 1, 5, '2023-05-02 07:00:00', 100, 1000000),
(2, 1, 6, '2023-02-26 10:00:00', 100, 1000000),
(2, 1, 5, '2023-03-30 11:00:00', 100, 1000000),
(2, 1, 2, '2023-01-18 12:00:00', 100, 1000000),
(2, 3, 2, '2023-04-05 06:00:00', 100, 1000000),
(2, 4, 1, '2023-06-15 08:00:00', 100, 1000000),
(2, 2, 3, '2023-05-12 07:00:00', 100, 1000000),
(3, 2, 6, '2023-06-26 10:00:00', 100, 1000000),
(3, 6, 1, '2023-05-30 11:00:00', 100, 1000000),
(3, 4, 1, '2023-04-18 12:00:00', 100, 1000000),
(3, 3, 1, '2023-03-05 06:00:00', 100, 1000000),
(3, 5, 1, '2023-02-15 08:00:00', 100, 1000000),
(3, 5, 1, '2023-01-12 07:00:00', 100, 1000000),
(4, 1, 2, '2023-04-26 10:00:00', 100, 1000000),
(4, 1, 3, '2023-06-30 11:00:00', 100, 1000000),
(4, 2, 1, '2023-03-14 12:00:00', 100, 1000000),
(4, 3, 2, '2023-01-01 06:00:00', 100, 1000000),
(4, 6, 1, '2023-02-16 08:00:00', 100, 1000000),
(4, 5, 1, '2023-06-12 07:00:00', 100, 1000000),
(5, 2, 6, '2023-06-26 10:00:00', 100, 1000000),
(5, 6, 1, '2023-05-30 11:00:00', 100, 1000000),
(5, 4, 1, '2023-04-18 12:00:00', 100, 1000000),
(5, 3, 1, '2023-03-05 06:00:00', 100, 1000000),
(5, 5, 1, '2023-02-15 08:00:00', 100, 1000000),
(5, 5, 1, '2023-01-12 07:00:00', 100, 1000000),
(6, 2, 6, '2023-06-30 10:00:00', 100, 1000000),
(6, 6, 1, '2023-05-12 11:00:00', 100, 1000000),
(6, 4, 1, '2023-04-15 12:00:00', 100, 1000000),
(6, 3, 1, '2023-03-23 06:00:00', 100, 1000000),
(6, 5, 1, '2023-02-08 08:00:00', 100, 1000000),
(6, 5, 1, '2023-01-19 07:00:00', 100, 1000000);

CREATE TABLE transactions (
  id int PRIMARY KEY IDENTITY(1, 1),
  user_id 			int 	NOT NULL,
  ticket_id 		int 	NOT NULL,
  price 			int 	NOT NULL,
  transaction_date 	date 	not null
);

INSERT INTO transactions (user_id, ticket_id, price, transaction_date) VALUES
(1, 1, 1000000, '2022-01-12'),
(1, 2, 1000000, '2022-12-23'),
(1, 4, 1000000, '2022-08-07'),
(1, 12, 1000000, '2022-09-13'),
(1, 27, 1000000, '2022-07-18'),
(1, 29, 1000000, '2022-03-20'),
(1, 3, 1000000, '2022-02-24'),
(1, 5, 1000000, '2022-04-27'),
(1, 28, 1000000, '2022-03-28'),
(1, 14, 1000000, '2022-07-30'),
(2, 16, 1000000, '2022-06-19'),
(2, 27, 1000000, '2022-03-19'),
(2, 22, 1000000, '2022-04-12'),
(2, 20, 1000000, '2022-06-11'),
(2, 24, 1000000, '2022-08-17'),
(2, 16, 1000000, '2022-05-12'),
(2, 13, 1000000, '2022-07-06'),
(2, 18, 1000000, '2022-03-08'),
(2, 17, 1000000, '2022-01-09'),
(2, 1, 1000000, '2022-12-14'),
(3, 12, 1000000, '2022-05-03'),
(3, 30, 1000000, '2022-06-10'),
(3, 29, 1000000, '2022-07-13'),
(3, 20, 1000000, '2022-08-23'),
(3, 11, 1000000, '2022-09-28'),
(3, 16, 1000000, '2022-10-30'),
(3, 19, 1000000, '2022-11-03'),
(3, 20, 1000000, '2022-12-02'),
(3, 21, 1000000, '2022-01-13'),
(3, 21, 1000000, '2022-02-11'),
(4, 2, 1000000, '2022-12-02'),
(4, 1, 1000000, '2022-11-02'),
(4, 4, 1000000, '2022-02-02'),
(4, 9, 1000000, '2022-09-02'),
(4, 11, 1000000, '2022-04-02'),
(4, 15, 1000000, '2022-09-02'),
(4, 17, 1000000, '2022-10-02'),
(4, 21, 1000000, '2022-06-02'),
(4, 28, 1000000, '2022-07-02'),
(4, 27, 1000000, '2022-01-02'),
(5, 21, 1000000, '2022-01-06'),
(5, 29, 1000000, '2022-02-06'),
(5, 11, 1000000, '2022-03-06'),
(5, 12, 1000000, '2022-03-06'),
(5, 17, 1000000, '2022-07-06'),
(5, 18, 1000000, '2022-10-06'),
(5, 20, 1000000, '2022-12-06'),
(5, 30, 1000000, '2022-09-06'),
(5, 25, 1000000, '2022-09-06'),
(5, 26, 1000000, '2022-08-06'),
(6, 3, 1000000, '2022-04-01'),
(6, 7, 1000000, '2022-04-01'),
(6, 10, 1000000, '2022-04-01'),
(6, 12, 1000000, '2022-04-01'),
(6, 23, 1000000, '2022-04-01'),
(6, 28, 1000000, '2022-04-01'),
(6, 30, 1000000, '2022-04-01'),
(6, 18, 1000000, '2022-04-01'),
(6, 17, 1000000, '2022-04-01'),
(6, 15, 1000000, '2022-04-01');




