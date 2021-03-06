set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO

-- gets the efficient time for a certain period on a line
Create FUNCTION [dbo].[EfficientTime] 
(
	-- Add the parameters for the function here
@LocID int,
@PeriodStart datetime,
@PeriodEnd datetime,
@lotCo int

)
RETURNS decimal(15,3)
AS
BEGIN
-- return variable	
	DECLARE @efficienttime decimal(15,3)

-- function
  
	DECLARE @trimLotsCOs  TABLE (LotID int, goodunits decimal(15,3),formatrate decimal(15,3), 
		startdate datetime, enddate datetime,totalprodtime int, actprodtime  decimal(15,3), actoutput  decimal(15,3)) 

	INSERT INTO @trimLotsCOs 

-- select all the activities that fit within the time range.  use the activitytime function to find the activity time
-- when all shifts are taken account of.
	select tblactivity.activityID,goodproduct,f.operationratepermin, tblactivity.starttime, tblactivity.endtime, 
		dbo.activitytime(@locid,tblactivity.starttime,tblactivity.endtime,1) ,
        dbo.activitytime(@locid,tblactivity.starttime,tblactivity.endtime,1),0
		from tblactivity inner join tblformat f on tblactivity.format = f.formatid
		WHERE (tblactivity.starttime < @PeriodEnd ) and (tblactivity.endtime > @periodStart) 
          and tblactivity.LocIDsymp = @locid and tblactivity.activitytype =  @lotCO 
 
-- set the start time of any activity to the ranges start for any activity which overlaps the start time of the time range
update @trimlotsCOS set actprodtime = dbo.activitytime(@locid,@periodStart,enddate,@lotCO) 
where startdate < @periodstart

-- set the end time of any activity to the ranges start for any activity which overlaps the end time of the time range
update @trimlotsCOS set actprodtime = dbo.activitytime(@locid,startdate,@PeriodEnd,@lotCO) 
where enddate > @periodend

-- for all activities generate a good units (any activity which overlaps the start or the end of the period will have its
-- output prorated baseed on the following 
--  units generated in period  = (actualproduction time withing period)/(total production time for lot) * good units for lot

update @trimlotsCOS set actoutput = (actprodtime/totalprodtime) * goodunits where totalprodtime > 0 

-- divide each lots actual output by its format rate and sum to get total efficient time for lot

SELECT  @efficienttime = sum(actoutput/formatrate) from @trimlotsCos

	-- Return the result of the function


	RETURN  @efficienttime

END












