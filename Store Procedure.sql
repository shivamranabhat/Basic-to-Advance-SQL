 CREATE PROCEDURE INSERT_UPDATE_EMPLOYEE 
 (@fname varchar(20), @lname varchar(20), @age int, @gender varchar(20))
  AS
  BEGIN
	 IF EXISTS(SELECT * FROM employee_demographics WHERE fname = @fname AND lname = @lname)
	 BEGIN 
	 UPDATE employee_demographics SET fname = @fname, lname = @lname, age = @age, gender = @gender WHERE fname = @fname AND lname = @lname
	 END
	 ELSE
	 BEGIN
	 INSERT INTO employee_demographics VALUES(@fname,@lname,@age,@gender)
	 END
  END

  EXEC INSERT_UPDATE_EMPLOYEE @fname = 'Barbie', @lname='Sef',@age=20,@gender='female'