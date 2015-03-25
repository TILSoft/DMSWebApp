
Partial Class Controls_DAQtimelinetester
    Inherits System.Web.UI.Page
    Public LocArray(2, 20) As Object


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        LocArray(1, 1) = DAQTimeline1
        LocArray(1, 2) = DAQTimeline2
        LocArray(1, 3) = DAQTimeline3
        LocArray(1, 4) = DAQTimeline4
        LocArray(1, 5) = DAQTimeline5
        LocArray(1, 6) = DAQTimeline6
        LocArray(2, 1) = 5752
        LocArray(2, 2) = 5316
        LocArray(2, 3) = 6188
        LocArray(2, 4) = 6624
        LocArray(2, 5) = 3435
        LocArray(2, 6) = 7060

        Dim i As Integer

        i = 1

        Do Until LocArray(2, i) = Nothing
            loadchart(i)
            i = i + 1

        Loop

    End Sub
    Sub loadchart(i As Integer)

        Dim myadapter As New DAQEventsTableAdapters.chartingTableAdapter
        Dim mydt As New DAQEvents.chartingDataTable
        mydt = myadapter.GetDataByLocIDStartEndTime(LocArray(2, i), Now(), DateAdd(DateInterval.Hour, -ddlTime.SelectedValue, Now()))

        Dim actadap As New ActivityTableAdapters.tblActivityTableAdapter
        Dim actdt As New Activity.tblActivityDataTable

        actdt = actadap.GetDataByEndStartLoc(LocArray(2, i), DateAdd(DateInterval.Hour, -ddlTime.SelectedValue, Now()), Now())

        Select Case i
            Case 1
                DAQTimeline1.StartTime = DateAdd(DateInterval.Hour, -ddlTime.SelectedValue, Now())
                DAQTimeline1.EndTime = Now()
                DAQTimeline1.daqData = mydt
                DAQTimeline1.daqActData = actdt
                DAQTimeline1.CreateChart()

            Case 2
                DAQTimeline2.StartTime = DateAdd(DateInterval.Hour, -ddlTime.SelectedValue, Now())
                DAQTimeline2.EndTime = Now()
                DAQTimeline2.daqData = mydt
                DAQTimeline2.daqActData = actdt
                DAQTimeline2.CreateChart()
            Case 3
                DAQTimeline3.StartTime = DateAdd(DateInterval.Hour, -ddlTime.SelectedValue, Now())
                DAQTimeline3.EndTime = Now()
                DAQTimeline3.daqData = mydt
                DAQTimeline3.daqActData = actdt
                DAQTimeline3.CreateChart()
            Case 4
                DAQTimeline4.StartTime = DateAdd(DateInterval.Hour, -ddlTime.SelectedValue, Now())
                DAQTimeline4.EndTime = Now()
                DAQTimeline4.daqData = mydt
                DAQTimeline4.daqActData = actdt
                DAQTimeline4.CreateChart()
            Case 5
                DAQTimeline5.StartTime = DateAdd(DateInterval.Hour, -ddlTime.SelectedValue, Now())
                DAQTimeline5.EndTime = Now()
                DAQTimeline5.daqData = mydt
                DAQTimeline5.daqActData = actdt
                DAQTimeline5.CreateChart()
            Case 6
                DAQTimeline6.StartTime = DateAdd(DateInterval.Hour, -ddlTime.SelectedValue, Now())
                DAQTimeline6.EndTime = Now()
                DAQTimeline6.daqData = mydt
                DAQTimeline6.daqActData = actdt
                DAQTimeline6.CreateChart()
        End Select

    End Sub

    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        UpdatePanel1.Update()

    End Sub
End Class
