
use downtimemanual
declare @monthstart as datetime
declare @monthend as datetime

delete  from tblmonth 

set @monthstart = '01/01/08 00:00:00'
set @monthend = '01/31/08 23:59:59'

while @monthstart < '01/01/40 00:00:00'
begin

insert into tblmonth (monthstart,monthend) values (@monthstart,@monthend)
set @monthstart = dateadd(M,1,@monthstart)
set @monthend =  DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@monthstart)+1,0))

 
end 

