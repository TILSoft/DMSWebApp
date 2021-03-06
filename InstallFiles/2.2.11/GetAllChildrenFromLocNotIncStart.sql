use downtimedbv3

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetAllChildrenFromLocNotIncStart]
       (
       @LocID int
       )
RETURNS @temptbl TABLE (LocID int, LevelID int)
AS
       BEGIN

               DECLARE @LevelID int

               Select @LevelID = 0

				if @locID = 0 or @locID = 1 
					insert into @temptbl select LocID,@LevelID from tblLoc where ParentLocID = @LocID
				else
					insert into @temptbl select LocID,@LevelID from tblLoc where LocID = @LocID
				
               While @@rowcount>0
               BEGIN

       select @LevelID = @LevelID +1

               Insert into @temptbl SELECT     tblLoc.LocID, @LevelID
                                    FROM         tblLoc
                                    WHERE     tblLoc.ParentLocID IN (select LocID
from @temptbl where levelID = @LevelID-1)


               END


       RETURN
       END
