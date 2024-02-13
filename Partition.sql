SELECT * FROM employee_demographics
SELECT * FROM employee_salaries

SELECT * FROM employee_records


SELECT ed.fname,ed.lname,ed.gender,COUNT(ed.gender) OVER (PARTITION BY ed.gender) AS TOTAL_GENDER 
FROM employee_demographics ed
INNER JOIN employee_records er ON ed.id = er.employee_demographics_id
INNER JOIN employee_salaries es ON er.employee_salaries_id = es.id
