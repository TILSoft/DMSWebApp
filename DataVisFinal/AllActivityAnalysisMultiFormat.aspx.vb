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

    Protected Sub btnExpand_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExpand.Click
        GridView2.Visible = False
        GridView1.DataBind()
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        GridView2.Visible = False

        Dim actadap As New ActivityAnalysisTableAdapters.tblActivityTableAdapter
        Dim actdt As New ActivityAnalysis.tblActivityDataTable


        actdt = actadap.GetDataByFormatsearch(RadioButtonList2.SelectedValue, RadioButtonList1.SelectedValue, txtStart.Text, txtEnd.Text, txtFormatSearch.Text)

        For Each actrow As ActivityAnalysis.tblActivityRow In actdt

            Dim ele As New Element
            ele.YValue = actrow.trimmedtime
            ele.Name = actrow.txtID
            ele.URL = "../frontend/activitydetails.aspx?activityid=" & actrow.ActivityID
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
        ActivityChart.Title = "Line: " & RadioButtonList1.SelectedItem.Text & " ¦ Activity: " & RadioButtonList2.SelectedItem.Text & " ¦ Start Date: " & txtStart.Text & " ¦ End date: " & txtEnd.Text & " ¦ Format search: " & txtFormatSearch.Text


    End Sub

   
    Protected Sub btnOEE_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOEE.Click
        GridView2.Visible = True
        GridView2.DataBind()

    End Sub
End Class
