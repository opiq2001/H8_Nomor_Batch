/*INNER JOIN*/
SELECT employees.emp_no, first_name, last_name, salary_id, salary 
FROM employees INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;

/*LEFT JOIN*/
SELECT employees.emp_no, first_name, last_name, salary_id, salary
FROM employees LEFT JOIN salaries 
ON employees.emp_no = salaries.emp_no;

/*RIGHT JOIN*/
SELECT employees.emp_no, first_name, last_name, salary_id, salary
FROM employees RIGHT JOIN salaries 
ON employees.emp_no = salaries.emp_no;

/*SELF JOIN*/
SELECT
table1.emp_no AS emp_noA, table2.emp_no AS emp_noB, table1.title_name
FROM titles table1, titles table2
WHERE table1.emp_no != table2.emp_no AND table1.title_name = table2.title_name;

/*FILTERING JOIN*/
SELECT     
	employees.emp_no, first_name, last_name, gender, salary
FROM    
	employees
INNER JOIN salaries    
	ON employees.emp_no = salaries.emp_no 
WHERE employees.gender = 'F' AND salary < 100000;