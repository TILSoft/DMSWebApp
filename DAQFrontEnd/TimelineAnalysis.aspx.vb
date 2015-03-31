
Partial Class Controls_DAQtimelinetester
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not Page.IsPostBack Then
            txtStart.Text = DateAdd(DateInterval.Day, -1, Now())
            txtEnd.Text = Now

        End If


    End Sub


    Protected Sub btnGo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGo.Click

        Dim myadapter As New DAQEventsTableAdapters.chartingTableAdapter
        Dim mydt As New DAQEvents.chartingDataTable

        mydt = myadapter.GetDataByLocIDStartEndTime(RadioButtonList1.SelectedValue, CDate(txtEnd.Text), CDate(txtStart.Text))
        DAQTimeline1.StartTime = CDate(txtStart.Text)
        DAQTimeline1.EndTime = CDate(txtEnd.Text)
        DAQTimeline1.daqData = mydt

        Response.Write(mydt.Rows.Count)

        Response.Write("///" & RadioButtonList1.SelectedValue)


        Dim actadap As New ActivityTableAdapters.tblActivityTableAdapter
        Dim actdt As New Activity.tblActivityDataTable

        actdt = actadap.GetDataByEndStartLoc(RadioButtonList1.SelectedValue, CDate(txtStart.Text), CDate(txtEnd.Text))

        DAQTimeline1.daqActData = actdt

        DAQTimeline1.CreateChart()
    End Sub


End Class
