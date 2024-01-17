
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Employees_02_DB')
BEGIN
  CREATE DATABASE Employees_02_DB;
END;
GO

USE [Employees_02_DB]
GO
DROP TABLE IF EXISTS titles,
                     salaries, 
                     employees;


CREATE TABLE employees (
    emp_no      INT             PRIMARY KEY IDENTITY(1, 1),
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      VARCHAR(10) NOT NULL CHECK (gender IN('M', 'F')),    
    hire_date   DATE            NOT NULL
);

CREATE TABLE salaries (
    salary_id   INT 			PRIMARY KEY IDENTITY(1, 1),
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL
); 

CREATE TABLE titles (
	title_id 	INT				PRIMARY KEY IDENTITY(1, 1),
    title_name	VARCHAR (20)	NOT NULL,
    emp_no		INT				NOT NULL
);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date) VALUES 
('1964-06-02','Bezalel','Simmel','F','1985-11-21'),
('1959-12-03','Parto','Bamford','M','1986-08-28'),
('1954-05-01','Chirstian','Koblick','M','1986-12-01'),
('1955-01-21','Kyoichi','Maliniak','M','1989-09-12'),
('1953-04-20','Anneke','Preusig','F','1989-06-02'),
('1957-05-23','Tzvetan','Zielinski','F','1989-02-10');

INSERT INTO salaries (emp_no, salary, from_date, to_date) VALUES 
(1,62102,'1987-06-26','1988-06-25'),
(2,66074,'1988-06-25','1989-06-25'),
(3,66596,'1989-06-25','1990-06-25'),
(4,66961,'1990-06-25','1991-06-25'),
(5,71046,'1991-06-25','1992-06-24'),
(7,74333,'1992-06-24','1993-06-24');

INSERT INTO titles (title_name, emp_no) VALUES
('CEO', 1),
('Finance Staff', 2),
('Finance Staff', 3),
('Operation', 4),
('Social Media', 5),
('Social Media', 6);