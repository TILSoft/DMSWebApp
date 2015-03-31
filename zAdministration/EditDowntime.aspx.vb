
Partial Class zAdministration_EditDowntime
    Inherits System.Web.UI.Page

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim remtext As TextBox = FormView1.FindControl("RemedyIDTextBox")
        Response.Redirect("EditRemedyRootCause.aspx?Remedy=" & CInt(remtext.Text))

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim hlp As New Helpers
        If hlp.checkloginstatus(User.Identity.Name, 4) <= 0 Then
            Response.Redirect("AccessDenied.aspx")
        End If

        If Not Page.IsPostBack Then
            txtDate.Text = Now()

            If Not Request.QueryString("Downtimeid") Is Nothing Then
                pnlSelector.Visible = False
                ODSDowntimeEdit.SelectParameters("downtimeid").DefaultValue = Request.QueryString("downtimeid")


            End If
        End If






    End Sub

    Protected Sub txtDate_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtDate.TextChanged
        DropDownList1.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        DropDownList1.DataBind()
    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        Dim locadap As New LocationsTableAdapters.QueriesTableAdapter
        lblSympLoc.Text = locadap.GetSympLocIDFromRCLocID(RadioButtonList1.SelectedValue)

    End Sub
End Class
