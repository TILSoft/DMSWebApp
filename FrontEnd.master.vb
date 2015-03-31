
Partial Class FrontEnd
    Inherits System.Web.UI.MasterPage

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click

        Dim AdapUser As New UsersTableAdapters.QueriesTableAdapter
        Dim userLevel As Integer = AdapUser.UserLevelByName(Right(Page.User.Identity.Name, Len(Page.User.Identity.Name) - 7))

        If userLevel = 0 Then
            Response.Redirect("~/Visonly/wshome.aspx")
        ElseIf userLevel > 0 Then
            Dim locid As Integer = Request.Cookies("DMSWorkstation")("Workstation")
            Dim adapAsset As New AssetTableAdapters.QueriesTableAdapter
            If adapAsset.DAQHomePage(locid) = True Then
                Response.Redirect("~/daqfrontend/daqwshome.aspx")
            Else
                Response.Redirect("~/frontend/wshome.aspx")
            End If

        End If

    End Sub
End Class

