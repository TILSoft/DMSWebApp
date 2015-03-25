
Partial Class FrontEnd_DataAnalysis_LotAnalysis
    Inherits System.Web.UI.Page
    Dim RCLocID As Integer
    Dim locid As Integer



    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged


        Dim lotadap As New lotsChangeOversTableAdapters.tblLotTableAdapter
        Dim lotdt As New lotsChangeOvers.tblLotDataTable
        Dim lotrow As lotsChangeOvers.tblLotRow
        lotdt = lotadap.GetDataByLotID(DropDownList1.SelectedValue)
        lotrow = lotdt.Rows(0)

        txtStart.Text = lotrow.LotStartTime
        txtEnd.Text = lotrow.LotEndTime

        Locid = RadioButtonList1.SelectedValue

        Dim locadap As New LocationsTableAdapters.QueriesTableAdapter
        RClocid = locadap.GetRCLocIDFromSymptomLocID(RadioButtonList1.SelectedValue)

        ODSDTDesc.SelectParameters("LocID").DefaultValue = RClocid

        GridView1.DataBind()

        populateTimeLines()



    End Sub

    Sub populateTimeLines()

        Dim start As DateTime = txtStart.Text
        Dim endd As DateTime = txtEnd.Text

        Dim myadap As New DataAnalysisTableAdapters.TrimmedDowntimesByPeriodTableAdapter
        Dim mydt As New DataAnalysis.TrimmedDowntimesByPeriodDataTable

        mydt = myadap.GetData(locid, RCLocID, start, endd)

        DTTimeLine.starttime = start
        DTTimeLine.endtime = endd

        For Each dtrow As DataAnalysis.TrimmedDowntimesByPeriodRow In mydt

            DTTimeLine.AddtoCollection(dtrow.DowntimeStart, dtrow.Downtimeend, 1)

        Next

        DTTimeLine.Create()



        Dim shiftadap As New DataAnalysisTableAdapters.TrimmedShiftsTableAdapter
        Dim shiftdt As New DataAnalysis.TrimmedShiftsDataTable

        shiftdt = shiftadap.GetData(locid, start, endd)

        ShiftTimeLine.starttime = start
        ShiftTimeLine.endtime = endd

        For Each shiftrow As DataAnalysis.TrimmedShiftsRow In shiftdt

            ShiftTimeLine.AddtoCollection(shiftrow.ShiftStart, shiftrow.ShiftEnd, 1)

        Next

        ShiftTimeLine.Create()


        Dim lotadap As New DataAnalysisTableAdapters.TrimmedLotsAndCOsTableAdapter
        Dim lotdt As New DataAnalysis.TrimmedLotsAndCOsDataTable

        lotdt = lotadap.GetData(locid, start, endd)

        LotTimeline.starttime = start
        LotTimeline.endtime = endd

        For Each lotrow As DataAnalysis.TrimmedLotsAndCOsRow In lotdt

            LotTimeline.AddtoCollection(lotrow.LotStartDate, lotrow.LotEndDate, lotrow.LotOrCO)
        Next

        LotTimeline.Create()
    End Sub
End Class
