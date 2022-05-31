SELECT * FROM employees;




SELECT first_name FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
# QUESTION 2: 709 Rows returned 
SELECT first_name FROM employees
WHERE first_name IN ('Irena' OR 'Vidya' OR 'Maya');
# QUESTION 3: 1000

SELECT first_name
FROM employees
WHERE first_name IN ('Irena' OR 'Vidya' OR 'Maya')
  AND male;
