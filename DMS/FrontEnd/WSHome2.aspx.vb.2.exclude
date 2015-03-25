
Partial Class FrontEnd_WSHome
    Inherits System.Web.UI.Page
    Public symptomID As Integer = 12345234
    Public scOEE As New dotnetCHARTING.Series
    Public dtActCheck As New Downtime.DowntimeActivityCheckDataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim adapUserCount As New UsersTableAdapters.QueriesTableAdapter
        Dim usercount As Integer = adapUserCount.UserNameCount(Right(Page.User.Identity.Name, Len(Page.User.Identity.Name) - 7))
        If usercount > 0 Then
            Dim AdapUser As New UsersTableAdapters.QueriesTableAdapter
            Dim userLevel As Integer = AdapUser.UserLevelByName(Right(Page.User.Identity.Name, Len(Page.User.Identity.Name) - 7))

            If userLevel = 0 Then
                Response.Redirect("~/Visonly/wshome.aspx")
            End If

        Else
            Response.Redirect("~/Visonly/wshome.aspx")

        End If


        btnOK.Attributes.Add("onclick", GetPostBackEventReference(btnOK) & ";this.value='Please wait...';this.disabled = true;")


        Try
            Dim ws As Integer = Request.Cookies("DMSWorkstation")("Workstation")
        Catch ex As Exception
            Response.Redirect("Setworkstation.aspx")
        End Try

        Try



            Session("WorkStationID") = Request.Cookies("DMSWorkstation")("Workstation")
            Dim loclinkadap As New LocationsTableAdapters.QueriesTableAdapter
            Session("RCWorkstationID") = loclinkadap.GetRCLocIDFromSymptomLocID(CInt(Session("workstationID")))


            Dim LocDescAdap As New LocationsTableAdapters.QueriesTableAdapter
            'set all the labels
            lblWorkStation.Text = LocDescAdap.LocDescFromLocID(Request.Cookies("DMSWorkstation")("Workstation"))
            lblDateTime.Text = Now()


            'get the line activity statsu from the loc table

            Dim locadap As New LocationsTableAdapters.QueriesTableAdapter
            Dim activitytype As Integer = locadap.ActivityTypeFromLocID(CInt(Session("workstationID")))
            Dim activityid As Integer = locadap.ActivityIDFromLocID(CInt(Session("workstationID")))
            Session("ActivityID") = activityid
            Dim actiadap As New ActivityTableAdapters.QueriesTableAdapter
            Dim lotno As String = actiadap.GetTxtIDByLocID(Session("WorkstationID"))

            Select Case activitytype
                Case 1
                    lbltxtID.Text = "Lot Number"
                    lblLot.Text = lotno
                    lblStatus.Text = "Lot In progress"
                    'get format
                    lblFormat.Text = locadap.FormatDescFromLocID(Session("WorkstationID"))
                    'update activity time with current time
                    actiadap.UpdateEndtimebyActivityID(Now(), activityid)
                    litDT.Text = "<strong style='color: #00CC66'><marquee id=mar1 direction=right>Line is currently running</marquee></strong>"


                Case 2
                    lbltxtID.Text = "Change over name"
                    lblLot.Text = lotno
                    lblStatus.Text = "Change over in progress"
                    lblFormat.Text = locadap.FormatDescFromLocID(Session("WorkstationID"))
                    actiadap.UpdateEndtimebyActivityID(Now(), activityid)

                    litDT.Text = "<strong style='color: #00CC66'><marquee id=mar1 direction=right>Line is currently in Changeover</marquee></strong>"

                Case 3
                    lblLot.Text = "No data"
                    lblStatus.Text = "Idle time in progress"
                    lblFormat.Text = "No Format"
                    actiadap.UpdateEndtimebyActivityID(Now(), activityid)

                    litDT.Text = "<strong style='color: #00CC66'><marquee id=mar1 direction=right>Line is currently Idle</marquee></strong>"

            End Select

            txtSliderHandle.Text = 100
            Call loadChart()



            Dim shiftadap As New ShiftsTableAdapters.tblShiftsTableAdapter
            Dim shiftdt As New Shifts.tblShiftsDataTable
            shiftdt = shiftadap.GetShiftbyCurrenttime(Now(), CInt(Session("WorkstationID")))

            If shiftdt.Rows.Count = 0 Then

                lblShift.Text = "No Shift is allocated to this time.  Please contact your admin to add your shift"
                lblShift.ForeColor = Drawing.Color.Red
                lblShiftStart.Text = DateAdd(DateInterval.Hour, -24, Now())
                lblShiftEnd.Text = Now()

            Else


                Dim shiftrow As Shifts.tblShiftsRow = shiftdt.Rows(0)

                lblShift.Text = shiftrow.ShiftTeam
                lblShiftStart.Text = shiftrow.ShiftStart
                lblShiftEnd.Text = shiftrow.ShiftEnd

            End If


            If Not Page.IsPostBack Then

                Session("btnLocID") = Request.Cookies("DMSWorkstation")("Workstation")

                If Request.QueryString("locid") <> Nothing Then
                    Session("btnLocID") = Request.QueryString("LocID")

                    Dim sitepath As New Helpers
                    litPath.Text = sitepath.getlocpath(Session("btnLocid"), "WSHome.aspx", 1)

                End If

            Else
                'TabContainer1.ActiveTabIndex = Session("activeTabIndex")
            End If

            CheckForDowntime()


        Catch ex As Exception

            Dim hlp As New Helpers
            hlp.InsertError(ex.Message, Right(ex.StackTrace, 400), 1)

        End Try




    End Sub
    Sub loadChart()
        Dim fractime As Double = CInt(txtSliderHandle.Text) - 100
        fractime = fractime / 100 * 24 * 60
        Dim enddate As DateTime = DateAdd(DateInterval.Minute, fractime, Now())
        Dim timelinespan As Double = -ddlTimeLineSpan.SelectedValue
        Dim timelinespanmins As Double = timelinespan * 60

        Dim chtadap As New DAQEventsTableAdapters.chartingTableAdapter
        Dim chtdt As New DAQEvents.chartingDataTable
        chtdt = chtadap.GetDataByLocIDStartEndTime(CInt(Session("WorkstationID")), DateAdd(DateInterval.Minute, 1, enddate), DateAdd(DateInterval.Minute, timelinespanmins, enddate))
        DAQTimeline1.StartTime = DateAdd(DateInterval.Minute, timelinespanmins, enddate)
        DAQTimeline1.EndTime = enddate
        DAQTimeline1.daqData = chtdt

        Dim actadap As New ActivityTableAdapters.actForRunChartTableAdapter
        Dim actdt As New Activity.actForRunChartDataTable
        actdt = actadap.GetData(CInt(Session("WorkstationID")), DateAdd(DateInterval.Minute, timelinespanmins, enddate), enddate)
        DAQTimeline1.daqActData = actdt

        DAQTimeline1.CreateChart()
        UptimeLine.Update()

    End Sub

  
    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand
        Session("btnLocID") = e.CommandArgument
        DataList1.DataBind()
        DataList2.DataBind()

        Dim sitepath As New Helpers
        litPath.Text = sitepath.getlocpath(e.CommandArgument, "WSHome.aspx", 1)
    End Sub
    Protected Sub DataList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList1.SelectedIndexChanged
        Session("btnLocID") = DataList1.SelectedValue
        DataList1.DataBind()
        DataList2.DataBind()
    End Sub
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Response.Redirect("StartEndActivity.aspx")
    End Sub
    Protected Sub DataList2_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList2.ItemCommand
        Session("SympID") = e.CommandArgument
        txtPopTime.Text = Now()
        MPELogin.Show()

        'if symptom downtime type = 2 then it is a short stop and does not require a signature
        Dim AdapLoc As New LocationsTableAdapters.QueriesTableAdapter
        Dim DTtype As Integer = AdapLoc.dttypefromsymptomid(e.CommandArgument)

        If DTtype = 2 Then
            startDownTime(2)
        Else
            MPELogin.Show()
        End If






    End Sub
    Sub CheckForDowntime()

        'find if downtime is active on line
        Dim Locadap As New LocationsTableAdapters.QueriesTableAdapter
        Dim DTid As Integer = Locadap.DowntimeIDbyLoc(CInt(Session("WorkstationID")))

        If DTid > 0 Then

            lblDowntimeStatus.Text = ""
            DataList1.Enabled = False
            DataList2.Enabled = False

            'get downtime details for 

            Dim DTdetailsAdap As New DowntimeTableAdapters.DowntimeDetails_1TableAdapter
            Dim DtDetailsDT As Downtime.DowntimeDetails_1DataTable

            DtDetailsDT = DTdetailsAdap.GetDowntimeByDTIDforDTEnd(DTid)

            Dim dtrow As Downtime.DowntimeDetails_1Row = DtDetailsDT.Rows(0)

            Dim Path As New Helpers

            Dim DTPath As String = Path.getlocpathnolink(dtrow.LocID, 1)


            Dim strDTmessage As String = lblWorkStation.Text & " is down for the reason: '" & dtrow.SymptomDesc & _
             "' identified at this location '" & DTPath & "'. This downtime started at " & dtrow.Downtimestart & ". Click the button below to close this downtime. You must close the downtime before changing lot or CO"

            litDT.Text = "<strong style='color: #FF0000'><marquee id=mar1 direction=left>" & strDTmessage & "</marquee></strong>"

            lblMessage.Font.Size = 12

            dtLinkButton.Font.Size = 20

            dtLinkButton.Text = "Review Remedies & Close Downtime"
            dtLinkButton.Visible = True
            dtLinkButton.PostBackUrl = "RootCauseReview.aspx?DowntimeID=" & dtrow.DowntimeID
            'changeover link button disabled
            LinkButton1.Visible = False


        Else
            'changeover link button enabled
            LinkButton1.Visible = True


        End If




    End Sub
    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOK.Click
        Dim proceedok As Boolean = True
        ' Threading.Thread.Sleep(1000)

        Dim useradap As New UsersTableAdapters.QueriesTableAdapter
        Dim usercount As Integer = useradap.checkUserPass(txtUserName.Text, txtPass.Text)

        If usercount = 0 Then
            lbllogMsg.Text = "you have entered an incorrect username/password"
            proceedok = False
        End If

        'check if downtime overlaps with another downtime for that line
        Dim adapdtcheck As New DowntimeTableAdapters.DowntimeCheckerTableAdapter
        Dim dtdtcheck As New Downtime.DowntimeCheckerDataTable

        dtdtcheck = adapdtcheck.GetDataStartOnly(CInt(Session("WorkstationID")), txtPopTime.Text)


        If dtdtcheck.Rows.Count > 0 Then
            lbllogMsg.Text = "Your downtime overlaps with another downtime for this line.  Please check your downtime and start again"
            proceedok = False
        End If

        'check if downtime start coincides with currnet activity for line
        Dim adapactcheck As New DowntimeTableAdapters.DowntimeActivityCheckTableAdapter
        '    Dim dtActCheck As New Downtime.DowntimeActivityCheckDataTable

        'select the activity for this line that the downtime coincides with and compare to session("activityID")

        dtActCheck = adapactcheck.GetData(txtPopTime.Text, CInt(Session("workstationID")))
        Dim rowActCheck As Downtime.DowntimeActivityCheckRow = dtActCheck.Rows(0)

        If GridView2.Visible = False And proceedok = True Then


            If Not rowActCheck.ActivityID = CInt(Session("activityid")) Then
                lbllogMsg.Text = "Your downtime is starting in an activity different to the current activity. For details see below. If you wish to continue with this downtime please enter your password again and submit.  It not click cancel"
                GridView2.Visible = True
                GridView2.DataBind()
                proceedok = False
            End If

        ElseIf GridView2.Visible = True Then

            If Not rowActCheck.ActivityID = CInt(Session("activityid")) Then

                proceedok = True
            End If

        End If


        If proceedok = True Then

            startDownTime(1)
            'need to find out why we have to do this!!!!

        End If




    End Sub

    Sub startDownTime(ByVal DTtype As Integer)

        'Try
        Dim useridno As Integer
        Dim useradap As New UsersTableAdapters.QueriesTableAdapter
        ' Dim dtActCheck As New Downtime.DowntimeActivityCheckDataTable

        ' dtActCheck = adapactcheck.GetData(txtPopTime.Text, CInt(Session("workstationID")))

        MPELogin.Hide()
        If DTtype = 1 Then
            useridno = useradap.UserIdbyUserName(txtUserName.Text)
        ElseIf DTtype = 2 Then
            useridno = 0
        End If

        Session("btnLocID") = Session("WorkstationID")

        'insert new downtime in downtime table


        'check if downtime coincides with another activity because it is being entered retrospectivley


        Dim activityid As Integer
        'get format and lot no

        If GridView2.Visible = True Then
            'if the downtime has coincided with an activity other than current and the user has posted
            'back the form after being warned then attach the activityID from the lot in the table
            Dim dtactcheckrow As Downtime.DowntimeActivityCheckRow = dtActCheck.Rows(0)
            activityid = dtactcheckrow.ActivityID

        ElseIf GridView2.Visible = False Then
            'if the downtime conincides with the current activity, then get the current activity and update
            'the downtime table with that 
            Dim locadap As New LocationsTableAdapters.tblLocTableAdapter
            Dim locdt As New Locations.tblLocDataTable
            locdt = locadap.GetDataByLocID(CInt(Session("WorkstationID")))
            Dim locrow As Locations.tblLocRow = locdt.Rows(0)

            activityid = locrow.LotStatus
            GridView2.Visible = False
        End If


        'insert the new downtime

        Dim DTadap As New DowntimeTableAdapters.QueriesTableAdapter

        Dim maxDTID As Integer = 0
        'added stored procedure to return maxDTID 
        DTadap.SPInsertDowntime(txtPopTime.Text, CInt(Session("sympid")), useridno, activityid, 0, maxDTID)


        '  DTadap.InsertStartDowntime(txtPopTime.Text, CInt(Session("sympid")), useridno, activityid, 0)

        'get new downtime id



        'add downtime to the location

        Dim locQadap As New LocationsTableAdapters.QueriesTableAdapter
        locQadap.UpdatetblLocWithDownTime(maxDTID, Session("WorkstationID"))

        Response.Redirect("WShome.aspx")
        CheckForDowntime()


        'Catch ex As Exception

        '    Dim errhlp As New Helpers
        '    errhlp.InsertError(ex.Message, Right(ex.StackTrace, 400), 1)

        'End Try





    End Sub





    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        MPELogin.Hide()
    End Sub
    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click

        Response.Redirect("note.aspx")

    End Sub
    Protected Sub lnkChangePass_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkChangePass.Click
        Response.Redirect("ChangePassword.aspx")
    End Sub
    Protected Sub lnkChangePass0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkChangePass0.Click
        Response.Redirect("ReviewRemedies.aspx")
    End Sub

    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton3.Click
        Response.Redirect("../zadministration/ManageSymptomLocations.aspx")
    End Sub



    Protected Sub LinkButton4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton4.Click
        Response.Redirect("http://inet/engineering/Packaging%20Engineering/index.htm")
    End Sub
    Protected Sub lnkComm_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkComm.Click
        MPEComment.Show()
    End Sub

    Protected Sub btnCommSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCommSubmit.Click
        Dim commAdap As New CommentsTableAdapters.tblActCommentTableAdapter
        commAdap.Insert(1, Now(), txtComment.Text, Session("ActivityID"))
        MPEComment.Hide()
    End Sub

    Protected Sub btnCommCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCommCancel.Click
        MPEComment.Hide()
    End Sub

    'Protected Sub btnSHOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSHOK.Click
    '    Dim useradap As New UsersTableAdapters.QueriesTableAdapter
    '    Dim usercount As Integer = useradap.checkUserPass(txtSHUser.Text, txtSHPass.Text)

    '    If usercount = 0 Then
    '        lblSHMessage.Text = "you have entered an incorrect username/password"
    '        MPEAuthenticate.Show()

    '    ElseIf usercount > 0 Then

    '        Dim useridno As Integer = useradap.UserIdbyUserName(txtSHUser.Text)
    '        MPEAuthenticate.Hide()
    '        odsShiftHand.InsertParameters("Lineid").DefaultValue = Session("WorkstationID")
    '        odsShiftHand.InsertParameters("EntryTime").DefaultValue = Now()
    '        odsShiftHand.InsertParameters("userid").DefaultValue = useridno
    '        FormView1.InsertItem(False)

    '    End If
    'End Sub

    Protected Sub btnSHCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSHCancel.Click
        MPEAuthenticate.Hide()
    End Sub

    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        MPEAuthenticate.Show()
    End Sub

    Protected Sub dtLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles dtLinkButton.Click

    End Sub
End Class
