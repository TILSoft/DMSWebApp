
Partial Class FrontEnd_SetWorkStation
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSetWorkStation.Click
        Dim newCookie As HttpCookie = New HttpCookie("DMSWorkstation")
        newCookie.Values.Add("Workstation", DropDownList1.SelectedValue)
        newCookie.Expires = DateAdd(DateInterval.Year, 1, Now())
        Response.Cookies.Add(newCookie)

        Dim locid As Integer = Request.Cookies("DMSWorkstation")("Workstation")
        Dim adapAsset As New AssetTableAdapters.QueriesTableAdapter
        If adapAsset.DAQHomePage(locid) = True Then
            Response.Redirect("~/daqfrontend/daqwshome.aspx")
        Else
            Response.Redirect("~/frontend/wshome.aspx")
        End If





    End Sub




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Label1.Text = Request.Cookies("DMSWorkstation")("Workstation")

    End Sub
End Class
