
Partial Class FrontEnd_DataVisualisation_PeriodAnalysis
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            If Not Request.QueryString("start") Is Nothing Then

                MaskedEditExtender6.Enabled = False
                MaskedEditExtender7.Enabled = False
                txtEnd.Text = DateAdd(DateInterval.Second, 1, CDate(Request.QueryString("End")))
                txtStart.Text = DateAdd(DateInterval.Second, 1, CDate(Request.QueryString("Start")))
                RadioButtonList1.SelectedIndex = Request.QueryString("locid")
                populateTimeLines()

            Else

                txtEnd.Text = Now
                txtStart.Text = DateAdd(DateInterval.Month, -1, Now())

            End If




       
        End If

        Chart1.Type = dotnetCHARTING.ChartType.Pie




    End Sub



    Sub populateTimeLines()

        Try


            Dim start As Date = txtStart.Text
            Dim finish As Date = txtEnd.Text

            Dim TLadap As New AnalysisTimeLinesTableAdapters.MultiTablePeriodTrimOnlyTableAdapter
            Dim TLdt As New AnalysisTimeLines.MultiTablePeriodTrimOnlyDataTable

            TLdt = TLadap.GetData(RadioButtonList1.SelectedValue, start, finish)

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



                        WUClot.AddtoCollection(TLrow.StartTime, TLrow.EndTime, itemcolor, "Start time: " & TLrow.StartTime & " End time:" & TLrow.EndTime, "../datavisfinal/LotAnalysis.aspx?activityid=" & TLrow.OriginalID & "&LocIDindex=" & RadioButtonList1.SelectedIndex)
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



    Protected Sub DetailsView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView1.DataBound

        Dim perfseries As New dotnetCHARTING.Series

        For i = 4 To 9
            Dim ele As New dotnetCHARTING.Element

            ele.Name = DetailsView1.Rows(i).Cells(0).Text
            ele.YValue = DetailsView1.Rows(i).Cells(1).Text

            perfseries.AddElements(ele)



        Next
        Chart1.SeriesCollection.Add(perfseries)


    End Sub

 


    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        populateTimeLines()
    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        populateTimeLines()
    End Sub
End Class
