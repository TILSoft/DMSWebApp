Imports dotnetCHARTING

Partial Class FrontEnd_DataAnalysis_PeriodCalculation

    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            txtStartTime.Text = "24/07/08 00:00:00" ' DateAdd(DateInterval.Day, -1.5, Now())
            txtEndTime.Text = "27/07/08 00:00:00" 'DateAdd(DateInterval.Day, 0.7, Now())
        End If
        Dim RCIDadap As New LocationsTableAdapters.QueriesTableAdapter
        txtRCLocID.Text = RCIDadap.GetRCLocIDFromSymptomLocID(txtLocID.Text)

        Chart.Debug = True
        Chart.Type = ChartType.ComboHorizontal
        Chart.Size = "600x350"
        Chart.Title = ".netCHARTING Sample"
        Chart.ShadingEffectMode = ShadingEffectMode.Seven
        Chart.XAxis.Scale = dotnetCHARTING.Scale.Time


        Dim SC As dotnetCHARTING.SeriesCollection = New dotnetCHARTING.SeriesCollection()
      
        Dim s As dotnetCHARTING.Series = New dotnetCHARTING.Series("Series Shifts")

        Dim shiftadap As New DataAnalysisTableAdapters.TrimmedShiftsTableAdapter
        Dim shiftdt As New DataAnalysis.TrimmedShiftsDataTable
        shiftdt = shiftadap.GetData(txtLocID.Text, txtStartTime.Text, txtEndTime.Text)

        For Each shiftrow As DataAnalysis.TrimmedShiftsRow In shiftdt

            Dim ele As dotnetCHARTING.Element = New dotnetCHARTING.Element("Element " & shiftrow.ShiftStart)
            ele.YDateTime = shiftrow.ShiftStart
            s.Elements.Add(ele)

        Next

        SC.Add(s)
        Chart.SeriesCollection.Add(SC)


    End Sub


End Class
