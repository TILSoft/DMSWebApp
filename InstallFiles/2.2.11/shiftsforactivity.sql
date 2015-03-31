USE [Downtimedbv3]
GO
/****** Object:  UserDefinedFunction [dbo].[ShiftsForActivity]    Script Date: 01/17/2009 14:08:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ShiftsForActivity] 
(
	-- Add the parameters for the function here
@ActivityID int

)
RETURNS varchar(1000)
AS
BEGIN
-- return variable	

DECLARE @strShifts varchar(1000)

SELECT @strShifts = convert(varchar,coalesce(@strShifts +',', ''))  + convert(varchar, b.shiftteam) 
FROM  tblActivity a INNER JOIN
               tblShifts b ON a.StartTime < b.ShiftEnd AND a.endtime > b.ShiftStart
where a.activityid = @activityid and b.locid = a.locidsymp

RETURN @strShifts

END







