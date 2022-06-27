Use BMGS

--This function was created to calculate the cost of rentals for a given period
GO
Create Function DetermineMonthlyProfit(@StartDate Date, @EndDate Date)
Returns int
As
Begin
		Declare @Monthly int
		Select @Monthly = Sum(final_cost) From RENTAL where rental_date >=@StartDate AND rental_date <= @EndDate
		Return @Monthly
End

Select [dbo].DetermineMonthlyProfit('2018-09-01','2018-09-30') as 'Monthly Profit'
------------------------------------------------------------------------------------------------------------

--This function was created to see all hardware devices that are due for renewal in a given period
Go
Create Function MaintenanceCheck(@StartDate Date, @EndDate Date)
Returns Table 
As
	Return Select * From MAINTENANCE Where date >= @StartDate And date <= @EndDate 


SELECT * From [dbo].MaintenanceCheck('2018-09-01','2018-10-30') 
------------------------------------------------------------------------------------------------------------

--This function was created to calculate the final cost per hour for a hardware device
GO
Create Function RentalCost(@ID varchar(10), @hrs int)
Returns int 
As
Begin
	Declare @Total int, @Value int
	Select @Value  =  value From COMPUTER where @ID = hardware_ID
	Set @Total  =  @Value * @hrs
	Return @Total
End

Select dbo.RentalCost('H3X501', 4) as 'Cost for Rent'
------------------------------------------------------------------------------------------------------------

--This function was created to calculate a discount to the final cost
Go 
Create Function CalcDiscount(@hrs int, @ID varchar(10), @ID2 varchar(10))
Returns int
As
Begin
		Declare @total int, @value int, @discount int = 200 

		Select @Value = value From COMPUTER where @ID = hardware_ID
		Set @total = @value * @hrs

		Select @value = value From COMPUTER where @ID2 = hardware_ID
		If (@hrs >= 3)
		Begin
			Set @discount = 300
		End
		Set @total = @total + (@value * @hrs) - @discount
	Return @total
End

Select * From COMPUTER
Select [dbo].CalcDiscount (6, 'H3X501', 'X1P912') as 'Discounted Cost'
------------------------------------------------------------------------------------------------------------

--This function was created to collate information relating to a computer
Go 
Create Function ComputerInfo()
Returns table
As
	Return Select hardwareID, brand, type, os_version, value, status From HARDWARE
	Inner Join COMPUTER ON hardware_ID = hardwareID


Select * From [dbo].ComputerInfo()