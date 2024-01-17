DROP DATABASE IF EXISTS DSP_sesi_5_DB;
CREATE DATABASE IF NOT EXISTS DSP_sesi_5_DB;
USE DSP_sesi_5_DB;

DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS teachers;

CREATE TABLE teachers (
  id int NOT NULL AUTO_INCREMENT,
  first_name varchar(20) NOT NULL,
  last_name varchar(20) NOT NULL,
  gender enum('M','F') NOT NULL,
  city varchar(20) NOT NULL,
  teaching_subject varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
);


INSERT INTO teachers (first_name, last_name, gender, city, teaching_subject) VALUES
('Bezalel', 'Simmel', 'F', 'Jakarta', 'Math'),
('Parto', 'Bamford', 'M', 'Jakarta', 'Chemistry'),
('Chirstian', 'Koblick', 'M', 'Bogor', 'Physics');

CREATE TABLE students (
  id int NOT NULL AUTO_INCREMENT,
  first_name varchar(20) NOT NULL,
  last_name varchar(20) NOT NULL,
  gender enum('M','F') NOT NULL,
  city varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO students (first_name, last_name, gender, city) VALUE
('Kyoichi', 'Maliniak', 'M', 'Bandung'),
('Anneke', 'Preusik', 'F', 'Medan'),
('Tzvetan', 'Zielinski', 'F', 'Bandung');

