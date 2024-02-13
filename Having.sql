SELECT * FROM employee_demographics

SELECT * FROM age_categories


--having clause
SELECT category,COUNT(id) as id_count from age_categories group by category 
HAVING COUNT(id) > 1

SELECT * FROM employee_demographics
SELECT * FROM employee_salaries
SELECT * FROM employee_records

SELECT ed.fname, MAX(es.salary) from employee_demographics ed
inner join employee_records er on ed.id = er.employee_demographics_id
inner join employee_salaries es on er.employee_salaries_id = es.id
GROUP BY ed.id, ed.fname
HAVING MAX(es.salary) > 40000
ORDER BY MAX(es.salary)
