
Partial Class zAdministration_EditRemedy
    Inherits System.Web.UI.Page

    Protected Sub DetailsView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewPageEventArgs) Handles DetailsView1.PageIndexChanging

    End Sub

    Protected Sub lnkRC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkRC.Click
        Response.Redirect("editremedyrootcause.aspx?remedy=" & Request.QueryString("remedy"))

    End Sub
End Class
