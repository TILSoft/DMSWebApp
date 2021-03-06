﻿Imports System.Data.SqlClient
Imports Oracle.DataAccess.Client
Imports Oracle.DataAccess.Types
Imports System.IO


Partial Class controls_charttemp_daqTest

    Inherits System.Web.UI.Page
    Public rowEvent As DAQEvents.tblEventRow
    Public rowAct As Activity.tblActivityRow
    Public ss5Desc As String = ""
    Public ss5Count As Integer = 1
    Public ss5Start As DateTime




#Region "Page Init"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim locadap As New LocationsTableAdapters.QueriesTableAdapter

        'set the submit button for rootcause addition to lock once clicked the first time

        btnRemRootCause.Attributes.Add("onclick", GetPostBackEventReference(btnRemRootCause) & ";this.value='Please wait...';this.disabled = true;")

        If Not Page.IsPostBack Then
            'check that the workstation cookie is set for this PC, if not redirect to the workstation set page
            Try
                Dim ws As Integer = Request.Cookies("DMSWorkstation")("Workstation")

                Dim adapDaqOrMan As New AssetTableAdapters.QueriesTableAdapter

                If Not adapDaqOrMan.DAQHomePage(ws) Then
                    Response.Redirect("~/frontend/wshome.aspx")
                End If

            Catch ex As Exception
                Response.Redirect("Setworkstation.aspx")
            End Try

            'set workstation ID session variable 
            Session("WorkStationID") = Request.Cookies("DMSWorkstation")("Workstation")
            drillDownSymp.locID = CInt(Session("WorkstationID"))
            drilldownRootCause.locID = locadap.GetRCLocIDFromSymptomLocID(CInt(Session("WorkstationID")))
            Session("EnableClick") = True

            'move slider to hard right to start with
            txtSliderHandle.Text = 100
            SliderExtender1.DataBind()


            Call gvDownTimeRefresh()
            Call LoadHeaderData()
            Call loadChart()
        End If

        odsDowntimeForLine.SelectParameters("LocID").DefaultValue = locadap.GetRCLocIDFromSymptomLocID(CInt(Session("WorkstationID")))

     
    End Sub

    Sub LoadHeaderData()

        'get the location name and set the appropriate field
        Dim locadap As New LocationsTableAdapters.QueriesTableAdapter
        lblWorkStation.Text = locadap.LocDescFromLocID(CInt(Session("workstationID")))
        'set the current date time label
        lblDateTime.Text = Now()

        'get the activity type and the lot no and set the lot number label
        Dim activityid As Integer = locadap.ActivityIDFromLocID(CInt(Session("workstationID")))

        Dim actiadap As New ActivityTableAdapters.QueriesTableAdapter
        Dim lotno As String = actiadap.GetTxtIDByLocID(CInt(Session("WorkstationID")))
        lblLot.Text = lotno

        Dim activitytype As Integer = locadap.ActivityTypeFromLocID(CInt(Session("workstationID")))

        'based on the activity type set the other indicators
        Select Case activitytype


            Case 1
                lblTxtID.Text = "Lot Number"
                lblStatus.Text = "Lot In progress"
                'get format
                lblFormat.Text = locadap.FormatDescFromLocID(CInt(Session("WorkstationID")))
                actiadap.UpdateEndtimebyActivityID(Now(), activityid)
                litDT.Text = "<strong style='color: #00CC66'><marquee id=mar1 direction=right>Line is currently running</marquee></strong>"

                'lnkManualDowntime.Visible = False

                'get current output 
                Try
                    lblCurrentOutput.Text = actiadap.GetGoodProductByActivityID(activityid)
                Catch ex As Exception
                End Try
            Case 2
                lblTxtID.Text = "Change Over ID"
                lblStatus.Text = "Change Over In progress"
                'get format
                lblFormat.Text = locadap.FormatDescFromLocID(CInt(Session("WorkstationID")))
                actiadap.UpdateEndtimebyActivityID(Now(), activityid)
                litDT.Text = "<strong style='color: #00CC66'><marquee id=mar1 direction=right>Line is currently in Change over</marquee></strong>"
                lnkManualDowntime.Visible = True
        
            Case 3
                lblTxtID.Text = "Idle Time ID"
                lblStatus.Text = "Idle time In progress"
                'get format
                lblFormat.Text = locadap.FormatDescFromLocID(CInt(Session("WorkstationID")))
                actiadap.UpdateEndtimebyActivityID(Now(), activityid)
                litDT.Text = "<strong style='color: #00CC66'><marquee id=mar1 direction=right>Line is currently in Idle time</marquee></strong>"
                lnkManualDowntime.Visible = True

        End Select

        Call UpdateOutputValue()
        Call setShift()
    
   
    End Sub

    Sub setShift()

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

    End Sub


#End Region

#Region "Chart Handlers"

    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        upTimeLine.Update()
    End Sub

    Protected Sub upTimeLine_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles upTimeLine.Load

        DAQTimeline1.Click_enabled = Session("EnableClick")
        'update the activity end time 
        Dim adapLoc As New LocationsTableAdapters.QueriesTableAdapter
        Dim activityId As Integer = adapLoc.ActivityIDFromLocID(CInt(Session("workstationID")))
        Dim adapAct As New ActivityTableAdapters.QueriesTableAdapter
        adapAct.UpdateEndtimebyActivityID(Now(), activityId)

        'update the DAQ server handshake light
        Call checkServerhandshake()
        'load the chart
        Call loadChart()

    End Sub

    Sub checkServerhandshake()

        Dim AdapHandShake As New AssetTableAdapters.QueriesTableAdapter
        Dim dtHandShake As Date = AdapHandShake.LastHandShake()


        If dtHandShake <= DateAdd(DateInterval.Minute, -1, Now()) Then
            lblHandShake.ForeColor = Drawing.Color.White
            lblHandShake.BackColor = Drawing.Color.Red
            lblHandShake.Text = "There is a server issue. Contact administrator"

        Else
            lblHandShake.ForeColor = Drawing.Color.Green
            lblHandShake.BackColor = Drawing.Color.Green
            lblHandShake.Text = ".."

        End If





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


        'get OEE data for a type 3 device

        Dim adapPerfData As New ActivityTableAdapters.actPerfDataTableAdapter
        Dim dtPerfData As New Activity.actPerfDataDataTable

        dtPerfData = adapPerfData.GetData(CInt(Session("WorkstationID")))

        If Not dtPerfData.Count = 0 Then

            Dim rowPerf As Activity.actPerfDataRow = dtPerfData.Rows(0)
            If rowPerf.DeviceType = 3 And rowPerf.ActivityType = 1 Then

                DAQTimeline1.OEEView = True
                DAQTimeline1.OEEMode = "Lot"

                Dim currentOutput As Integer = rowPerf.CounterValue - rowPerf.StartCount
                Dim targetOutput As Integer = rowPerf.TargetOutput / rowPerf.outputMultiplier
                DAQTimeline1.CurrentCount = currentOutput
                DAQTimeline1.TargetCount = targetOutput

                'calc OEE
                Dim NumMins As Integer = DateDiff(DateInterval.Minute, rowPerf.StartTime, Now())
                Dim TheoOutput As Integer = NumMins * (rowPerf.OperationRatePerMin / rowPerf.outputMultiplier)
                Dim OEE As Double = currentOutput / TheoOutput * 100
                DAQTimeline1.OEE = OEE

                'calc est Completion time
                Dim MinsToComp As Integer = ((targetOutput - currentOutput) / (rowPerf.OperationRatePerMin / rowPerf.outputMultiplier)) / (OEE / 100)
                Dim TimeOfComp As DateTime = DateAdd(DateInterval.Minute, MinsToComp, Now())
                DAQTimeline1.TimeOfComp = TimeOfComp

            ElseIf rowPerf.ActivityType = 2 Then

                DAQTimeline1.OEEView = True
                DAQTimeline1.OEEMode = "ChangeOver"

                Dim timeofComp As DateTime = DateAdd(DateInterval.Minute, rowPerf.StdTime, rowPerf.StartTime)
                DAQTimeline1.TimeOfComp = timeofComp


            Else

                DAQTimeline1.OEEView = False

            End If

        End If

        DAQTimeline1.CreateChart()
        upTimeLine.Update()

    End Sub

    Protected Sub ddlTimeLineSpan_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTimeLineSpan.SelectedIndexChanged
        Call chartEnable()
        Call loadChart()
        Call gvDownTimeRefresh()

    End Sub
    Sub chartDisable()

        Session("EnableClick") = False
        ddlTimeLineSpan.Enabled = False

    End Sub
    Sub chartEnable()

        Session("EnableClick") = True
        ddlTimeLineSpan.Enabled = True

    End Sub

#End Region

#Region "DT WorkFlow"

    Sub SetEventDetails(ByVal eventid As Integer)

        'get event details
        Dim eventAdap As New DAQEventsTableAdapters.tblEventTableAdapter
        Dim dtEvent As New DAQEvents.tblEventDataTable
        dtEvent = eventAdap.GetDataBy(eventid)

        rowEvent = dtEvent.Rows(0)

        'get activity details at start of event time
        Dim adapAct As New ActivityTableAdapters.tblActivityTableAdapter
        Dim dtAct As New Activity.tblActivityDataTable

        dtAct = adapAct.GetMostRecentActivityDataByTime(rowEvent.EventStartTime, CInt(Session("workstationID")))

        rowAct = dtAct.Rows(0)
    End Sub
    Protected Sub DAQTimeline1_ElementClicked(ByVal sender As Object, ByVal e As ElementClickArgs) Handles DAQTimeline1.ElementClicked

        'disable the clicking of another event
        Call chartDisable()
        Call loadChart()

        Dim evId As Integer = e.id
        Session("EventID") = evId

        Call SetEventDetails(evId)

        'Event Status
        '0 = event not treated
        '1 = event treated as short stop
        '2 = event treated only with symptom, needs to be closed out completely
        '3 = event treated with symptom and root cause and closed
        '4 = manually started event
        '5 = manually ended event
        '6 = Eliminated by concatenation event
        '7 = blanketted event

        'Event Type
        '-1 = event still running (can set symptom only. Cant set root cause, short stop or start of lot)
        '0 = event finished

        'check if the event has been dealt with already and had its status changed
        If rowEvent.EventStatus = 0 Or rowEvent.EventStatus = 2 Or rowEvent.EventStatus = 4 Or rowEvent.EventStatus = 7 Then

            Dim adapQuery As New DAQEventsTableAdapters.QueriesTableAdapter

            'if current activity is lot running
            If rowAct.ActivityType = 1 Then

                'pnlManualStartTime.Visible = False
                '*************************    lnkManualDowntime.Visible = False

                'check if its a short stop 
                Dim AdapAsset As New AssetTableAdapters.QueriesTableAdapter

                'case for super short stop
                If DateDiff(DateInterval.Second, rowEvent.EventStartTime, rowEvent.EventEndtime) < AdapAsset.SuperShortStopPeriod(CInt(Session("WorkstationID"))) Then
                    Call DoShortStop(2)

                    'case for short stop which has had a symptom added to it through clicking "my remedy is not in this list"
                ElseIf DateDiff(DateInterval.Second, rowEvent.EventStartTime, rowEvent.EventEndtime) < AdapAsset.ShortStopPeriodbyLocID(CInt(Session("WorkstationID"))) And Not rowEvent.EventTempSymptomID = 0 Then
                    Call DoRootCause()

                ElseIf DateDiff(DateInterval.Second, rowEvent.EventStartTime, rowEvent.EventEndtime) < AdapAsset.ShortStopPeriodbyLocID(CInt(Session("WorkstationID"))) Then
                    Call DoShortStop(1)

                    'if its a normal dt check it has not already had a symptom assigned to it
                ElseIf rowEvent.EventTempSymptomID = 0 Then
                    'if its not a short stop show popup for recording of downtime or creation of a new change over
                    Call DoSymptom(False)

                Else
                    'if the symptom is a quick close symptom then open the quick close window 
                    'otherwise open the root cause window
                    Dim adapSymp As New LocationsTableAdapters.QueriesTableAdapter

                    If adapSymp.QuickCloseBySympID(rowEvent.EventTempSymptomID) Then
                        Call ShortStopSelector(rowEvent.EventTempSymptomID)
                    Else
                        Call DoRootCause()
                    End If

                End If



                'else if current activity is change over
            ElseIf rowAct.ActivityType <> 1 Then

                If rowEvent.EventStatus = 4 Then
                    Call DoRootCause()
                Else
                    dvAct.DataBind()
                    Call DoChangeActivity()
                End If


            End If
            Call gvDownTimeRefresh()
            loadChart()
        Else

        End If


    End Sub

    Sub gvDownTimeRefresh()
        'update the downtime grid with new data

        Dim fractime As Double = CInt(txtSliderHandle.Text) - 100
        fractime = fractime / 100 * 24 * 60
        Dim enddate As DateTime = DateAdd(DateInterval.Minute, fractime, Now())
        Dim timelinespan As Double = -ddlTimeLineSpan.SelectedValue
        Dim timelinespanmins As Double = timelinespan * 60


        odsDowntimeForLine.SelectParameters("downtimeend").DefaultValue = DateAdd(DateInterval.Minute, 1, enddate)
        odsDowntimeForLine.SelectParameters("downtimestart").DefaultValue = DateAdd(DateInterval.Minute, timelinespanmins, enddate)
        gvDowntime.DataBind()
        upDowntime.Update()

    End Sub


#End Region

#Region "ShortStop Handlers"

    Sub DoShortStop(ByVal ShortStopType As Integer)

        Select Case ShortStopType
            Case 1
                'long short stop method
                Dim assetAdap As New AssetTableAdapters.QueriesTableAdapter
                Dim sympID As Integer = assetAdap.NominatedSympIdbyLocid(CInt(Session("WorkstationID")))
                Call ShortStopSelector(sympID)
            Case 2
                'get default SS Remedy for line 
                Dim AdapAsset As New AssetTableAdapters.QueriesTableAdapter
                Dim DefaultSSRemedy As Integer = AdapAsset.ShortStopRemedyIDByLocID(CInt(Session("WorkstationID")))
                'default to the quick shortstop downtime closure with the std short stop remedy
                Call CloseShortStop(DefaultSSRemedy, rowEvent)
        End Select

    End Sub
    Sub ShortStopSelector(ByVal sympid As Integer)
        'check if event is finished before closing short stop or quick close
        If Not rowEvent.EventType = -1 Then
            odsShortStopQuickCloses.SelectParameters("SympID").DefaultValue = sympid
            gvShortStop.DataBind()
            upShortStop.Update()

            'show short stop blanket selector

            Call loadSSBlanketChart()
            upSSClose.Update()
            mpeShortStop.Show()
        Else
            lbltimelinemsg.Text = "You cannot complete a root cause for a downtime which has not ended"
            Call chartEnable()
        End If


    End Sub

    Sub loadSSBlanketChart()
        Dim adapass As New AssetTableAdapters.QueriesTableAdapter


        If adapass.BlanketClosedowntime(CInt(Session("WorkstationID"))) Then
            Dim timelinespanmins As Double = -DateDiff(DateInterval.Second, rowEvent.EventStartTime, Now())

            Dim chtadap As New DAQEventsTableAdapters.chartingTableAdapter
            Dim chtdt As New DAQEvents.chartingDataTable
            chtdt = chtadap.GetDataByLocIDStartEndTime(CInt(Session("WorkstationID")), Now(), DateAdd(DateInterval.Second, timelinespanmins, Now()))
            DAQtimelineSSBlanket.StartTime = DateAdd(DateInterval.Second, timelinespanmins, Now())
            DAQtimelineSSBlanket.EndTime = Now()
            DAQtimelineSSBlanket.daqData = chtdt

            Dim actadap As New ActivityTableAdapters.tblActivityTableAdapter
            Dim actdt As New Activity.tblActivityDataTable
            actdt = actadap.GetDataByEndStartLoc(CInt(Session("WorkstationID")), DateAdd(DateInterval.Second, timelinespanmins, Now), Now())
            DAQtimelineSSBlanket.daqActData = actdt

            DAQtimelineSSBlanket.CreateChart()

        Else
            DAQtimelineSSBlanket.Visible = False

        End If
    End Sub
    Protected Sub gvShortStop_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvShortStop.SelectedIndexChanged

        'get the remedy id 
        Dim remedyid As Integer = gvShortStop.SelectedDataKey.Value
        Call RootCauseSelected(remedyid)

    End Sub

    Protected Sub dlShortStop_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlShortStop.ItemCommand

        Dim remedyid As Integer = e.CommandArgument
        Call RootCauseSelected(remedyid)

    End Sub

    Sub RootCauseSelected(ByVal remedyid As Integer)

        Call SetEventDetails(Session("EventID"))

        'find all the events with the current eventid in the eventID or the blanketEventIdcolumns
        Dim adapEvent As New DAQEventsTableAdapters.tblEventTableAdapter
        Dim tbEvent As New DAQEvents.tblEventDataTable
        tbEvent = adapEvent.GetEventAndBlanketedEvents(rowEvent.EventID)

        For Each evRow As DAQEvents.tblEventRow In tbEvent

            'do root cause and remedy addition 
            '   Call RootCauseRemedyAddition(techuser, enguser, execuser, evRow)
            Call CloseShortStop(remedyid, evRow)

        Next

    End Sub

    Sub CloseShortStop(ByVal remedyID As Integer, ByVal evrow As DAQEvents.tblEventRow)

        Call SetEventDetails(Session("EventID"))

        'if the downtime is not completed do not allow the short stop to be executed

        If Not evrow.EventType = -1 Then

            Dim downtimeid As Integer

            'get default Symptom for line
            Dim AdapRem As New RootCauseRemedyTableAdapters.QueriesTableAdapter
            Dim symptomID As Integer = AdapRem.SymptomIDfromRemedy(remedyID)

            'create downtime 
            Dim adapDT As New DowntimeTableAdapters.QueriesTableAdapter
            adapDT.spInsertDAQShortStopDowntime(evrow.EventStartTime, evrow.EventEndtime, symptomID, rowAct.ActivityID, remedyID, downtimeid)

            Dim adapEvent As New DAQEventsTableAdapters.QueriesTableAdapter
            'update the event with downtime ID and event status change to 1 = short stop
            adapEvent.UpdateEventStatus(1, downtimeid, symptomID, evrow.EventID)

            loadChart()


            'check if remedyID has an image related to it

            Dim imgQueryAdap As New ImageHandlerTableAdapters.QueriesTableAdapter
            If imgQueryAdap.ImageCountForRemedy(remedyID) > 0 Then
                'there is an image so do something

                Call createSSImageButton(remedyID)


            End If
            'there is no image so carry on

        End If

        Call gvDownTimeRefresh()
        Call chartEnable()
        Call loadChart()
        mpeShortStop.Hide()
        lbltimelinemsg.Text = ""


    End Sub
    Protected Sub lnkMPEShortStopClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkMPEShortStopClose.Click
        Call chartEnable()
        Call loadChart()
        mpeShortStop.Hide()
    End Sub
    Protected Sub lblRootCauseEntry_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblRootCauseEntry.Click
        mpeShortStop.Hide()
        mpeSymptom.Show()

    End Sub

    Protected Sub DAQtimelineSSBlanket_ElementClicked(ByVal sender As Object, ByVal e As ElementClickArgs) Handles DAQtimelineSSBlanket.ElementClicked

        Dim blankEventID As Integer = e.id
        'set master event details
        Call SetEventDetails(CInt(Session("EventID")))
        Dim adapEventQ As New DAQEventsTableAdapters.QueriesTableAdapter
        Dim AdapAsset As New AssetTableAdapters.QueriesTableAdapter

        'check if event is > SS time or event is still active

        If adapEventQ.EventTimeSecs(blankEventID) < AdapAsset.ShortStopPeriodbyLocID(CInt(Session("WorkstationID"))) Then

            'check to see if event is still active, do not allow selection for event which is still active.
            If Not adapEventQ.EventTypeByEventID(blankEventID) = -1 Then
                'set sub event to have the blanket id of the master event id
                adapEventQ.BlanketEventID(rowEvent.EventID, 7, e.id)
                're load chart
                Call loadSSBlanketChart()
                upSSClose.Update()
            End If

        End If


    End Sub




#End Region

#Region "Short Stop Image Handlers"

    Sub CreateSSImageButton(ByVal remedyid As Integer)

        lblRemedyID.Text = remedyid

        Dim imgrow As ImageHandler.tblShortStopImageRow
        Dim imgadap As New ImageHandlerTableAdapters.tblShortStopImageTableAdapter
        Dim imgdt As New ImageHandler.tblShortStopImageDataTable
        imgdt = imgadap.GetDataBy(remedyid)
        imgrow = imgdt.Rows(0)

        lblInstruction.Text = imgrow.imagedesc

        imgButtSSImage.ImageUrl = "~/DaqFrontEnd/imggopher.aspx?remedyid=" & remedyid
        upimagebutton.Update()

        mpeSSImage.Show()


    End Sub

    Protected Sub imgButtSSImage_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgButtSSImage.Click

        Dim imgrow As ImageHandler.tblShortStopImageRow
        Dim imgadap As New ImageHandlerTableAdapters.tblShortStopImageTableAdapter
        Dim imgdt As New ImageHandler.tblShortStopImageDataTable
        imgdt = imgadap.GetHighestRevImageEnabled(lblRemedyID.Text)
        imgrow = imgdt.Rows(0)

        Dim clickadap As New ImageHandlerTableAdapters.tblImageClickTableAdapter
        clickadap.Insert(imgrow.imageid, e.X, e.Y, Now())

        mpeSSImage.Hide()

    End Sub



#End Region

#Region "Symptom handlers"

    Protected Sub lnkManualDowntime_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkManualDowntime.Click
        'start a manual downtime
        Call DoSymptom(True)
    End Sub


    Sub DoSymptom(ByVal showTime As Boolean)

        If showTime Then
            pnlManualStartTime.Visible = True
            txtManualStart.Text = Now()
        Else
            pnlManualStartTime.Visible = False
        End If

        SymptomODS.SelectParameters("locid").DefaultValue = CInt(Session("WorkstationID"))
        dlSymptom.DataBind()
        upSymp.Update()

        'show the symptom capture box
        mpeSymptom.Show()
    End Sub
    Protected Sub drillDownSymp_ControlClicked(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles drillDownSymp.ControlClicked
        'show possible symptoms for location
        SymptomODS.SelectParameters("locid").DefaultValue = e.CommandArgument
        dlSymptom.DataBind()
        mpeSymptom.Show()
    End Sub
    Protected Sub dlSymptom_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlSymptom.ItemCommand
        'get selected symptom
        Dim symptomid As Integer = e.CommandArgument
        'set symptom in event field
        Dim adapEvent As New DAQEventsTableAdapters.QueriesTableAdapter


        'BUG FIX
        'if the symptomid = 0 or null then do not update the event id

        If Not symptomid = 0 Then

            'if the downtime is manually entered
            If pnlManualStartTime.Visible = True Then
                'start a manual downtime
                adapEvent.InsertNewEvent(txtManualStart.Text, CInt(Session("WorkstationID")), 4, -1, symptomid)
            Else
                'update the event with downtime ID and event status change to 1 = short stop
                adapEvent.UpdateEventStatus(2, 0, symptomid, CInt(Session("EventID")))

            End If
            'set the symptom drill down control to the top level
            drillDownSymp.locID = CInt(Session("WorkstationID"))
            drillDownSymp.refDataBind()

            'set the symptom list to the top level for the next use
            SymptomODS.SelectParameters("locid").DefaultValue = CInt(Session("WorkstationID"))
            dlSymptom.DataBind()

        End If


        Call chartEnable()
        Call loadChart()
        mpeSymptom.Hide()

        'show previous root cause remedies for this issue.

        Call showRootCauseReview(symptomid)

    End Sub
    Protected Sub lnkMPESympClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkMPESympClose.Click
        mpeSymptom.Hide()

        'set the symptom drill down control to the top level for next use
        drillDownSymp.locID = CInt(Session("WorkstationID"))
        drillDownSymp.refDataBind()

        'set the symptom list to the top level for the next use
        SymptomODS.SelectParameters("locid").DefaultValue = CInt(Session("WorkstationID"))
        dlSymptom.DataBind()
        Call chartEnable()
        Call loadChart()

    End Sub
    Sub showRootCauseReview(ByVal symptomid As Integer)

        odsRemReview.SelectParameters("symptomID").DefaultValue = symptomid
        gvRCRemReview.DataBind()
        upRCRemReview.Update()
        mpeRCRemReview.Show()

    End Sub
    Protected Sub lnkRevRemsClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkRevRemsClose.Click
        mpeRCRemReview.Hide()
    End Sub
#End Region

#Region "RootCause handlers"

    Sub DoRootCause()
        lbltimelinemsg.Text = ""
        If rowEvent.EventType = -1 And Not rowEvent.EventStatus = 4 Then
            lbltimelinemsg.Text = "You cannot complete a root cause for a downtime which has not ended"
            Call chartEnable()
        Else

            If rowEvent.EventStatus = 4 Then
                'show the manual end time box
                pnlManualEndtime.Visible = True
                txtManualEndtime.Text = Now()
            Else
                pnlManualEndtime.Visible = False
            End If
            'if concatenatedowntime is on for this line then show button 

            Dim assetAdap As New AssetTableAdapters.QueriesTableAdapter
            Dim concatOn As Boolean = assetAdap.concatenateDowntime(CInt(Session("WorkstationID")))

            If concatOn Then
                lnkConcatDowntime.Visible = True
                pnlConcatDT.Visible = False
            Else
                pnlConcatDT.Visible = False
                lnkConcatDowntime.Visible = False
            End If

            upRootCause.Update()
            'show the symptom capture box
            mpeRootCause.Show()
        End If

    End Sub

    Protected Sub drilldownRootCause_ControlClicked(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles drilldownRootCause.ControlClicked

        Dim rootCauseLocID As Integer = e.CommandArgument
        Session("RCLocID") = rootCauseLocID

        'check if there are any further locations under this root cause location
        Dim locadap As New LocationsTableAdapters.QueriesTableAdapter
        Dim childrenCount As Integer = locadap.ChildrenCount(rootCauseLocID)

        If childrenCount = 0 Then
            txtRootCause.Visible = True
            txtRemedy.Visible = True
            rblEngineer.Visible = True
        Else
            txtRootCause.Visible = False
            txtRemedy.Visible = False
            rblEngineer.Visible = False
            pnlEngSign.Visible = False
            pnlExecSign.Visible = False
            pnlTechSign.Visible = False

        End If

        mpeRootCause.Show()

    End Sub

    Protected Sub rblEngineer_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rblEngineer.SelectedIndexChanged

        Call SetEventDetails(CInt(Session("EventID")))

        pnlEngSign.Visible = False
        pnlExecSign.Visible = False
        pnlTechSign.Visible = False
        btnRemRootCause.Visible = False

        'Set up the appropriate signature panels
        pnlTechSign.Visible = True

        'if the downtime requires an engineer
        If rblEngineer.SelectedValue = 0 Then
            pnlEngSign.Visible = True
        End If

        Dim adapAsset As New AssetTableAdapters.QueriesTableAdapter

        'if the downtime was > than specified time add exec sign

        If DateDiff(DateInterval.Minute, rowEvent.EventStartTime, rowEvent.EventEndtime) > adapAsset.ExecSignPeriod(CInt(Session("WorkstationID"))) Then
            pnlExecSign.Visible = True
        End If

        btnRemRootCause.Visible = True
        mpeRootCause.Show()

    End Sub

    Protected Sub btnRemRootCause_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemRootCause.Click
        Call SetEventDetails(CInt(Session("EventID")))

        lblLoginMsg.Text = ""
        Dim proceed As Boolean = False
        Dim AdapUser As New UsersTableAdapters.QueriesTableAdapter
        Dim techuser, enguser, execuser As Integer

        'check the passwords if the pnls are active

        If pnlTechSign.Visible = True Then

            If AdapUser.checkUserPass(txtTechSign.Text, txtTechPass.Text) = 1 Then
                proceed = True
                techuser = AdapUser.UserIdbyUserName(txtTechSign.Text)
            Else
                proceed = False
                lblLoginMsg.Text = "Tech User/Pass Incorrect."
            End If

        End If

        If pnlEngSign.Visible = True And proceed = True Then

            If AdapUser.UserPassCheckbyLevel(txtEngSign.Text, txtEngPass.Text, 2) = 1 Then
                proceed = True
                enguser = AdapUser.UserIdbyUserName(txtEngSign.Text)
            Else
                proceed = False
                lblLoginMsg.Text = lblLoginMsg.Text & " " & "Eng User/Pass Incorrect."
            End If

        End If

        If pnlExecSign.Visible = True And proceed = True Then

            If AdapUser.UserPassCheckbyLevel(txtExecSign.Text, txtExecPass.Text, 3) = 1 Then
                proceed = True
                execuser = AdapUser.UserIdbyUserName(txtExecSign.Text)
            Else
                proceed = False
                lblLoginMsg.Text = lblLoginMsg.Text & " " & "Exec User/Pass Incorrect."
            End If

        End If

        If proceed Then
            'close all events with the event id or the eventid in question in the blanket event id field

            Dim adapEvent As New DAQEventsTableAdapters.tblEventTableAdapter
            Dim tbEvent As New DAQEvents.tblEventDataTable
            tbEvent = adapEvent.GetEventAndBlanketedEvents(rowEvent.EventID)

            For Each evRow As DAQEvents.tblEventRow In tbEvent

                'do root cause and remedy addition 
                Call RootCauseRemedyAddition(techuser, enguser, execuser, evRow)
            Next

            'reset the pop up for the next use
            Dim locadap As New LocationsTableAdapters.QueriesTableAdapter

            drilldownRootCause.locID = locadap.GetRCLocIDFromSymptomLocID(CInt(Session("WorkstationID")))
            drilldownRootCause.refDataBind()

            txtTechSign.Text = ""
            txtEngSign.Text = ""
            txtExecSign.Text = ""
            txtRootCause.Text = ""
            txtRootCause.Visible = False
            txtRemedy.Text = ""
            txtRemedy.Visible = False
            rblEngineer.Visible = False
            rblEngineer.SelectedIndex = -1
            btnRemRootCause.Visible = False
            pnlTechSign.Visible = False
            pnlEngSign.Visible = False
            pnlExecSign.Visible = False


            mpeRootCause.Hide()
            Call gvDownTimeRefresh()
            Call chartEnable()
            Call loadChart()

        Else
            mpeRootCause.Show()
        End If

        loadChart()

    End Sub

    Sub RootCauseRemedyAddition(ByVal techuser As Integer, ByVal enguser As Integer, ByVal execuser As Integer, ByVal evrow As DAQEvents.tblEventRow)

        Call SetEventDetails(CInt(Session("EventID")))

        'add root cause to table
        Dim RootRemAdap As New RootCauseRemedyTableAdapters.QueriesTableAdapter
        Dim newRC As Integer = 0
        RootRemAdap.SPInsertRootCause(txtRootCause.Text, rowEvent.EventTempSymptomID, CInt(Session("RCLocID")), newRC)

        'add remedy to table
        Dim newREM As Integer = 0
        RootRemAdap.SPInsertRemedy(txtRemedy.Text, newRC, newREM)

        'add downtime to downtime table
        Dim adapDowntime As New DowntimeTableAdapters.QueriesTableAdapter
        Dim downtimeID As Integer
        Dim eventend As DateTime
        Dim Actid As Integer
        'If event is manual event then use  the typed downtime
        If rowEvent.EventStatus = 4 Then

            eventend = CDate(txtManualEndtime.Text)

            'if its a manual event select the activity it is started in 
            Dim adapActManual As New ActivityTableAdapters.tblActivityTableAdapter
            Dim dtActManual As New Activity.tblActivityDataTable
            dtActManual = adapActManual.GetActivityDataByTime(rowEvent.EventStartTime, rowEvent.EventLocID)

            If dtActManual.Rows.Count = 0 Then
                Actid = rowAct.ActivityID
            Else
                Dim rowActManual As Activity.tblActivityRow = dtActManual.Rows(0)
                Actid = rowActManual.ActivityID
            End If



        Else
            eventend = evrow.EventEndtime
            Actid = rowAct.ActivityID
        End If

        'adapDowntime.spInsertDAQDowntime(rowEvent.EventStartTime, eventend, rowEvent.EventTempSymptomID, rowAct.ActivityID, newREM, techuser, enguser, execuser, downtimeID)

        adapDowntime.spInsertDAQDowntime(evrow.EventStartTime, eventend, rowEvent.EventTempSymptomID, Actid, newREM, techuser, enguser, execuser, downtimeID)


        'update event table to indicate the downtime has been closed out
        Dim adapEvent As New DAQEventsTableAdapters.QueriesTableAdapter
        If rowEvent.EventStatus = 4 Then
            adapEvent.UpdateManualEventStatus(5, downtimeID, rowEvent.EventTempSymptomID, 0, eventend, rowEvent.EventID)
        Else
            adapEvent.UpdateEventStatus(3, downtimeID, rowEvent.EventTempSymptomID, evrow.EventID)
        End If

    End Sub

    Protected Sub btnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose.Click
        Call chartEnable()
        Call loadChart()
        mpeRootCause.Hide()

    End Sub

#End Region

#Region "Concatenate & Blanket Event Downtime Handlers"

    Protected Sub lnkConcatDowntime_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkConcatDowntime.Click

        Call SetEventDetails(CInt(Session("EventID")))
        pnlConcatDT.Visible = True
        Call loadConCatChart()
        upRootCause.Update()
        'initialize the chart and open the panel to display the chart
    End Sub
    Sub loadConCatChart()

        Dim timelinespanmins As Double = -DateDiff(DateInterval.Second, rowEvent.EventStartTime, Now())

        Dim chtadap As New DAQEventsTableAdapters.chartingTableAdapter
        Dim chtdt As New DAQEvents.chartingDataTable
        chtdt = chtadap.GetDataByLocIDStartEndTime(CInt(Session("WorkstationID")), Now(), DateAdd(DateInterval.Second, timelinespanmins, Now()))
        DAQtimelineConCat.StartTime = DateAdd(DateInterval.Second, timelinespanmins, Now())
        DAQtimelineConCat.EndTime = Now()
        DAQtimelineConCat.daqData = chtdt

        Dim actadap As New ActivityTableAdapters.tblActivityTableAdapter
        Dim actdt As New Activity.tblActivityDataTable
        actdt = actadap.GetDataByEndStartLoc(CInt(Session("WorkstationID")), DateAdd(DateInterval.Second, timelinespanmins, Now), Now())
        DAQtimelineConCat.daqActData = actdt

        DAQtimelineConCat.CreateChart()

    End Sub
    Protected Sub DAQtimelineConCat_ElementClicked(ByVal sender As Object, ByVal e As ElementClickArgs) Handles DAQtimelineConCat.ElementClicked

        Call SetEventDetails(CInt(Session("EventID")))

        Dim closetype As Integer

        Dim concatEvent As Integer = e.id

        Dim adapEvent As New DAQEventsTableAdapters.tblEventTableAdapter
        Dim dtEvent As New DAQEvents.tblEventDataTable
        dtEvent = adapEvent.GetDataBy(e.id)
        Dim concatRow As DAQEvents.tblEventRow = dtEvent.Rows(0)

        Dim AdapAss As New AssetTableAdapters.QueriesTableAdapter
        If AdapAss.concatenateDowntime(CInt(Session("WorkstationID"))) Then
            closetype = 1

        End If

        If AdapAss.BlanketClosedowntime(CInt(Session("WorkstationID"))) Then
            closetype = 2

        End If

        Dim adapEventQ As New DAQEventsTableAdapters.QueriesTableAdapter

        Select Case closetype

            Case 1 ' concat close
                'update the current event to end at the end time of the clicked event.
                adapEventQ.UpdateEventEndTime(concatRow.EventEndtime, rowEvent.EventID)

                'update the other events between the first event and the last event or change status to concatenated (status = 6)
                adapEventQ.UpdateStatusByStartTimeLoc(6, rowEvent.EventStartTime, concatRow.EventEndtime, CInt(Session("workstationID")))

                'reset the event details
                Call SetEventDetails(CInt(Session("EventID")))
                Call loadConCatChart()
                upRootCause.Update()



            Case 2 'blanket close

                'if clicked unit is already type 7 reset to type 1
                'update the selected event to have the blanket event ID in its blanket event id column and change status to 7
                adapEventQ.BlanketEventID(rowEvent.EventID, 7, e.id)
                Call loadConCatChart()
                upRootCause.Update()

        End Select

    End Sub

#End Region

#Region "Activity Change Handlers"

    Protected Sub lnkMPEActChgClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkMPEActChgClose.Click
        mpeActivityChg.Hide()
        Call clearActChng()
        Call chartEnable()
        Call loadChart()
        lblActChgLoginMsg.Text = ""
    End Sub

    Protected Sub lnkChangeOver_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkChangeOver.Click

        mpeSymptom.Hide()
        Call DoChangeActivity()

    End Sub

    Sub DoChangeActivity()

        dvAct.DataBind()

        Call SetEventDetails(CInt(Session("EventID")))

        'activity chagne work flow
        'find current activity type
        Select Case rowAct.ActivityType

            Case 1 'lot running
                pnlEndLot.Visible = True
                revUnitsGen.Enabled = True
                revWasteGen.Enabled = True

            Case 2 'change over running
                revUnitsGen.Enabled = False
                revWasteGen.Enabled = False

            Case 3 ' idle timerunning
                revUnitsGen.Enabled = False
                revWasteGen.Enabled = False

        End Select

        dvAct.DataBind()
        upActivityChg.Update()

        mpeActivityChg.Show()

    End Sub
    Protected Sub rblNewActivity_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rblNewActivity.SelectedIndexChanged

        Call SetEventDetails(CInt(Session("EventID")))
        lblActChgLoginMsg.Text = ""
        pnlStartLot.Visible = False
        pnlStartChangeOver.Visible = False
        pnlStartIdleTime.Visible = False

        'there are x unclosed downtimes for the current activity.  if they are not closed they will not be recorded as downtimes


        Select Case rblNewActivity.SelectedValue

            Case 1
                'check if the event type is 0 to show the event has finished
                If rowEvent.EventType = 0 Then
                    pnlStartLot.Visible = True
                    pnlActChgAuthen.Visible = True
                Else
                    lblActChgLoginMsg.Text = "The event you selected must have finished to start a new lot"
                    pnlActChgAuthen.Visible = False
                End If
                rfvLot.Enabled = True
                revTarget.Enabled = True

            Case 2
                pnlStartChangeOver.Visible = True
                pnlActChgAuthen.Visible = True
                rfvLot.Enabled = False
                revTarget.Enabled = False
            Case 3
                pnlStartIdleTime.Visible = True
                pnlActChgAuthen.Visible = True
                rfvLot.Enabled = False
                revTarget.Enabled = False
        End Select
        upActivityChg.Update()

        mpeActivityChg.Show()
    End Sub
    Protected Sub btnActChgSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnActChgSubmit.Click


        'check user authentication details
        Dim proceed As Boolean
        Dim AdapUser As New UsersTableAdapters.QueriesTableAdapter
        Dim techuser As Integer


        If AdapUser.checkUserPass(txtActChgUser.Text, txtActChgPass.Text) = 1 Then
            proceed = True
            techuser = AdapUser.UserIdbyUserName(txtActChgUser.Text)
        Else
            proceed = False
            lblActChgLoginMsg.Text = "Tech User/Pass Incorrect."
            mpeActivityChg.Show()
        End If


        Dim unclosedDT As Integer = GetUnclosedDowntime()

        If unclosedDT > 0 Then

            proceed = True
            lblActChgLoginMsg.Text = "You have " & unclosedDT & " unclosed downtimes for this batch, please close before proceeding"


        End If


        If proceed Then

            Call SetEventDetails(CInt(Session("EventID")))
            Dim adapAct As New ActivityTableAdapters.QueriesTableAdapter

            'end the current activity
            Select Case rowAct.ActivityType

                Case 1 'lot in progress
                    'end the lot
                    adapAct.UpdateAtEndOfLot(rowEvent.EventStartTime, txtUnitsGen.Text, txtWasteGen.Text, techuser, Now(), rowEvent.EventStartCount, rowAct.ActivityID)
                Case 2 'changover in progress
                    adapAct.UpdateEndCOorIdle(rowEvent.EventEndtime, techuser, Now(), rowAct.ActivityID)
                Case 3 'idle time in progress
                    adapAct.UpdateEndCOorIdle(rowEvent.EventStartTime, techuser, Now(), rowAct.ActivityID)

            End Select

            'start the new activity
            Dim actid As Integer

            Select Case rblNewActivity.SelectedValue

                Case 1
                    'start a new lot
                    adapAct.spInsertNewLot(rblNewActivity.SelectedValue, CInt(Session("workstationID")), rowEvent.EventEndtime, txtLot.Text, rowAct.ActivityID, ddlFormat.SelectedValue, txtTarget.Text, techuser, Now(), rowEvent.EventEndCount, txtItem.Text, actid)
                    lnkManualDowntime.Visible = False

                Case 2
                    'start a new CO.
                    adapAct.spInsertNewChangeOver(rblNewActivity.SelectedValue, CInt(Session("workstationID")), rowEvent.EventStartTime, CStr(rowEvent.EventStartTime), techuser, Now(), rowAct.ActivityID, ddlCOlist.SelectedValue, actid)
                    lnkManualDowntime.Visible = True

                Case 3
                    'start a new Idle time
                    adapAct.spInsertNewIdleTime(rblNewActivity.SelectedValue, CInt(Session("workstationID")), rowEvent.EventStartTime, rowAct.ActivityID, techuser, Now(), actid)
                    lnkManualDowntime.Visible = True

            End Select

            'update the loc table and the old activity with the new activity id

            'insert into the old activity  postactId field
            adapAct.UpdatePostActivityIDField(actid, rowAct.ActivityID)

            'update loctable with new activity ID
            Dim adapLoc As New LocationsTableAdapters.QueriesTableAdapter
            adapLoc.UpdateLotStatusByLocID(actid, CInt(Session("workstationID")))

            mpeActivityChg.Hide()

            Call clearActChng()
            Call chartEnable()
            Call loadChart()

            Response.Redirect("daqwshome.aspx")



        End If
    End Sub

    Sub clearActChng()

        pnlStartLot.Visible = False
        pnlStartChangeOver.Visible = False
        pnlStartIdleTime.Visible = False
        pnlEndLot.Visible = False
        pnlActChgAuthen.Visible = False
        txtActChgUser.Text = ""
        txtLot.Text = ""
        txtTarget.Text = ""
        txtUnitsGen.Text = ""
        txtWasteGen.Text = ""
        lblActChgLoginMsg.Text = ""
        rblNewActivity.SelectedIndex = -1

    End Sub
    Function GetUnclosedDowntime() As Integer

        Call SetEventDetails(CInt(Session("EventID")))

        Dim locadap As New LocationsTableAdapters.QueriesTableAdapter
        Dim activityid As Integer = locadap.ActivityIDFromLocID(CInt(Session("workstationID")))

        'get start and end time of activity

        Dim actAdap As New ActivityTableAdapters.tblActivityTableAdapter
        Dim actdt As New Activity.tblActivityDataTable

        actdt = actAdap.GetDataByActivityID(activityid)

        Dim actrow As Activity.tblActivityRow = actdt.Rows(0)

        If actrow.ActivityType = 1 Then 'if activity is a lot then get the downtime for it, if not ignore this

            'get number of unclosed events for this line between the start and end time of the activity

            Dim eventadap As New DAQEventsTableAdapters.QueriesTableAdapter

            Dim eventcount As Integer = eventadap.UnclosedDowntimes(0, 0, CInt(Session("workstationID")), actrow.StartTime, rowEvent.EventEndtime)

            Return eventcount
        Else
            Return 0

        End If



    End Function



#End Region

#Region "Activity Comment Handlers"

    Protected Sub btnActComment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnActComment.Click

        lblActCommMsg.Text = ""

        Dim proceed As Boolean
        'do authentication 
        Dim AdapUser As New UsersTableAdapters.QueriesTableAdapter
        Dim techuser As Integer

        'check the passwords if the pnls are active

        If AdapUser.checkUserPass(txtActCommUser.Text, txtActCommentPass.Text) = 1 Then
            proceed = True
            techuser = AdapUser.UserIdbyUserName(txtActCommUser.Text)
        Else
            proceed = False
            lblActCommMsg.Text = "User/Pass Incorrect."
            mpeActComment.Show()
        End If

        If proceed Then

            Dim locadap As New LocationsTableAdapters.QueriesTableAdapter
            Dim activityid As Integer = locadap.ActivityIDFromLocID(CInt(Session("workstationID")))
            Dim adapActComm As New CommentsTableAdapters.tblActCommentTableAdapter
            adapActComm.Insert(techuser, Now(), txtActComment.Text, activityid)
            Call actCommentClear()
            mpeActComment.Hide()
            Call chartEnable()

        End If

    End Sub
    Protected Sub lnkAddComment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkAddComment.Click
        upActComment.Update()
        mpeActComment.Show()
    End Sub

    Protected Sub lnkActCommentclose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkActCommentclose.Click
        Call actCommentClear()
        mpeActComment.Hide()
        Call chartEnable()
    End Sub

    Sub actCommentClear()
        txtActComment.Text = ""
        txtActCommentPass.Text = ""
        txtActCommUser.Text = ""
    End Sub

#End Region

#Region "Shift HandOver Handlers"
    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        odsShiftHand.InsertParameters("EntryTime").DefaultValue = Now()
        odsShiftHand.InsertParameters("LineID").DefaultValue = Session("workstationID")
        fvShiftHand.InsertItem(False)
    End Sub
#End Region

#Region "Output Calculation Handlers"

    Protected Sub tmOutput_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles tmOutput.Tick
        'update the output via query to external database
        Call UpdateOutputValue()
        upOutput.Update()

    End Sub

    Sub UpdateOutputValue()

        Dim output As Object
        Dim adapAsset As New AssetTableAdapters.tblAssetTableAdapter
        'get asset details
        Dim dtAsset As New Asset.tblAssetDataTable
        dtAsset = adapAsset.GetDataBy(CInt(Session("WorkstationID")))
        Dim dtrow As Asset.tblAssetRow = dtAsset.Rows(0)

        'get format details for the line

        Dim locadap As New LocationsTableAdapters.QueriesTableAdapter
        Dim formatmult As Integer

        If IsDBNull(locadap.OutputMultiplierByFormat(CInt(Session("WorkstationID")))) Then
            formatmult = 1
        Else
            formatmult = locadap.OutputMultiplierByFormat(CInt(Session("WorkstationID")))
        End If



        Select Case dtrow.OutputCalcType

            Case 1 'Oracle connection

                Dim oraConnString As String = dtrow.OutputConnString
                Dim oraconn As New OracleConnection(oraConnString)

                oraconn.Open()

                Dim oraCmd As New OracleCommand

                Dim sqlText As String = dtrow.OutputSQL
                sqlText = findandreplaceVar(sqlText)

                oraCmd.CommandText = sqlText
                oraCmd.Connection = oraconn

                Dim OraAdap As New OracleDataAdapter
                Dim OraRead As OracleDataReader

                OraRead = oraCmd.ExecuteReader

                While OraRead.Read()
                    If Not OraRead.IsDBNull(0) Then

                        output = OraRead.GetDecimal(0)
                        lblCurrentOutput.Text = output & " " & dtrow.OutputSQLvar1
                        updategoodunitsforactivity(output)
                    Else
                        lblCurrentOutput.Text = "Null"
                    End If

                End While

                oraconn.Close()



            Case 2 'SQL connection
                Dim sqlconn As New SqlConnection
                sqlconn.ConnectionString = dtrow.OutputConnString

                sqlconn.Open()

                Dim sqlText As String = dtrow.OutputSQL

                sqlText = findandreplaceVar(sqlText)

                Dim sqlcomm As New SqlCommand
                sqlcomm.CommandText = sqlText
                sqlcomm.Connection = sqlconn


                Dim reader As SqlDataReader
                reader = sqlcomm.ExecuteReader()

                While reader.Read()

                    If reader.IsDBNull(0) Then
                        lblCurrentOutput.Text = "Null"
                    Else

                        output = CInt(reader.GetValue(0)) * formatmult
                        lblCurrentOutput.Text = output & " " & dtrow.OutputSQLvar1
                        updategoodunitsforactivity(output)
                    End If


                End While

                sqlconn.Close()


        End Select



    End Sub


    Function findandreplaceVar(ByVal sqltext As String) As String

        Dim newSQLtext As String
        Dim txtindex As Integer = sqltext.IndexOf("[batchid]")

        If txtindex > -1 Then
            newSQLtext = sqltext.Replace("[batchid]", lblLot.Text)
            Return newSQLtext
        Else
            Return sqltext

        End If

    End Function

    Sub updategoodunitsforactivity(ByVal goodunits As Decimal)

        Try
            Dim actadap As New ActivityTableAdapters.QueriesTableAdapter
            actadap.UpdateGoodProductByActivityID(goodunits, rowAct.ActivityID)
        Catch ex As Exception

        End Try

    End Sub
    Protected Sub lnkOutputUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkOutputUpdate.Click
        pnlOutputUpdate.Visible = True
    End Sub

    Protected Sub btnUpdateOutput_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateOutput.Click
        Try

            'update activity with current output
            ' get activity for location
            Dim actAdap As New LocationsTableAdapters.QueriesTableAdapter
            Dim actid As Integer = actAdap.ActivityIDFromLocID(CInt(Session("WorkstationID")))

            Dim adapgoodprod As New ActivityTableAdapters.QueriesTableAdapter
            adapgoodprod.UpdateGoodProductByActivityID(txtOutputUpdate.Text, actid)
            pnlOutputUpdate.Visible = False
        Catch ex As Exception

        End Try

    End Sub
#End Region

#Region "Highlight repeat downtimes"

    Protected Sub gvDowntime_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvDowntime.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            If e.Row.Cells(4).Text = ss5Desc Then
                ss5Count = ss5Count + 1

                If ss5Count = 3 And DateDiff(DateInterval.Minute, CDate(e.Row.Cells(0).Text), ss5Start) < 20 Then
                    e.Row.BackColor = Drawing.Color.DarkOrange

                End If
            Else
                ss5Desc = e.Row.Cells(4).Text
                ss5Start = CDate(e.Row.Cells(0).Text)
                ss5Count = 1

            End If
        End If
    End Sub

#End Region
End Class
