USE fruits_db;
show tables;
select * from fruits;

select name, quantity from fruits;
# return number of rows in the table
SELECT count(*) from fruits;
# How many unique fruits are in the table?
select distinct(name) from fruits;
select count(distinct(name)) from fruits;

select *, name, name, quantity, quantity from fruits;


select *, quantity * 100 from fruits;

select * from fruits;
select * from fruits
where name like '%berry%';

SELECT name as 'fruit', quantity * 10 as new_quantity from fruits
WHERE quantity > 10