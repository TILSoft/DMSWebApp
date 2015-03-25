
Partial Class FrontEnd_DataAnalysis_PeriodCalculation

    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            txtStartTime.Text = "24/07/08 00:00:00" ' DateAdd(DateInterval.Day, -1.5, Now())
            txtEndTime.Text = "27/07/08 00:00:00" 'DateAdd(DateInterval.Day, 0.7, Now())
        End If
        Dim RCIDadap As New LocationsTableAdapters.QueriesTableAdapter
        txtRCLocID.Text = RCIDadap.GetRCLocIDFromSymptomLocID(txtLocID.Text)

        '




    End Sub



    Protected Sub btnGo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGo.Click
        GridView1.DataBind()

    End Sub


    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        Dim scShift As New dotnetCHARTING.Series
        Dim ele As New dotnetCHARTING.Element

        If e.Row.RowType = DataControlRowType.DataRow Then

            ele.YDateTimeStart = e.Row.Cells(1).Text
            ele.YDateTime = e.Row.Cells(2).Text
            ele.ToolTip = DateDiff(DateInterval.Minute, ele.YDateTimeStart, ele.YDateTime)
            ele.Color = Drawing.Color.Red
            scShift.AddElements(ele)
        End If

        Chart1.SeriesCollection.Add(scShift)

    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim scShift As New dotnetCHARTING.Series
        Dim ele As New dotnetCHARTING.Element

        If e.Row.RowType = DataControlRowType.DataRow Then

            ele.YDateTimeStart = e.Row.Cells(2).Text
            ele.YDateTime = e.Row.Cells(3).Text
            ele.ToolTip = DateDiff(DateInterval.Minute, ele.YDateTimeStart, ele.YDateTime)

            If e.Row.Cells(4).Text = 1 Then

                ele.Color = Drawing.Color.Green
            Else

                ele.Color = Drawing.Color.Pink

            End If

            scShift.AddElements(ele)
        End If

        Chart1.SeriesCollection.Add(scShift)
    End Sub

    Protected Sub GridView3_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView3.RowDataBound
        Dim scShift As New dotnetCHARTING.Series
        Dim ele As New dotnetCHARTING.Element

        If e.Row.RowType = DataControlRowType.DataRow Then

            ele.YDateTimeStart = e.Row.Cells(1).Text
            ele.YDateTime = e.Row.Cells(2).Text
            ele.ToolTip = DateDiff(DateInterval.Minute, ele.YDateTimeStart, ele.YDateTime)

            ele.Color = Drawing.Color.Purple

            scShift.AddElements(ele)
        End If

        Chart1.SeriesCollection.Add(scShift)
    End Sub

    Protected Sub GridView4_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView4.RowDataBound
        Dim scShift As New dotnetCHARTING.Series
        Dim ele As New dotnetCHARTING.Element

        If e.Row.RowType = DataControlRowType.DataRow Then
          
            If e.Row.Cells(1).Text = "&nbsp;" Then

            Else
                ele.Name = e.Row.Cells(0).Text
                ele.YValue = CInt(e.Row.Cells(1).Text)
                ele.Color = Drawing.Color.Purple

                scShift.AddElements(ele)
            End If

        End If

            OEEChart.SeriesCollection.Add(scShift)
    End Sub
End Class
