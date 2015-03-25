
Partial Class zAdministration_FillWeeks
    Inherits System.Web.UI.Page



    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim wkdate As Date = txtStart.Text

        Dim wkstart As DateTime
        Dim wkend As DateTime
        Dim wkadap As New OEETableAdapters.tblWeekTableAdapter

        wkadap.deletequery()

        Do Until CDate(wkdate) > CDate(txtEnd.Text)


            If Weekday(wkdate) = 1 Then

                wkstart = wkdate
                wkadap.Insert(wkstart, DateAdd(DateInterval.Day, 7, wkstart))

            End If


            wkdate = DateAdd(DateInterval.Day, 1, wkdate)
        Loop






    End Sub
End Class
