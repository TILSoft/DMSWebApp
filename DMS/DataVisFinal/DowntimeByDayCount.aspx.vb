Imports dotnetCHARTING
Partial Class DataVisFinal_WeeklyCount
    Inherits System.Web.UI.Page
    Public serCnt As New Series

    Protected Sub BtnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSubmit.Click
        Try


            Dim adapcnt As New DowntimeAnalysisTableAdapters.DowntimeCountByDateTableAdapter
            Dim dtcnt As New DowntimeAnalysis.DowntimeCountByDateDataTable

            dtcnt = adapcnt.GetData(RadioButtonList1.SelectedValue)


            For Each row As DowntimeAnalysis.DowntimeCountByDateRow In dtcnt

                Dim ele As New Element

                ele.YValue = row.count
                ele.Name = row.cDay & "/" & row.cMonth & "/" & row.cYear
                serCnt.AddElements(ele)

            Next


            ChtDailyDowntime.SeriesCollection.Add(serCnt)
        Catch ex As Exception
            Dim err As New Helpers
            err.InsertError(ex.Message, Right(ex.StackTrace, 400), 1)
        End Try


    End Sub
End Class
