
Partial Class FrontEnd_popDTstart
    Inherits System.Web.UI.Page

    Protected Sub btnAccept_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAccept.Click
        Dim useradap As New UsersTableAdapters.QueriesTableAdapter
        Dim userpass As Integer = useradap.checkUserPass(TxtUsername.Text, TxtPassword.Text)
        If userpass > 0 Then
            txtUser.Text = useradap.UserIdbyUserName(TxtUsername.Text)
        Else
            txtUser.Text = 0
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TxtTime.Text = Now()
    End Sub

 
End Class
