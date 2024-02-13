
-- Subqueries (in the select, from, and where statement)


-- Select
select id, fname,lname, (select AVG(salary) from employee_salaries) AS All_Avg_Sal from employee_demographics


-- In partition by
select id, AVG(salary) over () AS All_Avg_Sal from employee_salaries


-- From 
select a.id, a.All_Avg_Sal from (select id, AVG(salary) over () AS All_Avg_Sal from employee_salaries) a

-- Where 
select id, fname, lname from employee_demographics where (select salary from employee_salaries where employee_salaries.id = employee_demographics.id) <20000