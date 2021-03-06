USE [Downtimetest]
GO
/****** Object:  UserDefinedFunction [dbo].[AverageFormatRate]    Script Date: 01/24/2009 20:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AverageFormatRate] 
(
	-- Add the parameters for the function here
@LocID int,
@PeriodStart datetime,
@PeriodEnd datetime,
@lotCo int

)
RETURNS int
AS
BEGIN
-- return variable	
	DECLARE @avgFormatRate int

-- function
    DECLARE @trimShift  TABLE (SID int, ShiftStart datetime, ShiftEnd datetime) 
	DECLARE @trimLotsCOs  TABLE (LotID int, SID int, LotStartDate datetime, LotEndDate datetime,downtime int, formatrate decimal, LotShiftID int IDENTITY(1,1) ) 

	INSERT INTO @trimshift
		SELECT ShiftID, ShiftStart, ShiftEnd from dbo.tblshifts where Shiftstart < @PeriodEnd and shiftend > @PeriodStart and LocID = @LocID
	
	UPDATE @trimshift set Shiftstart = @PeriodStart where shiftstart < @PeriodStart
    UPDATE @trimshift set shiftend = @PeriodEnd where shiftend > @PeriodEnd


	INSERT INTO @trimLotsCOs 

		select tblactivity.activityID, t.sid, tblactivity.starttime, tblactivity.endtime,0,tblformat.operationratepermin
		from tblactivity inner join @trimshift t On tblactivity.endtime >t.shiftstart 
		inner join tblformat on tblactivity.format = tblformat.formatid
		WHERE (tblactivity.starttime < t.shiftend) and tblactivity.LocIDsymp = @locid and tblactivity.activitytype = @lotCO


	UPDATE @trimLotsCOs 
	SET LotStartDate = c.ShiftStart
	FROM @trimLotsCOs d INNER JOIN
    @trimShift c ON d.SID = c.SID AND d.LotStartDate < c.ShiftStart


	UPDATE @trimLotsCOs 
	SET LotEndDate = b.ShiftEnd
	FROM @trimLotsCOs e INNER JOIN
    @trimShift b ON e.SID = b.SID AND e.LotEndDate > b.ShiftEnd

update @trimLotsCOs set downtime = dbo.downtimetrimbyshiftonly(@locid, lotstartdate, lotenddate,1)


   -- Add the T-SQL statements to compute the return value here
declare @totUnits int
declare @tottime int

SELECT @totUnits = sum((datediff(n,lotstartdate,lotenddate)-downtime)*formatrate) from @trimlotsCos
Select @totTime = sum((datediff(n,lotstartdate,lotenddate)-downtime)) from @trimLotsCOs


	-- Return the result of the function

if @totUnits is null
select @avgformatrate = 0 else
select @avgformatrate = @totUnits/@tottime

	RETURN @avgformatrate

END







