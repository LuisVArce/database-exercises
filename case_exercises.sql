use employees;

-- QUESTION 1
SELECT DISTINCT emp_no, dept_no, hire_date, dept_emp.to_date, 
	(SELECT CASE to_date
		when to_date > now() then 1
		
		ELSE 0
		END) AS 'is_current_employee'
FROM employees
JOIN dept_emp USING (emp_no)
JOIN salaries USING (emp_no);

-- QUESTION 2
SELECT
	first_name,
	last_name,
	CASE
		WHEN last_name BETWEEN 'A' AND 'H' THEN 'A-H'
		WHEN last_name BETWEEN 'I' AND 'Q' THEN 'I-Q'
		WHEN last_name BETWEEN 'R' AND 'Z' THEN 'R-Z'
		ELSE 'other'
	END AS alpha_group
FROM employees;

-- QUESTION 3
select case
	when birth_date like '195%' then '1950s'
    when birth_date like '196%' then '1960s'
    end as 'decades',
    count(*)
from employees
group by decades;

-- QUESTION 4
select
	case
		when dept_name in ('research', 'development') then 'R&D'
        WHEN dept_name in ('sales', 'marketing') then 'Sales & Marketing'
		when dept_name in ('production', 'quality management') then 'Prod & QM'
        when dept_name in ('finance', 'human resources') then 'Finance & HR'
else 'Customer Service' end as 'department_group',
avg(salary)
from salaries
join dept_emp using (emp_no)
join departments using (dept_no)
where salaries.to_date > now()
group by department_group;
