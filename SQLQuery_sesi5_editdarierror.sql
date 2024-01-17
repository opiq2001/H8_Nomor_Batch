create database DSP_sesi_5_DB;
use DSP_sesi_5_DB;

drop table if exists teachers;
drop table if exists students;

CREATE TABLE teachers (
  id INT IDENTITY(1,1) NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
  city VARCHAR(20) NOT NULL,
  teaching_subject VARCHAR(10) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO teachers (first_name, last_name, gender, city, teaching_subject) VALUES
('Bezalel', 'Simmel', 'F', 'Jakarta', 'Math'),
('Parto', 'Bamford', 'M', 'Jakarta', 'Chemistry'),
('Chirstian', 'Koblick', 'M', 'Bogor', 'Physics');

CREATE TABLE students (
  id INT IDENTITY(1,1) NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
  city VARCHAR(20) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO students (first_name, last_name, gender, city) VALUES
('Kyoichi', 'Maliniak', 'M', 'Bandung'),
('Anneke', 'Preusik', 'F', 'Medan'),
('Tzvetan', 'Zielinski', 'F', 'Bandung');