
Partial Class FrontEnd_DataAnalysis_OEEbyPeriod
    Inherits System.Web.UI.Page

    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand
        Session("OEELocID") = e.CommandArgument

        Dim RClocadap As New LocationsTableAdapters.QueriesTableAdapter
        Session("OEERCLocID") = RClocadap.GetRCLocIDFromSymptomLocID(CInt(Session("OEELocID")))

        GridView1.DataBind()


    End Sub

    Protected Sub Page_PreLoad(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreLoad

        If Not Page.IsPostBack Then
            txtStart.Text = DateAdd(DateInterval.Day, -30, Now())
            txtEnd.Text = Now()
        End If

    End Sub
End Class
