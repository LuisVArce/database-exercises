USE kalpana_1816;


create temporary table my_numbers(
	n INT UNSIGNED NOT NULL);
    
insert into my_numbers(n) values (1), (2), (3), (4), (5);

select * from kalpana_1816.employees_with_departments2;

update my_numbers set n = n + 1;

delete from my_numbers where n % 2 = 0;
-- QUESTION 1
use employees;

create temporary table kalpana_1816.employees_with_departments2 as
(select first_name, last_name, dept_name
from employees
join dept_emp using (emp_no)
join departments using (dept_no));
-- Q1 A
ALTER TABLE kalpana_1816.employees_with_departments2 ADD full_name VARCHAR(100);
UPDATE kalpana_1816.employees_with_departments2
SET full_name = CONCAT(first_name, ' ', last_name);
-- Q1 B, C, D
ALTER TABLE kalpana_1816.employees_with_departments2 DROP COLUMN last_name;
use sakila;
SELECT * FROM kalpana_1816.sakila_payment;

-- QUESTION 2
create temporary table kalpana_1816.sakila_payment as
(select payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update
from payment);

alter table kalpana_1816.sakila_payment modify amount decimal(8,2);

-- QUESTION 3
create temporary table kalpana_1816.avg_salary_by_dept_current as 
	select departments.dept_name,
    avg(sal.salary) as average_salary
from salaries as sal
	join dept_emp as demp on sal.emp_no = demp.emp_no
    join departments on demp.dept_no = departments.dept_no
where sal.to_date > now()
and demp.to_date > now()
group by departments.dept_name
order by average_salary desc;

select * from kalpana_1816.avg_salary_by_dept_current;

select *,
	(average_salary - (select avg(salary) from employees.salaries
    where to_date > now()))
    /
    (select stddev(salary) from employees.salaries where to_date > now())
    as zscore
    from kalpana_1816.avg_salary_by_dept_current;


select avg(salary), std(salary) from employees.salaries
where to_date > now();




use employees;

-- BOOLEAN MATCH/CAST
SELECT 
    dept_name, dept_name LIKE 'Research' AS is_research
FROM
    departments; 

-- IF()
SELECT 
    dept_name, 
    IF(dept_name = 'Research', true, false) AS is_research
FROM
    departments; 

-- CASE: OPTION ONE
-- USE IF YOU HAVE MORE THAN 2 VALUES
-- NEED MORE FLEXIBILITY IN THE CONDITION ITSELF

select
	dept_name,
    case dept_name
		when 'Research' then 1
        else 0
	end as is_research
    from departments;
-- cannot test for NULL values
-- CASE: OPTION 2

select
	dept_name,
    case
		when dept_name in ('Marketing', 'Sales') then 'Money Makers'
        when dept_name like 'research' or dept_name like 'resources'then 'people pleasers'
		else 'others'
	end as department_categories
from departments;



