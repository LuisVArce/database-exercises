USE employees;

-- Q1
SELECT first_name, last_name
fROM employees
WHERE hire_date = (SELECT hire_date FROM employees 
WHERE emp_no = 101010);

-- Q2
SELECT title, count(title) AS number_of_titles_held
FROM titles
WHERE emp_no IN 
(SELECT emp_no
FROM salaries
JOIN employees e USING(emp_no)
WHERE to_date > now()
AND first_name = 'Aamod')
GROUP BY title;
-- Q3
SELECT count(*) AS number_of_employees
FROM employees
WHERE emp_no NOT IN (SELECT emp_no
FROM salaries
WHERE to_date > CURDATE());
-- 59900 employees

-- Q4
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
SELECT emp_no
FROM dept_manager
WHERE to_date > now())
AND gender = 'F';
-- Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil

-- Q5
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
SELECT emp_no
FROM salaries
WHERE salary >= (SELECT avg(salary) FROM salaries)
AND to_date > NOW());

-- Q6
SELECT count(salary) 
FROM salaries 
WHERE to_date > curdate()
AND salary >= 
    (SELECT max(salary) - stddev(salary)
    FROM salaries
    where to_date>curdate())
/
(select count(*) from salaries
where to_date > now()) * 100;

