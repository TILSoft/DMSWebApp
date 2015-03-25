
Partial Class FrontEnd_popDTstart
    Inherits System.Web.UI.Page

    Protected Sub btnAccept_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAccept.Click
        Dim useradap As New UsersTableAdapters.QueriesTableAdapter


        If pnlTech.Visible = True Then
            Dim userpass As Integer = useradap.UserPassCheckbyLevel(TxtTechUser.Text, txtTechPass.Text, 1)
            If userpass > 0 Then
                txtTechUserID.Text = useradap.UserIdbyUserName(TxtTechUser.Text)
            Else
                txtTechUserID.Text = 0
            End If
        End If

        If pnlEng.Visible = True Then
            Dim userpass As Integer = useradap.UserPassCheckbyLevel(TxtEngUser.Text, txtEngPass.Text, 2)
            If userpass > 0 Then
                TxtEngUserID.Text = useradap.UserIdbyUserName(TxtEngUser.Text)
            Else
                txtTechUserID.Text = -1
            End If


        End If


        If pnlExec.Visible = True Then
            Dim userpass As Integer = useradap.UserPassCheckbyLevel(TxtExecUser.Text, txtExecPass.Text, 3)
            If userpass > 0 Then
                txtExecUserID.Text = useradap.UserIdbyUserName(TxtExecUser.Text)
            Else
                txtTechUserID.Text = -2
            End If


        End If




    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TxtTime.Text = Now()
        Dim authreq As Integer = Request.Cookies("AuthReq").Value

        Select Case authreq
            Case 1
                pnlTech.Visible = True
                pnlEng.Visible = False
                pnlExec.Visible = False
            Case 2
                pnlTech.Visible = True
                pnlEng.Visible = True
                pnlExec.Visible = False

            Case 3
                pnlTech.Visible = True
                pnlEng.Visible = False
                pnlExec.Visible = True

        End Select


    End Sub

 
End Class
