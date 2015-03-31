Imports dotnetCHARTING
Partial Class DataVisualisation_OEEbyLine
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            txtEnd.Text = Now()
            txtStart.Text = DateAdd(DateInterval.Month, -1, Now())
        End If

        Chart1.Type = ChartType.Combo


    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged

        Dim WaterFallAdap As New OEEtableadapters.OEEWaterFallTableAdapter
        Dim dsWaterFall As New OEE.OEEWaterFallDataTable

        dsWaterFall = WaterFallAdap.GetData(txtStart.Text, txtEnd.Text, RadioButtonList1.SelectedValue)

        Dim srWater As New Series
        Dim rowWaterFall As OEE.OEEWaterFallRow = dsWaterFall.Rows(0)


        Dim eleWater As New Element

        eleWater.Name = "Total Time"
        eleWater.YValueStart = 0
        eleWater.YValue = rowWaterFall.TotalTime
        '     srWater.AddElements(eleWater)

        Dim elewater2 As New Element

        elewater2.Name = "Non Working Time"
        elewater2.YValueStart = rowWaterFall.cSchedRunTime
        elewater2.YValue = rowWaterFall.TotalTime
        '    srWater.AddElements(elewater2)

        Dim elewater3 As New Element

        elewater3.Name = "Working Time"
        elewater3.YValueStart = 0
        elewater3.YValue = rowWaterFall.cSchedRunTime
        srWater.AddElements(elewater3)


        Dim elewater4 As New Element

        elewater4.Name = "Change Over Time"
        elewater4.YValueStart = rowWaterFall.cSchedRunTime - rowWaterFall.ChangeOvertime
        elewater4.YValue = rowWaterFall.cSchedRunTime
        srWater.AddElements(elewater4)

        Dim elewater5 As New Element

        elewater5.Name = "Downtime"
        elewater5.YValueStart = rowWaterFall.cSchedRunTime - rowWaterFall.ChangeOvertime - rowWaterFall.cBreakdownTimeLoss
        elewater5.YValue = rowWaterFall.cSchedRunTime - rowWaterFall.ChangeOvertime
        srWater.AddElements(elewater5)


        Dim elewater6 As New Element

        elewater6.Name = "Available Time"
        elewater6.YValueStart = 0
        elewater6.YValue = rowWaterFall.cAvailableTime
        srWater.AddElements(elewater6)

        Dim elewater7 As New Element

        elewater7.Name = "Short Stops"
        elewater7.YValueStart = rowWaterFall.cAvailableTime - rowWaterFall.ShortStopTimeLoss
        elewater7.YValue = rowWaterFall.cAvailableTime
        srWater.AddElements(elewater7)


        Dim elewater8 As New Element

        elewater8.Name = "Performance Loss"
        elewater8.YValueStart = rowWaterFall.cAvailableTime - rowWaterFall.ShortStopTimeLoss - rowWaterFall.cPerformanceTimeLoss
        elewater8.YValue = rowWaterFall.cAvailableTime - rowWaterFall.ShortStopTimeLoss
        srWater.AddElements(elewater8)


        Dim elewater9 As New Element

        elewater9.Name = "Quality Time"
        elewater9.YValueStart = 0
        elewater9.YValue = rowWaterFall.cQualityTime
        srWater.AddElements(elewater9)


        Dim elewater10 As New Element

        elewater10.Name = "Waste Loss time"
        elewater10.YValueStart = rowWaterFall.cQualityTime - rowWaterFall.cWasteTimeLoss
        elewater10.YValue = rowWaterFall.cQualityTime
        srWater.AddElements(elewater10)

        Dim elewater11 As New Element

        elewater11.Name = "Effective Time"
        elewater11.YValueStart = 0
        elewater11.YValue = rowWaterFall.cEffectiveTime
        srWater.AddElements(elewater11)





        Chart1.SeriesCollection.Add(srWater)



    End Sub
End Class



