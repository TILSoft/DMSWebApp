set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
Create FUNCTION [dbo].[IndividualDowntimeTrimSecs] 
(
	-- Add the parameters for the function here
@DowntimeID int

)
RETURNS int
AS
BEGIN
-- return variable	
	DECLARE @totaldowntime int

-- function
    DECLARE @trimShift  TABLE (SID int, ShiftStart datetime, ShiftEnd datetime) 
	Declare @trimDowntimes  TABLE (LotCODowntimeID int IDENTITY(1,1), DowntimeStart datetime, Downtimeend datetime, lotCOID int, DowntimeID int) 

--shifts

  --get symp root cause id from downtimeidb

	DECLARE	@RCLocID int
	DECLARE @RCMachineLocID int
	DECLARE @SympMachineLocID int
	DECLARE @PeriodStart datetime
	DECLARE @PeriodEnd datetime

		Select @Periodstart = a.downtimestart from tbldowntime a where a.downtimeid = @downtimeid
		Select @PeriodEnd = a.downtimeend from tbldowntime a where a.downtimeid = @downtimeid		
		Select @RCLocID = c.rootcauselocid from tbldowntime a inner join tblremedy b on a.remedyid = b.remedyid inner join tblrootcause c on b.Rootcauseid = c.rootcauseid WHERE a.downtimeid = @downtimeid
		Select @RCMachineLocID = dbo.getrootlocid(@RCLocID,0)
		Select @SympMachineLocID = SymptomLocID from tblloclink where RootCauseLocID = @RCMachineLocID


-- insert shifts into table
	INSERT INTO @trimshift
	SELECT ShiftID, ShiftStart, ShiftEnd from tblshifts  where Shiftstart < @periodend and shiftend > @periodstart and LocID = @SympMachineLocID
	
	UPDATE @trimshift set Shiftstart = @PeriodStart where shiftstart < @PeriodStart
    UPDATE @trimshift set shiftend = @PeriodEnd where shiftend > @PeriodEnd

--downtime

INSERT INTO @trimDowntimes

SELECT b.Downtimestart, b.Downtimeend,a.SID,b.DowntimeID
FROM  @trimShift a CROSS JOIN tbldowntime b WHERE b.downtimeid = @downtimeid

UPDATE @trimDowntimes

SET   h.Downtimestart = g.shiftstart
FROM  @trimDowntimes h INNER JOIN
               @trimshift g ON h.LotCOId = g.SID
WHERE h.downtimestart < g.shiftstart


UPDATE @trimDowntimes
SET       i.Downtimeend = j.shiftend
FROM  @trimDowntimes i INNER JOIN
               @trimshift j ON i.LotCOId = j.SID 
WHERE i.downtimeend > j.shiftend

    declare @totdt int
	SELECT @totdt = sum(datediff(s,downtimestart,downtimeend)) from @trimdowntimes 


if @totdt is null 
select @totaldowntime = 0 else
select @totaldowntime = @totdt
	
	-- Return the result of the function
	RETURN @totaldowntime

END




