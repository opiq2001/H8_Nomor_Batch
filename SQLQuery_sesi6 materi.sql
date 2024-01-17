/*LIKE*/
/*PERCENT WILD*/
SELECT id, first_name, last_name
FROM employees
WHERE first_name LIKE 'S%';

SELECT id, first_name, last_name
FROM employees
WHERE first_name LIKE 'S%A';

/*UNDERSCORE WILD*/
SELECT id, first_name, last_name
FROM employees
WHERE first_name LIKE '_h%';

/*LIST OF CHARACTER*/
SELECT id, first_name, last_name
FROM employees 
WHERE first_name LIKE '[SC]%'

/*RANGE OF CHARACTER*/
SELECT id, first_name, last_name
FROM employees 
WHERE first_name LIKE '[A-C,S]%'

/*^ RANGE OR LIST OF CHARACTER*/
SELECT id, first_name, last_name 
FROM employees 
WHERE first_name LIKE '[^A-S]%';

SELECT id, first_name, last_name 
FROM employees 
WHERE first_name LIKE '[A-S]%' AND first_name NOT LIKE 'M%'
ORDER BY first_name;

/*NOT LIKE*/
SELECT id, first_name, last_name 
FROM employees 
WHERE first_name NOT LIKE 'A%';

/*SUBQUERY*/
/*In place of expression*/
/*contoh subquery*/
SELECT AVG(salary) FROM employees;
/*contoh query utama*/
SELECT id, first_name, last_name, (salary - (SELECT AVG(salary) FROM employees)) AS difference_from_avg_salary FROM employees;

/*IN*/
/*subquery*/
SELECT id FROM employees WHERE first_name = 'Steven';
/*query utama*/
SELECT id, first_name, last_name, manager_id FROM employees
WHERE manager_id IN
(SELECT id FROM employees WHERE first_name = 'Steven');

/*ANY*/
/*subquery*/
SELECT job_id, AVG(salary) FROM employees GROUP BY job_id
/*query utama*/
SELECT id, first_name, last_name, salary
FROM employees
WHERE salary >= ANY (SELECT AVG(salary) FROM employees GROUP BY job_id);

/*ALL*/
/*subquery*/
/*SELECT job_id, AVG(salary) FROM employees GROUP BY job_id*/
/*query utama*/
SELECT id, first_name, last_name, salary
FROM employees
WHERE salary >= ALL (SELECT AVG(salary) FROM employees GROUP BY job_id);

/*FROM*/
/*subquery*/
SELECT job_id, AVG(salary) as avg_salary FROM employees GROUP BY job_id
/*query utama*/
SELECT MAX(table_avg_salary.avg_salary) 
FROM (SELECT job_id, AVG(salary) as avg_salary FROM employees
GROUP BY job_id) table_avg_salary

/*CTE*/
WITH cte_average_salary(job_id, avg_salary) AS (
	SELECT job_id, AVG(salary) as avg_salary
	FROM employees GROUP BY job_id
)
SELECT * FROM cte_average_salary
WHERE 
avg_salary = (SELECT MAX(cte_average_salary.avg_salary)FROM cte_average_salary)

/*TEMPORARY TABLE*/
CREATE TABLE #average_salary (
	job_id VARCHAR(10),
	avg_salary FLOAT
)

INSERT INTO #average_salary
	SELECT job_id, AVG(salary) as
	avg_salary FROM employees GROUP BY job_id

SELECT * FROM #average_salary







SELECT salary FROM employees WHERE id = 163;

SELECT id, first_name, last_name
FROM employees
WHERE salary >= ALL (SELECT salary FROM employees WHERE id = 163);

SELECT id, first_name, last_name
FROM employees
WHERE salary > ALL (SELECT AVG(salary) FROM employees GROUP BY job_id);

SELECT job_id, AVG(salary) as avg_salary FROM employees GROUP BY job_id
SELECT 