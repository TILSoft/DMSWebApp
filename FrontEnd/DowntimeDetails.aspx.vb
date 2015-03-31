
Partial Class FrontEnd_DowntimeDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim pathfind As New Helpers
        Dim locidadap As New DowntimeTableAdapters.QueriesTableAdapter

        '  Label1.Text = pathfind.getlocpathnolink(locidadap.RootCauseLocIDByDowntimeID(Request.QueryString("downtimeid")), 0)


    End Sub
End Class
