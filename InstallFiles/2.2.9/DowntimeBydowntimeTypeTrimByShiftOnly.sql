USE [Downtimetest]
GO
/****** Object:  UserDefinedFunction [dbo].[DowntimeByDowntimeTypeTrimByShiftOnly]    Script Date: 12/08/2008 10:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DowntimeByDowntimeTypeTrimByShiftOnly] 
(
	-- Add the parameters for the function here
@LocID int,
@PeriodStart datetime,
@PeriodEnd datetime,
@ActType int,
@DowntimeType int 

)
RETURNS int
AS
BEGIN
-- return variable	
	DECLARE @totaldowntime int

-- function
    DECLARE @trimShift  TABLE (SID int, ShiftStart datetime, ShiftEnd datetime) 
	Declare @RCLocID int
	Declare @trimDowntimes  TABLE (LotCODowntimeID int IDENTITY(1,1), DowntimeStart datetime, Downtimeend datetime, lotCOID int, DowntimeID int) 

-- get the root cause location ID 
	select @RClocID = RootCauseLocID from tblLocLink where SymptomLocid = @LociD

--shifts
	INSERT INTO @trimshift
		SELECT ShiftID, ShiftStart, ShiftEnd from dbo.tblshifts where Shiftstart < @PeriodEnd and shiftend > @PeriodStart and LocID = @LocID
	
	UPDATE @trimshift set Shiftstart = @PeriodStart where shiftstart < @PeriodStart
    UPDATE @trimshift set shiftend = @PeriodEnd where shiftend > @PeriodEnd

--downtime

INSERT INTO @trimDowntimes

SELECT tbldowntime.Downtimestart, tbldowntime.Downtimeend,z.SID,tbldowntime.DowntimeID
FROM  @trimShift z CROSS JOIN
               tblRemedy INNER JOIN
               tbldowntime ON tblRemedy.RemedyID = tbldowntime.RemedyID INNER JOIN
               tblRootCause ON tblRemedy.RootCauseID = tblRootCause.RootCauseID INNER JOIN
               dbo.GetAllChildrenFromLoc(@RCLocID) AS GetAllChildrenFromLoc_1 
				ON tblRootCause.RootCauseLocID = GetAllChildrenFromLoc_1.LocID
				inner join tblactivity ON tblactivity.activityid = tbldowntime.downtimelotid
				inner join tblsymptom ON tbldowntime.tempsymptomid = tblsymptom.symptomID
WHERE (tbldowntime.downtimestart < z.ShiftEnd) AND (tbldowntime.downtimeend> z.shiftstart) AND tblactivity.activitytype = @Acttype AND tblsymptom.DTType = @DowntimeType


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
	SELECT @totdt = sum(datediff(s,downtimestart,downtimeend))/60 from @trimdowntimes 


if @totdt is null 
select @totaldowntime = 0 else
select @totaldowntime = @totdt
	
	-- Return the result of the function
	RETURN @totaldowntime

END












