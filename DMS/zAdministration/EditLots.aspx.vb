
Partial Class zAdministration_EditLots
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim hlp As New Helpers
        If hlp.checkloginstatus(User.Identity.Name, 4) <= 0 Then
            Response.Redirect("AccessDenied.aspx")
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        DropDownList1.DataBind()
    End Sub

    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        'check if new starttime is < start time of preceeding lot or > end time of next lot


        Dim txtstart As TextBox = FormView1.FindControl("Starttimetextbox")
        Dim txtend As TextBox = FormView1.FindControl("Endtimetextbox")
        Dim txtPre As TextBox = FormView1.FindControl("PreActivitytextbox")
        Dim txtPost As TextBox = FormView1.FindControl("PostActivitytextbox")

        Dim adapprepost As New ActivityTableAdapters.GetPreAndPostTableAdapter
        Dim dtprepost As New Activity.GetPreAndPostDataTable
        dtprepost = adapprepost.GetPreAndPostTimes(DropDownList1.SelectedValue)
        Dim rowprepost As Activity.GetPreAndPostRow = dtprepost.Rows(0)

        If CDate(txtstart.Text) < rowprepost.prestart Or CDate(txtend.Text) > rowprepost.postend Then


            lblmessage.text = "The new dates are greater than the end of the next lot or less than the start of the previous lot.  Please adjust them"
            Dim btn As LinkButton = FormView1.FindControl("updatebutton")
            btn.CommandName = "Cancel"

        Else
            lblmessage.Text = ""

            Dim actiadap As New ActivityTableAdapters.QueriesTableAdapter
            'update the end time of the pre lot with the start time of the current lot
            actiadap.UpdateEndtimebyActivityID(txtstart.Text, txtPre.Text)
            'update the startime of the next lot with the end time of the current lot
            actiadap.UpdateStartTimeByActivityID(txtend.Text, txtPost.Text)

        End If






       


    End Sub
End Class
