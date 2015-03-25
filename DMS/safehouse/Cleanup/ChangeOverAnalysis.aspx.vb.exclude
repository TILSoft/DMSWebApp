Imports dotnetCHARTING
Partial Class FrontEnd_DataVisualisation_LotAnalysis
    Inherits System.Web.UI.Page
    Public scoee As New dotnetCHARTING.Series


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged

        Dim actadap As New ActivityTableAdapters.tblActivityTableAdapter
        Dim actdt As New Activity.tblActivityDataTable
        actdt = actadap.GetDataByActivityID(DropDownList1.SelectedValue)
        For Each actrow As Activity.tblActivityRow In actdt
            populateChart(actrow.StartTime, actrow.endtime, actrow.LocIDSymp)
            populateTimeLines(actrow.StartTime, actrow.endtime, actrow.LocIDSymp)

        Next

    End Sub

    Sub populateChart(ByVal start As DateTime, ByVal finish As DateTime, ByVal locid As Integer)


        Dim StatsAdap As New AnalysisTimeLinesTableAdapters.MultiTableFullTrimGroupedTableAdapter
        Dim StatsDT As New AnalysisTimeLines.MultiTableFullTrimGroupedDataTable

        StatsDT = StatsAdap.GetData(locid, start, finish)

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

            scoee.AddElements(ele)

        Next

        OEEChart.SeriesCollection.Add(scoee)

    End Sub

    Sub populateTimeLines(ByVal start As DateTime, ByVal finish As DateTime, ByVal locid As Int32)

       

        Dim TLadap As New AnalysisTimeLinesTableAdapters.MultiTablePeriodTrimOnlyTableAdapter
        Dim TLdt As New AnalysisTimeLines.MultiTablePeriodTrimOnlyDataTable

        TLdt = TLadap.GetData(locid, start, finish)


        WUC1.starttime = start
        WUC1.endtime = finish

        WUC2.starttime = start
        WUC2.endtime = finish


        WUC3.starttime = start
        WUC3.endtime = finish

        For Each TLrow As AnalysisTimeLines.MultiTablePeriodTrimOnlyRow In TLdt


            Select Case TLrow._Class

                Case 1

                    WUC1.AddtoCollection(TLrow.StartTime, TLrow.EndTime, 1)

                Case 2

                    WUC2.AddtoCollection(TLrow.StartTime, TLrow.EndTime, TLrow.SubClass)

                Case 3

                    WUC3.AddtoCollection(TLrow.StartTime, TLrow.EndTime, 1)

            End Select

        Next


        WUC1.Create()
        WUC2.Create()
        WUC3.Create()

    End Sub

End Class
