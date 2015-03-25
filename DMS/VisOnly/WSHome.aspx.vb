
Partial Class FrontEnd_WSHome
    Inherits System.Web.UI.Page
    Public symptomID As Integer = 12345234
    Public scOEE As New dotnetCHARTING.Series

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        OEEChart.YAxis.Label.Text = "Minutes"


        Try

            If Request.QueryString("LocID") = Nothing Then
                Session("WorkStationID") = Request.Cookies("DMSWorkstation")("Workstation")
            Else
                Session("WorkStationID") = Request.QueryString("LocID")
            End If

            Dim loclinkadap As New LocationsTableAdapters.QueriesTableAdapter
            Session("RCWorkstationID") = loclinkadap.GetRCLocIDFromSymptomLocID(CInt(Session("workstationID")))


            Dim LocDescAdap As New LocationsTableAdapters.QueriesTableAdapter
            'set all the labels
            lblWorkStation.Text = LocDescAdap.LocDescFromLocID(CInt(Session("WorkStationID")))
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
                    'if activity has been running for less than one minute supress the performance calculation as it will give a divide by 0 error
                    Dim actstart As DateTime = actiadap.StarttimebyActivityID(CInt(Session("activityID")))

                    If DateDiff(DateInterval.Minute, actstart, Now()) < 1 Then
                        DetailsView1.Visible = False
                    End If
                    'update activity time with current time
                    actiadap.UpdateEndtimebyActivityID(Now(), activityid)
                    litDT.Text = "<strong style='color: #00CC66'><marquee id=mar1 direction=right>Line is currently running</marquee></strong>"


                Case 2
                    lbltxtID.Text = "Change over name"
                    lblLot.Text = lotno
                    lblStatus.Text = "Change over in progress"
                    lblFormat.Text = locadap.FormatDescFromLocID(Session("WorkstationID"))
                    actiadap.UpdateEndtimebyActivityID(Now(), activityid)
                    DetailsView1.Visible = False

                    litDT.Text = "<strong style='color: #00CC66'><marquee id=mar1 direction=right>Line is currently in Changeover</marquee></strong>"

                Case 3
                    lblLot.Text = "No data"
                    lblStatus.Text = "Idle time in progress"
                    lblFormat.Text = "No Format"
                    actiadap.UpdateEndtimebyActivityID(Now(), activityid)
                    DetailsView1.Visible = False

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

                lblQueryStart.Text = lblShiftStart.Text
                lblQueryEnd.Text = Now()
                CheckForDowntime()
                OEEChart.DefaultAxis.SpacingPercentage = 10
                scOEE.PaletteName = dotnetCHARTING.Palette.Spring
                GridView1.DataBind()
                OEEChart.SeriesCollection.Add(scOEE)
            End If

            populateTimeLines()
            populatechart2()

        Catch ex As Exception

            Dim hlp As New Helpers
            hlp.InsertError(ex.Message, Right(ex.StackTrace, 400), 1)

        End Try




    End Sub
    Sub populatechart2()

        Try
            OEEChart.SeriesCollection.Clear()


            Dim OEEadap As New OEETableAdapters.OEEMasterByPeriodTableAdapter
            Dim oeedt As New OEE.OEEMasterByPeriodDataTable
            oeedt = OEEadap.GetData(CInt(Session("WorkstationID")), lblQueryStart.Text, lblQueryEnd.Text)

            Dim row As OEE.OEEMasterByPeriodRow = oeedt.Rows(0)

            OEEChart.Type = dotnetCHARTING.ChartType.Pie
            OEEChart.LegendBox.Visible = True

            createseries(row._cLottime_Lotdowntime, "Lot Time")
            createseries(row.Downtime, "Lot Downtime")
            createseries(row._cCOtime_COdowntime, "Changeover Time")
            createseries(row.ChangeOverDowntime, "Changeover Downtime")

        Catch ex As Exception
            Dim hlp As New Helpers
            hlp.InsertError(ex.Message, Right(ex.StackTrace, 400), 0)
        End Try


    End Sub

    Sub createseries(ByVal value, ByVal name)

        Dim myser As New dotnetCHARTING.Series
        Dim ele As New dotnetCHARTING.Element
        ele.YValue = value
        ele.Name = name
        myser.AddElements(ele)
        myser.Name = name
        OEEChart.SeriesCollection.Add(myser)



    End Sub
    Sub populateChart()

        Try

            OEEChart.SeriesCollection.Clear()

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




            Dim start As DateTime = lblQueryStart.Text
            Dim finish As DateTime = lblQueryEnd.Text

            Dim TLadap As New AnalysisTimeLinesTableAdapters.MultiTablePeriodTrimOnlyTableAdapter
            Dim TLdt As New AnalysisTimeLines.MultiTablePeriodTrimOnlyDataTable

            TLdt = TLadap.GetData(CInt(Session("WorkstationID")), start, finish)

            WUCShift.ClearCollection()

            WUCShift.starttime = start
            WUCShift.endtime = finish

            WUCLot.ClearCollection()

            WUCLot.starttime = start
            WUCLot.endtime = finish

            WUCDT.ClearCollection()

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
  
   
  
    Sub CheckForDowntime()

        'find if downtime is active on line
        Dim Locadap As New LocationsTableAdapters.QueriesTableAdapter
        Dim DTid As Integer = Locadap.DowntimeIDbyLoc(CInt(Session("WorkstationID")))

        If DTid > 0 Then

            lblDowntimeStatus.Text = ""

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

       
           


        End If




    End Sub
   
    Protected Sub rblSelectQuery_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rblSelectQuery.SelectedIndexChanged
        Select Case rblSelectQuery.SelectedValue
            Case 1
                lblQueryStart.Text = lblShiftStart.Text
                lblQueryEnd.Text = Now()
            Case 2

                lblQueryStart.Text = DateAdd(DateInterval.Day, -1, Now())
                lblQueryEnd.Text = Now()
        End Select

        GridView1.DataBind()
        populateTimeLines()
        populatechart2()
        CheckForDowntime()

    End Sub

    
    Protected Sub lnkAllLines_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkAllLines.Click

        Response.Redirect("../VisOnly/allLinesStatus.aspx")

    End Sub
End Class
