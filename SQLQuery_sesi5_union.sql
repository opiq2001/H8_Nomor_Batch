/*MATERI UNION*/
SELECT city FROM students UNION
SELECT city FROM teachers;

select first_name, last_name, gender
from students
union
select first_name, last_name, gender
from teachers;

select city from students
union all
select city from teachers;

select city from teachers
union all
select city from students;