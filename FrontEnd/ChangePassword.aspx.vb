
Partial Class FrontEnd_ChangePassword
    Inherits System.Web.UI.Page

    Protected Sub BtnChangePass_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnChangePass.Click

        'check old password is correct

        Dim passadap As New UsersTableAdapters.QueriesTableAdapter
        Dim pass As Integer = passadap.checkUserPass(txtUser.Text, txtOldPass.Text)


        If pass > 0 Then

            'check new passwords match

            If txtNewPass.Text = txtNewPass2.Text Then

                'update new passwrod
                Dim userid As Integer = passadap.UserIdbyUserName(txtUser.Text)
                passadap.ResetPassword(txtNewPass.Text, userid)
                'redirect to home page 

                Response.Redirect("WShome.aspx")


            Else

                lblmessage.text = "Your two new passwords do not match"
            End If

        Else

            lblmessage.text = "You have entered and incorrect password for your old password"

        End If


    End Sub
End Class
