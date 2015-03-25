
Partial Class FrontEnd_RootCauseReview
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session.Timeout = 20
        btnLogOk.Attributes.Add("onclick", GetPostBackEventReference(btnLogOk) & ";this.value='Please wait...';this.disabled = true;")

        Try
            Session("WorkstationID") = Request.Cookies("DMSWorkstation")("Workstation")
        Catch ex As Exception
            Response.Redirect("Setworkstation.aspx")
        End Try

        Dim path As New Helpers

        If Not Page.IsPostBack Then

            'populate the labels in the header

            Dim dtadap As New DowntimeTableAdapters.DowntimeDetails_1TableAdapter
            Dim DTdetailsDT As New Downtime.DowntimeDetails_1DataTable

            DTdetailsDT = dtadap.GetDowntimeByDTIDforDTEnd(Request.QueryString("DowntimeID"))

            Dim dtrow As Downtime.DowntimeDetails_1Row = DTdetailsDT.Rows(0)
            lblDowntimeStart.Text = dtrow.Downtimestart


            lblSympLocation.Text = path.getlocpathnolink(dtrow.LocID, 1)
            lblSymptomDesc.Text = dtrow.SymptomDesc

            If Request.QueryString("Locid") = "" Then
                'get the root cause location linked to the workstation location if there is no locid in teh query string
                'ie:  this page hasnt been posted back from the path
                Dim loclinkadap As New LocationsTableAdapters.QueriesTableAdapter
                Session("btnRCLocID") = loclinkadap.GetRCLocIDFromSymptomLocID(CInt(Session("workstationID")))
            Else
                'if there is a locid querystring then the repost has come from the path so we must set the 
                'datalist to the locid required and update the path 
                Session("btnRCLocID") = Request.QueryString("Locid")
                litRCPath.Text = path.getlocpath(Session("btnRClocid"), "RootCauseReview.aspx", "&DowntimeID=" & Request.QueryString("downtimeid"), 0)
                TabContainer1.ActiveTabIndex = Request.QueryString("TabID")
            End If


        Else

            'if this page is postback from itself just update the path with the appropriate info
            litRCPath.Text = path.getlocpath(Session("btnRClocid"), "RootCauseReview.aspx", "&DowntimeID=" & Request.QueryString("downtimeid") & "&TabID=" & TabContainer1.ActiveTabIndex, 0)


        End If

    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand

        Dim j As String = e.CommandArgument
        Response.Redirect("quickclose.aspx?downtimeid=" & Request.QueryString("downtimeID") & "&remedyID=" & e.CommandArgument)

    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        'Dim chkbox As CheckBox = e.Row.FindControl("CheckBox1")
        'If e.Row.RowType = DataControlRowType.DataRow Then
        '    e.Row.Cells(7).Visible = chkbox.Checked
        'End If
    End Sub



    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand
        Session("btnRCLocID") = e.CommandArgument
        DataList1.DataBind()


        If DataList1.Items.Count = 0 Then

            lbl2.Visible = True
            txtRootCause.Visible = True
            btnAcceptRC.Visible = True

        End If


    End Sub

    Protected Sub TextBox1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRootCause.TextChanged

    End Sub

    Protected Sub DataList1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList1.Load

    End Sub

    Protected Sub btnAcceptRC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAcceptRC.Click
        lbl3.Visible = True
        lbl4.Visible = True
        lbl5.Visible = True
        txtRemedy.Visible = True

        cblParameters.DataBind()

        If cblParameters.Items.Count = 0 Then
            lblParamMsg.text = "There are no parameters for this location"
        Else
            cblParameters.Visible = True
        End If


        rblEngineer.Visible = True

    End Sub

    Protected Sub rblEngineer_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rblEngineer.SelectedIndexChanged
        btnCloseDT.Visible = True

    End Sub

    Protected Sub btnCloseDT_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCloseDT.Click

        TxtPopTime.Text = Now()

        pnlExec.Visible = False
        pnlEng.Visible = False
        pnlTech.Visible = True

        If rblEngineer.SelectedValue = 0 Then

            If DateDiff(DateInterval.Minute, CDate(lblDowntimeStart.Text), Now()) > 60 Then
                pnlExec.Visible = True
            End If

        Else
            pnlEng.Visible = True
        End If

        MPELogin.Show()

    End Sub

    Protected Sub btnLogOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogOk.Click
        'check login is OK
        GridView2.Visible = False

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
                GridView2.DataBind()
                GridView2.Visible = True

                'check if the session has expired and ask user to start again
            ElseIf CInt(Session("btnRCLocID")) = 0 Then
                lblLogMsg.Text = "The sesssion has expired. please return to the home page and start the close out of your downtime again"
                Dim errhlp As New Helpers
                errhlp.InsertError("Session expired in root cause review", 0, 0)

                'close the downtime
            Else
                Try

                    '1) Input the root cause into the root cause table

                    'get the symptomID
                    Dim dtadap As New DowntimeTableAdapters.QueriesTableAdapter
                    Dim symptomid As Integer = dtadap.GetSymptomFromDowntime(Request.QueryString("DowntimeID"))

                    'Dim RootAdap As New RootCauseRemedyTableAdapters.tblRootCauseTableAdapter
                    'RootAdap.Insert(txtRootCause.Text, symptomid, CInt(Session("btnRCLocID")))
                    'Dim MaxRCadap As New RootCauseRemedyTableAdapters.QueriesTableAdapter

                    Dim RootRemAdap As New RootCauseRemedyTableAdapters.QueriesTableAdapter
                    Dim newRC As Integer = 0
                    RootRemAdap.SPInsertRootCause(txtRootCause.Text, symptomid, CInt(Session("btnRCLocID")), newRC)

                    '2) Input the remedy into the remedy table 
                    'Dim Remadap As New RootCauseRemedyTableAdapters.tblRemedyTableAdapter
                    'Remadap.Insert(txtRemedy.Text, newRC)
                    Dim newREM As Integer = 0
                    RootRemAdap.SPInsertRemedy(txtRemedy.Text, newRC, newREM)

                    '3) Insert the parameters if required
                    Dim ParamAdap As New RootCauseRemedyTableAdapters.tblParamDowntimeTableAdapter
                    Dim i As Integer

                    For i = 0 To cblParameters.Items.Count - 1
                        If cblParameters.Items(i).Selected = True Then
                            ParamAdap.Insert(cblParameters.Items(i).Value, Request.QueryString("downtimeid"), 0, 0)
                        End If
                    Next

                    '4) Update the Loc table

                    Dim Locadap As New LocationsTableAdapters.QueriesTableAdapter
                    Locadap.UpdatetblLocWithDownTime(0, CInt(Session("WorkstationID")))

                    '5) close the downtime
                    dtadap.UpdateDowntimeAtClose(TxtPopTime.Text, newREM, techID, engID, execID, Request.QueryString("downtimeID"))


                    '6) Update the downtimeemailsent field in the locations table
                    Locadap.DowntimeEmailSentUpdate(False, CInt(Session("WorkstationID")))


                    'hide the login box

                    MPELogin.Hide()

                Catch ex As Exception
                    Dim err As New Helpers
                    err.InsertError(ex.Message, Right(ex.StackTrace, 400), 1)
                End Try

                Response.Redirect("WShome.aspx")

            End If

        End If

    End Sub

    Protected Sub btnLogCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogCancel.Click
        txtEngPass.Text = ""
        txtTechPass.Text = ""
        txtExecPass.Text = ""
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
End Class
