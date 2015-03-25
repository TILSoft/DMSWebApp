Imports dotnetCHARTING
Partial Class FrontEnd_DataAnalysis_LossAnalysisByMonth
    Inherits System.Web.UI.Page
    Dim SC As New SeriesCollection
    Dim Slottime As New Series
    Dim Slotdt As New Series
    Dim sCOtime As New Series
    Dim sCODT As New Series
    Dim sUnacc As New Series


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LossAnalysisChart.YAxis.Scale = dotnetCHARTING.Scale.Stacked
        LossAnalysisChart.YAxis.Label.Text = "Minutes"
        GridView1.DataBind()

        LossAnalysisChart.SeriesCollection.Add(Slottime)
        LossAnalysisChart.SeriesCollection.Add(Slotdt)
        LossAnalysisChart.SeriesCollection.Add(sCOtime)
        LossAnalysisChart.SeriesCollection.Add(sCODT)
        LossAnalysisChart.SeriesCollection.Add(sUnacc)

    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            If e.Row.Cells(4).Text = "&nbsp;" Then
                e.Row.Cells(4).Text = 0
            End If

            Dim ele As New Element
            ele.Name = e.Row.Cells(0).Text
            ele.YValue = e.Row.Cells(4).Text
            ele.Color = Drawing.Color.Green
            Slottime.Name = "Lot Running time"
            Slottime.AddElements(ele)


            If e.Row.Cells(3).Text = "&nbsp;" Then
                e.Row.Cells(3).Text = 0
            End If

            Dim ele2 As New Element
            ele2.Name = e.Row.Cells(0).Text
            ele2.YValue = e.Row.Cells(3).Text
            ele2.Color = Drawing.Color.Red
            Slotdt.Name = "Lot Downtime"
            Slotdt.AddElements(ele2)


            If e.Row.Cells(7).Text = "&nbsp;" Then
                e.Row.Cells(7).Text = 0
            End If

            Dim ele3 As New Element
            ele3.Name = e.Row.Cells(0).Text
            ele3.YValue = e.Row.Cells(7).Text
            ele3.Color = Drawing.Color.Yellow
            sCOtime.Name = "Change Over Time"
            sCOtime.AddElements(ele3)


            If e.Row.Cells(6).Text = "&nbsp;" Then
                e.Row.Cells(6).Text = 0
            End If

            Dim ele5 As New Element
            ele5.Name = e.Row.Cells(0).Text
            ele5.YValue = e.Row.Cells(6).Text
            ele5.Color = Drawing.Color.Orange
            sCODT.Name = "Change Over Down time"
            sCODT.AddElements(ele5)


            If e.Row.Cells(1).Text = "&nbsp;" Then
                e.Row.Cells(1).Text = 0
            End If

            Dim ele6 As New Element
            ele6.Name = e.Row.Cells(0).Text
            ele6.YValue = e.Row.Cells(1).Text - ele5.YValue - ele3.YValue - ele2.YValue - ele.YValue
            sUnacc.Name = "Unaccounted Time"
            ele6.Color = Drawing.Color.White
            sUnacc.AddElements(ele6)

        End If







    End Sub
End Class
