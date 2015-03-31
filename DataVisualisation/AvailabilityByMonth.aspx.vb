Imports dotnetCHARTING
Partial Class FrontEnd_DataVisualisation_AvailabilityByMonth
    Inherits System.Web.UI.Page

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged

        ' If Not Page.IsPostBack Then

       

        '   End If


        Dim scLot As New Series
        Dim scLotDT As New Series
        Dim scCO As New Series
        Dim scCODT As New Series
        Dim scIdle As New Series
        Dim scIdleDT As New Series
        Dim scUnacc As New Series


        Dim Availadap As New PerformanceAnalysisTableAdapters.AvailabilityByMCbyMonthTableAdapter
        Dim availdt As New PerformanceAnalysis.AvailabilityByMCbyMonthDataTable

        availdt = Availadap.GetData(RadioButtonList1.SelectedValue, txtstart.Text, txtend.Text)

        For Each availrow As PerformanceAnalysis.AvailabilityByMCbyMonthRow In availdt


            Dim eleLot As New Element
            Dim eleLotDT As New Element
            Dim eleCO As New Element
            Dim eleCOdt As New Element
            Dim eleIdle As New Element
            Dim eleIdleDt As New Element
            Dim eleUnacc As New Element


            eleLot.Name = availrow.Month & "/" & availrow.year
            eleLot.YValue = availrow.LottimeMinusLotdowntime
            eleLot.ToolTip = eleLot.YValue & " mins of Lot time"
            eleLot.Color = Drawing.Color.Green
            scLot.AddElements(eleLot)

            eleLotDT.Name = availrow.Month & "/" & availrow.year
            eleLotDT.YValue = availrow.Lotdowntime
            eleLotDT.ToolTip = eleLotDT.YValue & " mins of lot downtime"
            eleLotDT.Color = Drawing.Color.Red
            scLotDT.AddElements(eleLotDT)

            eleCO.Name = availrow.Month & "/" & availrow.year
            eleCO.YValue = availrow.ChangetimeMinusChangedowntime
            eleCO.ToolTip = eleCO.YValue & " mins of Change over time"
            eleCO.Color = Drawing.Color.Purple
            scCO.AddElements(eleCO)

            eleCOdt.Name = availrow.Month & "/" & availrow.year
            eleCOdt.YValue = availrow.ChangeDowntime
            eleCOdt.ToolTip = eleCOdt.YValue & " mins of change over downtime"
            eleCOdt.Color = Drawing.Color.Yellow
            scCODT.AddElements(eleCOdt)

            eleIdle.Name = availrow.Month & "/" & availrow.year
            eleIdle.YValue = availrow.IdletimeMinusIdledowntime
            eleIdle.ToolTip = eleIdle.YValue & " mins of Idle time"
            eleCOdt.Color = Drawing.Color.Blue
            scIdle.AddElements(eleIdle)

            eleIdleDt.Name = availrow.Month & "/" & availrow.year
            eleIdleDt.YValue = availrow.IdleDowntime
            eleIdleDt.ToolTip = eleIdleDt.YValue & " mins of idle downtime"
            eleIdleDt.Color = Drawing.Color.Beige
            scIdle.AddElements(eleIdleDt)

            eleUnacc.Name = availrow.Month & "/" & availrow.year
            eleUnacc.YValue = availrow.UnAccountedTime
            eleUnacc.ToolTip = eleUnacc.YValue & " mins of unaccounted time"
            eleUnacc.Color = Drawing.Color.White

            scUnacc.AddElements(eleUnacc)

        Next


        ChartAvail.SeriesCollection.Add(scLot)
        ChartAvail.SeriesCollection.Add(scLotDT)
        ChartAvail.SeriesCollection.Add(scCO)
        ChartAvail.SeriesCollection.Add(scCODT)
        ChartAvail.SeriesCollection.Add(scIdle)
        ChartAvail.SeriesCollection.Add(scIdleDT)
        ChartAvail.SeriesCollection.Add(scUnacc)


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ChartAvail.YAxis.Scale = dotnetCHARTING.Scale.Stacked
        ChartAvail.YAxis.Label.Text = "Minutes"

        If Not Page.IsPostBack Then
            txtstart.Text = DateAdd(DateInterval.Month, -12, Now())
            txtend.Text = DateAdd(DateInterval.Month, 3, Now())
        End If


    End Sub
End Class
