Imports dotnetCHARTING
Partial Class FrontEnd_DataVisualisation_AllActiivtyAnalysis
    Inherits System.Web.UI.Page
    Dim SCact As New dotnetCHARTING.Series
    Dim scTarget As New dotnetCHARTING.Series

    Protected Sub RadioButtonList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList2.SelectedIndexChanged


    End Sub

    Protected Sub ddlFormat_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlFormat.SelectedIndexChanged

        Dim actadap As New PerformanceAnalysisTableAdapters.tblActivityTableAdapter
        Dim actdt As New PerformanceAnalysis.tblActivityDataTable

        'get std format time 
        Dim stdtime As Integer
        Dim stdtimeadap As New LocationsTableAdapters.QueriesTableAdapter

        If stdtimeadap.FormatStdTimeByFormatID(ddlFormat.SelectedValue) Is Nothing Then
            stdtime = 0
        Else
            stdtime = stdtimeadap.FormatStdTimeByFormatID(ddlFormat.SelectedValue)
        End If


        actdt = actadap.ActivitiesByFormat(RadioButtonList2.SelectedValue, ddlFormat.SelectedValue, RadioButtonList1.SelectedValue, txtStart.Text, txtEnd.Text)


        For Each actrow As PerformanceAnalysis.tblActivityRow In actdt

            Dim ele As New Element
            ele.YValue = actrow.activitytime
            ele.Name = actrow.txtID
            ele.SmartLabel.Text = actrow.ActivityID
            SCact.AddElements(ele)

            If stdtime > 0 Then
                Dim tele As New Element
                tele.YValue = stdtime
                tele.Name = ele.Name
                scTarget.AddElements(tele)

            End If
           

        Next
        ActivityChart.Use3D = False

        SCact.DefaultElement.Transparency = 0

        SCact.Type = SeriesType.Line
        scTarget.Type = SeriesType.Line
        scTarget.DefaultElement.Color = Drawing.Color.Red


        ActivityChart.SeriesCollection.Add(SCact)
        ActivityChart.SeriesCollection.Add(scTarget)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtStart.Text = DateAdd(DateInterval.Month, -1, Now())

        txtEnd.Text = Now()


    End Sub
End Class
