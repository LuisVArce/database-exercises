-- QUESTION 2
USE employees;
SELECT COUNT(DISTINCT title) 
	FROM titles;
-- QUESTION 3
SELECT * FROM employees;
SELECT DISTINCT last_name, COUNT(last_name)
	FROM employees
    WHERE last_name LIKE 'e%e'
    GROUP BY last_name;
-- QUESTION 4
SELECT first_name, last_name
	FROM employees
    WHERE last_name LIKE 'e%e'
    GROUP BY first_name , last_name;
-- QUESTION 5
SELECT last_name
	FROM employees
    WHERE last_name 
    LIKE '%q%' AND last_name NOT LIKE '%qu%'
    GROUP BY last_name;
# Chleq, Lindqvist, Qiwen
-- QUESTION 6
SELECT COUNT(last_name)
	FROM employees
    WHERE last_name 
    LIKE '%q%' AND last_name NOT LIKE '%qu%'
    GROUP BY last_name;
# 189, 190, 168
-- QUESTION 7
SELECT gender, first_name, COUNT(gender)
	FROM employees
    WHERE first_name IN ('Irena','Vidya','Maya')
    GROUP BY FIRST_name, gender;
#correct
-- QUESTION 8



SELECT AVG(salary)
	FROM employees
    GROUP BY employees, salaries;
    
USE dept_emp;
SELECT COUNT(emp_no)
	FROM dept_emp
    GROUP BY dept_no AND emp_no;

-- 
  
  
USE employees;
DESCRIBE ;
CREATE TABLE authors (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (first_name, last_name)
);