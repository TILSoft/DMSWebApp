
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[GetAllLocsToBase]
(	
	@StartLoc int, 
	@EndLoc int
)
RETURNS @LocList TABLE (Locid int, Locdesc varchar(50))  
AS
BEGIN

DECLARE @ParentLocID int

INSERT into @LocList select locid,locdescription from tblloc where locid = @StartLoc
SELECT @ParentLocID = Parentlocid from tblloc where locid = @StartLoc

	WHILE @ParentLocID >= @EndLoc
		begin

		INSERT into @locList select locid,locdescription from tblloc where locid = @ParentLocID
		SELECT @ParentLocID = Parentlocid from tblloc where locid = @ParentLocID

		end

RETURN 

END
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

