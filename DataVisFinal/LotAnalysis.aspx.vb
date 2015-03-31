Imports dotnetCHARTING
Partial Class FrontEnd_DataVisualisation_LotAnalysis
    Inherits System.Web.UI.Page
    Public scoee As New dotnetCHARTING.Series


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            If Not Request.QueryString("ActivityID") Is Nothing Then
                lblActID.Text = Request.QueryString("ActivityID")

                DetailsView1.DataBind()
                DetailsView4.DataBind()
                visualisation()
            End If



        End If




    End Sub



    Sub visualisation()

        Dim actadap As New ActivityTableAdapters.tblActivityTableAdapter
        Dim actdt As New Activity.tblActivityDataTable
        actdt = actadap.GetDataByActivityID(lblActID.Text)
        For Each actrow As Activity.tblActivityRow In actdt
            populateChart(actrow.StartTime, actrow.endtime, actrow.LocIDSymp)
            populateTimeLines(actrow.StartTime, actrow.endtime, actrow.LocIDSymp)

        Next

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        lblActID.Text = DropDownList1.SelectedValue

      

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

    Sub populateTimeLines(ByVal start As DateTime, ByVal finish As DateTime, ByVal LocID As Integer)

        Try


            Dim TLadap As New AnalysisTimeLinesTableAdapters.MultiTablePeriodTrimOnlyTableAdapter
            Dim TLdt As New AnalysisTimeLines.MultiTablePeriodTrimOnlyDataTable

            TLdt = TLadap.GetData(LocID, start, finish)

            WUCShift.starttime = start
            WUCShift.endtime = finish


            WUCLot.starttime = start
            WUCLot.endtime = finish



            WUCDT.starttime = start
            WUCDT.endtime = finish


            For Each TLrow As AnalysisTimeLines.MultiTablePeriodTrimOnlyRow In TLdt

                Select Case TLrow._Class

                    Case 1

                        WUCShift.AddtoCollection(TLrow.StartTime, TLrow.EndTime, Drawing.Color.Green, "Start time: " & TLrow.StartTime & " End time:" & TLrow.EndTime, "../frontend/downtimedetails.aspx?downtimeid=" & TLrow.OriginalID)


                    Case 2


                        Dim itemcolor As System.Drawing.Color
                        If TLrow.SubClass = 1 Then
                            itemcolor = Drawing.Color.Blue
                        ElseIf TLrow.SubClass = 2 Then
                            itemcolor = Drawing.Color.Purple
                        End If



                        WUCLot.AddtoCollection(TLrow.StartTime, TLrow.EndTime, itemcolor, "Start time: " & TLrow.StartTime & " End time:" & TLrow.EndTime, "../datavisfinal/LotAnalysis.aspx?activityid=" & TLrow.OriginalID & "&LocIDindex=" & RadioButtonList1.SelectedIndex)
                    Case 3

                        WUCDT.AddtoCollection(TLrow.StartTime, TLrow.EndTime, Drawing.Color.Red, "Start time: " & TLrow.StartTime & " End time:" & TLrow.EndTime, "../frontend/downtimedetails.aspx?downtimeid=" & TLrow.OriginalID)
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


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        visualisation()
    End Sub
End Class
