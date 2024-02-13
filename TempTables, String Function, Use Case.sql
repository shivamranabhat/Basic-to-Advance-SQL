--Temp tables

select * from employee_salaries

INSERT INTO employee_salaries VALUES 
('Regional Manager',20000),
('CEO',30000),
('Head Officer',40000),
('Zonal Manager',50000)


DROP TABLE IF EXISTS #temp_table
CREATE table #temp_table (id int not null,fname varchar(30),lname varchar(30))
INSERT INTO #temp_table SELECT id,fname,lname from employee_demographics
SELECT * FROM #temp_table

DROP TABLE #temp_table

UPDATE #temp_table SET fname=' Boby' WHERE id=3

-- String Function - TRIM, LTRIM,RTRIM, REPLACE, SUBSTRING, UPPER,LOWER

--Using Trim, LTRIM, RTRIM
-- TRIM => Get rid of blank space in both left and right side
SELECT fname, TRIM(fname) AS FNAMETRIM from #temp_table

SELECT fname, LTRIM(fname) AS FNAMETRIM from #temp_table

SELECT fname, RTRIM(fname) AS FNAMETRIM from #temp_table

UPDATE #temp_table SET fname = LTRIM(fname) WHERE id = 3


--Using Replace

UPDATE #temp_table SET lname = REPLACE(lname,'- Hob','') WHERE id = 2
UPDATE #temp_table SET fname = 'TIm' WHERE id = 2

SELECT lname, REPLACE(lname,'- Hob','') as LastName FROM #temp_table

SELECT * FROM #temp_table

SELECT * FROM employee_demographics


--Substring
--used to match the string of a certain column
SELECT tm.fname, SUBSTRING(tm.fname,1,3), ed.fname, SUBSTRING(ed.fname,1,3)
FROM employee_demographics ed 
inner join #temp_table tm 
on SUBSTRING(ed.fname,1,3) = SUBSTRING(tm.fname,1,3)


SELECT SUBSTRING(tm.fname,1,3), SUBSTRING(ed.fname,1,3)
FROM #temp_table tm  
join employee_demographics ed 
on SUBSTRING(tm.fname,1,3) = SUBSTRING(ed.fname,1,3)


--Using upper and lower
SELECT fname, Lower(fname) as LowerCased FROM #temp_table


SELECT fname, Upper(fname) as UpperCased FROM #temp_table