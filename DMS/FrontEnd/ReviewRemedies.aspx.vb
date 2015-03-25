
Partial Class FrontEnd_ReviewRemedies
    Inherits System.Web.UI.Page

    Public pathhlp As New Helpers

    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand


        Session("RemSympLocID") = e.CommandArgument
        litSympPath.Text = pathhlp.getlocpathWithHome(e.CommandArgument, "ReviewRemedies.aspx", 1)
        GridView1.DataBind()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            If Not Request.QueryString("locID") = "" Then
                Session("RemSympLocID") = Request.QueryString("locID")
                litSympPath.Text = pathhlp.getlocpathWithHome(Session("RemSympLocID"), "ReviewRemedies.aspx", 1)

            End If

        End If
    End Sub

    Protected Sub DataList2_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList2.ItemCommand
        Session("SympID") = e.CommandArgument
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        Dim locpath As New Helpers


        If e.Row.RowType = DataControlRowType.DataRow Then

            e.Row.Cells(4).Text = locpath.getlocpathnolink(GridView1.DataKeys(0).Value, 0)

        End If



    End Sub
End Class
