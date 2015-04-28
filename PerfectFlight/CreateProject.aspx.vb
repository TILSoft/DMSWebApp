
Partial Class Application_CreateProject
    Inherits System.Web.UI.Page

    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        odsCreateProj.InsertParameters("ProjStatus").DefaultValue = 10
      
    End Sub

 

    Protected Sub odsCreateProj_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles odsCreateProj.Inserted
        Dim projadap As New PefectFlightTableAdapters.QueriesTableAdapter
        Dim projid As Integer = projadap.MaxPFID
        Response.Redirect("ManageProjTasks.aspx?Projid=" & projid)

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Dim projid As Integer = GridView1.SelectedDataKey.Value
        Response.Redirect("ManageProjTasks.aspx?Projid=" & projid)

    End Sub

    Protected Sub FormView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewPageEventArgs) Handles FormView1.PageIndexChanging

    End Sub
End Class
