--INSERT INTO employee_demographics VALUES 
--('Bob','Chrish',25,'Male')

--select top 4 fname from employee_demographics

--insert into employee_salaries values 
--('Digital Marketer', 45000),
--('IT Officer', 10000)

--remove duplicate records
--select distinct(gender) from employee_demographics

--count the number of rows
--select count(fname) from employee_demographics

--as 
--select fname AS First_Name from employee_demographics

--min
--SELECT min(salary) AS Min_Salary from employee_salaries

--max
--SELECT MAX(salary) AS Max_Salary from employee_salaries

--avg
--SELECT AVG(salary) AS Avg_Salary from employee_salaries


--CREATE TABLE employee_records (id int not null identity(1,1),employee_demographics_id int not null foreign key references employee_demographics(id),employee_salaries_id int not null foreign key references employee_salaries(id))

--INSERT INTO employee_records VALUES(1,1)

--SELECT ed.fname AS FIRST_NAME, es.salary from employee_records er inner join employee_demographics ed ON er.employee_demographics_id= ed.id inner join employee_salaries es ON er.employee_salaries_id= es.id where es.salary >= 40000

--% % (like or contains)
--provide output where fname contains B anywhere inside the word
--SELECT DISTINCT(fname) from employee_demographics WHERE fname like '%B%'

--provide output where fname contains B at first in the word
SELECT * from employee_demographics WHERE lname like 'C%'

--<> (Not equals to)
--SELECT * from employee_demographics WHERE fname <> 'Bob'

--null & not null
--SELECT * from employee_demographics where fname is null
--SELECT * from employee_demographics where fname is not null

-- in (Helps to select multiple value of single col)
SELECT * from employee_demographics WHERE fname IN ('Jim','Tim');