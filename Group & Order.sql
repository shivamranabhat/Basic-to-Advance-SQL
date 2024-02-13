--use sql_tutorial

--group by (helps to group the data based on a specific col and use min, max, avg and count)
--SELECT fname,COUNT(id) AS NO_OF_SAME_FNAME from employee_demographics group by fname 


--order by (order the specific column in asc or dec order)
--SELECT * from employee_demographics order by fname asc


--inner join (AnB), left outer join (A - B), right outer join (B - A), full join (A U B)
--SELECT * from employee_demographics right outer join employee_records ON  employee_demographics.id= employee_records.employee_demographics_id




