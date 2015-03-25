Imports dotnetCHARTING
Partial Class FrontEnd_DataVisualisation_AllActiivtyAnalysis
    Inherits System.Web.UI.Page
    Public SCact As New dotnetCHARTING.Series
    Public scTarget As New dotnetCHARTING.Series
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            txtStart.Text = DateAdd(DateInterval.Month, -1, Now())
            txtEnd.Text = Now()
        End If
    End Sub


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
 
        Dim actadap As New ActivityAnalysisTableAdapters.tblActivityTableAdapter
        Dim actdt As New ActivityAnalysis.tblActivityDataTable


        actdt = actadap.GetDataByFormatID(2, RadioButtonList1.SelectedValue, txtStart.Text, txtEnd.Text, ddlformat.SelectedValue)

        For Each actrow As ActivityAnalysis.tblActivityRow In actdt

            Dim anno As New Annotation
            anno.Label.Text = actrow.Shifts


            Dim ele As New Element
            ele.YValue = actrow.trimmedtime
            If cboxShowShift.Checked = True Then
                ele.Annotation = anno
            End If
            ele.Name = actrow.txtID
            ele.URL = "../activitydetails.aspx?activityid=" & actrow.ActivityID
            ele.URLTarget = "_blank"
            SCact.AddElements(ele)

            If Not IsDBNull(actrow.StdTime) Then
                Dim tele As New Element
                tele.YValue = actrow.StdTime
                tele.Name = ele.Name
                scTarget.AddElements(tele)
            End If


        Next

        ActivityChart.Use3D = False

        SCact.DefaultElement.Transparency = 0

        SCact.Type = SeriesType.Line
        SCact.Name = "Actual Time"
        scTarget.Type = SeriesType.Line
        scTarget.Name = "Target Time"
        scTarget.DefaultElement.Color = Drawing.Color.Red

        ActivityChart.SeriesCollection.Add(SCact)
        ActivityChart.SeriesCollection.Add(scTarget)
        ActivityChart.Title = "Line: " & RadioButtonList1.SelectedItem.Text & " ¦ Activity: Change over in progress ¦ Start Date: " & txtStart.Text & " ¦ End date: " & txtEnd.Text & " ¦ Format search: " & ddlformat.SelectedItem.Text



    End Sub

   
End Class
