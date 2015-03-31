
Partial Class zAdministration_EmailByLine
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim adaplineemail As New UsersTableAdapters.tblEmailbyLineTableAdapter
        adaplineemail.Insert(DropDownList1.SelectedValue, RadioButtonList1.SelectedValue)
        GridView1.DataBind()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim hlp As New Helpers
        If hlp.checkloginstatus(User.Identity.Name, 4) <= 0 Then
            Response.Redirect("AccessDenied.aspx")
        End If

        Dim hsAdap As New ConfigTableAdapters.QueriesTableAdapter

        lblHandShake.Text = hsAdap.DateValFromConfigID(3)





    End Sub
End Class
