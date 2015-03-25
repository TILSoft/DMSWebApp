
Partial Class SafeHouse_testcontrol_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim start As DateTime = "24/07/08"
        Dim endd As DateTime = "26/07/08 14:00:00"



        Dim myadap As New DataAnalysisTableAdapters.TrimmedDowntimesByPeriodTableAdapter
        Dim mydt As New DataAnalysis.TrimmedDowntimesByPeriodDataTable

        mydt = myadap.GetData(1928, 1929, start, endd)

        WUC.starttime = start
        WUC.endtime = endd

        For Each dtrow As DataAnalysis.TrimmedDowntimesByPeriodRow In mydt

            WUC.AddtoCollection(dtrow.DowntimeStart, dtrow.Downtimeend, 1)

        Next

        WUC.Create()



        Dim shiftadap As New DataAnalysisTableAdapters.TrimmedShiftsTableAdapter
        Dim shiftdt As New DataAnalysis.TrimmedShiftsDataTable

        shiftdt = shiftadap.GetData(1928, start, endd)

        WUC2.starttime = start
        WUC2.endtime = endd

        For Each shiftrow As DataAnalysis.TrimmedShiftsRow In shiftdt

            WUC2.AddtoCollection(shiftrow.ShiftStart, shiftrow.ShiftEnd, 1)

        Next

        WUC2.Create()


        Dim lotadap As New DataAnalysisTableAdapters.TrimmedLotsAndCOsTableAdapter
        Dim lotdt As New DataAnalysis.TrimmedLotsAndCOsDataTable

        lotdt = lotadap.GetData(1928, start, endd)

        WUC3.starttime = start
        WUC3.endtime = endd

        For Each lotrow As DataAnalysis.TrimmedLotsAndCOsRow In lotdt

            WUC3.AddtoCollection(lotrow.LotStartDate, lotrow.LotEndDate, lotrow.LotOrCO)
        Next

        WUC3.Create()
    End Sub
End Class
