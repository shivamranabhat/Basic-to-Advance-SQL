--use sql_tutorial


--case statements
SELECT fname,lname,age,gender,
CASE
WHEN age between 20 AND 24 THEN 'Young' WHEN age between 25 and 30 THEN 'Adult' ELSE 'Old'
END
from employee_demographics ORDER BY age


--use case
SELECT ed.fname,ed.lname,ed.age,ed.gender,es.job_title,es.salary,
CASE
   WHEN es.job_title='Salesman' THEN es.salary+(es.salary*0.1)
   WHEN es.job_title='Digital Marketer' THEN es.salary+(es.salary*0.05)
   WHEN es.job_title='IT Officer' THEN es.salary+(es.salary*0.5)
END AS Increased_Salary
from employee_demographics ed
JOIN employee_records er ON ed.id = er.employee_demographics_id
JOIN employee_salaries es ON es.id = er.employee_salaries_id


--CREATE TABLE age_categories (id INT NOT NULL PRIMARY KEY IDENTITY(1,1), employee_demographics_id int not null foreign key references employee_demographics(id),category varchar(50) not null)
SELECT * FROM employee_demographics

SELECT * FROM age_categories

--insert using case statement
INSERT INTO age_categories(employee_demographics_id, category) SELECT employee_demographics.id,
CASE
WHEN employee_demographics.age between 20 AND 24 THEN 'Young' WHEN employee_demographics.age between 25 and 30 THEN 'Adult' ELSE 'Old'
END As category
FROM employee_demographics

UPDATE employee_demographics 
SET gender = 
    CASE 
        WHEN ac.category = 'Old' THEN 'female' 
        ELSE 'male'
    END
FROM age_categories ac 
INNER JOIN employee_demographics ed ON ac.employee_demographics_id = ed.id;

UPDATE employee_demographics SET gender =
CASE
WHEN ac.category = 'Old' THEN 'old_female' 
WHEN ac.category = 'Adult' THEN 'adult_female' 
WHEN ac.category = 'Young' THEN 'young_female' 
END
from age_categories ac 
inner join employee_demographics ed on ac.employee_demographics_id = ed.id

