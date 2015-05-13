
Partial Class zAdministration_EventViewer
    Inherits System.Web.UI.Page
    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand

        If e.CommandName = "xDelete" Then
            Dim dk As Integer = GridView1.DataKeys(e.CommandArgument).Value
            Dim qadap As New DAQEventsTableAdapters.QueriesTableAdapter
            qadap.DeleteEvent(dk)
            GridView1.DataBind()

        End If
    End Sub
End Class
