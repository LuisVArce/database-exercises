-- QUESTION 1 (Join example database)
USE join_example_db;
SELECT * 
	FROM users, roles;
-- QUESTION 2
SELECT *
	FROM users
    JOIN roles ON users.role_id = roles.id;
SELECT *
	FROM users
    LEFT JOIN roles on users.role_id = roles.id;
SELECT *
	FROM roles
    RIGHT JOIN users on users.role_id = roles.id;

SELECT *
	FROM users
    JOIN roles ON users.role_id = roles.id;
    
USE employees;
SELECT dept_name as 'Department Name',
	CONCAT(first_name, ' ', last_name) as 'Department Manager'
	FROM dept_manager
    JOIN employees ON dept_manager.emp_no = employees.emp_no
    JOIN departments USING (dept_no)
    WHERE to_date > NOW()
    ORDER BY dept_name;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name as 'Department Name'
FROM employees e
JOIN dept_emp de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

-- QUESTION 3
USE employees;
SELECT dept_name as `Department Name`,
    concat(first_name, " ", last_name) as `Manager Name`
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date > CURDATE()
    AND gender = "F"
ORDER BY `Department Name`;
-- QUESTION 4
SELECT title as "Title",
    count(*) as "Count"
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN titles ON titles.emp_no = dept_emp.emp_no
WHERE titles.to_date > CURDATE()
    AND dept_emp.to_date > CURDATE()
    AND dept_name = "Customer Service"
GROUP BY title;
-- QUESTION 5
USE employees;
SELECT dept_name as 'Department Name',
	CONCAT(first_name, ' ', last_name) as 'Name',
	salary as 'Salary'
FROM salaries
JOIN dept_manager ON dept_manager.emp_no = salaries.emp_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE salaries.to_date > CURDATE()
AND dept_manager.to_date > CURDATE()
ORDER BY 'Department Name';

-- QUESTION 6
SELECT dept_no, dept_name, count(*) as 'num_employees'
FROM departments
JOIN dept_emp USING (dept_no)
WHERE to_date > CURDATE ()
GROUP BY dept_no
ORDER BY dept_no DESC;

-- QUESTION 7
SELECT dept_name, AVG(salary) as `average_salary`
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_emp.to_date > now()
AND salaries.to_date > now()
GROUP BY dept_name
ORDER BY `average_salary` DESC
LIMIT 1;

-- QUESTION 8
SELECT first_name, last_name, salary
FROM employees
JOIN dept_emp on dept_emp.emp_no = employees.emp_no
JOIN salaries on salaries.emp_no = dept_emp.emp_no
JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE salaries.to_date > CURDATE()
AND dept_emp.to_date > CURDATE()
AND dept_name = 'Marketing'
ORDER BY salary DESC
LIMIT 1;

-- QUESTION 9
SELECT first_name, last_name, salary, dept_name
FROM dept_manager
JOIN employees USING(emp_no)
JOIN salaries USING(emp_no)
JOIN departments USING(dept_no)
WHERE salaries.to_date > CURDATE()
AND dept_manager.to_date > CURDATE()
ORDER BY salary DESC
LIMIT 1;

-- QUESTION 10
SELECT dept_name, ROUND(AVG(salary)) as `average_salary`
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_emp.to_date > now()
AND salaries.to_date > now()
GROUP BY dept_name
ORDER BY `average_salary` DESC;

