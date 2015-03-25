Imports dotnetCHARTING

Partial Class FrontEnd_DataAnalysis_DowntimeDrilldownbyLocation
    Inherits System.Web.UI.Page

    Dim chtSeries As New dotnetCHARTING.Series
    Dim pathhlp As New Helpers


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            If Not Request.QueryString("LocID") = Nothing Then
                Session("DTLocID") = Request.QueryString("LocID")
                Literal1.Text = pathhlp.getlocpath(Session("DTLocID"), "DowntimeDrillDownByLocation.aspx", "&StartDate=" & txtStartDate.Text & "&enddate=" & txtEndDate.Text, 0)

            Else
                Session("DTLocID") = 0
            End If

            txtStartDate.Text = DateAdd(DateInterval.Month, -1, Now())
            txtEndDate.Text = Now()

        End If

        Chart1.SeriesCollection.Clear()
        Chart1.DefaultAxis.SpacingPercentage = 10
        Chart1.YAxis.Label.Text = "Minutes"
        chtSeries.PaletteName = Palette.Spring
        GridView1.DataBind()
        Chart1.SeriesCollection.Add(chtSeries)
    End Sub


    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        Dim ele As New dotnetCHARTING.Element

        If e.Row.RowType = DataControlRowType.DataRow Then

            If Not e.Row.Cells(1).Text = "&nbsp;" Then

                ele.YValue = e.Row.Cells(1).Text
                ele.Name = e.Row.Cells(0).Text
                ele.URL = "DowntimeDrilldownByLocation.aspx?LocID=" & e.Row.Cells(2).Text
                ele.ToolTip = CInt(e.Row.Cells(1).Text)

                chtSeries.AddElements(ele)

            End If

        End If
    End Sub

    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand
        Session("DTLocID") = e.CommandArgument
        Literal1.Text = pathhlp.getlocpath(Session("DTLocID"), "DowntimeDrillDownByLocation.aspx", "&StartDate=" & txtStartDate.Text & "&enddate=" & txtEndDate.Text, 0)
        Dim i As Integer


        DataList1.DataBind()

        For i = 0 To chtSeries.Elements.Count - 1
            chtSeries.Elements.RemoveAt(0)

        Next i

        Chart1.SeriesCollection.Clear()

        GridView1.DataBind()
        Chart1.SeriesCollection.Add(chtSeries)

        GridView2.DataBind()


    End Sub

    Protected Sub GridView2_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView2.PageIndexChanging
        TabContainer1.ActiveTabIndex = 1

    End Sub

    Protected Sub BtnGetData_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnGetData.Click
        GridView1.DataBind()
        GridView2.DataBind()
    End Sub
End Class
