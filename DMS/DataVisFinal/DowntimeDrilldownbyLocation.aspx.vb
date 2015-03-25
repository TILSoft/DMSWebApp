Imports dotnetCHARTING

Partial Class FrontEnd_DataAnalysis_DowntimeDrilldownbyLocation
    Inherits System.Web.UI.Page

    Dim chtSeries As New dotnetCHARTING.Series
    Dim pathhlp As New Helpers

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            txtStartDate.Text = DateAdd(DateInterval.Month, -1, Now())
            txtEndDate.Text = Now()

            If Not Request.QueryString("LocID") = Nothing Then

                Session("DTLocID") = Request.QueryString("LocID")
                txtStartDate.Text = Request.QueryString("startdate")
                txtEndDate.Text = Request.QueryString("enddate")
                RadioButtonList2.SelectedIndex = Request.QueryString("MachineLocID")
                RadioButtonList1.SelectedIndex = Request.QueryString("Acttype")

         
            Else
                Session("DTLocID") = 0
                Chart1.Visible = False
                GridView1.Visible = False
            End If

        Else


        End If

        Chart1.SeriesCollection.Clear()
        Chart1.DefaultAxis.SpacingPercentage = 10
        Chart1.YAxis.Label.Text = "Minutes"
        chtSeries.PaletteName = Palette.Spring
        '  Chart1.SeriesCollection.Add(chtSeries)
    End Sub

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound
        If GridView1.Rows.Count > 0 Then
            Chart1.Title = "Line: " & RadioButtonList2.SelectedItem.Text & " ¦ Activity: " & RadioButtonList1.SelectedItem.Text & " ¦ Start Date: " & txtStartDate.Text & " ¦ End date: " & txtEndDate.Text
            Chart1.SeriesCollection.Add(chtSeries)
        End If
    End Sub


    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        Dim ele As New dotnetCHARTING.Element

        If e.Row.RowType = DataControlRowType.DataRow Then

            If Not e.Row.Cells(1).Text = "&nbsp;" Then

                Dim annot As New Annotation



                ele.YValue = e.Row.Cells(1).Text
                ele.Name = e.Row.Cells(0).Text
                ele.URL = "DowntimeDrilldownByLocation.aspx?LocID=" & e.Row.Cells(2).Text & "&startdate=" & txtStartDate.Text & "&enddate=" & txtEndDate.Text & "&Acttype=" & RadioButtonList1.SelectedIndex & "&MachineLocID=" & RadioButtonList2.SelectedIndex

                ele.ToolTip = CInt(e.Row.Cells(1).Text)

                chtSeries.AddElements(ele)

            End If

        End If
        '     Chart1.SeriesCollection.Add(chtSeries)

    End Sub


    Protected Sub GridView2_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView2.PageIndexChanging
        TabContainer1.ActiveTabIndex = 1

    End Sub


    Protected Sub RadioButtonList1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.DataBound

        Dim RBLitem As New ListItem

        RBLitem.Value = "%"
        RBLitem.Text = "All"
        RadioButtonList1.Items.Add(RBLitem)
        RadioButtonList1.SelectedIndex = Request.QueryString("ActType")

        GridView1.DataBind()

        Literal1.Text = pathhlp.getlocpath(Session("DTLocID"), "DowntimeDrillDownByLocation.aspx", "&startdate=" & HttpUtility.UrlEncode(txtStartDate.Text) & "&enddate=" & HttpUtility.UrlEncode(txtEndDate.Text) & "&Acttype=" & RadioButtonList1.SelectedIndex & "&MachineLocID=" & RadioButtonList2.SelectedIndex, 0)



    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim RCadap As New LocationsTableAdapters.QueriesTableAdapter
        Session("DTLocID") = RCadap.GetRCLocIDFromSymptomLocID(RadioButtonList2.SelectedValue)
        GridView1.Visible = True
        Chart1.Visible = True

        GridView1.DataBind()
    End Sub


    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        Literal1.Text = pathhlp.getlocpath(Session("DTLocID"), "DowntimeDrillDownByLocation.aspx", "&startdate=" & HttpUtility.UrlEncode(txtStartDate.Text) & "&enddate=" & HttpUtility.UrlEncode(txtEndDate.Text) & "&Acttype=" & RadioButtonList1.SelectedIndex & "&MachineLocID=" & RadioButtonList2.SelectedIndex, 0)

    End Sub

    Protected Sub RadioButtonList2_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList2.DataBound
        RadioButtonList2.SelectedIndex = Request.QueryString("machinelocid")
    End Sub

    Protected Sub GridView1_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GridView1.Sorting

    End Sub
End Class
