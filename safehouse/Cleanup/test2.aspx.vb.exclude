
Partial Class safehouse_test2
    Inherits System.Web.UI.Page

    Protected Sub Page_load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim mybtn As New LinkButton
        mybtn.Text = "new button"
        mybtn.CommandArgument = 3
        PlaceHolder1.Controls.Add(mybtn)

        AddHandler mybtn.Click, AddressOf mybtn_click


    End Sub

    Sub mybtn_click(ByVal sender As Object, ByVal e As EventArgs)



        Response.Write("updated")


    End Sub
End Class
