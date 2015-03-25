
Partial Class SafeHouse_timelinetest
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        TimeLine21.Width = 800
        TimeLine21.starttime = Now()
        TimeLine21.endtime = DateAdd(DateInterval.Day, 1, Now())


        TimeLine21.AddtoCollection(DateAdd(DateInterval.Hour, 2, Now()), DateAdd(DateInterval.Hour, 4, Now()), Drawing.Color.Red, "james dinniss &crlf; is so cool", "../frontend/wshome.aspx")
        TimeLine21.AddtoCollection(DateAdd(DateInterval.Hour, 6, Now()), DateAdd(DateInterval.Hour, 7, Now()), Drawing.Color.Orange, "james dinniss &crlf; is so cool", "../frontend/wshome.aspx")
        TimeLine21.AddtoCollection(DateAdd(DateInterval.Hour, 9, Now()), DateAdd(DateInterval.Hour, 10, Now()), Drawing.Color.Green, "james dinniss &crlf; is so cool", "../frontend/wshome.aspx")

        TimeLine21.Create()






    End Sub
End Class
