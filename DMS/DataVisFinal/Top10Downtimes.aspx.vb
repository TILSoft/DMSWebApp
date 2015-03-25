
Partial Class FrontEnd_DataVisualisation_Top10Downtimes
    Inherits System.Web.UI.Page

    Dim symseries As New dotnetCHARTING.Series

    Dim rcseries As New dotnetCHARTING.Series

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            txtStart.Text = DateAdd(DateInterval.Month, -1, Now())
            txtEnd.Text = Now()
            RadioButtonList1.DataBind()
            RadioButtonList1.SelectedIndex = 0
            RadioButtonList2.DataBind()
            RadioButtonList2.SelectedIndex = 3

        End If

    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        Dim rcadap As New LocationsTableAdapters.QueriesTableAdapter

        lblRCId.Text = rcadap.GetRCLocIDFromSymptomLocID(RadioButtonList1.SelectedValue)


    End Sub

    Protected Sub GridView2_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.DataBound

        If GridView2.Rows.Count > 0 Then

            Chart2.SeriesCollection.Add(rcseries)
            Chart2.Title = "Line: " & RadioButtonList1.SelectedItem.Text & " ¦ Activity: " & RadioButtonList2.SelectedItem.Text & " ¦ Start Date: " & txtStart.Text & " ¦ End date: " & txtEnd.Text
        End If
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim pathadap As New Helpers
            e.Row.Cells(3).Text = pathadap.getlocpathnolink(e.Row.Cells(2).Text, 0)

            Dim ele As New dotnetCHARTING.Element
            ele.YValue = e.Row.Cells(0).Text
            ele.Name = e.Row.Cells(1).Text
            ele.ToolTip = e.Row.Cells(0).Text
            ele.URL = "Top10Details.aspx?LocID=" & e.Row.Cells(2).Text & "&Starttime=" & txtStart.Text & "&Endtime=" & txtEnd.Text & "&ActType=" & RadioButtonList2.SelectedValue & "&SympLocID=" & RadioButtonList1.SelectedValue
            rcseries.Elements.Add(ele)
        End If

    End Sub

    Protected Sub RadioButtonList2_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList2.DataBound
        Dim lstitem As New ListItem
        lstitem.Text = "Select All"
        lstitem.Value = "%"
        RadioButtonList2.Items.Add(lstitem)
    End Sub


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

    End Sub
End Class
