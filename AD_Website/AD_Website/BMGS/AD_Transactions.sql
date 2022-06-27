Use BMGS

--This Transaction was created to validate whether a rental could be processed depending on the status of the machine
Go
CREATE PROCEDURE spValidateRental(
@ID varchar(10),
@rdate date,
@emptrn varchar(10),
@supID varchar(10),
@name varchar(50),
@email varchar(50))
AS
Begin
	Declare @status varchar(15)
	Select @status = status From dbo.ComputerInfo() where @ID = hardwareID
	Begin TRANSACTION
		Insert into RENTAL(hardware_ID, rental_date, empTRN, supID, name, email)
		values (@ID, @rdate, @emptrn, @supID, @name, @email)
		IF (@status = 'Rented')
			Begin
				Print 'This Machine is not available and cannot be assigned...'
				ROLLBACK Transaction
			End
		Else
		Begin
			Print 'Hardware assigned.'
			Commit Transaction
		End
	END

Exec spValidateRental 'D2A103', '2018-09-10', '158743209', '814357018', 'Jeremey Mathie', 'jermeym@yahoo.com'

Select * From RENTAL
--------------------------------------------------------------------------------------------------

Select * From MAINTENANCE


