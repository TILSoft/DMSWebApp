
Partial Class zAdministration_ManageUsers
    Inherits System.Web.UI.Page

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged

    End Sub

    Protected Sub lnkCreateNewUser_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        DetailsView1.ChangeMode(DetailsViewMode.Insert)
    End Sub

    Protected Sub lnkResetPass_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim passadap As New UsersTableAdapters.QueriesTableAdapter
        passadap.ResetPassword("DMS", DetailsView1.DataKey.Value)

        lblMessage.text = "Password Reset Successfully"


    End Sub

    Protected Sub UserEditODS_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles UserEditODS.Inserted
        GridView1.DataBind()
        DropDownList1.DataBind()

    End Sub

    Protected Sub UserEditODS_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles UserEditODS.Updated
        GridView1.DataBind()
        DropDownList1.DataBind()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim hlp As New Helpers
        If hlp.checkloginstatus(User.Identity.Name, 4) <= 0 Then
            Response.Redirect("AccessDenied.aspx")
        End If

    End Sub
End Class
