
Partial Class FrontEnd_WSHome
    Inherits System.Web.UI.Page
    Public symptomID As Integer = 12345234
    Public scOEE As New dotnetCHARTING.Series

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        OEEChart.YAxis.Label.Text = "Minutes"

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
                    lbltxtID.Text = "Change over type"
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

                CheckForDowntime()
                OEEChart.DefaultAxis.SpacingPercentage = 10
                scOEE.PaletteName = dotnetCHARTING.Palette.Spring
                GridView1.DataBind()
                OEEChart.SeriesCollection.Add(scOEE)

            End If

        Catch ex As Exception

            Dim hlp As New Helpers
            hlp.InsertError(ex.Message, Right(ex.StackTrace, 400), 1)

        End Try

        populateTimeLines()
        populateChart()

    End Sub
    Sub populateChart()

        Try


     

            Dim start As DateTime = lblShiftStart.Text
            Dim finish As DateTime = Now()

            Dim StatsAdap As New AnalysisTimeLinesTableAdapters.MultiTableFullTrimGroupedTableAdapter
            Dim StatsDT As New AnalysisTimeLines.MultiTableFullTrimGroupedDataTable

            StatsDT = StatsAdap.GetData(CInt(Session("WorkstationID")), start, finish)

            For Each Statsrow As AnalysisTimeLines.MultiTableFullTrimGroupedRow In StatsDT

                Dim ele As New dotnetCHARTING.Element

                Select Case Statsrow._Class

                    Case 1
                        'shift data

                        ele.YValue = Statsrow.dtime
                        ele.Name = "Shift Time"
                        ele.Color = Drawing.Color.Green

                    Case 2
                        'activity data

                        Select Case Statsrow.SubClass
                            Case 1
                                ele.YValue = Statsrow.dtime
                                ele.Name = "Lot time"

                            Case 2
                                ele.YValue = Statsrow.dtime
                                ele.Name = "Change Over time"

                            Case 3
                                ele.YValue = Statsrow.dtime
                                ele.Name = "Idle time"

                        End Select

                    Case 3
                        'Downtime data

                        Select Case Statsrow.SubClass
                            Case 1
                                ele.YValue = Statsrow.dtime
                                ele.Name = "Lot Downtime"

                            Case 2
                                ele.YValue = Statsrow.dtime
                                ele.Name = "Change Over Down time"

                            Case 3
                                ele.YValue = Statsrow.dtime
                                ele.Name = "Idle Down time"

                        End Select

                End Select

                scOEE.AddElements(ele)

            Next

            OEEChart.SeriesCollection.Add(scOEE)
        Catch ex As Exception

            Dim hlp As New Helpers
            hlp.InsertError(ex.Message, Right(ex.StackTrace, 400), 1)


        End Try
    End Sub

    Sub populateTimeLines()

        Try


            Dim start As DateTime = lblShiftStart.Text
            Dim finish As DateTime = lblDateTime.Text

            Dim TLadap As New AnalysisTimeLinesTableAdapters.MultiTablePeriodTrimOnlyTableAdapter
            Dim TLdt As New AnalysisTimeLines.MultiTablePeriodTrimOnlyDataTable

            TLdt = TLadap.GetData(CInt(Session("WorkstationID")), start, finish)

            WUCShift.starttime = start
            WUCShift.endtime = finish
        

            WUCLot.starttime = start
            WUCLot.endtime = finish
         


            WUCDT.starttime = start
            WUCDT.endtime = finish


            For Each TLrow As AnalysisTimeLines.MultiTablePeriodTrimOnlyRow In TLdt

                Select Case TLrow._Class

                    Case 1

                         WUCShift.AddtoCollection(TLrow.StartTime, TLrow.EndTime, Drawing.Color.Green, "Start time: " & TLrow.StartTime & "End time:" & TLrow.EndTime, "../frontend/downtimedetails.aspx?downtimeid=" & TLrow.OriginalID)


                    Case 2

                
                        Dim itemcolor As System.Drawing.Color
                        If TLrow.SubClass = 1 Then
                            itemcolor = Drawing.Color.Blue
                        ElseIf TLrow.SubClass = 2 Then
                            itemcolor = Drawing.Color.Purple
                        End If



                        WUCLot.AddtoCollection(TLrow.StartTime, TLrow.EndTime, itemcolor, "Start time: " & TLrow.StartTime & "End time:" & TLrow.EndTime, "../frontend/Activitydetails.aspx?activityid=" & TLrow.OriginalID)
                    Case 3

                        WUCDT.AddtoCollection(TLrow.StartTime, TLrow.EndTime, Drawing.Color.Red, "Start time: " & TLrow.StartTime & "End time:" & TLrow.EndTime, "../frontend/downtimedetails.aspx?downtimeid=" & TLrow.OriginalID)
                End Select

            Next


              WUCDT.Create()
            WUCLot.Create()
            WUCShift.Create()
        Catch ex As Exception

            Dim hlp As New Helpers
            hlp.InsertError(ex.Message, Right(ex.StackTrace, 400), 1)


        End Try

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
             "' identified at this location '" & DTPath & "'.  Click the button below to close this downtime. You must close the downtime before changing lot of CO"

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



        Dim useradap As New UsersTableAdapters.QueriesTableAdapter

        Dim usercount As Integer = useradap.checkUserPass(txtUserName.Text, txtPass.Text)

        If usercount = 0 Then

            lbllogMsg.Text = "you have entered an incorrect username/password"

        Else

            'check if downtime overlaps with another downtime for that line
            Dim adapdtcheck As New DowntimeTableAdapters.DowntimeCheckerTableAdapter
            Dim dtdtcheck As New Downtime.DowntimeCheckerDataTable

            dtdtcheck = adapdtcheck.GetDataStartOnly(CInt(Session("WorkstationID")), txtPopTime.Text)


            If dtdtcheck.Rows.Count > 0 Then

                lbllogMsg.Text = "Your downtime overlaps with another downtime for this line.  Please check your downtime and start again"

            Else
                Try

            
                    MPELogin.Hide()

                    Dim useridno As Integer = useradap.UserIdbyUserName(txtUserName.Text)

                    Session("btnLocID") = Session("WorkstationID")

                    'insert new downtime in downtime table

                    'get format and lot no

                    Dim locadap As New LocationsTableAdapters.tblLocTableAdapter
                    Dim locdt As New Locations.tblLocDataTable
                    locdt = locadap.GetDataByLocID(CInt(Session("WorkstationID")))

                    Dim locrow As Locations.tblLocRow = locdt.Rows(0)

                    'insert the new downtime

                    Dim DTadap As New DowntimeTableAdapters.QueriesTableAdapter
                    DTadap.InsertStartDowntime(txtPopTime.Text, CInt(Session("sympid")), useridno, locrow.LotStatus, 0)

                    'get new downtime id

                    Dim maxDTID As Integer = DTadap.MaxDTID

                    'add downtime to the location

                    Dim locQadap As New LocationsTableAdapters.QueriesTableAdapter
                    locQadap.UpdatetblLocWithDownTime(maxDTID, Session("WorkstationID"))

                Catch ex As Exception

                    Dim errhlp As New Helpers
                    errhlp.InsertError(ex.Message, Right(ex.StackTrace, 400), 1)

                End Try


                'need to find out why we have to do this!!!!
                Response.Redirect("WShome.aspx")
                CheckForDowntime()

            End If

        End If

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
End Class
