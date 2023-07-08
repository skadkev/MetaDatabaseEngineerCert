SELECT *
FROM Employees
WHERE AnnualSalary > (SELECT AnnualSalary FROM Employees WHERE Role = 'Assistant Chef');

--The above query is an example for a requirement of needing to see which employees have a higher salary than the Assistant Chef.
--In this example, the child query is executed first to find the value for the AnnualSalary for the Assitant Chef;  The parent query is then executed to pull all employees that make more than the results of the child query.

SELECT *
FROM Employees
WHERE AnnualSalary <= ALL (SELECT AnnualSalary FROM Employees WHERE Role IN ('Manager', 'Assistant Manager', 'Head Chef', 'Head Waiter'));

SELECT *
FROM Employees
WHERE AnnualSalary >= ANY (SELECT AnnualSalary FROM Employees WHERE Role IN ('Manager', 'Assistant Manager', 'Head Chef', 'Head Waiter'));

SELECT *
FROM Employees
WHERE EXISTS (SELECT * FROM Bookings WHERE Bookings.EmployeeID = Employees.EmployeeID AND Role IN ('Head Chef', 'Head Waiter'));
