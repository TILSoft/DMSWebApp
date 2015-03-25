
Partial Class FrontEnd
    Inherits System.Web.UI.MasterPage

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click

        'if userlevel = 0 then vis only and no access to the home page

        Dim adapUserCount As New UsersTableAdapters.QueriesTableAdapter
        Dim usercount As Integer = adapUserCount.UserNameCount(Right(Page.User.Identity.Name, Len(Page.User.Identity.Name) - 7))

        If usercount > 0 Then
            Dim AdapUser As New UsersTableAdapters.QueriesTableAdapter
            Dim userLevel As Integer = AdapUser.UserLevelByName(Right(Page.User.Identity.Name, Len(Page.User.Identity.Name) - 7))

            If userLevel = 0 Then
                Response.Redirect("~/Visonly/wshome.aspx")
            ElseIf userLevel > 0 Then
                Response.Redirect("~/frontend/wshome.aspx")
            End If
        End If


    End Sub


    Protected Sub Post1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Post1.Click
        Response.Redirect("wshome.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    
    End Sub
End Class

