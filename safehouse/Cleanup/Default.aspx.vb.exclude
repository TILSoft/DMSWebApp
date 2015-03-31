
Partial Class test_Default
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Threading.Thread.Sleep(5000)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Button1.Attributes.Add("onclick", ClientScript.GetPostBackEventReference(Button1, "") & ";this.value='Please wait...';this.disabled = true;")

    End Sub
End Class
