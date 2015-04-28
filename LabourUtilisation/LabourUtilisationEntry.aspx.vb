
Partial Class LabourUtilisation_LabourUtilisationEntry
    Inherits System.Web.UI.Page

    Public TotalTime As Single


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            txtDate.Text = Now()

        End If
    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim db As New LinqLabourDataContext

        Dim labUtil As New tblLabourUtilisation
        labUtil.Activity = ddlActivity.SelectedValue
        labUtil.Date = CDate(txtDate.Text)
        labUtil.Hours = txtHours.Text
        labUtil.NoStaff = txtNoStaff.Text
        labUtil.Signed = 1
        labUtil.WkCtr = ddlWkCtr.SelectedValue
        labUtil.Shift = ddlShift.SelectedValue

        db.tblLabourUtilisations.InsertOnSubmit(labUtil)
        db.SubmitChanges()

        gvDisplay.DataBind()



    End Sub

    Protected Sub ddlWkCtr_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlWkCtr.SelectedIndexChanged
        gvDisplay.DataBind()

    End Sub

    Protected Sub gvDisplay_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvDisplay.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            Try


                e.Row.Cells(6).Text = CInt(e.Row.Cells(4).Text) * CInt(e.Row.Cells(5).Text)
                TotalTime = TotalTime + CInt(e.Row.Cells(6).Text)
                lblTotalHours.Text = TotalTime
            Catch ex As Exception

            End Try
        End If

    End Sub
End Class
