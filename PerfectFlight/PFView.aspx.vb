
Partial Class PerfectFlight_PFView
    Inherits System.Web.UI.Page
    Dim db As New PFLinqDataContext
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim pfcopy As New PerfectFlightHandlers
        pfcopy.CopyPFtoExecuteTable(8693, Now())

        Dim ActivityID As Integer = Request.QueryString("ActivityID")






    End Sub
End Class
