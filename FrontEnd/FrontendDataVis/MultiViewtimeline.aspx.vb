
Partial Class Controls_DAQtimelinetester
    Inherits System.Web.UI.Page
    Public LocArray(2, 20) As Object


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        LocArray(1, 1) = DAQTimeline1
        LocArray(1, 2) = DAQTimeline2
        LocArray(1, 3) = DAQTimeline3
        LocArray(2, 1) = 166
        LocArray(2, 2) = 92
        LocArray(2, 3) = 1972
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
        mydt = myadapter.GetDataByLocIDStartEndTime(LocArray(2, i), Now(), DateAdd(DateInterval.Hour, -3, Now()))

        Dim actadap As New ActivityTableAdapters.tblActivityTableAdapter
        Dim actdt As New Activity.tblActivityDataTable

        actdt = actadap.GetDataByEndStartLoc(LocArray(2, i), DateAdd(DateInterval.Hour, -3, Now()), Now())

        Select Case i
            Case 1
                DAQTimeline1.StartTime = DateAdd(DateInterval.Hour, -3, Now())
                DAQTimeline1.EndTime = Now()
                DAQTimeline1.daqData = mydt
                DAQTimeline1.daqActData = actdt
                DAQTimeline1.CreateChart()

            Case 2
                DAQTimeline2.StartTime = DateAdd(DateInterval.Hour, -3, Now())
                DAQTimeline2.EndTime = Now()
                DAQTimeline2.daqData = mydt
                DAQTimeline2.daqActData = actdt
                DAQTimeline2.CreateChart()
            Case 3
                DAQTimeline3.StartTime = DateAdd(DateInterval.Hour, -3, Now())
                DAQTimeline3.EndTime = Now()
                DAQTimeline3.daqData = mydt
                DAQTimeline3.daqActData = actdt
                DAQTimeline3.CreateChart()
        End Select

    End Sub
End Class
