
Partial Class FrontEnd_DataAnalysis_MachineAnalysisByMonth
    Inherits System.Web.UI.Page

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        GridView1.DataBind()




    End Sub
End Class
