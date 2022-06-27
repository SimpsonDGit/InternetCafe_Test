Use BMGS

--This Procedure was created to update the Maintenance table for the next maintenance date and its maintenance#
Go
Create procedure [dbo].[spUpdateMaintenance] 
@h_id varchar(10),
@newdate date,
@empid nvarchar(50),
@type varchar(50)
AS 
Begin 
	Declare @main# int
	Select @main# = LAST_VALUE(Maintenance#) 
	OVER (Order By Service# ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) From MAINTENANCE 
	where hardware_ID = @h_id

	IF (@main# >= 1)
	Begin
		Set @main# = @main# + 1
		Insert into MAINTENANCE values
		(@h_id,  @main#, @empid, @newdate, @type)
	End
End
--DBCC CHECKIDENT ('MAINTENANCE', RESEED, 0) 
Exec spUpdateMaintenance 'D1A100','2018-12-23','814357018','Servicing'

Select * From MAINTENANCE

--------------------------------------------------------------------------------------------------

--This procedure was created to set/update the status of the hardware devices
Create procedure [dbo].[spDetermineStatus]
@ID varchar(20),
@Status Varchar(20)

AS 
Begin
			If  (@Status = 'A')
			Begin
				Update HARDWARE
				SET Status = 'Available'
				Where hardwareID = @ID
			End
			Else If  (@Status = 'R')
			Begin
				Update HARDWARE
				SET Status = 'Rented'
				Where hardwareID = @ID
			End
			Else If  (@Status = 'D')
			Begin
				Update HARDWARE
				SET Status = 'Damaged'
				Where hardwareID = @ID
			End
			Else If  (@Status = 'M')
			Begin
				Update HARDWARE
				SET Status = 'Maintenance Needed'
				Where hardwareID = @ID
			End
END 
GO

Select * FROM HARDWARE
Exec [ spDetermineStatus] 'Y5L294','A'
Select * FROM HARDWARE
--------------------------------------------------------------------------------------------------

--This procedure was created to modify the value of a machine dependending on its status
Create procedure [dbo].[spModifyValue] 
@id varchar(20),
@value int
AS 
Begin
		Declare @status varchar(20)
		Select @status = status From HARDWARE where hardwareID = @id
		IF (@status = 'Available')
		Begin
			Update COMPUTER
			Set value = @value
			where hardware_ID = @id
		End

		Else IF (@status = 'Damaged')
		Begin
			Update COMPUTER
			Set value = 0
			where hardware_ID = @id
		End
		ELSE IF (@status = 'Maintenance Needed')
		Begin
			Update COMPUTER
			Set value = value - 80
			where hardware_ID = @id
		End
END 
GO

EXECUTE spModifyValue 'D1A100',null
Select * From dbo.ComputerInfo()

--------------------------------------------------------------------------------------------------

--This procedure was created to calculate how many rentals the employees have made
Create procedure [dbo].[spMostRentals]
AS 
Begin 
	Select empTRN, Count(empTRN) AS 'Number of Rentals', Sum(final_cost) as 'Total Sold' From RENTAL Group By empTRN 
END 
GO

Execute spMostRentals
--------------------------------------------------------------------------------------------------

--This procedure was created to filter customers  based on their email and assign them promotions 
GO 
CREATE PROCEDURE [dbo].[spFilterCustomers] 
@address varchar(20)
AS 
BEGIN 
		Declare @promotion varchar(50)
		If (@address = 'gmail')
		Begin
			Set @promotion = '10% off each rental'
			Select Name, email, @promotion as 'Offering' From RENTAL where email Like '%' + @address + '%'
		End
		Else If (@address = 'outlook' OR @address = 'hotmail')
		Begin
			Set @promotion = '%5 off each rental'
			Select Name, email, @promotion as 'Offering' From RENTAL where email Like '%' + @address + '%'
		End
		Else If (@address = 'yahoo')
		Begin
			Set @promotion = '%3 off each rental'
			Select Name, email, @promotion as 'Offering' From RENTAL where email Like '%' + @address + '%'
		End
END 
GO 

Exec spFilterCustomers 'gmail'
Exec spFilterCustomers 'yahoo'

