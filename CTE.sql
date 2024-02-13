
-- CTE's are just like derieved tables but it sustain for the short period. We use this just to hanlde large queries
WITH CTE_Employee AS
(SELECT ed.fname,ed.lname,ed.gender,ed.age,es.job_title,es.salary, COUNT(ed.gender) OVER (PARTITION BY ed.gender) AS NO_OF_GENDER
from employee_demographics ed
JOIN employee_records er ON ed.id = er.employee_demographics_id
JOIN employee_salaries es ON es.id = er.employee_salaries_id)
SELECT NO_OF_GENDER,fname,gender  FROM CTE_Employee

