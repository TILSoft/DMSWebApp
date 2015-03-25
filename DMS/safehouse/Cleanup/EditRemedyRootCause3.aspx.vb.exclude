
Partial Class zAdministration_EditRemedyRootCause
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim hlp As New Helpers
        If hlp.checkloginstatus(User.Identity.Name, 4) <= 0 Then
            Response.Redirect("AccessDenied.aspx")
        End If


        Dim RCfromRemadap As New RootCauseRemedyTableAdapters.QueriesTableAdapter
        Session("RCID") = RCfromRemadap.RootCauseIDfromRemedy(Request.QueryString("remedy"))
        DetailsView1.DataBind()


    End Sub

End Class
