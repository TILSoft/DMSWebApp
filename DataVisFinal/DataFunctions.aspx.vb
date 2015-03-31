Imports dotnetCHARTING
Partial Class FrontEnd_DataVisualisation_AllActiivtyAnalysis
    Inherits System.Web.UI.Page
    Public SCact As New dotnetCHARTING.Series
    Public scTarget As New dotnetCHARTING.Series
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            txtStart.Text = DateAdd(DateInterval.Month, -1, Now())
            txtEnd.Text = Now()
            Session("DataBtnLocID") = 0
        End If
    End Sub


    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand
        TextBox1.Text = e.CommandArgument
        Session("DataBtnLocID") = e.CommandArgument

        DataList1.DataBind()
    End Sub
End Class
