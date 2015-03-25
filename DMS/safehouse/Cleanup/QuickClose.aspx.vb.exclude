Partial Class FrontEnd_RootCauseReview
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        btnLogOk.Attributes.Add("onclick", GetPostBackEventReference(btnLogOk) & ";this.value='Please wait...';this.disabled = true;")

        Try
            Session("WorkstationID") = Request.Cookies("DMSWorkstation")("Workstation")
        Catch ex As Exception
            Response.Redirect("Setworkstation.aspx")
        End Try

        Dim path As New Helpers

        'populate the labels in the header

        Dim dtadap As New DowntimeTableAdapters.DowntimeDetails_1TableAdapter
        Dim DTdetailsDT As New Downtime.DowntimeDetails_1DataTable

        DTdetailsDT = dtadap.GetDowntimeByDTIDforDTEnd(Request.QueryString("DowntimeID"))

        Dim dtrow As Downtime.DowntimeDetails_1Row = DTdetailsDT.Rows(0)
        lblDowntimeStart.Text = dtrow.Downtimestart


        lblSympLocation.Text = path.getlocpathnolink(dtrow.LocID, 1)
        lblSymptomDesc.Text = dtrow.SymptomDesc

    End Sub

    Protected Sub btnCloseDT_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCloseDT.Click

        TxtPopTime.Text = Now()

        pnlExec.Visible = False
        pnlEng.Visible = False
        pnlTech.Visible = True

        If DateDiff(DateInterval.Minute, CDate(lblDowntimeStart.Text), Now()) > 60 Then
            pnlExec.Visible = True
        End If

        MPELogin.Show()

    End Sub

    Protected Sub btnLogOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogOk.Click
        'check login is OK
        GridView1.Visible = False
        lblLogMsg.Text = ""
        Dim usersadap As New UsersTableAdapters.QueriesTableAdapter

        Dim techID As Integer = 0
        Dim execID As Integer = 0
        Dim engID As Integer = 0

        If pnlTech.Visible = True Then

            If usersadap.UserPassCheckbyLevel(txtTechUser.Text, txtTechPass.Text, 1) = 0 Then
                lblLogMsg.Text = "Technologist login incorrect"
                txtTechPass.Text = ""
            Else
                techID = usersadap.UserIdbyUserName(txtTechUser.Text)
            End If


        End If

        If pnlEng.Visible = True Then

            If usersadap.UserPassCheckbyLevel(txtEngUserName.Text, txtEngPass.Text, 2) = 0 Then
                lblLogMsg.Text = "Engineer login incorrect"
                txtEngPass.Text = ""
            ElseIf txtEngUserName.Text = txtTechUser.Text Then
                lblLogMsg.Text = "You cannot use the same login for both"
                txtEngPass.Text = ""
                txtEngUserName.Text = ""
            Else
                engID = usersadap.UserIdbyUserName(txtEngUserName.Text)

            End If

        End If

        If pnlExec.Visible = True Then

            If usersadap.UserPassCheckbyLevel(txtExecUserName.Text, txtExecPass.Text, 1) = 0 Then
                lblLogMsg.Text = "Executive login incorrect"
                txtExecPass.Text = ""
            ElseIf txtTechUser.Text = txtExecUserName.Text Then
                lblLogMsg.Text = "You cannot use the same login for both"
                txtExecPass.Text = ""
                txtExecUserName.Text = ""
            Else
                execID = usersadap.UserIdbyUserName(txtExecUserName.Text)

            End If

        End If

        MPELogin.Show()



        If lblLogMsg.Text = "" Then

            txtExecPass.Text = ""
            txtEngPass.Text = ""
            txtTechPass.Text = ""

            'fill datatable with anydowntime overlaps
            Dim adapdtcheck As New DowntimeTableAdapters.DowntimeCheckerTableAdapter
            Dim dtdtcheck As New Downtime.DowntimeCheckerDataTable

            dtdtcheck = adapdtcheck.GetDataByStartAndEnd(CInt(Session("WorkstationID")), TxtPopTime.Text, CDate(lblDowntimeStart.Text))

            'check if downtime end is before downtime start

            If CDate(TxtPopTime.Text) < CDate(lblDowntimeStart.Text) Then

                lblLogMsg.Text = "The end time of the DT is earlier than the start time of the downtime"


                'check if downtime overlaps another downtime
            ElseIf dtdtcheck.Rows.Count > 0 Then

                lblLogMsg.Text = "Your downtime coincides with another downtime for this machine.  Please check your time"
                GridView1.DataBind()
                GridView1.Visible = True
                'close the downtime
            Else
               

                '4) Update the Loc table

                Dim Locadap As New LocationsTableAdapters.QueriesTableAdapter
                Locadap.UpdatetblLocWithDownTime(0, CInt(Session("WorkstationID")))

                '5) close the downtime

                Dim dtadap As New DowntimeTableAdapters.QueriesTableAdapter

                dtadap.UpdateDowntimeAtClose(TxtPopTime.Text, Request.QueryString("RemedyID"), techID, engID, execID, Request.QueryString("downtimeID"))

                '6) Update the downtimeemailsent field in the locations table
                Locadap.DowntimeEmailSentUpdate(False, CInt(Session("WorkstationID")))


                'hide the login box

                MPELogin.Hide()

                Response.Redirect("WShome.aspx")


            End If



        End If



    End Sub

    Protected Sub btnLogCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogCancel.Click
        txtEngPass.Text = ""
        txtTechPass.Text = ""
        txtExecPass.Text = ""
    End Sub

   
End Class
