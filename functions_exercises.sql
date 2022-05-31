USE EMPLOYEES;
SELECT first_name, last_name concat(first_name, ' ', last_name) as fullname
FROM employees
WHERE last_name LIKE 'E%' AND '%E';

-- QUESTION 2
SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND '%E'
AND SELECT CONCAT('first_name', 'last_name')
	SELECT UPPER(full_name);
-- QUESTION 3
SELECT *, datediff(now(), hire_date) as tenure
FROM employees
WHERE hire_date like '199%' 
AND birth_date like '____-12-25';
-- QUESTION 4
SELECT max(salary), min(salary) 
FROM salaries
where to_date > now();
-- QUESTION 5
SELECT 
	lower(concat(substr(first_name, 1, 1),
				substr(last_name, 1, 4),
				'_',
                substr(birth_date, 6, 2),
                substr(birth_date, 3, 2)
			)) as username,
            first_name,
            last_name,
            birth_date,
	FROM
			employees;
            