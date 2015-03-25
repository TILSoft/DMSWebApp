Imports dotnetCHARTING
Partial Class FrontEnd_DataAnalysis_Default
    Inherits System.Web.UI.Page

    Dim OEESC As New SeriesCollection
    Dim AvailSC As New SeriesCollection
    Dim PerfSC As New SeriesCollection
    Dim QualSC As New SeriesCollection

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound


        If e.Row.RowType = DataControlRowType.DataRow Then

            If e.Row.Cells(6).Text = "&nbsp;" Then
                e.Row.Cells(6).Text = 0
            End If

            Dim oeeS As New Series
            Dim oeeele As New Element
            oeeele.Name = e.Row.Cells(0).Text
            oeeele.YValue = e.Row.Cells(6).Text
            oeeS.AddElements(oeeele)

            If e.Row.Cells(5).Text = "&nbsp;" Then
                e.Row.Cells(5).Text = 0
            End If

            Dim availS As New Series
            Dim availele As New Element
            availele.Name = e.Row.Cells(0).Text
            availele.YValue = e.Row.Cells(5).Text
            availS.AddElements(availele)

            If e.Row.Cells(4).Text = "&nbsp;" Then
                e.Row.Cells(4).Text = 0
            End If

            Dim perfs As New Series
            Dim Perfele As New Element
            Perfele.Name = e.Row.Cells(0).Text
            Perfele.YValue = e.Row.Cells(4).Text
            perfs.AddElements(Perfele)

            OEESC.Add(oeeS)
            AvailSC.Add(availS)
            PerfSC.Add(perfs)

        End If










    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        GridView1.DataBind()


        ChartOEE.YAxis.Label.Text = "Minutes"
        chartAvail.YAxis.Label.Text = "Minutes"
        ChartPerf.YAxis.Label.Text = "Minutes"

        ChartOEE.SeriesCollection.Add(OEESC)
        chartAvail.SeriesCollection.Add(AvailSC)
        ChartPerf.SeriesCollection.Add(PerfSC)

    End Sub
End Class
