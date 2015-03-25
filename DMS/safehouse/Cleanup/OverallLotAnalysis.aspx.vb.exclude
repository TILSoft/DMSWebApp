
Partial Class FrontEnd_DataAnalysis_LotAnalysis
    Inherits System.Web.UI.Page

    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand
        Session("lotLocid") = e.CommandArgument
        Dim RClocadap As New LocationsTableAdapters.QueriesTableAdapter
        Session("lotRCLocID") = RClocadap.GetRCLocIDFromSymptomLocID(CInt(Session("lotlocid")))

        
        GridView1.DataBind()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtstart.Text = DateAdd(DateInterval.Month, -3, Now())
        txtend.Text = Now()

        Session("LotStartTime") = txtstart.Text
        Session("LotEndTime") = txtend.Text

    End Sub

    
End Class
