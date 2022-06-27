Use BMGS

Select * From RENTAL
Select * From MAINTENANCE
Go
Create Trigger SupervisorInfo
On EMPLOYEE 
AFTER Insert 
AS 
BEGIN
	Declare @Count int
	Set @Count =  (Select Max(emp.Count) AS 'Number of Employees' 
	From (Select Count(SupervisorID) as 'Count' From EMPLOYEE GROUP BY SupervisorID) emp)
	Print 'Highest number of employees assigned to a supervisor: ' + Cast(@Count AS Varchar(3))
End
